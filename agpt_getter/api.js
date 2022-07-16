const express = require('express');
const {Kafka} = require('kafkajs');
const pg = require('pg'); 

const Lock1 = require('./lock.js')

const lock = new Lock1.Lock();

const cors = require('cors');

const app = express()
app.use(cors())  

const path=require('path');

const {parse }=require('csv-parse');

const fs = require('fs');

const calcul_index=require("./aggrtest.js")

let val = calcul_index.calindex;

const {Client, Connection} = require('pg');

const responses = Object.create(null);


const pgp = require('pg-promise')({
    
        capSQL: true 
});

pg.types.setTypeParser(1114, str => str);

const db=pgp({
        host:"agpt_getter_db",
        port:5432,
        user:"postgres",
        password:"Dd2502!..",
        database:"getterforagpt"
})//τα στοιχεια της βασης
    
    
    
db.connect()//κανουμε την συνδεση στη βαση

//dictionary for energy types used for calculation of index
const types = {"Biomass":0, 
"Hydro Run-of-river and poundage":1, 
"Hydro Water Reservoir":2,
"Hydro Pumped Storage":3,
"Solar":4,
"Wind Onshore":5,
"Wind Offshore":6,
"Fossil Brown coal/Lignite":7, 
"Fossil Hard coal":8, 
"Fossil Oil":9,
"Fossil Gas":10,
"Geothermal":11,
"Nuclear":12,
"Other":13,
"Other renewable":14,
"Waste":15,
"Fossil Coal-derived gas":16,
"Marine":17,
"Fossil Peat":18,
"Fossil Oil shale":19
}

var filename;

var values;

var y;

var sqlString;

var counter=0;

var countries=[];//αρχικοποιηση ενος πινακα για τις χωρες

const cs=[];//αρχικοποιηση ενος πινακα για τα rows που θα κανουμε insert


current_month={}//αρχικοποιουμε ενα dictionary

New_Data={}

//consumer and producer here
// ----------------------------------
const kafka = new Kafka({
        "clientId": "SaaS-2022",
        "brokers" :["kafka1:19092","kafka2:19093", "kafka3:19094"]
    
});
const consumer = kafka.consumer({"groupId": "agpt_cons"})
console.log("Consumer Connecting.......")
consumer.connect()
console.log("Consumer Connected!")
consumer.subscribe({
        topic: "agpt",
});

//producer config and connection!
const producer = kafka.producer();
console.log("Producer Connecting.....");
producer.connect();
console.log("Producer Connected!");
// ----------------------------------
//διαβαζουμε το CSV των χωρων και αποθηκευουμε τα δεδομενα στο countries
fs.createReadStream("../Countriescsv/countries_data.csv")
.pipe(parse({delimiter:";",from_line:2}))
    .on('data',data =>countries.push(data))
    .on('end', () => {

             
      for(var i=0;i<countries.length;i++){
        countryRow_ = countries[i].toString();//το καθε row το μετατρεπουμε σε string
        
        countryRow = countryRow_.split(",");//κανουμε split καθε row με κομμα και αποθηκευουμε την λιστα στο countryRow
        
        current_month[countryRow[3].toLowerCase()]={}//το value που αντιστοιχιζεται σε καθε key(mapcode) ειναι ενα ενα dictionary
        cs.push(new pgp.helpers.ColumnSet(['datetime','actualgenerationpertype','actualconsumption','productiontype','updatetime','index'],{table:countryRow[3].toLowerCase()}))

      }
      
     })
     .on('error', (err) => {
	     console.log("error trying to open Countries csv");
     });     


//csvs to import to db
const arr_of_agpt_csv=["2022_01_01_00_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_01_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_02_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_03_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_04_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_05_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_06_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_07_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_08_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_09_AggregatedGenerationPerType16.1.BC.csv"]


initialdate ="2022-03-01 00:00:00"


//function for updating rows in csv if needed
function Update_post(row,index1){

        values = [row[7]===''?null:row[7],row[8]===''?null:row[8],row[9],index1]
        sqlString='UPDATE ' + row[4].substring(0,2).toLowerCase() +' SET actualgenerationpertype = $1, actualconsumption = $2, updatetime = $3  WHERE index = $4 '  
        db.query(sqlString,values)
      
}

function ReadCsv(file){

        data1={}//αρχικοποιουμε ενα dictionary 
        
        for(var i=0;i<countries.length;i++){
        countryRow_ = countries[i].toString();//καθε row του CSV το μετατρεπει σε string
        
        countryRow = countryRow_.split(",");//το κανουμε split με κομμα
            
           data1[countryRow[3].toLowerCase()]=[]//το value που αντιστοιχιζεται σε καθε key(mapcode) ειναι ενας πινακας
        }
        var results=[];
        filename=path.join('..','/AGPTfinalCsv/'+ file)
        //διαβαζουμε το CSV για το agpt
        y=fs.createReadStream(filename)
        .pipe(parse({delimiter:"\t",from_line:2}))
        .on('data',data =>results.push(data))
        .on('end', () =>{
            
            //για καθε row του csv κανουμε τους απαραιτητους ελεγχους,επειδη μας αφορα το CTY
            for(var i=0; i < results.length;i++){
                if(results[i][3]==='CTY') {
                 var countryname=results[i][4].substring(0,2).toLowerCase()//αποθηκευουμε το mapcode στο countryname 
                    
                  
                  var ind=val(initialdate,results[i][0],parseInt(results[i][1].substring(2,3))) + types[results[i][6]]//υπολογισμος του index 
                 
    
                   //ελεγχουμε αν το value για συγκεκριμενο index(key) του συγκεκριμενου mapcode υπαρχει
                  if (current_month[countryname][ind]===undefined){
                      
                       //αν δεν υπαρχει
                       current_month[countryname][ind]=results[i][9]//τοτε παιρνει ως value το updatetime 
                       var values = [results[i][0], results[i][7]===''?null:results[i][7], results[i][8]===''?null:results[i][8], results[i][6], results[i][9], ind]//παιρνουμε τις αντιστοιχες τιμες απο το CSV για να τις κανουμε insert
                       data1[countryname].push({datetime:values[0],actualgenerationpertype:values[1],actualconsumption:values[2],productiontype:values[3],updatetime:values[4],index:values[5]})//το value για το συγκεκριμενο mapcode ειναι το αντιστοιχο row που εχει προκυψει
    
                     }
    
                    else{
                    
                        var cur_date_split = current_month[countryname][ind].split(" ");//κανουμε split το update time που ειναι το value του συγκεκριμενου index για το συγκεκριμενο mapcode
                        var res_date_split = results[i][9].split(" ");//κανουμε split το νεο updatetime,αυτο που παιρνουμε για το συγκεκριμενο mapcode για το συγκεκριμενο index
                        var current_date = new Date(cur_date_split[0]);//αποθηκευουμε το date απο το update time που ειναι το value του συγκεκριμενου index για το συγκεκριμενο mapcode
                        var res_date = new Date(res_date_split[0]);//αποθηκευουμε το date απο το νεο updatetime,αυτο που παιρνουμε για το συγκεκριμενο mapcode για το συγκεκριμενο index
                        //ελεγχουμε αν οι ημερομηνιες και του παλιου και του νεου updatetime ειναι οι ιδιες
                        if(current_date === res_date){
                           var cur_hour = cur_date_split[1].split(":");//κανουμε split τις ωρες,τα λεπτα και τα secs του παλιου updatetime
                           var res_hour = res_date_split[1].split(":");//κανουμε split τις ωρες,τα λεπτα και τα secs του νεου updatetime
                           if((cur_hour[0]<res_hour[0]) || (cur_hour[0]===res_hour[0] && cur_hour[1]<res_hour[1])) {
                               Update_post(results[i],ind)//αν oι ωρες του νεου updatetime ειναι μετα τι ωρες του παλιου update time, αν οι ωρες ειναι οι ιδιες αλλα διαφερουν τα λεπτα κανουμε update 
                            }
                         }
                    
    
                }
                   
    
                }
            }

            Object.assign(New_Data,data1);//κανουμε copy το dict1 στο New Data
            countryRow_list = []//αρχικοποιουμε εναν πινακα
            counter_for_countries = 0;//αρχικοποιουμε εναν counter για τις χωρες σε 0
           
            for(var i=0;i<countries.length;i++){
               countryRow_ = countries[i].toString();//για καθε χωρα μετατρεπουμε το row της σε string
               
               countryRow = countryRow_.split(",");//κανουμε το row split με κομμα
                 
               const countrydata = data1[countryRow[3].toLowerCase()]//παιρνουμε το columnset για το συγκεκριμενο mapcode και το αποθηκευουμε στο countrydata
              
               if(countrydata.length!=0){
                        
                        countryRow_list.push(countryRow[3]);
                        const query =pgp.helpers.insert(data1[countryRow[3].toLowerCase()],cs[i])//κανουμε insert στο συγκεκριμενο columnset τα δεδομενα
                        db.none(query)
                        .then(()=>{
                                console.log("all records inserted");
                                const result = producer.send({
                                        topic: "agpt",
                                        
                                        messages: [{
                                                "value": "NEW DATA:" + countryRow_list[counter_for_countries]
                                                
                                
                                        }]
                                
                                });
                                counter_for_countries += 1;
                                

                        })
                        .catch(error => {
                                console.log("error is", error)
                        }) 
             } 
               
          }
        
          }
        )
     }





//endpoint για να παιρνουμε δεδομενα για τον συγκεκριμενο τυπο ενεργειας για την συγκεκριμενη χωρα απο μια συγκεκριμενη ημερομηνια μεχρι μια συγκεκριμενη ημερομηνια
app.get("/getData/:country/:dataFrom/:dataTo/:typeOfEnergy", (req, res, next) => {

        var country=req.params.country
        var datafrom=req.params.dataFrom
        var datato=req.params.dataTo
        var typeofenergy=req.params.typeOfEnergy

        console.log("query =", "SELECT * FROM public." + country + " WHERE public." + country + ".productiontype = " + "\'" + typeofenergy + "\'" + " AND public." + country + ".datetime >= " + "\'" + datafrom + "\'" + " AND public." + country + ".datetime <= " + "\'" + datato + "\';"
        )
        var get_query= db.query(
                
           "SELECT * FROM public." + country + " WHERE public." + country + ".productiontype = " + "\'" + typeofenergy + "\'" + " AND public." + country + ".datetime >= " + "\'" + datafrom + "\'" + " AND public." + country + ".datetime <= " + "\'" + datato + "\';"
        )
        .then((result) =>{
                console.log(result);
                res.status(200).json(result);
        })
        .catch((e) => {
                res.status(500).send("something went wrong");                
        });     
        
});


//endpoint για να κανουμε request για νεα δεδομενα για μια χωρα
app.get("/newData/:country", (req, res, next) => {
   
        var country=req.params.country.toString();
        console.log("got a request for new data!");
        
        res.status(200).json(New_Data[country])
        
});

//endpoint για να παιρνουμε ολα τα δεδομενα για μια συγκεκριμενη χωρα
app.get("/getIniData/:country", (req, res, next) => {

        var country=req.params.country;
        console.log(country);
        var EnergyType=req.params.typeOfEnergy;
        
        console.log("query =", "SELECT * from public." + country + ";");
        var get_query=db.any("SELECT * from public." + country + ";")
        .then((result) =>{
                res.status(200).json(result);
        })
        .catch((e) => {
                res.status(500).send("something went wrong");                
        });
});

const magic_func = async () => {
        await lock.acquire();
        ReadCsv(arr_of_agpt_csv[counter])
        counter++
        lock.release();
}

//Βοηθητικό endpoint το οποίο χτυπάμε προκειμένου να διαβαστεί - γίνει import στη βάση το επόμενο csv
app.get("/agpt/ImportNewCsv", (req, res, next) => {
    
        if(counter<arr_of_agpt_csv.length){
            magic_func();
            res.status(200).send("New CSV imported\n")
        }
        else{
    
            res.status(200).send("No more CSVs to import\n")
    
        }
})

//endpoint για να γινει reset η βαση
app.get("/agpt/ResetDB", (req, res, next) => {
  
        var query = pgp.helpers.concat([
                'DELETE FROM  public.al',
                'DELETE FROM  public.am',
                'DELETE FROM  public.at',
                'DELETE FROM  public.az',
                'DELETE FROM  public.ba',
                'DELETE FROM  public.be',
                'DELETE FROM  public.bg',
                'DELETE FROM  public.by',
                'DELETE FROM  public.cy',
                'DELETE FROM  public.cz',
                'DELETE FROM  public.de',
                'DELETE FROM  public.dk',
                'DELETE FROM  public.ee',
                'DELETE FROM  public.es',
                'DELETE FROM  public.fi',
                'DELETE FROM  public.fr',
                'DELETE FROM  public.gb',
                'DELETE FROM  public.ge',
                'DELETE FROM  public.gr',
                'DELETE FROM  public.hr',
                'DELETE FROM  public.hu',
                'DELETE FROM  public.ie',
                'DELETE FROM  public.it',
                'DELETE FROM  public.lt',
                'DELETE FROM  public.lu',
                'DELETE FROM  public.lv',
                'DELETE FROM  public.md',
                'DELETE FROM  public.me',
                'DELETE FROM  public.mk',
                'DELETE FROM  public.no',
                'DELETE FROM  public.pl',
                'DELETE FROM  public.nl',
                'DELETE FROM  public.mt',
                'DELETE FROM  public.pt',
                'DELETE FROM  public.ro',
                'DELETE FROM  public.rs;',
                'DELETE FROM  public.se',
                'DELETE FROM  public.si',
                'DELETE FROM  public.sk',
                'DELETE FROM  public.tr',
                'DELETE FROM  public.ua',
                'DELETE FROM  public.xk',
                'DELETE FROM  public.ch',
                'DELETE FROM  public.ru'
        ])
        db.none(query)
        .then(()=>{
                console.log("all records for display deleted!");
                counter = 0; 
                for(var i=0;i<countries.length;i++){
                        countryRow_ = countries[i].toString();
                        countryRow = countryRow_.split(",");
                        current_month[countryRow[3].toLowerCase()]={}
                }
                res.status(200).send("DB cleared and CSV counter set 0!")
        })
        .catch(error => {
                console.log("error is", error);
                res.status(500).send("Something went wrong!")
        })
})

app.get("/healthCheck", (req, res, next) => {
	res.status(200).send("I am healthy");
});	

app.listen(8081, () => {
 console.log("Server running on port 8081");
});

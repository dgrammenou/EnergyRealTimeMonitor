const express = require('express');
const {Kafka} = require('kafkajs');
const pg = require('pg');

const cors = require('cors');

const app = express()
app.use(cors())  

const path=require('path');
const {parse }=require('csv-parse');
const fs = require('fs');
const calcul_index=require("./aggrtest.js")
let val = calcul_index.calindex;

const {Client, Connection} = require('pg');

const pgp = require('pg-promise')({
    
    capSQL: true 
});

pg.types.setTypeParser(1114, str => str);

const db=pgp({
        host:"phf_getter_db",
        port:5432,
        user:"postgres",
        password:"Dd2502!..",
        database:"getterforff"
})//τα στοιχεια της βασης
    
db.connect()//κανουμε την συνδεση στη βαση

var filename;

var values;

var y;

var sqlString;

var counter=0;

var countries=[];//αρχικοποιηση ενος πινακα για τις χωρες

const cs=[];//αρχικοποιηση ενος πινακα για τα rows που θα κανουμε insert

current_month={}//αρχικοποιουμε ενα dictionary

countries_dict={}//αρχικοποιουμε ενα dictionary που θα χρειαστει για το index

New_Data={}//αρχικοποιουμε ενα dictionary 


//consumer and producer here
// ----------------------------------
const kafka = new Kafka({
	"clientId": "SaaS-2022",
	"brokers" :["kafka1:19092","kafka2:19093", "kafka3:19094"]
});
const consumer = kafka.consumer({"groupId": "phf_cons"})
console.log("Consumer Connecting.......")
consumer.connect()
console.log("Consumer Connected!")
consumer.subscribe({
	topic: "phf",
});

//producer config and connection!
const producer = kafka.producer();
console.log("Producer Connecting.....");
producer.connect();
console.log("Producer Connected!");
// ----------------------------------

const responses = Object.create(null);
//διαβαζουμε το CSV των χωρων και αποθηκευουμε τα δεδομενα στο countries
fs.createReadStream("../Countriescsv/countries_data.csv")
.pipe(parse({delimiter:";",from_line:2}))
    .on('data',data =>countries.push(data))
    .on('end', () => {
      for(var i=0;i<countries.length;i++){
		countryRow_ = countries[i].toString();//το καθε row το μετατρεπουμε σε string
        countryRow = countryRow_.split(",");//κανουμε split καθε row με κομμα και αποθηκευουμε την λιστα στο countryRow
        current_month[countryRow[3].toLowerCase()]={}//το value που αντιστοιχιζεται σε καθε key(mapcode) ειναι ενα ενα dictionary
        cs.push(new pgp.helpers.ColumnSet(['datetime','outareaname','inareaname','flowvalue','updatetime','index'],{table:countryRow[3].toLowerCase()}))
        countries_dict[countryRow[3].toLowerCase()]=i
      }
     
    }
)
//csvs to import to db
const arr_of_ff_csv=["2022_01_01_00_PhysicalFlows12.1.G.csv","2022_01_01_01_PhysicalFlows12.1.G.csv","2022_01_01_02_PhysicalFlows12.1.G.csv","2022_01_01_03_PhysicalFlows12.1.G.csv","2022_01_01_04_PhysicalFlows12.1.G.csv","2022_01_01_05_PhysicalFlows12.1.G.csv","2022_01_01_06_PhysicalFlows12.1.G.csv","2022_01_01_07_PhysicalFlows12.1.G.csv","2022_01_01_08_PhysicalFlows12.1.G.csv","2022_01_01_09_PhysicalFlows12.1.G.csv"]

initialdate ="2022-01-01 00:00:00"

//function for updating rows in csv if needed
function Update_post(row,index1){

  values = [row[5]===''?null:row[5],row[9]===''?null:row[9],row[10]===''?null:row[10],row[11],index1]
  sqlString='UPDATE ' + row[5].toLowerCase() +' SET outareaname = $1, inareaname = $2, flowvalue=$3, updatetime = $4  WHERE index = $5 '  
  db.query(sqlString,values)

}

function ReadCsv(file){

    var data1={}//αρχικοποιουμε ενα dictionary 
    for(var i=0;i<countries.length;i++){
		countryRow_ = countries[i].toString();//καθε row του CSV το μετατρεπει σε string
        countryRow = countryRow_.split(",");//το κανουμε split με κομμα 
       	data1[countryRow[3].toLowerCase()]=[]//το value που αντιστοιχιζεται σε καθε key(mapcode) ειναι ενας πινακας
    }
    var results=[];
    filename=path.join('..','/FFfinalCsv/'+ file)
     //διαβαζουμε το CSV για το ff
    y=fs.createReadStream(filename)
    .pipe(parse({delimiter:"\t",from_line:2}))
    .on('data',data =>results.push(data))
    .on('end', () =>{
        //για καθε row του csv κανουμε τους απαραιτητους ελεγχους,επειδη μας αφορα το CTY
        
        for(var i=0; i < results.length;i++){
          
            if(results[i][3]==='CTY') {
              
              var countryname=results[i][5].toLowerCase()//αποθηκευουμε το mapcode στο countryname   
              var ind=val(initialdate,results[i][0],parseInt(results[i][1].substring(2,3)))+countries_dict[results[i][9].toLowerCase()]//υπολογισμος του index 

              //ελεγχουμε αν το value για συγκεκριμενο index(key) του συγκεκριμενου mapcode υπαρχει
              if (current_month[countryname][ind]===undefined){  
                   //αν δεν υπαρχει 
                   current_month[countryname][ind]=results[i][11]//τοτε παιρνει ως value το updatetime
                   var values = [results[i][0], results[i][5], results[i][9] , results[i][10]===''?null:results[i][10],  results[i][11], ind]//παιρνουμε τις αντιστοιχες τιμες απο το CSV για να τις κανουμε insert
                   data1[countryname].push({datetime:values[0],outareaname:values[1],inareaname:values[2],flowvalue:values[3],updatetime:values[4],index:values[5]})//το value για το συγκεκριμενο mapcode ειναι το αντιστοιχο row που εχει προκυψει
              }
              else{  
                    var cur_date_split=current_month[countryname][ind].split(" ");//κανουμε split το update time που ειναι το value του συγκεκριμενου index για το συγκεκριμενο mapcode
                    var res_date_split=results[i][11].split(" ");//κανουμε split το νεο updatetime,αυτο που παιρνουμε για το συγκεκριμενο mapcode για το συγκεκριμενο index
                    var current_date=new Date(cur_date_split[0]);//αποθηκευουμε το date απο το update time που ειναι το value του συγκεκριμενου index για το συγκεκριμενο mapcode
                    var res_date=new Date(res_date_split[0]);//αποθηκευουμε το date απο το νεο updatetime,αυτο που παιρνουμε για το συγκεκριμενο mapcode για το συγκεκριμενο index
                    //ελεγχουμε αν οι ημερομηνιες και του παλιου και του νεου updatetime ειναι οι ιδιες
                    if(current_date===res_date){
                       var cur_hour=cur_date_split[1].split(":");//κανουμε split τις ωρες,τα λεπτα και τα secs του παλιου updatetime
                       var res_hour=res_date_split[1].split(":");//κανουμε split τις ωρες,τα λεπτα και τα secs του νεου updatetime
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
          const countrydata=data1[countryRow[3].toLowerCase()]//παιρνουμε το columnset για το συγκεκριμενο mapcode και το αποθηκευουμε στο countrydata
          if(countrydata.length!=0){
            console.log("country =", countryRow[3]);
            countryRow_list.push(countryRow[3]);
            const query =pgp.helpers.insert(data1[countryRow[3].toLowerCase()],cs[i])//κανουμε insert στο συγκεκριμενο columnset τα δεδομενα
            db.none(query)
            .then(()=>{
              console.log("all records inserted for country", countryRow_list[counter_for_countries])
              const result = producer.send({
                topic: "phf",
                
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

//endpoint για να παρουμε δεδομενα που στελνονται απο μια συγκεκριμενη χωρα προς μια συγκεκριμενη χωρα απο μια συγκεκριμενη ημερομηνια μεχρι μια συγκεκριμενη ημερομηνια
app.get("/getData/:countryFrom/to/:countryTo/:dataFrom/:dataTo", (req, res, next) => {
	
	var countryFrom=req.params.countryFrom
	var countryTo=req.params.countryTo.toUpperCase()
	var datafrom=req.params.dataFrom
	var datato=req.params.dataTo


	console.log("query =", "SELECT * FROM public." + countryFrom + " WHERE inareaname = \'" + countryTo + "\'" + " AND public." + countryFrom + ".datetime >= " + "\'" + datafrom + "\'" + " AND public." + countryFrom + ".datetime <= " + "\'" + datato + "\';"
	)
	var get_query= db.query(
			
		"SELECT * FROM public." + countryFrom + " WHERE inareaname = \'" + countryTo + "\'" + " AND public." + countryFrom + ".datetime >= " + "\'" + datafrom + "\'" + " AND public." + countryFrom + ".datetime <= " + "\'" + datato + "\';"
	)
	.then((result) =>{
			console.log(result);
			res.status(200).json(result);
	})
	.catch((e) => {
			res.status(500).send("something went wrong");                
	});

});

//edpoint για να κανουμε request για νεα δεδομενα
app.get("/newData/:country", (req, res, next) => {
	
	var country=req.params.country.toString();
  console.log("got a request for new data!");
  
	res.status(200).json(New_Data[country]);

});	

//endpoint για να παρουμε δεδομενα για μια συγκεκριμενη χωρα
app.get("/getIniData/:country", (req, res, next) => {
	
	var country=req.params.country;
	console.log("ini data requested for country:", country);
	console.log("query =", "SELECT * from public." + country + ";");
	var get_query=db.any("SELECT * from public." + country + ";" )
	.then((result) =>{
			res.status(200).json(result);
	})
	.catch((e) => {
			res.status(500).send("something went wrong");                
	});

});	

//Βοηθητικό endpoint το οποίο χτυπάμε προκειμένου να διαβαστεί - γίνει import στη βάση το επόμενο csv
app.get("/ff/ImportNewCsv", (req, res, next) => {

  if(counter<arr_of_ff_csv.length){
      ReadCsv(arr_of_ff_csv[counter])
      counter++
      res.status(200).send("New CSV imported\n")
  }
  else{

      res.status(200).send("No more CSVs to import\n")

  }
})

//endpoint για να κανουμε reset την βαση
app.get("/ff/ResetDB", (req, res, next) => {
  
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
        console.log("all records for display deleted!")
        counter = 0; 
        for(var i=0;i<countries.length;i++){
                countryRow_ = countries[i].toString();
                countryRow = countryRow_.split(",");
                current_month[countryRow[3].toLowerCase()]={}
        }
        res.status(200).send("DB cleared and CSV counter set 0!")
      })
      .catch(error => {
        console.log("error is", error)
      })
})

app.get("/healthCheck", (req, res, next) => {
	res.status(200).send("I am healthy");
});	

app.listen(8083, () => {
	console.log("Server running on port 8083");
});

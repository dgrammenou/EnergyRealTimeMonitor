const express = require('express');
const {Kafka} = require('kafkajs');
const pg = require('pg'); 
var app = express();

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
        host:"host.docker.internal",
        port:5432,
        user:"postgres",
        password:"Dd2502!..",
        database:"getterforagpt"
})    
    
    
    
db.connect()

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

var countries=[];

const cs=[];


current_month={}

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

fs.createReadStream("../Countriescsv/countries_data.csv")
.pipe(parse({delimiter:";",from_line:2}))
    .on('data',data =>countries.push(data))
    .on('end', () => {
//       console.log(countries);
             
      for(var i=0;i<countries.length;i++){
        countryRow_ = countries[i].toString();
        // console.log("countryRow_ =", countryRow_)
        countryRow = countryRow_.split(",");
        // console.log("countryRow =", countryRow)
        current_month[countryRow[3].toLowerCase()]={}
        cs.push(new pgp.helpers.ColumnSet(['datetime','actualgenerationpertype','actualconsumption','productiontype','updatetime','index'],{table:countryRow[3].toLowerCase()}))

      }
      //console.log(current_month)
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

        data1={}
        // console.log("countries =", countries);
        for(var i=0;i<countries.length;i++){
        countryRow_ = countries[i].toString();
        // console.log("countryRow_ =", countryRow_)
        countryRow = countryRow_.split(",");
        // console.log("countryRow =", countryRow)     
           data1[countryRow[3].toLowerCase()]=[]
        }
        var results=[];
        filename=path.join('..','/AGPTfinalCsv/'+ file)
        y=fs.createReadStream(filename)
        .pipe(parse({delimiter:"\t",from_line:2}))
        .on('data',data =>results.push(data))
        .on('end', () =>{
    
            for(var i=0; i < results.length;i++){
                if(results[i][3]==='CTY') {
                 var countryname=results[i][4].substring(0,2).toLowerCase()
                    
                  
                  var ind=val(initialdate,results[i][0],parseInt(results[i][1].substring(2,3))) + types[results[i][6]]
                 
    
                
                  if (current_month[countryname][ind]===undefined){
                      
                      
                       current_month[countryname][ind]=results[i][9]
                       var values = [results[i][0], results[i][7]===''?null:results[i][7], results[i][8]===''?null:results[i][8], results[i][6], results[i][9], ind]
                       data1[countryname].push({datetime:values[0],actualgenerationpertype:values[1],actualconsumption:values[2],productiontype:values[3],updatetime:values[4],index:values[5]})
    
                     }
    
                    else{
                    
                        var cur_date_split = current_month[countryname][ind].split(" ");
                        var res_date_split = results[i][9].split(" ");
                        var current_date = new Date(cur_date_split[0]);
                        var res_date = new Date(res_date_split[0]);
                        if(current_date === res_date){
                           var cur_hour = cur_date_split[1].split(":");
                           var res_hour = res_date_split[1].split(":");
                           if((cur_hour[0]<res_hour[0]) || (cur_hour[0]===res_hour[0] && cur_hour[1]<res_hour[1])) {
                               Update_post(results[i],ind)
                            }
                         }
                    
    
                }
                   
    
                }
            }

            Object.assign(New_Data,data1);
            countryRow_list = []
            counter_for_countries = 0;
        //     console.log(cs)    
            for(var i=0;i<countries.length;i++){
               countryRow_ = countries[i].toString();
               // console.log("countryRow_ =", countryRow_)
               countryRow = countryRow_.split(",");
               // console.log("countryRow =", countryRow)   
               const countrydata = data1[countryRow[3].toLowerCase()]
               console.log("i =", i);
               if(countrydata.length!=0){
                        console.log("country =",  countryRow[3]);
                        countryRow_list.push(countryRow[3]);
                        const query =pgp.helpers.insert(data1[countryRow[3].toLowerCase()],cs[i])
                        db.none(query)
                        .then(()=>{
                                console.log("all records inserted");
                                const result = producer.send({
                                        topic: "agpt",
                                        //replyId: replyId,
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

//function to read csv's per e.g. 1min and import it to DB
// var updateinterval=setInterval(InsertAndUpdateCsv,30000)


// function InsertAndUpdateCsv() {
    
//      //console.log("im in insert and update")
//      ReadCsv(arr_of_aggrgencsv[counter])
//      counter++
//      if(counter===2){
//         clearInterval(updateinterval);
    
//     }
// }

//res.status(200).send(value[0]);

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

app.get("/newData/:country", (req, res, next) => {
   
        var country=req.params.country.toString();
        console.log("got a request for new data!");
        // console.log("i will return:", New_Data[country]) 
        res.status(200).json(New_Data[country])
        
});

app.get("/getIniData/:country", (req, res, next) => {

        var country=req.params.country;
        console.log(country);
        var EnergyType=req.params.typeOfEnergy;
        // console.log(EnergyType.toString);
        console.log("query =", "SELECT * from public." + country + ";");
        var get_query=db.any("SELECT * from public." + country + ";")
        .then((result) =>{
                res.status(200).json(result);
        })
        .catch((e) => {
                res.status(500).send("something went wrong");                
        });
});

//Βοηθητικό endpoint το οποίο χτυπάμε προκειμένου να διαβαστεί - γίνει import στη βάση το επόμενο csv
app.get("/agpt/ImportNewCsv", (req, res, next) => {
    
        if(counter<arr_of_agpt_csv.length){
            ReadCsv(arr_of_agpt_csv[counter])
            counter++
            res.status(200).send("New CSV imported\n")
        }
        else{
    
            res.status(200).send("No more CSVs to import\n")
    
        }
 
        
})

app.get("/healthCheck", (req, res, next) => {
	res.status(200).send("I am healthy");
});	

app.listen(8081, () => {
 console.log("Server running on port 8081");
});

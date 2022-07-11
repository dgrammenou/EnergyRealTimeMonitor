const express = require('express');
const kafka = require('kafkajs');
const pg = require('pg'); 
var app = express();

const path=require('path');

const {parse }=require('csv-parse');

const fs = require('fs');

const calcul_index=require("./aggrtest.js")

let val = calcul_index.calindex;

const responses = Object.create(null);

const {Client, Connection} = require('pg');


const pgp = require('pg-promise')({
    
        capSQL: true 
    });

    const db=pgp({
        host:"localhost",
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

fs.createReadStream(".\\Countriescsv\\countries_data.csv")
.pipe(parse({delimiter:";",from_line:2}))
    .on('data',data =>countries.push(data))
    .on('end', () => {
      for(var i=0;i<countries.length;i++){
        current_month[countries[i][3].toLowerCase()]={}
        cs.push(new pgp.helpers.ColumnSet(['datetime','actualgenerationpertype','actualconsumption','productiontype','updatetime','index'],{table:countries[i][3].toLowerCase()}))

      }
      //console.log(current_month)
     }
    )

//csvs to import to db
const arr_of_aggrgencsv=['2022_03_07_19_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_20_AggregatedGenerationPerType16.1.BC.csv']/*'2022_03_07_21_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_22_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_23_AggregatedGenerationPerType16.1.BC.csv']*/


initialdate ="2022-03-01 00:00:00"


//function for updating rows in csv if needed
function Update_post(row,index1){

        values = [row[7]===''?null:row[7],row[8]===''?null:row[8],row[9],index1]
        sqlString='UPDATE ' + row[4].substring(0,2).toLowerCase() +' SET actualgenerationpertype = $1, actualconsumption = $2, updatetime = $3  WHERE index = $4 '  
        db.query(sqlString,values)
      
}

function ReadCsv(file){

        data1={}
        for(var i=0;i<countries.length;i++){
           data1[countries[i][3].toLowerCase()]=[]
        }
        var results=[];
        filename=path.join('..','\\AGPTcsv\\'+ file)
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
                    
                        var cur_date_split=current_month[countryname][ind].split(" ");
                        var res_date_split=results[i][9].split(" ");
                        var current_date=new Date(cur_date_split[0]);
                        var res_date=new Date(res_date_split[0]);
                        if(current_date===res_date){
                           var cur_hour=cur_date_split[1].split(":");
                           var res_hour=res_date_split[1].split(":");
                           if((cur_hour[0]<res_hour[0]) || (cur_hour[0]===res_hour[0] && cur_hour[1]<res_hour[1])) {
                               Update_post(results[i],ind)
                            }
                         }
                    
    
                }
                   
    
                }
            }

           Object.assign(New_Data,data1)

    
            for(var i=0;i<countries.length;i++){
               const countrydata=data1[countries[i][3].toLowerCase()]
               if(countrydata.length!=0){
               const query =pgp.helpers.insert(data1[countries[i][3].toLowerCase()],cs[i])
               db.none(query)
               .then(()=>{
                console.log("all records inserted")
                /*const result = producer.send({
                        topic: "agpt",
                        //replyId: replyId,
                        messages: [{
                                "value": "NEW DATA:"+ countries[i][3]
                                
                
                        }]
                });*/
                

               })
               .catch(error => {
                console.log("errorrrrrrr is", error)
               }) 
            }
               
          }
        
          }
        )
     }





//consumer and producer here

/*const kafka = new Kafka({
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

//consumer code
//----------------------------------
consumer.run({
	//console.log("In consumer run\n")
	eachMessage: ({ topic, partition, message }) =>  {
		//heartbeat();
		console.log('Received message', {
			topic,
			partition,
			//key: message.key.toString(),
			value: message.value.toString()
		});
		data = {
			"topic": topic,
			//"message": rq.params.message,
			"partition": parseInt(partition),
			"message in ascii": message.value.toString()
		};
		//if the message is new data then get request to getter to get the data 
		//and on end we insert them on DB
		
		if(data["message in ascii"] === ""){

		}

		if(data["message in ascii"] === ""){
			
		}

		//.... ifs = number of cases (e.g. new data, add new country..)	
	}
});
//----------------------------------
*/

//function to read csv's per e.g. 1min and import it to DB
var updateinterval=setInterval(InsertAndUpdateCsv,30000)


function InsertAndUpdateCsv() {
    
     //console.log("im in insert and update")
     ReadCsv(arr_of_aggrgencsv[counter])
     counter++
     if(counter===2){
        clearInterval(updateinterval);
    
    }
}







//res.status(200).send(value[0]);

app.get("/getData/:country/:dataFrom/:dataTo/:typeOfEnergy", (req, res, next) => {

        var country=req.params.country
        var datafrom=req.params.dataFrom
        var datato=req.params.dataTo
        var typeofenergy=req.params.typeOfEnergy

        
        var get_query= db.query(
                
           "SELECT * FROM " + country + " WHERE productiontype=" + typeofenergy +" AND datetime>= "+ datafrom +" AND datetime <= "+ datato,(err,result)=>{
              if(err){
                console.log("ERROR")
                res.status(500).send('An error occured');
              }    
              else{
                console.log("Success")
                res.status(200).json(result.rows)
                console.log("result is",result)
              } 
              //console.log("result is",result)
        })
});

app.get("/newData/:country", (req, res, next) => {
   
        var country=req.params.country;
        res.status(200).json(New_Data[country])


        
});


app.get("/getIniData/:country/:typeOfEnergy", (req, res, next) => {

        var country=req.params.country
        var EnergyType=req.params.typeofEnergy;

        var get_query=db.query("SELECT * from " + country + " WHERE productiontype= "+ EnergyType, (err,result)=>{
                if(err){
                  console.log("ERROR")
                  res.status(500).send('An error occured');
                }    
                else{
                  console.log("Success")
                  res.status(200).json(result.rows)
                  console.log("result is",result)
                } 


})
});

app.get("/healthCheck", (req, res, next) => {
	res.status(200).send("I am healthy");
});	

app.listen(8081, () => {
 console.log("Server running on port 8081");
});

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
        database:"getterforatl"
})
    
db.connect()

var filename;

var values;

var y;

var sqlString;

var counter=0;

var countries=[];

const cs=[];

current_month={}

countries_dict={}

New_Data={}

// consumer and producer here
// ----------------------------------
const kafka = new Kafka({
        "clientId": "SaaS-2022",
        "brokers" :["kafka1:19092","kafka2:19093", "kafka3:19094"]
});
const consumer = kafka.consumer({"groupId": "atl_cons"})
console.log("Consumer Connecting.......")
consumer.connect()
console.log("Consumer Connected!")
consumer.subscribe({
        topic: "atl",
});

//producer config and connection!
const producer = kafka.producer();
console.log("Producer Connecting.....");
producer.connect();
console.log("Producer Connected!");
//----------------------------------

fs.createReadStream("../Countriescsv/countries_data.csv")
.pipe(parse({delimiter:";",from_line:2}))
    .on('data',data =>countries.push(data))
    .on('end', () => {
      for(var i=0;i<countries.length;i++){
        countryRow_ = countries[i].toString();
        countryRow = countryRow_.split(",");
        current_month[countryRow[3].toLowerCase()]={}
        cs.push(new pgp.helpers.ColumnSet(['datetime','totalloadvalue','updatetime','index'],{table:countryRow[3].toLowerCase()}))
        countries_dict[countryRow[3].toLowerCase()]=i
      }
     }
    )

const arr_of_csv=['2022_01_28_19_ActualTotalLoad6.1.A.csv', '2022_01_28_20_ActualTotalLoad6.1.A.csv']

initialdate ="2022-01-01 00:00:00"

function Update_post(row,index1){

        values =  [results[i][0], results[i][6]===''?null:results[i][6], results[i][7], index1]
        sqlString='UPDATE ' + row[5].toLowerCase() +' SET totalloadvalue = $1, updatetime = $2  WHERE index = $3 '  
        db.query(sqlString,values)
      
}

function ReadCsv(file){

        var data1={}
        for(var i=0;i<countries.length;i++){
                countryRow_ = countries[i].toString();
                countryRow = countryRow_.split(",");     
                data1[countryRow[3].toLowerCase()]=[]
        }
        var results=[];
        filename=path.join('..','/ATLcsv/'+ file)
        y=fs.createReadStream(filename)
        .pipe(parse({delimiter:"\t",from_line:2}))
        .on('data',data =>results.push(data))
        .on('end', () =>{
            for(var i=0; i < results.length;i++){
                if(results[i][3]==='CTY') {
                        var countryname=results[i][5].toLowerCase()
                        var ind=val(initialdate,results[i][0],parseInt(results[i][1].substring(2,3))) + countries_dict[countryname]
                        if (current_month[countryname][ind]===undefined){                  
                              current_month[countryname][ind]=results[i][7]
                              var values = [results[i][0], results[i][6]===''?null:results[i][6], results[i][7], ind] 
                              data1[countryname].push({datetime:values[0],totalloadvalue:values[1],updatetime:values[2],index:values[3]})
                        }
                        else{    
                               var cur_date_split=current_month[countryname][ind].split(" ");
                               var res_date_split=results[i][7].split(" ");
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

            Object.assign(New_Data,data1);
            
            countryRow_list = []
            counter_for_countries = 0;
            for(var i=0;i<countries.length;i++){
                countryRow_ = countries[i].toString();
                countryRow = countryRow_.split(",");
                const countrydata=data1[countryRow[3].toLowerCase()]
                if(countrydata.length!=0){
                        console.log("country =",  countryRow[3]);
                        countryRow_list.push(countryRow[3]);
                        const query =pgp.helpers.insert(data1[countryRow[3].toLowerCase()],cs[i])
                        db.none(query)
                        .then(()=>{
                                console.log("all records inserted")
                                const result = producer.send({
                                        topic: "atl",
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


var updateinterval=setInterval(InsertAndUpdateCsv,30000)

function InsertAndUpdateCsv() {
    
     //console.log("im in insert and update")
     ReadCsv(arr_of_csv[counter])
     counter++
     if(counter===2){
        clearInterval(updateinterval);
    
    }
}


//res.status(200).send(value[0]);
app.get("/getData/:country/:dataFrom/:dataTo", (req, res, next) => {

        var country=req.params.country
        var datafrom=req.params.dataFrom
        var datato=req.params.dataTo
        console.log("query =", "SELECT * FROM " + country + " WHERE datetime >= " + "\'" + datafrom + "\'" + " AND datetime <= " + "\'" + datato + "\';")        
        var get_query= db.query(
                
           "SELECT * FROM " + country + " WHERE datetime >= " + "\'" + datafrom + "\'" + " AND datetime <= " + "\'" + datato + "\';"
        )
        .then((result) =>{
                res.status(200).json(result);
        })
        .catch((e) => {
                console.log("error =", e);
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
        console.log("query =", "SELECT * from " + country + ";");
        var get_query=db.any("SELECT * from " + country + ";")
        .then((result) =>{
                res.status(200).json(result);
        })
        .catch((e) => {
                res.status(500).send("something went wrong");                
        });
});

app.get("/healthCheck", (req, res, next) => {
	res.status(200).send("I am healthy");
});	

app.listen(8082, () => {
        console.log("Server running on port 8082");
});

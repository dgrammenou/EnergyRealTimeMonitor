const {Pool,Client}= require('pg')

const path=require('path');

const {parse }=require('csv-parse');

const fs = require('fs');



const pool=new Pool ({
    user:"postgres",
    host: "localhost",
    database:"displayforff",
    password:"Dd2502!..",
    port: 5434
})

results=[]


filename=path.join('.','/countries_data.csv')
y=fs.createReadStream(filename)
.pipe(parse({delimiter:";",from_line:2}))
.on('data',data =>results.push(data))
.on('end', () =>{
     for(var i =0; i<results.length;i++) {
           countryRow_ = results[i].toString();
           countryRow = countryRow_.split(",");
           pool.query("CREATE TABLE " + countryRow[3] +  "(datetime timestamp(6),OutAreaName VARCHAR(2),InAreaName VARCHAR(2),FlowValue REAL,UpdateTime timestamp(6),index INT PRIMARY KEY )",(err,res) =>{
              console.log(err,res)
        })
     }

})

 
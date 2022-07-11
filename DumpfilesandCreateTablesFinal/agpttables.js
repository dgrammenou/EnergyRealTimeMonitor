const {Pool,Client}= require('pg')

const path=require('path');

const {parse }=require('csv-parse');

const fs = require('fs');


const pool=new Pool ({
    user:"postgres",
    host: "localhost",
    database:"getterforagpt",
    password:"Dd2502!..",
    port: 5432
})

results=[]


filename=path.join('..','/Countriescsv/countries_data.csv')
y=fs.createReadStream(filename)
.pipe(parse({delimiter:";",from_line:2}))
.on('data',data =>results.push(data))
.on('end', () =>{
     for(var i =0; i<results.length;i++) {
           pool.query("CREATE TABLE " + results[i][3] +  "(datetime timestamp(6),ActualGenerationPerType REAL,ActualConsumption REAL,ProductionType VARCHAR(50), UpdateTime timestamp(6),index INT PRIMARY KEY )",(err,res) =>{
              console.log(err,res)
        })
     }




})


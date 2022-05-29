const path=require('path');

const {parse }=require('csv-parse');

const fs = require('fs');

var results=[];

const {Client} = require('pg');

const client = new Client({
    host:"localhost",
    port:5432,
    user:"postgres",
    password:"Dd2502!..",
    database:"micro1"
})

client.connect();

//var format=require('pg-format');

var filename;

var values;

var y;

//var len;

const arr_of_csv='countries_data.csv'

function ReadCsv(file){

    filename=path.join('..','\\Countriescsv\\'+ file)
    y=fs.createReadStream(filename)
    .pipe(parse({delimiter:";",from_line:2}))
    .on('data',data =>results.push(data))
    .on('end', () =>{
      
      //len=results.length
      //console.log(results)
      for(var i=0; i < results.length;i++){

        values = [results[i][1],results[i][2],results[i][3],results[i][4]] 
        var sqlString='INSERT INTO countries(areaname,country,mapcode,areatypecode)  VALUES ($1,$2,$3,$4)'   
        client.query(sqlString,values)
      }
   }
  );
}

ReadCsv(arr_of_csv)


//console.log("length of results is",results.length)










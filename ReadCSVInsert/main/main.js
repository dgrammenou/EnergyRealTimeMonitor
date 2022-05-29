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

var format=require('pg-format');

var filename;

var values;

var y;

var len;

//var arraylen;

var arr_of_csv='countries_data.csv'


//ReadCsv(arr_of_csv[0])

function ReadCsv(file){

    filename=path.join('..','\\Countriescsv\\'+ file)
    y=fs.createReadStream(filename)
    .pipe(parse({delimiter:"/;",from_line:2}))
    .on('data',data =>results.push(data))
    .on('end', () =>{
      //console.log("results are",(typeof(results)))
      console.log("len of array inside end inside function is",results.length)
      len=results.length
      console.log(results)
    }
    )
  }

ReadCsv(arr_of_csv)


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

var filename;

var values;

var y;

var sqlString;


const arr_of_aggrgencsv=['2022_03_07_19_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_20_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_21_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_22_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_23_AggregatedGenerationPerType16.1.BC.csv']

function ReadCsv(file){

    filename=path.join('..','\\AGPTcsv\\'+ file)
    y=fs.createReadStream(filename)
    .pipe(parse({delimiter:"\t",from_line:2}))
    .on('data',data =>results.push(data))
    .on('end', () =>{
      console.log("results are",results)
     
      for(var i=0; i < results.length;i++){
        if(results[i][3]==='CTY') {
            if(results[i][7]===''){
                values = [results[i][0],results[i][1],results[i][4],null,results[i][8],results[i][9]]
                sqlString='INSERT INTO aggrgenerationpertype(datetime,resolutioncode,countriesareaname,actualgenerationoutput,actualconsumption,updatetime)  VALUES ($1,$2,$3,$4,$5,$6)'   
                client.query(sqlString,values)
            }
            if(results[i][8]===''){
                values = [results[i][0],results[i][1],results[i][4],results[i][7],null,results[i][9]]
                sqlString='INSERT INTO aggrgenerationpertype(datetime,resolutioncode,countriesareaname,actualgenerationoutput,actualconsumption,updatetime)  VALUES ($1,$2,$3,$4,$5,$6)'   
                client.query(sqlString,values)
            }
            if(results[i][9]===''){
                values = [results[i][0],results[i][1],results[i][4],results[i][7],results[i][8],null]
                sqlString='INSERT INTO aggrgenerationpertype(datetime,resolutioncode,countriesareaname,actualgenerationoutput,actualconsumption,updatetime)  VALUES ($1,$2,$3,$4,$5,$6)'   
                client.query(sqlString,values)
            }
            if(results[i][7]==='' && results[i][8]===''){
                values = [results[i][0],results[i][1],results[i][4],null,null,results[i][9]]
                sqlString='INSERT INTO aggrgenerationpertype(datetime,resolutioncode,countriesareaname,actualgenerationoutput,actualconsumption,updatetime)  VALUES ($1,$2,$3,$4,$5,$6)'   
                client.query(sqlString,values)
            }
            if(results[i][8]==='' && results[i][9]===''){
                values = [results[i][0],results[i][1],results[i][4],results[i][7],null,null]
                sqlString='INSERT INTO aggrgenerationpertype(datetime,resolutioncode,countriesareaname,actualgenerationoutput,actualconsumption,updatetime)  VALUES ($1,$2,$3,$4,$5,$6)'   
                client.query(sqlString,values)
            }
            if(results[i][7]==='' && results[i][9]===''){
                values = [results[i][0],results[i][1],results[i][4],null,results[i][8],null]
                sqlString='INSERT INTO aggrgenerationpertype(datetime,resolutioncode,countriesareaname,actualgenerationoutput,actualconsumption,updatetime)  VALUES ($1,$2,$3,$4,$5,$6)'   
                client.query(sqlString,values)
            }
            if(results[i][7]==='' && results[i][8] ==='' && results[i][9]===''){
                values = [results[i][0],results[i][1],results[i][4],null,null,null]
                sqlString='INSERT INTO aggrgenerationpertype(datetime,resolutioncode,countriesareaname,actualgenerationoutput,actualconsumption,updatetime)  VALUES ($1,$2,$3,$4,$5,$6)'   
                client.query(sqlString,values)
            }
            
           
           } 
           
        }
    }
    )
   }

ReadCsv(arr_of_aggrgencsv[0])











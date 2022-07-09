const path=require('path');

const {parse }=require('csv-parse');

const fs = require('fs');

const calcul_index=require("./aggrtest.js")

let val = calcul_index.calindex;

var results=[];

const {Client} = require('pg');

const client = new Client({
    host:"localhost",
    port:5432,
    user:"postgres",
    password:"Dd2502!..",
    database:"getterforagpt"
})

client.connect();

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


current_month={}

const arr_of_aggrgencsv=['2022_03_07_19_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_20_AggregatedGenerationPerType16.1.BC.csv']/*'2022_03_07_21_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_22_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_23_AggregatedGenerationPerType16.1.BC.csv']*/

initialdate ="2022-03-01 00:00:00"

function Insert_post(row,index){

    values = [row[0], row[7]===''?null:row[7], row[8]===''?null:row[8], row[6], row[9], index]
    sqlString='INSERT INTO ' + row[4].substring(0,2).toLowerCase() +'(datetime,actualgenerationpertype,actualconsumption,productiontype,updatetime,index)  VALUES ($1,$2,$3,$4,$5,$6)' 
    //console.log(sqlString)  
    client.query(sqlString,values)

 }


 function Update_post(row,index1){

  values = [row[7]===''?null:row[7],row[8]===''?null:row[8],row[9],index1]
  //sqlString='UPDATE ' + row[4].substring(0,2).toLowerCase() +' SET actualgenerationpertype=' + values[0] + ',actualconsumption=' + values[1]  + ',updatetime=' + values[2] + ' WHERE index=' + index1
  sqlString='UPDATE ' + row[4].substring(0,2).toLowerCase() +' SET actualgenerationpertype = $1, actualconsumption = $2, updatetime = $3  WHERE index = $4 '  
  //console.log(sqlString)  
  client.query(sqlString,values)

}


function ReadCsv(file){

    filename=path.join('..','\\AGPTcsv\\'+ file)
    y=fs.createReadStream(filename)
    .pipe(parse({delimiter:"\t",from_line:2}))
    .on('data',data =>results.push(data))
    .on('end', () =>{
        for(var i=0; i < results.length;i++){
            if(results[i][3]==='CTY') {
              //console.log(results[i])
               

               var ind=val(initialdate,results[i][0],parseInt(results[i][1].substring(2,3))) + types[results[i][6]]
               
               
               if (!(toString(ind) in current_month)){
                  current_month[ind]=results[i][9]
                  //console.log("current month[ind] ",current_month[ind])
                  if(Number.isNaN(ind)){
                    console.log(results[i])
                  }
                  Insert_post(results[i],ind)
                }
               

                else{
                    //console.log("im in else")
                    var cur_date_split=current_month[ind].split(" ");
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
      }
    )
      }

let updateinterval=setInterval(InsertAndUpdateCsv,60000)


function InsertAndUpdateCsv() {
    ReadCsv(arr_of_aggrgencsv[counter])
    counter++
    if(counter===2){
        clearInterval(updateinterval);
    }

}
    



   


   

    /*function Insert_postgres (row,ind){
            console.log("row is ",row)
            if(row[7]===''){
                console.log("here")
                values = [row[0],null,row[8],row[6],row[9],ind]
                sqlString='INSERT INTO al(datetime,actualgenerationpertype,actualconsumption,productiontype,updatetime,index)  VALUES ($1,$2,$3,$4,$5,$6)'   
                client.query(sqlString,values)
            }
            if(row[8]===''){
              console.log("here")
              values = [row[0],row[7],null,row[6],row[9],ind]
              console.log("values are", values)
              sqlString='INSERT INTO al(datetime,actualgenerationpertype,actualconsumption,productiontype,updatetime,index)  VALUES ($1,$2,$3,$4,$5,$6)'   
              client.query(sqlString,values)
            }
            if(row[9]===''){
                values = [row[0],row[7],row[8],row[6],null,ind]
                sqlString='INSERT INTO al(datetime,actualgenerationpertype,actualconsumption,productiontype,updatetime,index)  VALUES ($1,$2,$3,$4,$5,$6)'   
                client.query(sqlString,values)
            }
           if(row[7]==='' && row[8]===''){
                values = [row[0],null,null,row[6],row[9],ind]
                sqlString='INSERT INTO al(datetime,actualgenerationpertype,actualconsumption,productiontype,updatetime,index)  VALUES ($1,$2,$3,$4,$5,$6)'   
                client.query(sqlString,values)
            }
             if(row[8]==='' && row[9]===''){
                values = [row[0],row[7],null,row[6],null,ind]
                sqlString='INSERT INTO aggrgenerationpertype(datetime,actualgenerationpertype,actualconsumption,productiontype,updatetime,index)  VALUES ($1,$2,$3,$4,$5,$6)'   
                client.query(sqlString,values)
            }
            if(row[7]==='' && row[9]===''){
                values = [row[0],null,row[8],row[6],null,ind]
                sqlString='INSERT INTO aggrgenerationpertype(datetime,actualgenerationoutput,actualconsumption,productiontype,updatetime,index)  VALUES ($1,$2,$3,$4,$5,$6)'   
                client.query(sqlString,values)
            }
            if(row[7]==='' && row[8] ==='' && row[9]===''){
                values = [row[0],null,null,row[6],null,ind]
                sqlString='INSERT INTO aggrgenerationpertype(datetime,actualgenerationoutput,actualconsumption,productiontype,updatetime,index)  VALUES ($1,$2,$3,$4,$5,$6)'   
                client.query(sqlString,values)
            }*/
         
           
           
         
  













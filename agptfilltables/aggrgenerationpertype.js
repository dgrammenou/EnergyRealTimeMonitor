const path=require('path');

const {parse }=require('csv-parse');

const fs = require('fs');

const calcul_index=require("./aggrtest.js")

let val = calcul_index.calindex;



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


fs.createReadStream("..\\Countriescsv\\countries_data.csv")
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



const arr_of_aggrgencsv=['2022_03_07_19_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_20_AggregatedGenerationPerType16.1.BC.csv']/*'2022_03_07_21_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_22_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_23_AggregatedGenerationPerType16.1.BC.csv']*/

initialdate ="2022-03-01 00:00:00"



 function Update_post(row,index1){

  values = [row[7]===''?null:row[7],row[8]===''?null:row[8],row[9],index1]
  sqlString='UPDATE ' + row[4].substring(0,2).toLowerCase() +' SET actualgenerationpertype = $1, actualconsumption = $2, updatetime = $3  WHERE index = $4 '  
  db.query(sqlString,values)

}


function ReadCsv(file){

    var data1={}
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

        for(var i=0;i<countries.length;i++){
           const countrydata=data1[countries[i][3].toLowerCase()]
           if(countrydata.length!=0){
           const query =pgp.helpers.insert(data1[countries[i][3].toLowerCase()],cs[i])
           db.none(query)
           .then(()=>{
            console.log("all records inserted")
           })
           .catch(error => {
            console.log("errorrrrrrr is", error)
           }) 
        }
           
      }
    
      }
    )
 }

let updateinterval=setInterval(InsertAndUpdateCsv,30000)


function InsertAndUpdateCsv() {
    
     //console.log("im in insert and update")
     ReadCsv(arr_of_aggrgencsv[counter])
     counter++
     if(counter===2){
        clearInterval(updateinterval);
    
    }
}

         
           
           
         
  













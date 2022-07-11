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

fs.createReadStream(".\\Countriescsv\\countries_data.csv")
.pipe(parse({delimiter:";",from_line:2}))
    .on('data',data =>countries.push(data))
    .on('end', () => {
      for(var i=0;i<countries.length;i++){
        current_month[countries[i][3].toLowerCase()]={}
        cs.push(new pgp.helpers.ColumnSet(['datetime','totalloadvalue','updatetime','index'],{table:countries[i][3].toLowerCase()}))
        countries_dict[countries[i][3].toLowerCase()]=i
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
       data1[countries[i][3].toLowerCase()]=[]
    }
    var results=[];
    filename=path.join('.','\\ATLcsv\\'+ file)
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

var updateinterval=setInterval(InsertAndUpdateCsv,30000)

function InsertAndUpdateCsv() {
    
     //console.log("im in insert and update")
     ReadCsv(arr_of_csv[counter])
     counter++
     if(counter===2){
        clearInterval(updateinterval);
    
    }
}
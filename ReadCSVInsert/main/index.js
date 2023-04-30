const path=require('path');

const csv=require('csv-parser');

const fs = require('fs');

const results=[];


var arr_of_csv=['2022_03_07_19_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_20_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_21_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_22_AggregatedGenerationPerType16.1.BC.csv','2022_03_07_23_AggregatedGenerationPerType16.1.BC.csv']




function ReadCsv(file){

    var filename=path.join('..','\\AGPTcsv\\'+ file)
    var y=fs.createReadStream(filename)
    .pipe(csv({}))
    .on('data', (data)=>results.push(data))
    .on('end', () =>{
       console.log("results are",results);
   });
}

ReadCsv(arr_of_csv[1])

//for(var i=0;i<5;i++){
  //  ReadCsv(arr_of_csv[i])
//}








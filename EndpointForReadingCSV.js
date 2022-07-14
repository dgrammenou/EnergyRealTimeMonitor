
const arr_of_agpt_csv=["2022_01_01_00_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_01_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_02_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_03_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_04_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_05_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_06_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_07_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_08_AggregatedGenerationPerType16.1.BC.csv","2022_01_01_09_AggregatedGenerationPerType16.1.BC.csv"]

const arr_of_atl_csv=["2022_01_01_00_ActualTotalLoad6.1.A.csv","2022_01_01_01_ActualTotalLoad6.1.A.csv","2022_01_01_02_ActualTotalLoad6.1.A.csv","2022_01_01_03_ActualTotalLoad6.1.A.csv","2022_01_01_05_ActualTotalLoad6.1.A.csv","2022_01_01_06_ActualTotalLoad6.1.A.csv","2022_01_01_07_ActualTotalLoad6.1.A.csv","2022_01_01_08_ActualTotalLoad6.1.A.csv","2022_01_01_09_ActualTotalLoad6.1.A.csv"]

const arr_of_ff_csv=["2022_01_01_00_PhysicalFlows12.1.G.csv","2022_01_01_01_PhysicalFlows12.1.G.csv","2022_01_01_02_PhysicalFlows12.1.G.csv","2022_01_01_03_PhysicalFlows12.1.G.csv","2022_01_01_04_PhysicalFlows12.1.G.csv","2022_01_01_05_PhysicalFlows12.1.G.csv","2022_01_01_06_PhysicalFlows12.1.G.csv","2022_01_01_07_PhysicalFlows12.1.G.csv","2022_01_01_08_PhysicalFlows12.1.G.csv","2022_01_01_09_PhysicalFlows12.1.G.csv"]


app.get("/agpt/ImportNewCsv", (req, res, next) => {
    
    if(counter<arr_of_agpt_csv.length){
        ReadCsv(arr_of_agpt_csv[counter])
        counter++
        res.status(200).send("New CSV imported")
    }
    else{

        res.status(200).send("No more CSVs to import")

    }
})

app.get("/atl/ImportNewCsv", (req, res, next) => {
 
    if(counter<arr_of_atl_csv.length){
        ReadCsv(arr_of_atl_csv[counter])
        counter++
        res.status(200).send("New CSV imported")
    }
    else{

        res.status(200).send("No more CSVs to import")

    }
})

app.get("/ff/ImportNewCsv", (req, res, next) => {

    if(counter<arr_of_ff_csv.length){
        ReadCsv(arr_of_ff_csv[counter])
        counter++
        res.status(200).send("New CSV imported")
    }
    else{

        res.status(200).send("No more CSVs to import")

    }
})


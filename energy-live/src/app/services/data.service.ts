import { HttpClient, HttpParams } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { environment } from "src/environments/environment";  
import { ChartDto } from "./chart.dto";
import { ActualTotalLoad, CrossBoarderFlow, GenerationPerType } from "./charts.model";

 

@Injectable({providedIn: 'root'})
export class DataService {
    
    constructor(private httpClient: HttpClient){}

    updateActualTotalLoad() {
        return this.httpClient.get<void>('http://localhost:8082/atl/ImportNewCsv');  
    }
    dataActualTotalLoad(data: ActualTotalLoad) {
            let params = new HttpParams();
            params = params.set('date', data.date.getFullYear() + "-" + data.date.getMonth() + "-" + data.date.getDate());
            params = params.set('country', data.country);

            return this.httpClient.get<ChartDto>('http://localhost:7082/api/ActualTotalLoad/chart', {params}); 
    }

    updateGenerationPerType() {
        return this.httpClient.get<void>('http://localhost:8081/agpt/ImportNewCsv');  
    }
    dataGenerationPerType(data: GenerationPerType) {
        let params = new HttpParams();
        params = params.set('date', data.date.getFullYear() + "-" + data.date.getMonth() + "-" + data.date.getDate());
        params = params.set('country', data.country);
        params = params.set('generationType', data.generationType);

        return this.httpClient.get<ChartDto>('http://localhost:7081/api/GenerationPerType/chart', {params});         
    }


    updateCrossBoarderFlow() {
        return this.httpClient.get<void>('http://localhost:8083/ff/ImportNewCsv');  
    }
    dataCrossBoarderFlow(data: CrossBoarderFlow) {
        let params = new HttpParams();
        params = params.set('date', data.date.getFullYear() + "-" + data.date.getMonth() + "-" + data.date.getDate());
        params = params.set('countryFrom', data.countryFrom);
        params = params.set('countryTo', data.countryTo);

        return this.httpClient.get<ChartDto>('http://localhost:7083/api/CrossBoarderFlow/chart', {params});  
    } 

}

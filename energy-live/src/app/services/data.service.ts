import { HttpClient, HttpParams } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { environment } from "src/environments/environment";  
import { ChartDto } from "./chart.dto";
import { ActualTotalLoad, CrossBoarderFlow, GenerationPerType } from "./charts.model";

 

@Injectable({providedIn: 'root'})
export class DataService {
    
    constructor(private httpClient: HttpClient){}

    updateActualTotalLoad() {
        return this.httpClient.get<void>('https://paparrigopoulos.com/api/getter/atl/ImportNewCsv');  
    }
    dataActualTotalLoad(data: ActualTotalLoad) {
            let params = new HttpParams();
            params = params.set('date', data.date.getFullYear() + "-" + data.date.getMonth() + "-" + data.date.getDate());
            params = params.set('country', data.country);

            return this.httpClient.get<ChartDto>('https://paparrigopoulos.com/api/display/ActualTotalLoad/chart', {params}); 
    }

    updateGenerationPerType() {
        return this.httpClient.get<void>('https://paparrigopoulos.com/api/getter/agpt/ImportNewCsv');  
    }
    dataGenerationPerType(data: GenerationPerType) {
        let params = new HttpParams();
        params = params.set('date', data.date.getFullYear() + "-" + data.date.getMonth() + "-" + data.date.getDate());
        params = params.set('country', data.country);
        params = params.set('generationType', data.generationType);

        return this.httpClient.get<ChartDto>('https://paparrigopoulos.com/api/display/GenerationPerType/chart', {params});         
    }


    updateCrossBoarderFlow() {
        return this.httpClient.get<void>('https://paparrigopoulos.com/api/getter/ff/ImportNewCsv');  
    }
    dataCrossBoarderFlow(data: CrossBoarderFlow) {
        let params = new HttpParams();
        params = params.set('date', data.date.getFullYear() + "-" + data.date.getMonth() + "-" + data.date.getDate());
        params = params.set('country', data.countryFrom);
        params = params.set('incountry', data.countryTo);

        return this.httpClient.get<ChartDto>('https://paparrigopoulos.com/api/display/CrossBoarderFlow/chart', {params});  
    } 

    resetDbAndCsvATLGetter() {
        return this.httpClient.get<void>('https://paparrigopoulos.com/api/getter/atl/ResetDB');
    }
    resetDbAndCsvATLDisplay() {
        return this.httpClient.get<void>('https://paparrigopoulos.com/api/display/atl/ResetDB');
    }
    resetDbAndCsvAGPTGetter() {
        return this.httpClient.get<void>('https://paparrigopoulos.com/api/getter/agpt/ResetDB');
    }
    resetDbAndCsvAGPTDisplay() {
        return this.httpClient.get<void>('https://paparrigopoulos.com/api/display/agpt/ResetDB');
    }
    resetDbAndCsvFFGetter() {
        return this.httpClient.get<void>('https://paparrigopoulos.com/api/getter/ff/ResetDB');
    }
    resetDbAndCsvFFDisplay() {
        return this.httpClient.get<void>('https://paparrigopoulos.com/api/display/ff/ResetDB');
    }

}

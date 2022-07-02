import { HttpClient, HttpParams } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { environment } from "src/environments/environment";  
import { ChartDto } from "./chart.dto";
import { ActualTotalLoad, CrossBoarderFlow, GenerationPerType } from "./charts.model";

 

@Injectable({providedIn: 'root'})
export class DataService { 
    
    constructor(private httpClient: HttpClient){}

    dataActualTotalLoad(data: ActualTotalLoad) {
        let params = new HttpParams();
        params = params.set('date', data.date.getFullYear() + "-" + data.date.getMonth() + "-" + data.date.getDay());
        params = params.set('country', data.country);

        return this.httpClient.get<ChartDto>('http://localhost:7080/api/Data', {params}); 
    }
    dataGenerationPerType(data: GenerationPerType) {
        let params = new HttpParams();
        params = params.set('date', data.date.getFullYear() + "-" + data.date.getMonth() + "-" + data.date.getDay());
        params = params.set('country', data.country);
        params = params.set('generationType', data.generationType);

        return this.httpClient.get<ChartDto>('http://localhost:7081/api/Data', {params});         
    }
    dataCrossBoarderFlow(data: CrossBoarderFlow) {
        let params = new HttpParams();
        params = params.set('date', data.date.getFullYear() + "-" + data.date.getMonth() + "-" + data.date.getDay());
        params = params.set('countryFrom', data.countryFrom);
        params = params.set('countryTo', data.countryTo);

        return this.httpClient.get<ChartDto>('http://localhost:7082/api/Data', {params});  
        
    }
    // search(search: string, page: number) {
    //     let params = new HttpParams();
    //     params = params.set('search', search);
    //     params = params.set('page', page);
    //     // params = params.set('filters', filters);
        
    //     return this.httpClient.get<ListDto>(environment.path + 'search', { params }); // pass DTO HERE
    // }

    // getPrices(id: number) {
    //     return this.httpClient.get<number[][]>(environment.path + 'prices/' + id);
    // }
}
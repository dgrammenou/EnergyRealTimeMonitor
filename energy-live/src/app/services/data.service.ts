import { HttpClient, HttpParams } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { environment } from "src/environments/environment";  

@Injectable({providedIn: 'root'})
export class DataService {
    superMarkets = ["AB", "Sklavenitis", "My Market", "Kritikos"];
    categories = [
        ["Φρούτα & Λαχανικά", "fruits"],
        ["Κρέας & Ψάρια", "meat"],
        ["Ψυγείου & Αλλαντικά", "fridge"],
        ["Είδη Αρτοζαχαροπλαστείου", "daily-bread"],
        ["Έτοιμα Γεύματα", "Food_Truck"],
        ["Κατοικίδια", "dog"],
        ["Προσωπική Περιποίηση", "personal-care"],
        ["Καθαριστικά", "clean-spray"],
        ["Snacks & Ροφήματα & Ποτά", "coffee-snacks"],
        ["Κατεψυγμένα", "ice-cube"],
        ["Για το μωρό", "biberon"],
        ["Λοιπά", "store"],
    ];
    
    constructor(private httpClient: HttpClient){}

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
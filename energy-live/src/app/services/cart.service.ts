import { HttpClient, HttpParams } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { BehaviorSubject, Observable } from "rxjs";
import { take } from "rxjs/operators";
import { environment } from "src/environments/environment";
import { ProductDto, ProductListDto } from "./product.dto";

@Injectable({providedIn: 'root'})
export class CartService {
    private _data = new BehaviorSubject<ProductDto[]>([]);
    private _dataSize = new BehaviorSubject<number>(0);

    public readonly data: Observable<ProductDto[]> = this._data.asObservable();
    public readonly dataSize: Observable<number> = this._dataSize.asObservable();

    constructor(private httpClient: HttpClient) { 
        const prev = localStorage.getItem('cart');
        if (prev === null) {
            localStorage.setItem('cart', JSON.stringify([]));
        } else {
            const products: ProductDto[] = JSON.parse(prev);
            this.updateCartWithNewData(products).pipe(take(1)).subscribe(res => { 
                this._data.next(res.products); 
                this._dataSize.next(this._data.getValue().length); 
            });
            
        }          
    }
    
    updateCartWithNewData(products: ProductDto[]) {
        let params = new HttpParams();
        params = params.set('products', products.map((product: ProductDto) => product.id).join(', '));
        return this.httpClient.get<ProductListDto>(environment.path + "cart/update", {params});
    }

    getSuperMarket(superMarket: string) {
        return this._data.getValue().filter(x => x?.supermarket === superMarket);
    }

    insertProduct(product: ProductDto) { 
        let list = this._data.getValue().filter(x => x.product != product.product);    
        list.push(product)

        this._data.next(list);      
        this._dataSize.next(list.length);

        this.updateLocalStorage();
    }

    deleteProduct(product: ProductDto) {
        const list = this._data.getValue().filter(item => item != product);

        this._data.next(list);      
        this._dataSize.next(list.length); 
        this.updateLocalStorage();
    }

    private updateLocalStorage() {
        localStorage.removeItem("cart");
        localStorage.setItem("cart", JSON.stringify(this._data.getValue()));
    }
}
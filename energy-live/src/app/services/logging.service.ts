import { Injectable, OnInit } from "@angular/core";
import { GoogleLoginProvider, SocialAuthService, SocialUser } from '@abacritt/angularx-social-login';
import { BehaviorSubject, Observable, take } from "rxjs"; 
import { HttpClient, HttpParams } from "@angular/common/http";

@Injectable({providedIn: 'root'})
export class LoggingService{

    private _user = new BehaviorSubject<SocialUser | null>(null);
    public userValue !: SocialUser | null;
    public readonly user: Observable<SocialUser | null> = this._user.asObservable();
 
    constructor(
        private socialAuthService: SocialAuthService,
        private httpClient: HttpClient
    ) { 
        this.socialAuthService.authState.subscribe((user_: any) => {
            console.log("Service authState: ", user_);
            this._user.next(user_); 
            this.userValue = user_; 
        });
        this.socialAuthService.refreshAuthToken(GoogleLoginProvider.PROVIDER_ID).catch((reason: any) => {
            console.log("login constructor", reason);
        }); 
    }  

    refreshAuthToken() {
        this.socialAuthService.refreshAuthToken(GoogleLoginProvider.PROVIDER_ID).catch((reason: any) => {
            console.log("login constructor", reason);
        }); 
    }
    googleLogin() { 
        this.socialAuthService.signIn(GoogleLoginProvider.PROVIDER_ID).catch((reason: any) => {
            console.log("login", reason);
        });
    }
    signOut() {
        if(this.userValue !== null) {
            this.socialAuthService.signOut(true);
            this._user.next(null);
            this.userValue = null;
         }
    }
    
    getUserData() {
        if (!this.userValue) {
            return ;
        }
        let params = new HttpParams();
         
        params = params.set('firstname', this.userValue?.firstName);
        params = params.set('lastname', this.userValue?.lastName);
        params = params.set('email', this.userValue?.email);
         
        this.httpClient.get('http://paparrigopoulos.com:4020/api/users/login', {params: params}).pipe(take(1)).subscribe((data: any) => {
            
            if (!this.userValue) {
                return ;
            }
            this.userValue.daysLeft = data.daysLeft;
        })
    }

    extendUserPlan(extend: number) {
        if (!this.userValue) {
            return ;
        }
        let params = new HttpParams();
        params = params.set('firstname', this.userValue?.firstName);
        params = params.set('lastname', this.userValue?.lastName);
        params = params.set('email', this.userValue?.email);
        params = params.set('extend', extend); 
        
        return this.httpClient.get('http://paparrigopoulos.com:4020/api/users/extend', {params: params});
    }
}
import { Injectable, OnInit } from "@angular/core";
import { GoogleLoginProvider, SocialAuthService, SocialUser } from '@abacritt/angularx-social-login';
import { BehaviorSubject, Observable } from "rxjs";

@Injectable({providedIn: 'root'})
export class LoggingService{

    private _user = new BehaviorSubject<SocialUser | null>(null);
    public userValue !: SocialUser | null;
    public readonly user: Observable<SocialUser | null> = this._user.asObservable();
 
    constructor(private socialAuthService: SocialAuthService) { 
        this.socialAuthService.authState.subscribe((user_: any) => {
            console.log("Service authState: ", user_);
            this._user.next(user_); 
            this.userValue = user_; 
        });
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
}
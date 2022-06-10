import { SocialUser } from '@abacritt/angularx-social-login';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LoggingService } from '../services/logging.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {
  socialUser!: SocialUser;
  isLoggedin : boolean = false;

  daysLeft = 15;
  extendDays = 0;
  
  constructor(public loggingService: LoggingService, private router: Router) { }

  ngOnInit(): void {

    this.loggingService.user.subscribe((user) => {
      if (user && Object.keys(user).length === 0) {

      } else {
        if (user !== null) {
          this.socialUser = user;
        }
  
        this.isLoggedin = user != null;
      }  
    });
  }
  logOut(): void {
    this.loggingService.signOut(); 
    this.router.navigate(['/']);
  } 

  onCancel() {
    this.extendDays = 0;
  }

  onSave() {
    // todo: save on db
  }

}

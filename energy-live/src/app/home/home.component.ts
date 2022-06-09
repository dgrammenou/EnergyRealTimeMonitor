import { SocialUser } from '@abacritt/angularx-social-login';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router'; 
import { DataService } from '../services/data.service';
import { LoggingService } from '../services/logging.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit { 
  loginForm!: FormGroup;
  socialUser!: SocialUser;
  isLoggedin : boolean = false;
  constructor(
    private formBuilder: FormBuilder, 
    public loggingService: LoggingService,
    private router: Router, 
  ) {}
  ngOnInit() { 
    this.loginForm = this.formBuilder.group({
      email: ['', Validators.required],
      password: ['', Validators.required],
    });
    this.loggingService.user.subscribe((user) => {
      if (user && Object.keys(user).length === 0) {

      } else {
        if (user !== null) {
          this.socialUser = user;
        }
  
        this.isLoggedin = user != null;
      } 
      
      if (user !== null) {
        this.router.navigate(['charts'])
      }
    });
  }
  loginWithGoogle(): void {
    this.loggingService.googleLogin();  
  }
  logOut(): void {
    this.loggingService.signOut(); 
  } 

  onClick(input: string): void {
    if(input === 'about') {
      this.router.navigate(['about']);
    } else if (input === 'plans') {
      this.router.navigate(['plans']);
    } else if (input === 'legal') {
      this.router.navigate(['legal']);
    }
  }
}

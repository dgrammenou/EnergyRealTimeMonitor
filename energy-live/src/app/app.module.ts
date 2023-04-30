import { GoogleLoginProvider, SocialAuthServiceConfig, SocialLoginModule } from '@abacritt/angularx-social-login';
import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { HomeComponent } from './home/home.component';
import { IconsModule } from './icons/icons.module';
import { ChartsComponent } from './charts/charts.component';
import { ProfileComponent } from './profile/profile.component'; 
import { JwtModule } from '@auth0/angular-jwt';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AboutComponent } from './about/about.component';
import { PlansComponent } from './plans/plans.component';
import { LegalComponent } from './legal/legal.component';
import { NgxChartsModule } from '@swimlane/ngx-charts';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FileSaverModule } from 'ngx-filesaver';
import { NgSelectModule } from '@ng-select/ng-select';
import { ChartComponent } from './charts/chart/chart.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent, 
    HeaderComponent, 
    ChartsComponent, 
    ChartComponent,
    ProfileComponent, 
    AboutComponent, 
    PlansComponent, 
    LegalComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    IconsModule, 
    ReactiveFormsModule,
    SocialLoginModule,
    NgbModule,
    NgxChartsModule,
    BrowserAnimationsModule,
    FileSaverModule,
    NgSelectModule
  ],
  
  providers: [
    {
      provide: 'SocialAuthServiceConfig',
      useValue: {
        autoLogin: false,
        providers: [
          {
            id: GoogleLoginProvider.PROVIDER_ID,
            provider: new GoogleLoginProvider('345863516490-2uf3ku2hq10eg7vogeqg7p8jcu3sovug.apps.googleusercontent.com'),
          },
        ],
      } as SocialAuthServiceConfig,
    },
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

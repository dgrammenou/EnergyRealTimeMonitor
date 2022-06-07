import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ChartsComponent } from './charts/charts.component';
import { HomeComponent } from './home/home.component'; 
import { ProfileComponent } from './profile/profile.component';

const routes: Routes = [
  {path: '', pathMatch: 'full', component: HomeComponent}, 
  {path: 'charts', component: ChartsComponent},
  {path: 'profile', component: ProfileComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

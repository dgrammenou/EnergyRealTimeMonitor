import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ChartsComponent } from './charts/charts.component';
import { HomeComponent } from './home/home.component'; 
import { ProfileComponent } from './profile/profile.component';
import { AuthGuard } from './services/auth.guard';
import { NonAuthGuard } from './services/non-auth.guard';

const routes: Routes = [
  {path: '', pathMatch: 'full', component: HomeComponent, canActivate: [NonAuthGuard]}, 
  {path: 'charts', component: ChartsComponent, canActivate: [AuthGuard]},
  {path: 'profile', component: ProfileComponent, canActivate: [AuthGuard]},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

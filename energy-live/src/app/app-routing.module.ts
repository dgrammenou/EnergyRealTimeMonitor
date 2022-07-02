import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AboutComponent } from './about/about.component';
import { ChartsComponent } from './charts/charts.component';
import { HomeComponent } from './home/home.component'; 
import { LegalComponent } from './legal/legal.component';
import { PlansComponent } from './plans/plans.component';
import { ProfileComponent } from './profile/profile.component';
import { AuthGuard } from './services/auth.guard';
import { NonAuthGuard } from './services/non-auth.guard';

const routes: Routes = [
  {path: '', pathMatch: 'full', component: HomeComponent, canActivate: [NonAuthGuard]}, 
  {path: 'charts', component: ChartsComponent, canActivate: [AuthGuard]},
  {path: 'profile', component: ProfileComponent, canActivate: [AuthGuard]},
  {path: 'about', component: AboutComponent},
  {path: 'plans', component: PlansComponent},
  {path: 'legal', component: LegalComponent},
  {path: '***', component: HomeComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

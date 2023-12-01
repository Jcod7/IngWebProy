import { Routes } from '@angular/router';
import { LoginComponent } from './auth/login/login.component';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import { NewpasswordComponent } from './shared/newpassword/newpassword.component';


export const routes: Routes = [
  {path:'',redirectTo:'/inicio', pathMatch:'full'},
  {path:'inicio',component:DashboardComponent},
  {path:'iniciar-sesion',component:LoginComponent},
  {path:'forgot-password',component:NewpasswordComponent},
  {path:'forgot-password',redirectTo:'/forgot-password', pathMatch:'full'},
];


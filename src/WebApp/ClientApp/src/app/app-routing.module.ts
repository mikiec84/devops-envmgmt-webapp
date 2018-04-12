import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { Routes, RouterModule } from '@angular/router';

import { HomeComponent } from './components/home/home.component';
import { adminhomepage } from './components/admin/adminhomepage/adminhomepage.component';
import { RetrieveUsersComponent } from './components/admin/retrieveusers/retrieveusers.component';
import { adduser } from './components/admin/addusers/addusers.component';
import { updateenvdashboard } from './components/updateenvdashboard/updateenvdashboard.component';

const routes: Routes = [
  { path: '', component: HomeComponent, pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  { path: 'admin', component: adminhomepage },
  { path: 'admin/retrieve-user', component: RetrieveUsersComponent },
  { path: 'admin/adduser', component: adduser },
  { path: 'admin/adduser/:id', component: adduser },
  { path: 'updateenvdashboard', component: updateenvdashboard },
  { path: '**', redirectTo: 'home' }
];


@NgModule({
  imports: [
    BrowserModule,
    RouterModule.forRoot( routes, { useHash: true } ),
  ],
  providers: [  ],
  declarations: [ ],
  exports: [
    RouterModule
  ],
})

export class AppRoutingModule {}
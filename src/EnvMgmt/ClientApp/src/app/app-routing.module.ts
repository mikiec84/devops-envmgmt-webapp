import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { Routes, RouterModule } from '@angular/router';

import { HomeComponent } from './components/home/home.component';
import { adminhomepage } from './components/admin/adminhomepage/adminhomepage.component';
import { RetrieveUsersComponent } from './components/admin/retrieveusers/retrieveusers.component';
import { adduser } from './components/admin/addusers/addusers.component';
import { updateenvdashboard } from './components/updateenvdashboard/updateenvdashboard.component';
import { EnvRequestForm } from './components/envrequestform/envrequestform.component';
import { HpalmReleaseBundlePivotComponent } from './components/hpalm-release-bundle-pivot/hpalm-release-bundle-pivot.component';
import { TfsLabelsAndTagsReportComponent } from './components/reports/tfs-labels-and-tags-report/tfs-labels-and-tags-report.component';

import { HPALMDashboardComponent } from './components/hpalm-dashboard/hpalm-dashboard.component';
import { CdkDetailRowDirective } from './components/hpalm-dashboard/cdk-detail-row.directive';

const routes: Routes = [
  { path: '', component: HomeComponent, pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  { path: 'admin', component: adminhomepage },
  { path: 'admin/retrieve-user', component: RetrieveUsersComponent },
  { path: 'admin/adduser', component: adduser },
  { path: 'admin/adduser/:id', component: adduser },
  { path: 'envrequestform', component: EnvRequestForm},
  { path: 'updateenvdashboard', component: updateenvdashboard },
  { path: 'hpalmdashboard', component: HPALMDashboardComponent },
  { path: 'hpalmdashboard/:relid', component: HPALMDashboardComponent },
  { path: 'HpalmReleaseBundlePivotComponent', component: HpalmReleaseBundlePivotComponent },
  { path: 'HpalmReleaseBundlePivotComponent/:relid', component: HpalmReleaseBundlePivotComponent },
  { path: 'reports/TfsLabelsAndTagsReport', component: TfsLabelsAndTagsReportComponent }
];
//,
//{ path: '**', redirectTo: 'home' }

@NgModule({
  imports: [
    BrowserModule,
    RouterModule.forRoot( routes, { useHash: false } ),
  ],
  providers: [  ],
  declarations: [
   ],
  exports: [
    RouterModule
  ],
})

export class AppRoutingModule {}

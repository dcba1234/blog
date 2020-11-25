import { ProfileComponent } from './pages/new-home/profile/profile.component';
import { NewDetailComponent } from './pages/new-home/new-detail/new-detail.component';
import { SourceDataComponent } from './pages/new-home/source-data/source-data.component';
import { SourceListComponent } from './pages/new-home/source-list/source-list.component';
import { HomeCategoryComponent } from './pages/new-home/home-category/home-category.component';
import { CategoryComponent } from './pages/category/category.component';
import { SourceDetailComponent } from './pages/new-home/source-detail/source-detail.component';
import { HomePageComponent } from './pages/home-page/home-page.component';
import { RegisterComponent } from './pages/register/register.component';
import { NewHomeComponent } from './pages/new-home/new-home.component';
import { LoginComponent } from './pages/login/login.component';
import { Routes } from '@angular/router';

import { AdminLayoutComponent } from './layouts/admin-layout/admin-layout.component';
import { PermissionGuard } from './services/permission.guard';

export const AppRoutes: Routes = [
  {
    path: '',
    redirectTo: 'news-home',
    pathMatch: 'full',
  }, {
    path: 'admin',
    component: AdminLayoutComponent,
    canActivate: [PermissionGuard],
    children: [
        {
      path: '',
      loadChildren: './layouts/admin-layout/admin-layout.module#AdminLayoutModule'
  }]},
  {
    path: 'login',
    component: LoginComponent
  },
  {
    path: 'register',
    component: RegisterComponent
  },
  {
    path: 'home',
    component: NewHomeComponent,
    children: [
      {
        path: '',
        redirectTo: 'hot',
        pathMatch: 'full',
      },
      {
        path: 'hot',
        component: HomePageComponent
      },
      {
        path: 'all',
        component: SourceListComponent,
        data: { code: 'all' }
      },
      {
        path: 'category',
        component: HomeCategoryComponent
      },
      {
        path: 'source',
        component: SourceDataComponent
      },
      {
        path: 'dantri',
        component: SourceDetailComponent,
        data: { code: 'dantri.com' }
      },
      {
        path: 'vnexpress',
        component: SourceDetailComponent,
        data: { code: 'vnexpress' }
      },
      {
        path: 'detail/:slug',
        component: NewDetailComponent,
      },
      {
        path: 'profile',
        component: ProfileComponent,
      }
    ]
  },
  {
    path: '**',
    redirectTo: 'home'
  }
]

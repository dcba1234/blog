import { JobComponent } from './../../pages/job/job.component';
import { NotificationComponent } from './../../pages/notification/notification.component';
import { CategoryComponent } from './../../pages/category/category.component';
import { ReportComponent } from './../../pages/report/report.component';
import { UserManagerComponent } from './../../pages/user-manager/user-manager.component';
import { CountryComponent } from './../../pages/country/country.component';
import { GenderComponent } from './../../pages/gender/gender.component';
import { ArticlesComponent } from './../../pages/articles/articles.component';
import { WebSettingDetailComponent } from './../../pages/web-setting-detail/web-setting-detail.component';
import { WebPageComponent } from './../../pages/web-page/web-page.component';
import { WebSettingComponent } from './../../pages/web-setting/web-setting.component';
import { Routes } from '@angular/router';

import { DashboardComponent } from '../../pages/dashboard/dashboard.component';
import { UserComponent } from '../../pages/user/user.component';
import { TableComponent } from '../../pages/table/table.component';
import { TypographyComponent } from '../../pages/typography/typography.component';
import { IconsComponent } from '../../pages/icons/icons.component';
import { MapsComponent } from '../../pages/maps/maps.component';
import { NotificationsComponent } from '../../pages/notifications/notifications.component';
import { UpgradeComponent } from '../../pages/upgrade/upgrade.component';

export const AdminLayoutRoutes: Routes = [
    { path: '',    redirectTo: 'home', pathMatch: 'full' },
    { path: 'home',      component: DashboardComponent },
    { path: 'web-setting',      component: WebSettingComponent },
    { path: 'job',      component: JobComponent },
    { path: 'user',           component: UserComponent },
    { path: 'table',          component: TableComponent },
    { path: 'typography',     component: TypographyComponent },
    { path: 'icons',          component: IconsComponent },
    { path: 'maps',           component: MapsComponent },
    { path: 'notifications',  component: NotificationsComponent },
    { path: 'upgrade',        component: UpgradeComponent },
    { path: 'web-setting/:id',        component: WebPageComponent },
    { path: 'web-page/:id',        component: WebSettingDetailComponent },
    { path: 'articles',        component: ArticlesComponent },
    { path: 'gender',        component: GenderComponent },
    { path: 'country',        component: CountryComponent },
    { path: 'notification',        component: NotificationComponent },
    { path: 'user-manager',        component: UserManagerComponent },
    { path: 'report',        component: ReportComponent },
    { path: 'category',        component: CategoryComponent },
];

import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ToastrModule } from 'ngx-toastr';
import { NgSelectModule } from '@ng-select/ng-select';
import { SidebarModule } from './sidebar/sidebar.module';
import { FooterModule } from './shared/footer/footer.module';
import { NavbarModule } from './shared/navbar/navbar.module';
import { FixedPluginModule } from './shared/fixedplugin/fixedplugin.module';
import { ModalModule } from 'ngx-bootstrap/modal';
import { AppComponent } from './app.component';
import { AppRoutes } from './app.routing';
import { HttpClientModule } from '@angular/common/http';
import { AdminLayoutComponent } from './layouts/admin-layout/admin-layout.component';
import { PaginationModule } from 'ngx-bootstrap/pagination';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { WebSettingComponent } from './pages/web-setting/web-setting.component';
import { CardComponent } from './component/card/card.component';
import { WebPageComponent } from './pages/web-page/web-page.component';
import { WebSettingDetailComponent } from './pages/web-setting-detail/web-setting-detail.component';
import { CKEditorModule } from '@ckeditor/ckeditor5-angular';
import { NgDragDropModule } from 'ng-drag-drop';
import { DragulaModule } from 'ng2-dragula';
import { LoadingBarModule } from '@ngx-loading-bar/core';
import { LoadingBarHttpClientModule } from '@ngx-loading-bar/http-client';
import { ArticlesComponent } from './pages/articles/articles.component';
import { CategoryComponent } from './pages/category/category.component';
import { GenderComponent } from './pages/gender/gender.component';
import { CountryComponent } from './pages/country/country.component';
import { UserManagerComponent } from './pages/user-manager/user-manager.component';
import { NotificationComponent } from './pages/notification/notification.component';
import { ReportComponent } from './pages/report/report.component';
@NgModule({
  declarations: [AppComponent, AdminLayoutComponent, WebSettingComponent, CardComponent, WebPageComponent, WebSettingDetailComponent, ArticlesComponent, CategoryComponent, GenderComponent, CountryComponent, UserManagerComponent, NotificationComponent, ReportComponent],
  imports: [
    BrowserAnimationsModule,
    RouterModule.forRoot(AppRoutes, {
      useHash: true,
    }),
    SidebarModule,
    NavbarModule,
    ToastrModule.forRoot({
      positionClass: 'toast-bottom-right',
      preventDuplicates: true,
    }),
    FooterModule,
    FixedPluginModule,
    FontAwesomeModule,
    ReactiveFormsModule,
    FormsModule,
    PaginationModule.forRoot(),
    HttpClientModule,
    ModalModule.forRoot(),
    PaginationModule.forRoot(),
    NgSelectModule,
    CKEditorModule,
    NgDragDropModule.forRoot(),
    DragulaModule.forRoot(),
    LoadingBarModule,
    LoadingBarHttpClientModule

  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}

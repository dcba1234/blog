import { Component, OnInit } from '@angular/core';


export interface RouteInfo {
    path: string;
    title: string;
    icon: string;
    class: string;
}

export const ROUTES: RouteInfo[] = [
    { path: '/home',     title: 'home',         icon: 'nc-app',       class: '' },
    { path: '/web-setting',     title: 'setting',         icon: 'nc-settings',       class: '' },
    { path: '/web-settingg',     title: 'Article',         icon: 'nc-paper',       class: '' },
    { path: '/icons',         title: 'Gender',             icon: 'nc-align-left-2',    class: '' },
    { path: '/maps',          title: 'Country',              icon: 'nc-globe',      class: '' },
    { path: '/notifications', title: 'Notifications',     icon: 'nc-bell-55',    class: '' },
    { path: '/user',          title: 'User Manager',      icon: 'nc-single-02',  class: '' },
    { path: '/user',          title: 'Report',      icon: 'nc-support-17',  class: '' },
    { path: '/table',         title: 'Category',        icon: 'nc-tile-56',    class: '' },
    { path: '/typography',    title: 'Tag',        icon: 'nc-book-bookmark', class: '' },
    
];
//{ path: '/upgrade',       title: 'Upgrade to PRO',    icon: 'nc-spaceship',  class: 'active-pro' },
@Component({
    moduleId: module.id,
    selector: 'sidebar-cmp',
    templateUrl: 'sidebar.component.html',
})

export class SidebarComponent implements OnInit {
    public menuItems: any[];
    ngOnInit() {
        this.menuItems = ROUTES.filter(menuItem => menuItem);
    }
}

import { BehaviorSubject } from 'rxjs';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthenticationService } from 'app/services/authen.service';
import { API } from 'app/services/constant.enum';
import { IUser } from 'app/shared/models/User';

@Component({
  selector: 'new-home',
  templateUrl: './new-home.component.html',
  styleUrls: ['./new-home.component.scss']
})
export class NewHomeComponent implements OnInit {
  key;
  user: IUser;
  public name = '';
  public avatar = '';
  constructor(private router: Router, private authen: AuthenticationService) {
    authen.userInfo.subscribe((data) => {
      this.name = data.name;
    })
    authen.avatarInfo.subscribe((data) => {
      if (data.indexOf('http') < 0) {
        this.avatar = API.BASE_URL + '/' + data
      }
    })
   }

  ngOnInit(): void {
    this.initData();
  }

  initData() {
    const userInfo = this.authen.getInfo();
    console.log(userInfo);
    if (userInfo) {
      this.user = userInfo;
      if (this.user.avatar.indexOf('http') < 0) {
        this.user.avatar = API.BASE_URL + '/' + this.user.avatar
      }
    }
  }

  onEnter() {
    this.router.navigate(['/home/all'], { queryParams: { key: this.key } })
  }

  logOut() {
    localStorage.clear();
    this.router.navigate(['/login'])
  }

  toProfile() {
    this.router.navigate(['/home/profile'])
  }

}

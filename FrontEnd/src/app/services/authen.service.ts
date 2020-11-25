import { IUser } from './../shared/models/User';
import { API } from 'app/services/constant.enum';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {
  userInfo: BehaviorSubject<{name: string}> = new BehaviorSubject({name: ''});
  avatarInfo: BehaviorSubject<string> = new BehaviorSubject('');
  constructor(private http: HttpClient) { }
  login(user) {
    return this.http.post<any>(`${API.BASE_URL}${API.LOGIN}`, { user });
  }
  register(user) {
    return this.http.post<any>(`${API.BASE_URL}${API.REGISTER}`, { user });
  }
  saveToStorage(jwt: string) {
    localStorage.setItem('token', jwt);
  }
  getToken() {
    return localStorage.getItem('token');
  }

  getInfo(): IUser {
    const info = JSON.parse(localStorage.getItem('info'));
    this.userInfo.next({ name: info.firstName + ' ' + info.lastName});
    this.avatarInfo.next(info.avatar);
    return JSON.parse(localStorage.getItem('info'));
  }

  deleteToken() {
    return localStorage.removeItem('token');
  }
  setName(name) {
    this.userInfo.next({name: name});
  }

  setAvatar(avatar) {
    this.avatarInfo.next(avatar);
    const info = JSON.parse(localStorage.getItem('info'));
    localStorage.setItem('info', JSON.stringify({ ...info, avatar }))
  }

  getCurrentUser() {
    return this.http.get<any>(`${API.LOGIN}`);
  }
}

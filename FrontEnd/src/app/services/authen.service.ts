import { API } from 'app/services/constant.enum';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {
  userInfo: BehaviorSubject<{name: string}> = new BehaviorSubject({name: ''});
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

  deleteToken() {
    return localStorage.removeItem('token');
  }
  setName(name) {
    this.userInfo.next({name});
  }

  getCurrentUser() {
    return this.http.get<any>(`${API.LOGIN}`);
  }
}

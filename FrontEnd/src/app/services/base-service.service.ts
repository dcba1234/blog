import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Subject } from 'rxjs';
import { API } from './constant.enum';

@Injectable({
  providedIn: 'root'
})
export class BaseService {
  isLoading = new BehaviorSubject(false);
  constructor(private http: HttpClient) { }

  makeGet(url, params?) {
    const token = localStorage.getItem('token');
    const option = {
      params
    }
    if (token) {
      option['headers'] = {
        authtoken: token
      };
    }
    return this.http.get<any>(API.BASE_URL + url, option);
  }

  getSimilar(summary) {
    return this.http.get<any>(API.PYTHON + `?q=` + summary);
  }

  makeUpload(url, data, option = {}) {
    const token = localStorage.getItem('token');
    const formData = new FormData();
    formData.append('file', data);
    if (token) {
      option['headers'] = {
        authtoken: token
      };
      option['Content-Type'] = data.type
    }
    return this.http.post(API.BASE_URL + url, formData, option);
  }

  makePost(url, data, option = {}) {
    const token = localStorage.getItem('token');
    if (token) {
      option['headers'] = {
        authtoken: token
      };
    }
    return this.http.post(API.BASE_URL + url, data, option);
  }

  makePut(url, data, params?) {
    const option = {
      params
    }
    return this.http.put(API.BASE_URL + url, data, option);
  }

  makeDelete(url, data?, params?) {
    const option = {
      params
    }
    return this.http.delete(API.BASE_URL + url);
  }
}

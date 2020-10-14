import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { API } from './constant.enum';

@Injectable({
  providedIn: 'root'
})
export class BaseService {

  constructor(private http: HttpClient) { }

  makeGet(url, params?) {
    const option = {
      params
    }
    return this.http.get(API.BASE_URL + url, option);
  }

  makePost(url, data, option?) {
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
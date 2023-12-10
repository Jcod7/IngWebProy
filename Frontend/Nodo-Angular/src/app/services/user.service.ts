import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs'

@Injectable({
  providedIn: 'root'
})

@Injectable()
export class UsersService {

  constructor(private http: HttpClient) { }

  // Definimos la URL base del API  
  baseUrl = 'http://localhost:8080';

  signup(user: any) {
    // Indicamos la URL completa en cada petición
    return this.http.post(`${this.baseUrl}/signup`, user);
  }

  login(user: any) {
    return this.http.post(`${this.baseUrl}/login`, user);
  }

  getUsers():Observable<any> {
    return this.http.get(`${this.baseUrl}/get`);
  }

}
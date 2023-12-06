import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { User } from '../../auth/user';
import { Observable, catchError, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-user',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './user.component.html',
  styleUrl: './user.component.css'
})
export class UserComponent {
  constructor(private http:HttpClient){

  }

  getUser(id:number):Observable<User>{
    return this.http.get<User>(environment.utlApi+"user/"+id).pipe(
      catchError(this.handleError)
    )
  }

  updateUser(userRequest:User):Observable<any>
  {
    return this.http.put(environment.utlApi+"user", userRequest).pipe(
      catchError(this.handleError)
    )
  }

  private handleError(error:HttpErrorResponse){
    if(error.status===0){
      console.error('Se ha producio un error ', error.error);
    }
    else{
      console.error('Backend retornó el código de estado ', error.status, error.error);
    }
    return throwError(()=> new Error('Algo falló. Por favor intente nuevamente.'));
  }
}

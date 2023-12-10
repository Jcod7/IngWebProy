import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { ValidatorsService } from 'src/app/services/auth/validators.service';
import { EmailValidator } from 'src/app/services/auth/email-validator.service';
import { RouterLink } from '@angular/router';
import { FooterComponent } from "../footer/footer.component";
import { CedulaValidatorService } from 'src/app/services/auth/cedula-validator';

@Component({
  selector: 'app-register',
  standalone: true,
  templateUrl: './register.component.html',
  styleUrl: './register.component.css',
  imports: [CommonModule, ReactiveFormsModule, RouterLink, FooterComponent]
})

export class RegisterComponent {
  public myForm: FormGroup = this.fb.group({
    name: ['', [Validators.required, Validators.minLength(2)]],
    last_name: ['', [Validators.required, Validators.minLength(2)]],
    email: ['', [Validators.required, Validators.pattern(this.validatorsService.emailPattern)], [this.emailValidator]],
    username: ['', [Validators.required, this.validatorsService.cantBeStrider]],
    password: ['', [Validators.required, Validators.minLength(6)]],
    password2: ['', [Validators.required]]
    // ,cedula: ['',[Validators.required, this.cedulaValidator.validateCedula()],]
  }, {
    validators: [this.validatorsService.isFieldOneEqualFieldTwo('password', 'password2')],
  });

  constructor(
    private fb: FormBuilder,
    private validatorsService: ValidatorsService,
    private emailValidator: EmailValidator,
    private cedulaValidator: CedulaValidatorService
  ) { }

  isValidField(field: string) {
    return this.validatorsService.isValidField(this.myForm, field);
  }

  onSubmit() {
    this.myForm.markAllAsTouched();
    if (this.myForm.valid) {
      // Realiza cualquier lógica adicional al enviar el formulario
      console.log('Formulario válido. Datos:', this.myForm.value);
    }
  }
}
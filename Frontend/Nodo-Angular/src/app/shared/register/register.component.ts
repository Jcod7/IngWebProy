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
    email: ['', [Validators.required]],
    username: ['', [Validators.required]],
    password: ['', [Validators.required, Validators.minLength(6)]],
    password2: ['', [Validators.required]],
    cedula: ['', [Validators.required]],  // Agrega la validación según tus requisitos para la cédula
    // ... otros campos
  }, {
    validators: [this.isFieldOneEqualFieldTwo('password', 'password2')],
  });

  constructor(
    private fb: FormBuilder,
    private emailValidator: EmailValidator,
    private cedulaValidator: CedulaValidatorService
  ) { }

  isValidField(field: string) {
    const control = this.myForm.controls[field];
    return control ? control.valid && control.touched : false;
  }

  isFieldOneEqualFieldTwo(field1: string, field2: string) {
    return (formGroup: FormGroup) => {
      const control1 = formGroup.controls[field1];
      const control2 = formGroup.controls[field2];

      if (control1.value !== control2.value) {
        control2.setErrors({ notEqual: true });
      } else {
        control2.setErrors(null);
      }
    };
  }

  onSubmit() {
    this.myForm.markAllAsTouched();
    if (this.myForm.valid) {
      // Realiza cualquier lógica adicional al enviar el formulario
      console.log('Formulario válido. Datos:', this.myForm.value);
    }
  }
}
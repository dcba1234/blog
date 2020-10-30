import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthenticationService } from 'app/services/authen.service';
import { first } from 'rxjs/operators';

@Component({
  selector: 'register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {
  registerForm: FormGroup;
  loading = false;
  submitted = false;
  error = '';
  constructor(
      private formBuilder: FormBuilder,
      private router: Router,
      private authenticationService: AuthenticationService,
      ) { }

  ngOnInit() {
      this.registerForm = this.formBuilder.group({
          firstName: ['', Validators.required],
          lastName: ['', Validators.required],
          account: ['', Validators.required],
          password: ['', [Validators.required, Validators.minLength(6)]]
      });
      this.registerForm.valueChanges.subscribe(() => {
        this.error = '';
      })
  }

  // convenience getter for easy access to form fields
  get f() { return this.registerForm.controls; }

  onSubmit() {
      this.submitted = true;

      // stop here if form is invalid
      if (this.registerForm.invalid) {
          return;
      }

      this.loading = true;
      this.authenticationService.register(this.registerForm.value)
      .pipe(first())
      .subscribe(
          data => {
              this.authenticationService.saveToStorage(data.accessToken)
              this.router.navigate(['/news-home']);
          },
          error => {
              console.log(error);
              this.error = error.error;
              this.loading = false;
          });
  }

}

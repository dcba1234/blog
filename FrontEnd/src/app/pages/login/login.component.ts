import { API } from 'app/services/constant.enum';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthenticationService } from 'app/services/authen.service';
import { BaseService } from 'app/services/base-service.service';
import { first } from 'rxjs/operators';
@Component({
  selector: 'login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup;
  loading = false;
  submitted = false;
  returnUrl: string;
  error = '';
  constructor(
      private formBuilder: FormBuilder,
      private svc: BaseService,
      private route: ActivatedRoute,
      private router: Router,
      private authenticationService: AuthenticationService,
      ) {}

  ngOnInit() {
      this.loginForm = this.formBuilder.group({
          account: ['', Validators.required],
          password: ['', Validators.required]
      });
      this.loginForm.valueChanges.subscribe(() => {
        this.error = '';
      })
  }

  // convenience getter for easy access to form fields
  get f() { return this.loginForm.controls; }

  onSubmit() {
      this.submitted = true;

      // stop here if form is invalid
      if (this.loginForm.invalid) {
          return;
      }

      this.loading = true;
      this.authenticationService.login({ account: this.f.account.value, password: this.f.password.value })
          .pipe(first())
          .subscribe(
              data => {
                  this.authenticationService.saveToStorage(data.accessToken);
                  this.svc.makeGet((API.INFO)).subscribe((user) => {
                    localStorage.setItem(`info`, JSON.stringify(user));
                    this.router.navigate(['/news-home']);
                  })
              },
              error => {
                  console.log(error);
                  this.error = error.error;
                  this.loading = false;
              });
  }

}

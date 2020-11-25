import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { IUser } from './../../../shared/models/User';
import { API } from 'app/services/constant.enum';
import { AuthenticationService } from './../../../services/authen.service';
import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { BaseService } from 'app/services/base-service.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {
  @ViewChild('fileInput') fileInput;
  dataSource: IUser;
  imageUrl;
  country;
  gender;
  form: FormGroup;
  constructor(private router: Router,
              private authen: AuthenticationService,
              private fb: FormBuilder,
              private cd: ChangeDetectorRef,
              private svc: BaseService, private toastr: ToastrService) { }

  ngOnInit(): void {
    this.initForm();
    this.loadData();
  }

  loadData() {
    const token = this.authen.getToken();
    if (!token) {
      this.router.navigate(['/login']);
    }
    this.svc.makeGet(API.INFO).subscribe((item) => {
      console.log(item)
      this.dataSource = item;
      if (this.dataSource.avatar.indexOf('http') < 0) {
        this.dataSource.avatar = API.BASE_URL + '/' + this.dataSource.avatar
      }
      this.form.patchValue(item);
    })
    this.svc.makeGet(API.COUNTRY + '/all').subscribe((item) => {
      this.country = item;
    })
    this.svc.makeGet(API.GENDER + '/all').subscribe((item) => {
      this.gender = item;
    })
  }

  initForm() {
    this.form = this.fb.group({
      avatar: [],
      countryId: [],
      email: [],
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      genderId: [],
      introduce: [],
      account: []
    })
  }

  update() {
    this.form.markAllAsTouched();
    this.form.markAsDirty();
    if (this.form.invalid) {
      return;
    }
    this.svc.makePost(API.INFO, this.form.value).subscribe((data: any) => {
      const info = JSON.parse(localStorage.getItem('info'));
      info.firstName = data.First_Name
      info.lastName = data.Last_Name
      localStorage.setItem('info', JSON.stringify({ ...info}))
      this.authen.setName(data.First_Name + ' ' + data.Last_Name)
      this.dataSource = { ...this.dataSource, ...data };
      this.cd.detectChanges();
      this.toastr.success(
        '<span data-notify="icon" class="nc-icon nc-bell-55"></span><span data-notify="message">Save successfully!</span>',
        '',
        {
          timeOut: 3000,
          closeButton: true,
          enableHtml: true,
          toastClass: 'alert alert-success alert-with-icon',
          positionClass: 'toast-top-right'
        }
      );
    });
  }

  upload() {
    this.fileInput.nativeElement.click();
  }

  uploadFile(event) {
    const reader = new FileReader(); // HTML5 FileReader API
    const file = event.target.files[0];
    if (event.target.files && event.target.files[0]) {
      reader.readAsDataURL(file);

      // When file uploads set it to file formcontrol
      reader.onload = () => {
        this.svc.makeUpload(API.AVATAR, file).subscribe((data: any) => {
          this.form.patchValue({
            avatar: data.path
           });
           this.authen.setAvatar(data.path)
          this.dataSource.avatar = API.BASE_URL + '/' + data.path;
        })
      }
      // ChangeDetectorRef since file is loading outside the zone
      this.cd.markForCheck();
    }
  }

  isError(key, errorKey) {
    if (!errorKey) {
      return this.form.get(key).invalid && (this.form.get(key).dirty || this.form.get(key).touched)
    }
    return this.form.get(key).hasError(errorKey) && (this.form.get(key).dirty || this.form.get(key).touched)
  }
}

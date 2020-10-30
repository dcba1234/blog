import { ActivatedRoute, Router } from '@angular/router';
import { Route } from '@angular/compiler/src/core';
import { Component, OnInit, TemplateRef } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { BaseService } from 'app/services/base-service.service';
import { API } from 'app/services/constant.enum';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'web-setting',
  templateUrl: './web-setting.component.html',
  styleUrls: ['./web-setting.component.scss']
})
export class WebSettingComponent implements OnInit {
  dataSource = {
    rows: [],
    total: 0,
    itemPerPage: 0,
    page: 1
  };
  config = {
    backdrop: true,
    ignoreBackdropClick: true
  };
  modalRef: BsModalRef;
  form: FormGroup;
  formSave: FormGroup;
  currentItem
  params: any = {};
  constructor(private svc: BaseService,
    private modalService: BsModalService,
    private fb: FormBuilder,
    private router: Router,
    private activeRoute: ActivatedRoute,
    private toastr: ToastrService) { }

  ngOnInit(): void {
    this.buildForm();
    this.loadData();
  }

  loadData() {
    this.svc.makeGet(`${API.SETTING_WEB}`, { ...this.form.value }).subscribe((data: any) => {
      this.dataSource = data;
     })
  }

  buildForm() {
    this.form = this.fb.group({
      key: ['']
    })
    this.formSave = this.fb.group({
      title: ['', Validators.required],
      note: ['', Validators.required],
      url: ['', Validators.required]
    })
    this.form.valueChanges.subscribe((value) => {
      this.loadData();
    })
  }

  openModal(template: TemplateRef<any>) {
    this.modalRef = this.modalService.show(template,  this.config);
  }

  goTo(item) {
    this.router.navigateByUrl('/admin/web-setting/' + item.id)
  }

  closeModal() {
    this.modalRef.hide();
  }

  isError(key, errorKey) {
    if (!errorKey) {
      return this.formSave.get(key).invalid && (this.formSave.get(key).dirty || this.formSave.get(key).touched)
    }
    return this.formSave.get(key).hasError(errorKey) && (this.formSave.get(key).dirty || this.formSave.get(key).touched)
  }

  submit() {
    this.formSave.markAsDirty();
    this.formSave.markAllAsTouched();
    if (this.formSave.invalid) {
      return;
    }
    const saveItem = { ...this.formSave.value };
    if (this.currentItem) {
      saveItem.id = this.currentItem.id;
    }
    this.closeModal();
    this.formSave.reset();
    this.svc.makePost(`${API.SETTING_WEB}`, saveItem).subscribe((data: any) => {
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
      this.loadData();
   })
  }

}

import { Component, OnInit, TemplateRef } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { BaseService } from 'app/services/base-service.service';
import { API } from 'app/services/constant.enum';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'web-page',
  templateUrl: './web-page.component.html',
  styleUrls: ['./web-page.component.scss']
})
export class WebPageComponent implements OnInit {
  dataSource = {
    rows: [],
    total: 0,
    itemPerPage: 0,
    page: 1
  };
  currentPage = 1;
  config = {
    backdrop: true,
    ignoreBackdropClick: true,
    class: 'modal-lg modal-dialog-centered'
  };
  config2 = {
    backdrop: true,
    ignoreBackdropClick: true,
    class: 'modal-dialog-centered'
  };
  currentItemId;
  modalRef: BsModalRef;
  confirmRef: BsModalRef;
  currentId;
  cols = ['Id', 'Title', 'Url', ''];
  form: FormGroup;
  constructor(
    private svc: BaseService,
    private modalService: BsModalService,
    private fb: FormBuilder,
    private router: Router,
    private activeRoute: ActivatedRoute,
    private toastr: ToastrService
     ) { }

  ngOnInit(): void {
    this.buildForm();
    this.activeRoute.params.subscribe((params) => {
      this.currentId = params.id;
      this.loadData();
    })
  }

  loadData() {
    this.svc.makeGet(`${API.SETTING_PAGE_LIST}/${this.currentId}`).subscribe((data: any) => {
      this.dataSource = data;
      setTimeout(() => {
        this.currentPage = 1;
      })
   })
  }

  pageChange(page) {
    if (this.currentId) {
      this.svc.makeGet(`${API.SETTING_PAGE_LIST}/${this.currentId}`, { page: page.page }).subscribe((data: any) => {
        this.dataSource = data;
     })
    }
  }

  buildForm() {
    this.form = this.fb.group({
      title: ['', Validators.required],
      url: ['', Validators.required]
    })
  }

  openModal(template: TemplateRef<any>) {
    this.currentItemId = undefined;
    this.modalRef = this.modalService.show(template,  this.config);
  }

  closeModal() {
    this.modalRef.hide();
  }

  closeConfirmModal() {
    this.confirmRef.hide();
  }

  goTo(item) {
    this.router.navigateByUrl('/web-setting/' + item.id)
  }

  isError(key, errorKey) {
    if (!errorKey) {
      return this.form.get(key).invalid && (this.form.dirty || this.form.get(key).touched)
    }
    return this.form.get(key).hasError(errorKey) && (this.form.dirty || this.form.get(key).touched)
  }

  submit() {
    this.form.markAsDirty();
    if (this.form.invalid) {
      return;
    }
    const saveItem = { ...this.form.value };
    saveItem.webId = this.currentId;
    if (this.currentItemId) {
      saveItem.id = this.currentItemId;
    }
    this.closeModal();
    this.form.reset();
    this.svc.makePost(`${API.SETTING_PAGE_LIST}/save`, saveItem).subscribe((data: any) => {
      this.toastr.success('Save successfully!', '', { positionClass: 'toast-top-right' });
      this.loadData();
   })
  }

  edit(item, template) {
    this.currentItemId = item.id;
    this.form.patchValue(item);
    this.modalRef = this.modalService.show(template,  this.config);
  }

  openConfirm(template, item) {
    this.confirmRef = this.modalService.show(template,  this.config2);
    this.currentItemId = item.id;
  }

  confirm() {
    this.svc.makeDelete(`${API.SETTING_PAGE_LIST}/delete/${this.currentItemId}`).subscribe(() => {
      this.loadData();
      this.confirmRef.hide();
    });
  }
}

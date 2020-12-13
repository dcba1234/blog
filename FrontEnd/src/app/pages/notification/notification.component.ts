import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { BaseService } from 'app/services/base-service.service';
import { API } from 'app/services/constant.enum';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'notification',
  templateUrl: './notification.component.html',
  styleUrls: ['./notification.component.scss']
})
export class NotificationComponent implements OnInit {
  confirmRef: BsModalRef;
  modalRef: BsModalRef;
  orderDataSource = [
    {
      id: 'Created desc',
      label: 'Created desc'
    },
    {
      id: 'Created asc',
      label: 'Created asc'
    },
    {
      id: 'Title desc',
      label: 'Title desc'
    },
    {
      id: 'Title asc',
      label: 'Title asc'
    },
  ]
  dataSource = {
    rows: [],
    total: 0,
    itemPerPage: 0,
    page: 1
  };
  form: FormGroup;
  formSave: FormGroup;
  config = {
    backdrop: true,
    ignoreBackdropClick: true,
    class: 'modal-lg modal-dialog-centered'
  };
  config2 = {
    backdrop: true,
    ignoreBackdropClick: true,
    class: 'modal-s modal-dialog-centered'
  };
  cols = ['Id', 'Title', 'Create By', 'Created', 'Action'];
  currentPage = 1;
  currentId;
  currentItem
  params: any = {};
  constructor(private svc: BaseService,
    private modalService: BsModalService,
    private fb: FormBuilder,
    private router: Router,
    private activeRoute: ActivatedRoute,
    private toastr: ToastrService) { }

  ngOnInit(): void {
    this.initForm();
    this.loadData();
  }

  initForm() {
    this.form = this.fb.group({
      orderBy: ['Created desc'],
      key: ['']
    })
    this.formSave = this.fb.group({
      id: [],
      title: ['', Validators.required],
    })
    this.form.valueChanges.subscribe((value) => {
      this.loadData();
    })
  }

  loadData() {
    this.svc.makeGet(`${API.NOTIFICATION}`, { ...this.form.value }).subscribe((data: any) => {
      this.dataSource = data;
      setTimeout(() => {
        this.currentPage = 1;
      })
   })
  }

  active(type: 'active' | 'deactive', id) {
    this.svc.makeDelete(`${API.NOTIFICATION}/${type}/${id}`).subscribe(() => {
      this.loadData();
    })
  }

  closeConfirmModal() {
    this.confirmRef.hide();
  }

  closeModal() {
    this.modalRef.hide();
  }

  openModal(template, item?) {
    this.modalRef = this.modalService.show(template,  this.config);
    this.currentItem = item;
    if (item) {
      this.formSave.patchValue(item);
    }
  }

  openConfirm(template, item) {
    this.confirmRef = this.modalService.show(template,  this.config2);
    this.currentItem = item;
  }

  confirm(item) {
    this.active('deactive', item.id);
  }

  pageChange(page) {
    this.svc.makeGet(`${API.NOTIFICATION}`, { page: page.page }).subscribe((data: any) => {
      this.dataSource = data;
    })
  }

  getClass(col) {
    return 'col-' + col.split(' ').join('');
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
    saveItem.webId = this.currentId;
    if (this.currentItem) {
      saveItem.id = this.currentItem.id;
    }
    this.closeModal();
    this.formSave.reset();
    this.svc.makePost(`${API.NOTIFICATION}/save`, saveItem).subscribe((data: any) => {
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

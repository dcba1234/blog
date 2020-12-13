import { Component, Input, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { BaseService } from 'app/services/base-service.service';
import { API } from 'app/services/constant.enum';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'report-detail',
  templateUrl: './report-detail.component.html',
  styleUrls: ['./report-detail.component.scss']
})
export class ReportDetailComponent implements OnInit, OnChanges {
  @Input() slug = '';
  confirmRef: BsModalRef;
  modalRef: BsModalRef;
  orderDataSource = [
    {
      id: 'Created',
      label: 'Created'
    },
    {
      id: 'Reason desc',
      label: 'Reason desc'
    },
    {
      id: 'Reason asc',
      label: 'Reason asc'
    },
    {
      id: 'Post_Slug desc',
      label: 'Slug asc'
    },
    {
      id: 'Post_Slug desc',
      label: 'Slug asc'
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
  cols = ['STT', 'Reason', 'Reason (Other)' , 'Create By', 'Created'];
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
  ngOnChanges(changes: SimpleChanges): void {
    this.loadData(this.slug)
  }

  ngOnInit(): void {
    // this.initForm();
    // this.loadData(this.slug);
  }

  initForm() {
  }

  loadData(Slug) {
    this.svc.makeGet(`${API.REPORT_DETAIL}`, { Slug }).subscribe((data: any) => {
      this.dataSource = data;
      setTimeout(() => {
        this.currentPage = 1;
      })
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

  pageChange(page) {
    this.svc.makeGet(`${API.REPORT_DETAIL}`, { page: page.page, Slug: this.slug }).subscribe((data: any) => {
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
    this.svc.makePost(`${API.REPORT_DETAIL}/save`, saveItem).subscribe((data: any) => {
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
      this.loadData(this.slug);
   })
  }


}

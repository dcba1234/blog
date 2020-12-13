import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { BaseService } from 'app/services/base-service.service';
import { API } from 'app/services/constant.enum';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'user-manager',
  templateUrl: './user-manager.component.html',
  styleUrls: ['./user-manager.component.scss']
})
export class UserManagerComponent implements OnInit {
  confirmRef: BsModalRef;
  orderDataSource = [
    {
      id: 'Created Desc',
      label: 'Created desc'
    },
    {
      id: 'Created ASC',
      label: 'Created ASC'
    },
    {
      id: 'Account Desc',
      label: 'Account desc'
    },
    {
      id: 'Account ASC',
      label: 'Account ASC'
    },
    {
      id: 'First_Name Desc',
      label: 'Name Desc'
    },
    {
      label: 'Name ASC',
      id: 'First_Name ASC'
    },
  ]
  dataSource = {
    rows: [],
    total: 0,
    itemPerPage: 0,
    page: 1
  };
  form: FormGroup;
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
  cols = ['Account', 'Email', 'Name' , 'Date Of Birth', 'Created', 'Status'];
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
    this.activeRoute.queryParams.subscribe((params) => {
      if (params.slug) {
        this.form.patchValue({ key: params.slug })
      }
      this.loadData();
    })
  }

  initForm() {
    this.form = this.fb.group({
      orderBy: ['Created Desc'],
      key: ['']
    })
    this.form.valueChanges.subscribe((value) => {
      this.loadData();
    })
  }

  loadData() {
    this.svc.makeGet(`${API.USER}`, { ...this.form.value }).subscribe((data: any) => {
      this.dataSource = data;
      setTimeout(() => {
        this.currentPage = 1;
      })
   })
  }

  active(type: 'active' | 'deactive', slug) {
    this.svc.makeDelete(`${API.USER}/${type}/${slug}`).subscribe(() => {
      this.loadData();
    })
    this.confirmRef.hide();
  }

  closeConfirmModal() {
    this.confirmRef.hide();
  }

  openConfirm(template, item) {
    this.confirmRef = this.modalService.show(template,  this.config2);
    this.currentId = item.id;
    this.currentItem = item;
  }

  confirm() {
    this.active(this.currentItem.isActive ? 'deactive' : 'active', this.currentItem.account);
  }

  pageChange(page) {
    this.svc.makeGet(`${API.USER}`, { page: page.page }).subscribe((data: any) => {
      this.dataSource = data;
    })
  }

  getClass(col) {
    return 'col-' + col.split(' ').join('');
  }

}


import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { BaseService } from 'app/services/base-service.service';
import { API } from 'app/services/constant.enum';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'articles',
  templateUrl: './articles.component.html',
  styleUrls: ['./articles.component.scss']
})
export class ArticlesComponent implements OnInit {
  confirmRef: BsModalRef;
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
    {
      id: 'Slug',
      label: 'Slug'
    },
    {
      id: 'setting_web.Title',
      label: 'Source'
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
  cols = ['Slug', 'Title', 'Summary', 'Source' , 'Create By' , 'Publish Date', 'Status'];
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
      orderBy: ['Created desc'],
      key: ['']
    })
    this.form.valueChanges.subscribe((value) => {
      console.log(value);
      this.loadData();
    })
  }

  loadData() {
    this.svc.makeGet(`${API.POST}`, { ...this.form.value }).subscribe((data: any) => {
      this.dataSource = data;
      setTimeout(() => {
        this.currentPage = 1;
      })
   })
  }

  active(type: 'active' | 'deactive', slug) {
    this.svc.makeDelete(`${API.POST}/${type}/${slug}`).subscribe(() => {
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
    this.active(this.currentItem.isActive ? 'deactive' : 'active', this.currentItem.slug);
  }

  pageChange(page) {
    this.svc.makeGet(`${API.POST}`, { page: page.page }).subscribe((data: any) => {
      this.dataSource = data;
    })
  }

  getClass(col) {
    return 'col-' + col.split(' ').join('');
  }
}

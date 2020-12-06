import { Component, OnInit, TemplateRef } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { BaseService } from 'app/services/base-service.service';
import { API } from 'app/services/constant.enum';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'job',
  templateUrl: './job.component.html',
  styleUrls: ['./job.component.scss']
})
export class JobComponent implements OnInit {
  settings;
  settingWeb;
  dataSource = {
    rows: [],
    total: 0,
    itemPerPage: 0,
    page: 1
  };
  runningJobs = {}
  config = {
    backdrop: true,
    ignoreBackdropClick: true
  };
  modalRef: BsModalRef;
  form: FormGroup;
  formSave: FormGroup;
  currentItem
  jobData;
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
    this.loadSelect();
  }

  loadData() {
    this.svc.makeGet(`${API.JOB_TITLE}`, { ...this.form.value }).subscribe((data: any) => {
      this.dataSource = data;
     })
     this.svc.makeGet(`${API.JOB}`).subscribe((data: any) => {
      this.runningJobs = data;
      console.log(data)
     })
  }

  loadSelect() {
    this.svc.makeGet(`${API.SETTING_PAGE_LIST}`, { ...this.form.value }).subscribe((data: any) => {
      this.settingWeb = data.rows
     })
  }

  buildForm() {
    this.form = this.fb.group({
      key: ['']
    })
    this.formSave = this.fb.group({
      title: ['', Validators.required],
      rule: ['', Validators.required],
      settingPageId: ['', Validators.required],
      website: ['', Validators.required],
      jobUrl: ['', Validators.required],
    })
    this.formSave.get('settingPageId').disable();
    this.formSave.get('website').valueChanges.subscribe((val) => {
      if (!val) {
        this.formSave.get('settingPageId').disable();
        this.formSave.get('settingPageId').setValue('');
        this.formSave.get('settingPageId').markAsUntouched();
        this.formSave.get('settingPageId').markAsPristine();
        return;
      }
      this.svc.makeGet(`${API.SETTING_PAGE_LIST}/${val}`).subscribe((data: any) => {
        this.formSave.get('settingPageId').enable();
        this.formSave.get('settingPageId').setValue('');
        this.formSave.get('settingPageId').markAsUntouched();
        this.formSave.get('settingPageId').markAsPristine();
        this.settings = data.rows;
       })
    });
    this.form.valueChanges.subscribe((value) => {
      this.loadData();
    })
  }

  openModal(template: TemplateRef<any>) {
    this.modalRef = this.modalService.show(template,  this.config);
  }

  goTo(item) {
    if (this.runningJobs[item.id.toString()]) {
      this.svc.makePost(API.JOB_STOP, { ...item }).subscribe(() => {
        this.loadData();
      })
      return;
    }
    const itemSave = { ...item };
    if (itemSave.rule) {
      try {
        itemSave.rule = JSON.parse(`{ ${itemSave.rule} }`)
      } catch (error) {
        itemSave.rule = {};
      }
    } else {
      itemSave.rule = {};
    }
    this.svc.makePost(API.JOB_START,  itemSave ).subscribe((data) => {
      this.jobData = data;
      this.loadData();
    })
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
    this.svc.makePost(`${API.JOB_TITLE}`, saveItem).subscribe((data: any) => {
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

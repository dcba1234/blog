import { Router } from '@angular/router';
import { Route } from '@angular/compiler/src/core';
import { Component, OnInit, TemplateRef } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { BaseService } from 'app/services/base-service.service';
import { API } from 'app/services/constant.enum';
import { BsModalService, BsModalRef } from 'ngx-bootstrap/modal';

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
  constructor(
    private svc: BaseService,
    private modalService: BsModalService,
    private fb: FormBuilder,
    private router: Router

     ) { }

  ngOnInit(): void {
    this.buildForm();
   this.svc.makeGet(`${API.SETTING_WEB}`).subscribe((data: any) => {
    this.dataSource = data;
   })
  }

  buildForm() {
    this.form = this.fb.group({
      title: ['', Validators.required],
      note: ['', Validators.required],
      url: ['', Validators.required]
    })
  }

  openModal(template: TemplateRef<any>) {
    this.modalRef = this.modalService.show(template,  this.config);
  }

  goTo(item) {
    this.router.navigateByUrl('/web-setting/' + item.id)
  }

}

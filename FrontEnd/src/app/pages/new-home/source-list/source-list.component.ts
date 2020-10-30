import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { BaseService } from 'app/services/base-service.service';
import { API } from 'app/services/constant.enum';
import * as moment from 'moment';
import { DragulaService } from 'ng2-dragula';
import { BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'source-list',
  templateUrl: './source-list.component.html',
  styleUrls: ['./source-list.component.scss']
})
export class SourceListComponent implements OnInit {
  dataSource: any = []
  page = 1;
  filterObject;
  constructor(private svc: BaseService,
    private modalService: BsModalService,
    private fb: FormBuilder,
    private router: Router,
    private activeRoute: ActivatedRoute,
    private toastr: ToastrService,
    private dragulaService: DragulaService) {
      this.activeRoute.queryParams.subscribe(params => {
      console.log(params);
      this.filterObject = params;
    });
    }

  ngOnInit(): void {
    this.loadData();
  }

  async loadData() {
    // tslint:disable-next-line:max-line-length
    this.dataSource = await this.svc.makeGet(API.POST, { ...this.filterObject, active: 'true', page: this.page , orderBy: 'Created Desc', size: 5}).toPromise();
    console.log(this.dataSource);

  }

  getDate(date) {
    if (!date) { return ''; }
    return moment(date).fromNow();
  }

  pageChange(page) {
    this.page = page.page;
    this.loadData();
  }

}

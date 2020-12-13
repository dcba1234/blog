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
  selector: 'source-data',
  templateUrl: './source-data.component.html',
  styleUrls: ['./source-data.component.scss']
})
export class SourceDataComponent implements OnInit {
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
      this.filterObject = params;
    });
    }

    ngOnInit(): void {
      this.loadData();
    }
    async loadData() {
      this.dataSource = await this.svc.makeGet(API.SETTING_WEB).toPromise();
    }
    goTo(item) {
      this.router.navigate(['/home/all'], { queryParams: { source: item.id } })
    }
}

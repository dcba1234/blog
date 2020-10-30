import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { BaseService } from 'app/services/base-service.service';
import { API } from 'app/services/constant.enum';
import * as moment from 'moment';
import { DragulaService } from 'ng2-dragula';
import { BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'new-detail',
  templateUrl: './new-detail.component.html',
  styleUrls: ['./new-detail.component.scss'],
  encapsulation: ViewEncapsulation.None,
})
export class NewDetailComponent implements OnInit {
  dataSource;
  constructor(private svc: BaseService,
    private modalService: BsModalService,
    private fb: FormBuilder,
    private router: Router,
    private activeRoute: ActivatedRoute,
    private toastr: ToastrService,
    private dragulaService: DragulaService) { }

    ngOnInit(): void {
      this.activeRoute.params.subscribe(params => {
        this.loadData(params.slug)
      });
    }
    async loadData(slug) {
      // tslint:disable-next-line:max-line-length
      this.dataSource = await this.svc.makeGet(`${API.POST}/${slug}`).toPromise();
      console.log(this.dataSource);
    }

    getDate(date) {
      if (!date) { return ''; }
      return moment(date).fromNow();
    }

}

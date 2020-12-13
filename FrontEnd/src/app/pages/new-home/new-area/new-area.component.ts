import { Component, Input, OnInit } from '@angular/core';
import { BaseService } from 'app/services/base-service.service';
import { API } from 'app/services/constant.enum';
import * as moment from 'moment';

@Component({
  selector: 'new-area',
  templateUrl: './new-area.component.html',
  styleUrls: ['./new-area.component.scss']
})
export class NewAreaComponent implements OnInit {
  @Input() item;
  dataSource: any = [];
  dataSource2: any = [];
  constructor(private svc: BaseService) { }

  ngOnInit(): void {
    this.loadData();
  }

  async loadData() {
    this.dataSource = (await this.svc.makeGet(API.POST, { size: 5, key: 'active', category: this.item.id}).toPromise()).rows;
    this.dataSource2 = this.dataSource.splice(1);
  }

  getDate(date) {
    if (!date) { return ''; }
    return moment(date).fromNow();
  }

}

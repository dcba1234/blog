import { API } from 'app/services/constant.enum';
import { Component, Input, OnInit } from '@angular/core';
import { BaseService } from 'app/services/base-service.service';

@Component({
  selector: 'comment',
  templateUrl: './comment.component.html',
  styleUrls: ['./comment.component.scss']
})
export class CommentComponent implements OnInit {
  @Input() slug;
  comments;
  comment;
  page = 1;
  isDone = false;
  baseUrl = API.BASE_URL + '/';
  constructor(private svc: BaseService) { }

  ngOnInit(): void {
   this.baseUrl = API.BASE_URL + '/';
   this.getData();
  }

  getData() {
    this.page = 1;
    this.svc.makeGet(API.COMMENT + `/${this.slug}`, { page: 1, size: 5 }).subscribe((data) => {
      if ( 5 * this.page >= data.total) {
        this.isDone = true;
      } else {
        this.isDone = false;
      }
      this.comments = data;
    })
  }

  sendComment() {
    this.svc.makePost(API.COMMENT, { content: this.comment, postSlug: this.slug }).subscribe((data) => {
      this.comment = '';
      this.getData();
    })
  }

  viewMore() {
    this.page ++;
    this.svc.makeGet(API.COMMENT + `/${this.slug}`, { page: this.page, size: 5 }).subscribe((data) => {
      this.comments.rows.push(...data.rows);
      if ( 5 * this.page >= data.total) {
        this.isDone = true;
      }
    })
  }

}

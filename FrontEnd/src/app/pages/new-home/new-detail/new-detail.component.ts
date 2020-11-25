import { Component, OnInit, TemplateRef, ViewEncapsulation } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { BaseService } from 'app/services/base-service.service';
import { API } from 'app/services/constant.enum';
import * as moment from 'moment';
import { DragulaService } from 'ng2-dragula';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'new-detail',
  templateUrl: './new-detail.component.html',
  styleUrls: ['./new-detail.component.scss'],
  encapsulation: ViewEncapsulation.None,
})
export class NewDetailComponent implements OnInit {
  dataSource;
  slug;
  modalRef: BsModalRef;
  formSave: FormGroup;
  config = {
    backdrop: true,
    ignoreBackdropClick: true,
    class: 'modal-s modal-dialog-centered'
  };
  reason = [];
  constructor(private svc: BaseService,
    private modalService: BsModalService,
    private fb: FormBuilder,
    private router: Router,
    private activeRoute: ActivatedRoute,
    private toastr: ToastrService,
    private dragulaService: DragulaService) { }

    ngOnInit(): void {
      this.buildForm();
      this.activeRoute.params.subscribe(params => {
        this.loadData(params.slug);
        this.slug = params.slug;
      });
    }
    async loadData(slug) {
      // tslint:disable-next-line:max-line-length
      this.dataSource = await this.svc.makeGet(`${API.POST}/${slug}`).toPromise();
      this.svc.makeGet(`${API.REASON}`).subscribe((r) => {
        this.reason = r.rows;
      })
      console.log(this.dataSource);
    }

    getDate(date) {
      if (!date) { return ''; }
      return moment(date).fromNow();
    }

    buildForm() {
      this.formSave = this.fb.group({
        reasonReportOther: ['', Validators.required],
        reasonReportId: ['', Validators.required],
      })
    }

    isError(key, errorKey) {
      if (!errorKey) {
        return this.formSave.get(key).invalid && (this.formSave.get(key).dirty || this.formSave.get(key).touched)
      }
      return this.formSave.get(key).hasError(errorKey) && (this.formSave.get(key).dirty || this.formSave.get(key).touched)
    }

    closeModal() {
      this.modalRef.hide();
    }

    submit() {
      this.formSave.markAsDirty();
      this.formSave.markAllAsTouched();
      if (this.formSave.invalid) {
        return;
      }
      const saveItem = {
        ...this.formSave.value,
        postSlug: this.slug
      }
      this.svc.makePost(API.REPORT_SAVE, saveItem).subscribe();
      this.closeModal();
    }

    openModal(template: TemplateRef<any>) {
      this.modalRef = this.modalService.show(template,  this.config);
    }

}

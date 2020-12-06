import { element } from 'protractor';
import { Component, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { BaseService } from 'app/services/base-service.service';
import { API } from 'app/services/constant.enum';
import { BsModalService } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { DragulaService } from 'ng2-dragula';
import * as _ from 'lodash'
import * as $ from 'jquery'
@Component({
  selector: 'web-setting-detail',
  templateUrl: './web-setting-detail.component.html',
  styleUrls: ['./web-setting-detail.component.scss']
})
export class WebSettingDetailComponent implements OnInit {
  public items: Array<string> = ['Amsterdam'];
  public Editor = ClassicEditor;
  htmlData = '';
  currentUrl = '';
  form: FormGroup;
  currentId: any;
  dataSource: any;
  value: any;
  selectedCategory;
  isDone = false;
  postProperty = [
    'content',
    'summary',
    'title',
    'avatar'
  ]
  categorys = [
  ]
  element = [
  ]
  webId;
  constructor(
    private svc: BaseService,
    private modalService: BsModalService,
    private fb: FormBuilder,
    private router: Router,
    private activeRoute: ActivatedRoute,
    private toastr: ToastrService,
    private dragulaService: DragulaService
     ) {
      // dragulaService.createGroup('COPYABLE', {
      //   copy: (el, source) => {
      //     return source.id === 'left';
      //   },
      //   accepts: (el, target, source, sibling) => {
      //     // To avoid dragging from right to left container
      //     return target.id !== 'left';
      //   }
      // });
     }
  ngOnInit(): void {
    this.buildForm();
    this.activeRoute.params.subscribe((params) => {
      this.currentId = params.id;
      this.loadData();
      this.getData();
    })
  }

  loadData() {
    this.svc.makeGet(`${API.SETTING_PAGE_DETAIL}/${this.currentId}`).subscribe((data: any) => {
      this.dataSource = data;
      this.form.patchValue({
        url: data.url
      });
      this.currentUrl = data.url;
      this.webId = data.webId;
      data.elements.map((e) => {
        this.addElements(e)
      })
      this.loadWebData(data);
   })
  }

  getData() {
    this.svc.makeGet(`${API.CATEGORY_ALL}`).subscribe((data: any) => {
      this.categorys = data;
    })
  }

  reloadPage() {
    this.loadWebData(this.form.value);
  }

  saveSetting() {
    const value = _.pick(this.form.value, ['url', 'elements']);
    value.id = parseInt(this.currentId, 10);
    this.svc.makePost(`${API.SETTING_WEB_SAVE}`, value).subscribe((data: any) => {
      this.makeToast();
    })
  }

  // <span data-notify="icon" class="nc-icon nc-bell-55"></span>
  makeToast() {
    this.toastr.success(
      '<span style="color: white" data-notify="message">Successfully!</span>',
      '',
      {
        timeOut: 3000,
        closeButton: true,
        enableHtml: true,
        toastClass: 'alert alert-success alert-with-icon',
        positionClass: 'toast-top-right'
      }
    );
  }

  loadWebData(data) {
    this.svc.makePost(`${API.DATA}`, data).subscribe((d: any) => {
      console.log(d);
      this.htmlData = d.data;
      this.isDone = true;
      this.currentUrl = data.url;
      this.makeToast();
    })
  }

  buildForm() {
    this.form = this.fb.group({
      title: ['', Validators.required],
      avatar: ['', Validators.required],
      url: ['', Validators.required],
      tag: [[]],
      categoryId: ['', Validators.required],
      elements: this.fb.array([]),
      content: ['', Validators.required],
      summary: ['', Validators.required],
    })
  }

  get elementsForm(): FormArray {
    return this.form.get('elements') as FormArray
  }

  parseAll() {
    this.elementsForm.value.map((i) => {
      this.parseData(i);
    })
  }

  parseData(data) {
    const dataSave = {};
    dataSave[data.postProperty] = data.postProperty === 'content' ? $(data.selector).html() : $(data.selector).text();
    dataSave[data.postProperty] = dataSave[data.postProperty] || '';
    dataSave[data.postProperty] = dataSave[data.postProperty].trim();
    if (data.postProperty === 'avatar') {
      dataSave[data.postProperty] = $(data.selector)[0].src;
    }
    if (!dataSave[data.postProperty]) {
      return
    }
    this.form.patchValue(dataSave)
  }

  addElements(e?: any) {
    this.elementsForm.push(this.createElements(e))
  }

  saveArticle() {
    this.form.markAsDirty();
    this.form.markAllAsTouched();
    if (this.form.invalid) {
      return;
    }
    const savedt = { ...this.form.value, url: this.currentUrl };
    savedt.sourceId = parseInt(this.webId, 10);
    this.svc.makePost(API.POST, savedt).subscribe(() => {
      this.makeToast();
      //this.router.navigateByUrl('/admin/articles')
    })
  }

  isError(key, errorKey) {
    if (!errorKey) {
      return this.form.get(key).invalid && (this.form.get(key).dirty || this.form.get(key).touched)
    }
    return this.form.get(key).hasError(errorKey) && (this.form.get(key).dirty || this.form.get(key).touched)
  }

  removeElement(i) {
    this.elementsForm.removeAt(i);
  }

  // tslint:disable-next-line:no-shadowed-variable
  createElements(element?: any) {
    return this.fb.group({
      selector: [_.get(element, 'selector')],
      postProperty: [_.get(element, 'postProperty')],
    });
  }

  public refreshValue(value:any):void {
    this.value = value;
  }

}
// /dt-news__title
//dt-news__content
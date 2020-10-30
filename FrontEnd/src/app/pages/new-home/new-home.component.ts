import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'new-home',
  templateUrl: './new-home.component.html',
  styleUrls: ['./new-home.component.scss']
})
export class NewHomeComponent implements OnInit {
  key;
  constructor(private router: Router) { }

  ngOnInit(): void {
  }

  onEnter() {
    this.router.navigate(['/home/all'], { queryParams: { key: this.key } })
  }

}

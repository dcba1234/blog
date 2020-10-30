import { API } from 'app/services/constant.enum';
import { Component, OnInit } from '@angular/core';
import { BaseService } from 'app/services/base-service.service';
import Chart from 'chart.js';
import { interval, Observable } from 'rxjs';

@Component({
  selector: 'dashboard-cmp',
  moduleId: module.id,
  templateUrl: 'dashboard.component.html',
})
export class DashboardComponent implements OnInit {
  secondToReload = 2;
  dataSource = {
    articleResource: 0,
    articles: 0,
    reports: 0,
    users: 0,
    date: [0, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  };
  public canvas: any;
  public ctx;
  public chartColor;
  public chartEmail;
  public chartHours;
  constructor(private svc: BaseService) {}
  ngOnInit() {
    // interval(this.secondToReload * 1000).subscribe(x => {
       
    //   }
    // )
    this.loadData();
  }

  loadData() {
    this.svc.makeGet(API.DASHBOARD).subscribe((data: any) => {
      this.dataSource = data;
      this.initChart()
    })
  }

  initChart() {
    this.chartColor = '#FFFFFF';
    const speedCanvas = document.getElementById('speedChart');
    const dataFirst = {
      data: this.dataSource.date,
      fill: false,
      borderColor: '#51CACF',
      backgroundColor: 'transparent',
      pointBorderColor: '#51CACF',
      pointRadius: 4,
      pointHoverRadius: 4,
      pointBorderWidth: 8,
    };

    const speedData = {
      labels: [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ],
      datasets: [dataFirst],
    };

    const chartOptions = {
      legend: {
        display: false,
        position: 'top',
      },
    };

    const lineChart = new Chart(speedCanvas, {
      type: 'line',
      hover: false,
      data: speedData,
      options: chartOptions,
    });
  }
}

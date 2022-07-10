import { Component, OnDestroy, OnInit } from '@angular/core';
import { NgbCalendar, NgbDateStruct } from '@ng-bootstrap/ng-bootstrap'; 
import { FileSaverService } from "ngx-filesaver";
import { take } from 'rxjs';
import { ChartDataDto, ChartDto } from '../services/chart.dto';
import { DataService } from '../services/data.service';
import { LoggingService } from '../services/logging.service';
// import { saveSvgAsPng } from "save-svg-as-png";
const saveSvgAsPng = require('save-svg-as-png');
// import { sav}

@Component({
  selector: 'app-charts',
  templateUrl: './charts.component.html',
  styleUrls: ['./charts.component.scss']
})
export class ChartsComponent {
  length = 1;
  charts = [0];

  constructor(
    private fileSaverService: FileSaverService,
    private dataService: DataService,
    public loggingService: LoggingService
  ) {}
  onAddChart() {
    this.charts.push(this.length++);
  }
}

import { Component, OnInit } from '@angular/core';
import { NgbCalendar, NgbDateStruct } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-charts',
  templateUrl: './charts.component.html',
  styleUrls: ['./charts.component.scss']
})
export class ChartsComponent {
  options = ["Actual Total Load", "Generation Per Type", "Cross-Border Flows"];
  index = -1;
  option = "Choose Quantity";
  model !: NgbDateStruct;
  date !: {year: number, month: number};

  constructor(private calendar: NgbCalendar) {
    this.selectToday();
  }

  selectToday() {
    this.model = this.calendar.getToday();
  }

  onChooseOption(idx: number) {
    this.index = idx;
    this.option = this.options[idx];

  }
}

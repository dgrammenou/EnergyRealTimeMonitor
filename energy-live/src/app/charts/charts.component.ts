import { Component, OnDestroy, OnInit } from '@angular/core';
import { NgbCalendar, NgbDateStruct } from '@ng-bootstrap/ng-bootstrap'; 
import { FileSaverService } from "ngx-filesaver";
// import { saveSvgAsPng } from "save-svg-as-png";
const saveSvgAsPng = require('save-svg-as-png');
// import { sav}

@Component({
  selector: 'app-charts',
  templateUrl: './charts.component.html',
  styleUrls: ['./charts.component.scss']
})
export class ChartsComponent implements OnInit, OnDestroy {
  intervalId !: any;
  options = ["Actual Total Load", "Generation Per Type", "Cross-Border Flows"];
  index = -1;
  option = "Choose Quantity";
  model !: NgbDateStruct;
  date !: {year: number, month: number};
  data = [1,2,3,4,5];
  saleData: any[] = [];

  constructor(private calendar: NgbCalendar, private fileSaverService: FileSaverService) {
    this.selectToday();
    
    let data_graph = [];
    for (var i = 0; i < this.data.length; i++) {
      data_graph.push({
        "name": i+1,
        "value": this.data[i]
      }) 
    } 
    this.saleData = [
      {
        "name": this.option, 
        "series": data_graph
      }, 
    ];

    setInterval(() => {

    })
  }

  ngOnInit(): void {
    
    this.intervalId = setInterval(() => {
      if (this.index >= 0) {
        // update data
      }
    }, 5000);
  }
  ngOnDestroy(): void { 
    if (this.intervalId) {
      clearInterval(this.intervalId);
    }
  }

  selectToday() {
    this.model = this.calendar.getToday();
  }

  onChooseOption(idx: number) {
    this.index = idx;
    this.option = this.options[idx];
  }

  onSaveAsPng() {
    let svg = document.getElementsByTagName("svg")[0];
    svg.style.backgroundColor = '#fff';
    // saveSvgAsPng.saveSvgAsPng(svg, "chart.png"); 
    let blob = new Blob([svg.outerHTML]);
    this.fileSaverService.save(blob, 'data.svg');
  }

  onSaveData() { 
    let data = ["Data: "]; 
    for (const d of this.saleData) { 
      for (const el of d.series) {
        data.push(el.value + ",")
      }
      data.push("\nNames: ");
      for (const el of d.series) {
        data.push(el.name + ",")
      }
    }
    let blob = new Blob(data);
    
    this.fileSaverService.save(blob, 'data.txt');
  }
}

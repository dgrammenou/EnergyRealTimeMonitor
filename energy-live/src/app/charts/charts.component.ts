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
export class ChartsComponent implements OnInit, OnDestroy {
  intervalId !: any;

  dataFullForGraph = false;

  options = [
    {id: 1, name: "Actual Total Load" }, 
    {id: 2, name: "Generation Per Type" }, 
    {id: 3, name: "Cross-Border Flows" }
  ];
  index!: number;

  // option !: string;
  model !: NgbDateStruct;
  date !: {year: number, month: number};
  data = [1,2,3,4,5];
  saleData: ChartDto[] = [];


  selectedCountry !: number;

  countries = [ 
    { id: 1, name: 'Volvo' },
    { id: 2, name: 'Saab' },
    { id: 3, name: 'Opel' },
    { id: 4, name: 'Audi' },
    { id: 5, name: 'Volvo' },
    { id: 6, name: 'Saab' },
    { id: 7, name: 'Opel' },
    { id: 8, name: 'Audi' },
    { id: 9, name: 'Volvo' },
    { id: 10, name: 'Saab' },
    { id: 11, name: 'Opel' },
    { id: 12, name: 'Audi' },
  ];

  selectedGenerationType !: number;
  generationTypes = [
    { id: 1, name: "Natural Gas"},
  ];

  selectedCountryFrom !: number;
  selectedCountryTo !: number;


  constructor(
    private calendar: NgbCalendar, 
    private fileSaverService: FileSaverService,
    private dataService: DataService,
    public loggingService: LoggingService
  ) {
    this.selectToday();
    
    let data_graph: ChartDataDto[] = [];
    for (var i = 0; i < this.data.length; i++) {
      data_graph.push({
        "name": (i+1).toString(),
        "value": this.data[i]
      }) 
    } 
    this.saleData = [
      {
        "name": "test name", 
        "series": data_graph
      }, 
    ];
 
  }

  ngOnInit(): void {
    
    this.intervalId = setInterval(() => {
      if (this.dataFullForGraph) {
        this.dataFullForGraph = this.isDataFull();
      }
    }, 30000);
    this.loggingService.getUserData();
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
    // this.option = this.options[+idx].name;
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
  onChangeQuantity(event: any) {
    this.dataFullForGraph = this.isDataFull();
  }

  onActualTotalLoadChange(event: any) {
    this.dataFullForGraph = this.isDataFull();
  }

  onGenerationPerTypeChange(event: any) {
    this.dataFullForGraph = this.isDataFull();
  }

  onCrossBoarderFlowChange(event: any) {
    this.dataFullForGraph = this.isDataFull();
  }

  private isDataFull() {
    if (this.index === 1 && this.selectedCountry) {    
      this.dataService.dataActualTotalLoad({
        country: this.countries[this.selectedCountry - 1].name,
        date: new Date(this.model.year, this.model.month, this.model.day),
      }).pipe(take(1)).subscribe(d => {
        this.saleData = [ d ];
      });

      return true;      
    }
    else if (this.index === 2 && this.selectedCountry && this.selectedGenerationType) { 
      console.log(this.selectedCountry, this.selectedGenerationType);
      this.dataService.dataGenerationPerType({
        country: this.countries[this.selectedCountry - 1].name,
        date: new Date(this.model.year, this.model.month, this.model.day),
        generationType: this.generationTypes[this.selectedGenerationType - 1].name
      }).pipe(take(1)).subscribe(d => {
        this.saleData = [ d ];
      });

      return true;
    }
    else if (this.index === 3 && this.selectedCountryFrom && this.selectedCountryTo) {
      this.dataService.dataCrossBoarderFlow({
        date: new Date(this.model.year, this.model.month, this.model.day),
        countryFrom: this.countries[this.selectedCountryFrom - 1].name,
        countryTo: this.countries[this.selectedCountryTo - 1].name
      }).pipe(take(1)).subscribe(d => {
        this.saleData = [ d ];
      });

      return true;
    }

    return false;
  }
}

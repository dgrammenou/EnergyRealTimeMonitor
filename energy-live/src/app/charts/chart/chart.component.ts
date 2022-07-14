import { Component, OnDestroy, OnInit } from '@angular/core';
import { NgbCalendar, NgbDateStruct } from '@ng-bootstrap/ng-bootstrap'; 
import { FileSaverService } from "ngx-filesaver";
import { take } from 'rxjs';
import { ChartDataDto, ChartDto } from '../../services/chart.dto';
import { DataService } from '../../services/data.service';
import { LoggingService } from '../../services/logging.service';
 
// import { saveSvgAsPng } from "save-svg-as-png";
const saveSvgAsPng = require('save-svg-as-png');
// import { sav}

@Component({
  selector: 'app-chart',
  templateUrl: './chart.component.html',
  styleUrls: ['./chart.component.scss']
})
export class ChartComponent implements OnInit, OnDestroy { 
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
  data = [];
  saleData: ChartDto[] = [];
  latestUpdate !: string;

  selectedCountry !: number;

  countries = [ 
    { id:1, name:'Albania', code:'AL'}, 
    { id:2, name:'Austria', code:'AT'}, 
    { id:3, name:'Belarus', code:'BY'}, 
    { id:4, name:'Belgium', code:'BE'}, 
    { id:5, name:'Bosnia Herzegovina', code:'BA'}, 
    { id:6, name:'Bulgaria', code:'BG'}, 
    { id:7, name:'Croatia', code:'HR'}, 
    { id:8, name:'Cyprus', code:'CY'}, 
    { id:9, name:'Czech Republic', code:'CZ'}, 
    { id:10, name:'Denmark', code:'DK'}, 
    { id:11, name:'Estonia', code:'EE'}, 
    { id:12, name:'Finland', code:'FI'}, 
    { id:13, name:'France', code:'FR'}, 
    { id:14, name:'Georgia', code:'GE'}, 
    { id:15, name:'Germany', code:'DE'}, 
    { id:16, name:'Greece', code:'GR'}, 
    { id:17, name:'Hungary', code:'HU'}, 
    { id:18, name:'Ireland', code:'IE'}, 
    { id:19, name:'Italy', code:'IT'}, 
    { id:20, name:'Latvia', code:'LV'}, 
    { id:21, name:'Lithuania', code:'LT'}, 
    { id:22, name:'Luxembourg', code:'LU'}, 
    { id:23, name:'Malta', code:'MT'}, 
    { id:24, name:'Montenegro', code:'ME'}, 
    { id:25, name:'Netherlands', code:'NL'}, 
    { id:26, name:'North Macedonia', code:'MK'}, 
    { id:27, name:'Norway', code:'NO'}, 
    { id:28, name:'Poland', code:'PL'}, 
    { id:29, name:'Portugal', code:'PT'}, 
    { id:30, name:'Republic of Moldova', code:'MD'}, 
    { id:31, name:'Romania', code:'RO'}, 
    { id:32, name:'Serbia', code:'RS'}, 
    { id:33, name:'Slovakia', code:'SK'}, 
    { id:34, name:'Slovenia', code:'SI'}, 
    { id:35, name:'Spain', code:'ES'}, 
    { id:36, name:'Sweden', code:'SE'}, 
    { id:37, name:'Switzerland', code:'CH'}, 
    { id:38, name:'Turkey', code:'TR'}, 
    { id:39, name:'Ukraine', code:'UA'}, 
    { id:40, name:'United Kingdom', code:'UK'}, 
    { id:41, name:'Azerbaijan', code:'AZ'}, 
    { id:42, name:'Russia', code:'RU'}, 
    { id:43, name:'Kosovo', code:'XK'}, 
    { id:44, name:'Armenia', code:'AM'}, 
  ]; // .sort((a, b) => a.name.localeCompare(b.name));

  selectedGenerationType !: number;
  generationTypes = [ 
    {id:1,name:'Hydro Run-of-river and poundage'}, 
    {id:2,name:'Hydro Water Reservoir'},
    {id:3,name:'Hydro Pumped Storage'},
    {id:4,name:'Solar'},
    {id:5,name:'Wind Onshore'},
    {id:6,name:'Wind Offshore'},
    {id:7,name:'Fossil Brown coal/Lignite'}, 
    {id:8,name:'Fossil Hard coal'}, 
    {id:9,name:'Fossil Oil'},
    {id:10,name:'Fossil Gas'},
    {id:11,name:'Geothermal'},
    {id:12,name:'Nuclear'},
    {id:13,name:'Other'},
    {id:14,name:'Other renewable'},
    {id:15,name:'Waste'},
    {id:16,name:'Fossil Coal-derived gas'},
    {id:17,name:'Marine'},
    {id:18,name:'Fossil Peat'},
    {id:19,name:'Fossil Oil shale'},
    {id:20, name:'Biomass'}, 
  ]; // .sort((a, b) => a.name.localeCompare(b.name));

  selectedCountryFrom !: number;
  selectedCountryTo !: number;


  constructor(
    private calendar: NgbCalendar, 
    private fileSaverService: FileSaverService,
    private dataService: DataService,
    public loggingService: LoggingService
  ) {
    this.selectToday();  
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

  onDateChange(event: any) { 
    console.log("Date changed: ", event, this.calendar)
    this.dataFullForGraph = this.isDataFull();
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
        country: this.countries[this.selectedCountry - 1].code,
        date: new Date(this.model.year, this.model.month, this.model.day),
      }).pipe(take(1)).subscribe(d => {
        this.saleData = [ d ];
        this.latestUpdate = d.latestUpdate;
      });

      return true;      
    }
    else if (this.index === 2 && this.selectedCountry && this.selectedGenerationType) { 
      console.log(this.selectedCountry, this.selectedGenerationType);
      this.dataService.dataGenerationPerType({
        country: this.countries[this.selectedCountry - 1].code,
        date: new Date(this.model.year, this.model.month, this.model.day),
        generationType: this.generationTypes[this.selectedGenerationType - 1].name
      }).pipe(take(1)).subscribe(d => {
        this.saleData = [ d ];
        this.latestUpdate = d.latestUpdate;
      });

      return true;
    }
    else if (this.index === 3 && this.selectedCountryFrom && this.selectedCountryTo) {
      this.dataService.dataCrossBoarderFlow({
        date: new Date(this.model.year, this.model.month, this.model.day),
        countryFrom: this.countries[this.selectedCountryFrom - 1].code,
        countryTo: this.countries[this.selectedCountryTo - 1].code
      }).pipe(take(1)).subscribe(d => {
        this.saleData = [ d ];
        this.latestUpdate = d.latestUpdate;
      });

      return true;
    }

    return false;
  }
}

import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { CartService } from '../services/cart.service';
import { LoggingService } from '../services/logging.service';
import { ProductDto } from '../services/product.dto';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  search !: string;
  
  constructor(
    private router: Router,
    public cartService: CartService,
    public loggingService: LoggingService
  ) { }

  ngOnInit(): void {
    this.loggingService.user.subscribe(x =>{
      console.log('compoennt: ', x);
    })
  }

  onNavigate(input: any) {
    if (input === 'main') {
      this.router.navigate(['']);
      this.search = '';
    } else if (input == 'charts') {
      this.router.navigate(['charts']);
    }
    else if (input === 'profile') {
      this.router.navigate(['profile']);
    } else if (input == 'sign-out') {
      this.loggingService.signOut();
      this.router.navigate(['/']);
    }

  }
  
}

import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink, RouterOutlet } from '@angular/router';
import { FooterComponent } from "./shared/footer/footer.component";
import { HeaderComponent } from "./shared/header/header.component";
import { DashboardComponent } from "./pages/dashboard/dashboard.component";
import { NavComponent } from "./shared/nav/nav.component";
import { HttpClientModule } from '@angular/common/http'
import { SectionComponent } from "./shared/section/section.component";
import { NewpasswordComponent } from './shared/newpassword/newpassword.component';

@Component({
    selector: 'app-root',
    standalone: true,
    templateUrl: './app.component.html',
    styleUrls: ['./app.component.css'],
    imports: [CommonModule, RouterOutlet, FooterComponent, HeaderComponent, DashboardComponent, NavComponent,NewpasswordComponent, HttpClientModule, RouterLink, SectionComponent]
})

export class AppComponent {
[x: string]: any;
  title = 'frontend';
}

import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-widget',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div [class]="classes">
      <ng-content />
    </div>
  `
})
export class WidgetComponent {
  @Input() variant: 'default' | 'glass' | 'elevated' | 'inset' = 'default';

  get classes(): string {
    return [
      'apple-widget',
      this.variant !== 'default' && `apple-widget--${this.variant}`
    ].filter(Boolean).join(' ');
  }
}

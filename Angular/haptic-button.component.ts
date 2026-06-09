import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-haptic-button',
  standalone: true,
  imports: [CommonModule],
  template: `
    <button
      [class]="classes"
      [disabled]="disabled || loading"
      [attr.aria-busy]="loading"
      (click)="handleClick()"
    >
      <ng-content />
    </button>
  `,
  styles: [`
    :host { display: block; }
  `]
})
export class HapticButtonComponent {
  @Input() variant: 'primary' | 'secondary' | 'destructive' | 'plain' = 'primary';
  @Input() size: 'sm' | 'md' | 'lg' = 'md';
  @Input() fullWidth = false;
  @Input() loading = false;
  @Input() disabled = false;
  @Output() buttonClick = new EventEmitter<void>();

  get classes(): string {
    return [
      'apple-button',
      `apple-button--${this.variant}`,
      this.size !== 'md' && `apple-button--${this.size}`,
      this.fullWidth && 'apple-button--full',
      this.loading && 'apple-button--loading'
    ].filter(Boolean).join(' ');
  }

  handleClick(): void {
    if (this.disabled || this.loading) return;
    if (navigator.vibrate) navigator.vibrate(10);
    this.buttonClick.emit();
  }
}

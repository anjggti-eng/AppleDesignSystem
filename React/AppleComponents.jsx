import React from 'react';

/**
 * AppleWidget — Card com Glassmorphism
 */
export function AppleWidget({ 
  variant = 'default', // default | elevated | glass | inset | grouped
  children, 
  className = '',
  ...props 
}) {
  const classes = [
    'apple-widget',
    variant !== 'default' && `apple-widget--${variant}`,
    className
  ].filter(Boolean).join(' ');

  return (
    <div className={classes} {...props}>
      {children}
    </div>
  );
}

/**
 * AppleInput — Campo de texto
 */
export function AppleInput({
  label,
  error,
  placeholder,
  type = 'text',
  value,
  onChange,
  icon,
  className = '',
  ...props
}) {
  return (
    <div className={`apple-input-group ${className}`}>
      {label && <label className="apple-input-label">{label}</label>}
      <div style={{ position: 'relative' }}>
        {icon && (
          <span style={{ 
            position: 'absolute', 
            left: 12, 
            top: '50%', 
            transform: 'translateY(-50%)',
            color: 'var(--ds-label-tertiary)',
            fontSize: 16
          }}>
            {icon}
          </span>
        )}
        <input
          type={type}
          placeholder={placeholder}
          value={value}
          onChange={onChange}
          className={`apple-input ${error ? 'apple-input--error' : ''} ${icon ? 'apple-input--with-icon' : ''}`}
          style={icon ? { paddingLeft: 36 } : {}}
          {...props}
        />
      </div>
      {error && <span className="apple-input-error">{error}</span>}
    </div>
  );
}

/**
 * AppleSearch — Barra de pesquisa
 */
export function AppleSearch({ placeholder = "Pesquisar...", value, onChange }) {
  return (
    <div className="apple-search">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round">
        <circle cx="11" cy="11" r="8"/>
        <path d="M21 21l-4.35-4.35"/>
      </svg>
      <input
        type="text"
        placeholder={placeholder}
        value={value}
        onChange={onChange}
      />
    </div>
  );
}

/**
 * AppleBadge — Badge de status
 */
export function AppleBadge({ 
  children, 
  color = 'blue', 
  variant = 'filled', // filled | outlined | dot
  className = '' 
}) {
  if (variant === 'dot') {
    return <span className={`apple-badge apple-badge--dot apple-badge--${color} ${className}`} />;
  }

  return (
    <span className={`apple-badge apple-badge--${color} ${variant === 'outlined' ? 'apple-badge--outlined' : ''} ${className}`}>
      {children}
    </span>
  );
}

/**
 * AppleAvatar — Avatar de usuário
 */
export function AppleAvatar({ 
  name, 
  src, 
  size = 'md', 
  className = '' 
}) {
  const initials = name
    .split(' ')
    .map(w => w[0])
    .slice(0, 2)
    .join('')
    .toUpperCase();

  const colors = ['#007AFF', '#34C759', '#AF52DE', '#FF9500', '#FF2D55', '#5856D6', '#5AC8FA'];
  const colorIndex = name.split('').reduce((acc, c) => acc + c.charCodeAt(0), 0) % colors.length;

  return (
    <div 
      className={`apple-avatar apple-avatar--${size} ${className}`}
      style={!src ? { background: colors[colorIndex] } : {}}
    >
      {src ? <img src={src} alt={name} /> : initials}
    </div>
  );
}

/**
 * AppleToggle — Toggle switch
 */
export function AppleToggle({ checked, onChange, label }) {
  return (
    <div className="ds-flex ds-items-center ds-justify-between ds-w-full">
      {label && <span className="apple-body">{label}</span>}
      <button
        role="switch"
        aria-checked={checked}
        className="apple-toggle"
        onClick={() => onChange?.(!checked)}
      />
    </div>
  );
}

/**
 * AppleList — Lista de itens
 */
export function AppleList({ children, header, className = '' }) {
  return (
    <div className={className}>
      {header && <div className="apple-list-header">{header}</div>}
      <div className="apple-list">
        {children}
      </div>
    </div>
  );
}

/**
 * AppleListItem — Item de lista
 */
export function AppleListItem({
  icon,
  iconColor = '#007AFF',
  title,
  subtitle,
  value,
  chevron = true,
  onClick,
  children
}) {
  return (
    <div className="apple-list-item" onClick={onClick}>
      {icon && (
        <div className="apple-list-item-icon" style={{ background: iconColor }}>
          {icon}
        </div>
      )}
      <div className="apple-list-item-content">
        <div className="apple-list-item-title">{title}</div>
        {subtitle && <div className="apple-list-item-subtitle">{subtitle}</div>}
      </div>
      {value && <span className="apple-list-item-value">{value}</span>}
      {children}
      {chevron && (
        <svg className="apple-list-item-chevron" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round">
          <path d="M9 18l6-6-6-6"/>
        </svg>
      )}
    </div>
  );
}

/**
 * AppleProgress — Barra de progresso
 */
export function AppleProgress({ value, max = 100, variant = 'default', label }) {
  const percentage = Math.min((value / max) * 100, 100);
  const variantClass = variant !== 'default' ? `apple-progress-fill--${variant}` : '';

  return (
    <div>
      {label && (
        <div className="ds-flex ds-justify-between ds-mb-sm">
          <span className="apple-subhead">{label}</span>
          <span className="apple-caption1">{Math.round(percentage)}%</span>
        </div>
      )}
      <div className="apple-progress">
        <div 
          className={`apple-progress-fill ${variantClass}`}
          style={{ width: `${percentage}%` }}
        />
      </div>
    </div>
  );
}

/**
 * AppleCircularProgress — Progresso circular
 */
export function AppleCircularProgress({ 
  value, 
  max = 100, 
  size = 80, 
  strokeWidth = 8,
  color = '#007AFF',
  label 
}) {
  const percentage = Math.min((value / max) * 100, 100);
  const radius = (size - strokeWidth) / 2;
  const circumference = 2 * Math.PI * radius;
  const offset = circumference - (percentage / 100) * circumference;

  return (
    <div className="apple-progress-circular" style={{ width: size, height: size }}>
      <svg width={size} height={size}>
        <circle
          className="apple-progress-circular-track"
          cx={size / 2}
          cy={size / 2}
          r={radius}
          strokeWidth={strokeWidth}
        />
        <circle
          className="apple-progress-circular-fill"
          cx={size / 2}
          cy={size / 2}
          r={radius}
          strokeWidth={strokeWidth}
          stroke={color}
          strokeDasharray={circumference}
          strokeDashoffset={offset}
        />
      </svg>
      <span className="apple-progress-label">{Math.round(percentage)}%</span>
    </div>
  );
}

/**
 * AppleLoading — Indicador de carregamento
 */
export function AppleLoading({ variant = 'spinner', text }) {
  return (
    <div className="apple-loading">
      {variant === 'spinner' && <div className="apple-loading--spinner" />}
      {variant === 'dots' && (
        <div className="apple-loading--dots">
          <div className="apple-loading--dot" />
          <div className="apple-loading--dot" />
          <div className="apple-loading--dot" />
        </div>
      )}
      {text && <span className="apple-caption1" style={{ marginLeft: 8 }}>{text}</span>}
    </div>
  );
}

/**
 * AppleAlert — Alerta modal
 */
export function AppleAlert({ 
  type = 'info', // info | success | warning | error
  title, 
  message, 
  primaryAction, 
  secondaryAction,
  onPrimary,
  onSecondary,
  onClose 
}) {
  const icons = {
    info: 'ℹ️',
    success: '✅',
    warning: '⚠️',
    error: '❌'
  };

  return (
    <div className="apple-alert-overlay" onClick={onClose}>
      <div className="apple-alert" onClick={e => e.stopPropagation()}>
        <div className={`apple-alert-icon apple-alert-icon--${type}`}>
          {icons[type]}
        </div>
        <div className="apple-alert-title">{title}</div>
        {message && <div className="apple-alert-message">{message}</div>}
        <div className="apple-alert-actions">
          {primaryAction && (
            <HapticButton variant="primary" onClick={onPrimary}>
              {primaryAction}
            </HapticButton>
          )}
          {secondaryAction && (
            <HapticButton variant="plain" onClick={onSecondary || onClose}>
              {secondaryAction}
            </HapticButton>
          )}
        </div>
      </div>
    </div>
  );
}

/**
 * AppleSheet — Bottom sheet
 */
export function AppleSheet({ title, isOpen, onClose, children }) {
  if (!isOpen) return null;

  return (
    <>
      <div className="apple-sheet-overlay" onClick={onClose} />
      <div className="apple-sheet">
        <div className="apple-sheet-handle" />
        {title && (
          <div className="apple-sheet-header">
            <span className="apple-sheet-title">{title}</span>
            <HapticButton variant="plain" size="sm" onClick={onClose}>
              ✕
            </HapticButton>
          </div>
        )}
        {children}
      </div>
    </>
  );
}

/**
 * AppleBanner — Notificação banner
 */
export function AppleBanner({ 
  type = 'info', 
  title, 
  message, 
  isVisible, 
  onClose 
}) {
  if (!isVisible) return null;

  return (
    <div className={`apple-banner apple-banner--${type}`}>
      <div className="apple-banner-content">
        <div className="apple-banner-title">{title}</div>
        {message && <div className="apple-banner-message">{message}</div>}
      </div>
      <HapticButton variant="plain" size="sm" onClick={onClose}>
        ✕
      </HapticButton>
    </div>
  );
}

/**
 * AppleStat — Caixa de estatísticas
 */
export function AppleStat({ 
  title, 
  value, 
  icon, 
  iconColor = '#007AFF',
  trend, 
  trendDirection = 'up' 
}) {
  return (
    <div className="apple-stat">
      <div className="apple-stat-header">
        {icon && <span className="apple-stat-icon" style={{ color: iconColor }}>{icon}</span>}
        {trend && (
          <span className={`apple-stat-trend apple-stat-trend--${trendDirection}`}>
            {trendDirection === 'up' ? '↑' : '↓'} {trend}
          </span>
        )}
      </div>
      <div className="apple-stat-label">{title}</div>
      <div className="apple-stat-value">{value}</div>
    </div>
  );
}

/**
 * AppleProfile — Cabeçalho de perfil
 */
export function AppleProfile({ name, subtitle, avatar }) {
  return (
    <div className="apple-profile">
      {avatar || <AppleAvatar name={name} size="xl" />}
      <div className="apple-profile-name">{name}</div>
      {subtitle && <div className="apple-profile-subtitle">{subtitle}</div>}
    </div>
  );
}

/**
 * ApplePageIndicator — Indicador de páginas
 */
export function ApplePageIndicator({ total, active }) {
  return (
    <div className="apple-page-indicator">
      {Array.from({ length: total }, (_, i) => (
        <div 
          key={i} 
          className={`apple-page-indicator-dot ${i === active ? 'apple-page-indicator-dot--active' : ''}`} 
        />
      ))}
    </div>
  );
}

/**
 * AppleOnboarding — Tela de onboarding
 */
export function AppleOnboarding({ icon, iconColor, title, description }) {
  return (
    <div className="apple-onboarding">
      <div 
        className="apple-onboarding-icon" 
        style={{ background: `${iconColor}15`, color: iconColor, fontSize: 36 }}
      >
        {icon}
      </div>
      <h1 className="apple-onboarding-title">{title}</h1>
      <p className="apple-onboarding-desc">{description}</p>
    </div>
  );
}

/**
 * AppleTooltip — Tooltip
 */
export function AppleTooltip({ text, children }) {
  return (
    <div className="apple-tooltip">
      {children}
      <div className="apple-tooltip-content">{text}</div>
    </div>
  );
}

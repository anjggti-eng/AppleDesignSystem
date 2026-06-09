import React from 'react';

/**
 * HapticButton — Botão com feedback háptico
 * 
 * @param {string} variant - "primary" | "secondary" | "destructive" | "plain"
 * @param {string} size - "sm" | "md" | "lg"
 * @param {boolean} fullWidth - Largura total
 * @param {boolean} loading - Estado de carregamento
 * @param {boolean} disabled - Desabilitado
 * @param {function} onClick - Ação ao clicar
 * @param {React.ReactNode} children - Conteúdo do botão
 */
export function HapticButton({
  variant = 'primary',
  size = 'md',
  fullWidth = false,
  loading = false,
  disabled = false,
  onClick,
  children,
  className = '',
  ...props
}) {
  const handleInteraction = () => {
    if (disabled || loading) return;
    
    // Haptic feedback (navegadores modernos)
    if (navigator.vibrate) {
      navigator.vibrate(10);
    }
    
    onClick?.();
  };

  const classes = [
    'apple-button',
    `apple-button--${variant}`,
    size !== 'md' && `apple-button--${size}`,
    fullWidth && 'apple-button--full',
    loading && 'apple-button--loading',
    className
  ].filter(Boolean).join(' ');

  return (
    <button
      className={classes}
      onClick={handleInteraction}
      disabled={disabled || loading}
      aria-busy={loading}
      {...props}
    >
      {children}
    </button>
  );
}

export default HapticButton;

<script>
  export let variant = 'primary';
  export let size = 'md';
  export let fullWidth = false;
  export let loading = false;
  export let disabled = false;

  $: classes = [
    'apple-button',
    `apple-button--${variant}`,
    size !== 'md' && `apple-button--${size}`,
    fullWidth && 'apple-button--full',
    loading && 'apple-button--loading'
  ].filter(Boolean).join(' ');

  function handleClick() {
    if (disabled || loading) return;
    if (navigator.vibrate) navigator.vibrate(10);
  }
</script>

<button
  class={classes}
  disabled={disabled || loading}
  aria-busy={loading}
  on:click={handleClick}
>
  <slot />
</button>

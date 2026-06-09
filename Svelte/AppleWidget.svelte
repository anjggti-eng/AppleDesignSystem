<script>
  export let variant = 'default';
  
  $: classes = [
    'apple-widget',
    variant !== 'default' && `apple-widget--${variant}`
  ].filter(Boolean).join(' ');
</script>

<div class={classes}>
  <slot />
</div>

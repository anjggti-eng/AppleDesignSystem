<script>
  export let header = '';
</script>

{#if header}
  <div class="apple-list-header">{header}</div>
{/if}
<div class="apple-list">
  <slot />
</div>

<script>
  export let icon = '';
  export let iconColor = '#007AFF';
  export let title = '';
  export let subtitle = '';
  export let value = '';
  export let chevron = true;

  import { createEventDispatcher } from 'svelte';
  const dispatch = createEventDispatcher();
</script>

<div class="apple-list-item" on:click={() => dispatch('click')}>
  {#if icon}
    <div class="apple-list-item-icon" style="background: {iconColor}">
      {icon}
    </div>
  {/if}
  <div class="apple-list-item-content">
    <div class="apple-list-item-title">{title}</div>
    {#if subtitle}
      <div class="apple-list-item-subtitle">{subtitle}</div>
    {/if}
  </div>
  {#if value}
    <span class="apple-list-item-value">{value}</span>
  {/if}
  {#if chevron}
    <div class="apple-list-item-chevron">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><path d="M9 18l6-6-6-6"/></svg>
    </div>
  {/if}
</div>

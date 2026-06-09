<script>
  export let value = '';
  export let label = '';
  export let placeholder = '';
  export let type = 'text';
  export let error = '';

  import { createEventDispatcher } from 'svelte';
  const dispatch = createEventDispatcher();

  function handleInput(e) {
    value = e.target.value;
    dispatch('input', value);
  }
</script>

<div class="apple-input-group">
  {#if label}
    <label class="apple-input-label">{label}</label>
  {/if}
  <input
    {type}
    {placeholder}
    {value}
    class="apple-input {error ? 'apple-input--error' : ''}"
    on:input={handleInput}
  />
  {#if error}
    <span class="apple-input-error">{error}</span>
  {/if}
</div>

<template>
  <div class="apple-input-group">
    <label v-if="label" class="apple-input-label">{{ label }}</label>
    <input
      :type="type"
      :placeholder="placeholder"
      :value="modelValue"
      :class="['apple-input', error && 'apple-input--error']"
      @input="$emit('update:modelValue', $event.target.value)"
    />
    <span v-if="error" class="apple-input-error">{{ error }}</span>
  </div>
</template>

<script>
export default {
  name: 'AppleInput',
  props: {
    modelValue: { type: String, default: '' },
    label: { type: String, default: '' },
    placeholder: { type: String, default: '' },
    type: { type: String, default: 'text' },
    error: { type: String, default: '' }
  },
  emits: ['update:modelValue']
}
</script>

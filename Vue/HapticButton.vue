<template>
  <button
    :class="classes"
    :disabled="disabled || loading"
    :aria-busy="loading"
    @click="handleClick"
  >
    <slot />
  </button>
</template>

<script>
export default {
  name: 'HapticButton',
  props: {
    variant: { type: String, default: 'primary' },
    size: { type: String, default: 'md' },
    fullWidth: { type: Boolean, default: false },
    loading: { type: Boolean, default: false },
    disabled: { type: Boolean, default: false }
  },
  computed: {
    classes() {
      return [
        'apple-button',
        `apple-button--${this.variant}`,
        this.size !== 'md' && `apple-button--${this.size}`,
        this.fullWidth && 'apple-button--full',
        this.loading && 'apple-button--loading'
      ].filter(Boolean).join(' ')
    }
  },
  methods: {
    handleClick() {
      if (this.disabled || this.loading) return
      if (navigator.vibrate) navigator.vibrate(10)
      this.$emit('click')
    }
  }
}
</script>

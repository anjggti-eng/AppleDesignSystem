<template>
  <div :class="classes">
    <slot />
  </div>
</template>

<script>
export default {
  name: 'AppleWidget',
  props: {
    variant: { type: String, default: 'default' }
  },
  computed: {
    classes() {
      return [
        'apple-widget',
        this.variant !== 'default' && `apple-widget--${this.variant}`
      ].filter(Boolean).join(' ')
    }
  }
}
</script>

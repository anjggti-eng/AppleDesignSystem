<template>
  <div class="apple-list-header" v-if="header">{{ header }}</div>
  <div class="apple-list">
    <slot />
  </div>
</template>

<script>
export default {
  name: 'AppleList',
  props: {
    header: { type: String, default: '' }
  }
}
</script>

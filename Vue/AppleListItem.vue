<template>
  <div class="apple-list-item" @click="$emit('click')">
    <div v-if="icon" class="apple-list-item-icon" :style="{ background: iconColor }">
      {{ icon }}
    </div>
    <div class="apple-list-item-content">
      <div class="apple-list-item-title">{{ title }}</div>
      <div v-if="subtitle" class="apple-list-item-subtitle">{{ subtitle }}</div>
    </div>
    <span v-if="value" class="apple-list-item-value">{{ value }}</span>
    <div v-if="chevron" class="apple-list-item-chevron">
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><path d="M9 18l6-6-6-6"/></svg>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AppleListItem',
  props: {
    icon: { type: String, default: '' },
    iconColor: { type: String, default: '#007AFF' },
    title: { type: String, required: true },
    subtitle: { type: String, default: '' },
    value: { type: String, default: '' },
    chevron: { type: Boolean, default: true }
  },
  emits: ['click']
}
</script>

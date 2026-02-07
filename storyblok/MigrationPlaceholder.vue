<script setup lang="ts">
defineProps({
  blok: {
    type: Object,
    required: true
  }
})

const isExpanded = ref(false)
</script>

<template>
  <div
    v-editable="blok"
    class="my-8 mx-auto max-w-screen-xl border-2 border-dashed border-amber-500 bg-amber-50 dark:bg-amber-900/20 rounded-lg p-6"
  >
    <!-- Header -->
    <div class="flex items-start gap-3 mb-4">
      <div class="flex-shrink-0 w-10 h-10 bg-amber-500 rounded-full flex items-center justify-center">
        <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
        </svg>
      </div>
      <div class="flex-1">
        <h3 class="text-lg font-semibold text-amber-800 dark:text-amber-200">
          Migration Placeholder
        </h3>
        <p class="text-sm text-amber-700 dark:text-amber-300">
          Dieser Block konnte nicht automatisch migriert werden.
        </p>
      </div>
    </div>

    <!-- Info Box -->
    <div class="bg-white dark:bg-gray-800 rounded-md p-4 mb-4 border border-amber-200 dark:border-amber-700">
      <div class="space-y-3">
        <div v-if="blok.source_type">
          <span class="text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wide">Block-Typ</span>
          <p class="text-gray-900 dark:text-white font-mono text-sm mt-1">{{ blok.source_type }}</p>
        </div>
        <div v-if="blok.note">
          <span class="text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wide">Hinweis</span>
          <p class="text-gray-700 dark:text-gray-300 text-sm mt-1">{{ blok.note }}</p>
        </div>
      </div>
    </div>

    <!-- Collapsible HTML -->
    <div v-if="blok.source_html" class="border border-amber-200 dark:border-amber-700 rounded-md overflow-hidden">
      <button
        type="button"
        @click="isExpanded = !isExpanded"
        class="w-full px-4 py-2 bg-amber-100 dark:bg-amber-900/50 text-left text-sm font-medium text-amber-800 dark:text-amber-200 flex items-center justify-between hover:bg-amber-200 dark:hover:bg-amber-800 transition-colors"
      >
        <span>Original HTML</span>
        <svg
          class="w-4 h-4 transition-transform"
          :class="{ 'rotate-180': isExpanded }"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
        </svg>
      </button>
      <div v-show="isExpanded" class="p-4 bg-gray-900 overflow-x-auto">
        <pre class="text-xs text-green-400 font-mono whitespace-pre-wrap break-all">{{ blok.source_html }}</pre>
      </div>
    </div>

    <!-- Footer hint -->
    <p class="mt-4 text-xs text-amber-600 dark:text-amber-400 text-center">
      Ersetze diesen Block im Visual Editor durch eine passende Komponente
    </p>
  </div>
</template>

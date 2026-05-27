<template>
  <div style="border:1px solid #dcdfe6;border-radius:4px">
    <Toolbar :editor="editorRef" :defaultConfig="toolbarConfig"
      style="border-bottom:1px solid #dcdfe6" />
    <Editor :defaultConfig="editorConfig" v-model="html"
      style="height:400px" @onCreated="handleCreated" />
  </div>
</template>

<script setup lang="ts">
import { ref, shallowRef, watch, onBeforeUnmount } from 'vue'
import '@wangeditor/editor/dist/css/style.css'
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'

const props = defineProps<{ modelValue: string }>()
const emit = defineEmits<{ 'update:modelValue': [value: string] }>()

const editorRef = shallowRef()
const html = ref(props.modelValue || '')

const toolbarConfig = { excludeKeys: ['group-video'] }
const editorConfig = { placeholder: '请输入商品描述...' }

watch(() => props.modelValue, (val) => { if (val !== html.value) html.value = val })
watch(html, (val) => emit('update:modelValue', val))

function handleCreated(editor: any) { editorRef.value = editor }
onBeforeUnmount(() => { editorRef.value?.destroy() })
</script>

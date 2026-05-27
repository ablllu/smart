<template>
  <el-upload
    :http-request="handleUpload"
    list-type="picture-card"
    :file-list="fileList"
    :on-success="handleSuccess"
    :on-remove="handleRemove"
    :limit="limit"
  >
    <el-icon><Plus /></el-icon>
  </el-upload>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import * as uploadApi from '../api/upload'

const props = withDefaults(defineProps<{
  modelValue: string
  limit?: number
}>(), { limit: 1 })

const emit = defineEmits<{ 'update:modelValue': [value: string] }>()

const fileList = computed(() => {
  if (!props.modelValue) return []
  return [{ name: 'image', url: props.modelValue }]
})

async function handleUpload(options: any) {
  const result = await uploadApi.uploadImage(options.file)
  options.onSuccess(result)
}

function handleSuccess(response: any) {
  emit('update:modelValue', response.url)
}

function handleRemove() {
  emit('update:modelValue', '')
}
</script>

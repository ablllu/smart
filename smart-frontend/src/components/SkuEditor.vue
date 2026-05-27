<template>
  <div>
    <el-button type="primary" size="small" style="margin-bottom:12px" @click="addRow">
      添加 SKU
    </el-button>
    <el-table :data="modelValue" border size="small">
      <el-table-column label="SKU 名称" min-width="120">
        <template #default="{ row }">
          <el-input v-model="row.skuName" size="small" />
        </template>
      </el-table-column>
      <el-table-column label="规格" width="120">
        <template #default="{ row }">
          <el-input v-model="row.specInfo" size="small" />
        </template>
      </el-table-column>
      <el-table-column label="售价" width="100">
        <template #default="{ row }">
          <el-input-number v-model="row.price" :min="0" :precision="2" size="small" controls-position="right" style="width:80px" />
        </template>
      </el-table-column>
      <el-table-column label="原价" width="100">
        <template #default="{ row }">
          <el-input-number v-model="row.originalPrice" :min="0" :precision="2" size="small" controls-position="right" style="width:80px" />
        </template>
      </el-table-column>
      <el-table-column label="成本价" width="100">
        <template #default="{ row }">
          <el-input-number v-model="row.costPrice" :min="0" :precision="2" size="small" controls-position="right" style="width:80px" />
        </template>
      </el-table-column>
      <el-table-column label="库存" width="90">
        <template #default="{ row }">
          <el-input-number v-model="row.stock" :min="0" size="small" controls-position="right" style="width:70px" />
        </template>
      </el-table-column>
      <el-table-column label="图片" width="100">
        <template #default="{ row }">
          <el-input v-model="row.image" size="small" placeholder="URL" />
        </template>
      </el-table-column>
      <el-table-column label="操作" width="70" fixed="right">
        <template #default="{ $index }">
          <el-button type="danger" size="small" link @click="removeRow($index)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script setup lang="ts">
const props = defineProps<{ modelValue: any[] }>()
const emit = defineEmits<{ 'update:modelValue': [value: any[]] }>()

function addRow() {
  const list = [...props.modelValue, {
    skuName: '', specInfo: '', price: 0, originalPrice: 0, costPrice: 0, stock: 0, image: ''
  }]
  emit('update:modelValue', list)
}

function removeRow(index: number) {
  const list = props.modelValue.filter((_, i) => i !== index)
  emit('update:modelValue', list)
}
</script>

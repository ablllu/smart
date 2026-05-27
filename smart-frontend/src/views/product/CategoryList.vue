<template>
  <div>
    <el-card>
      <div style="margin-bottom:16px">
        <el-button type="primary" @click="handleAdd(null)">新增分类</el-button>
      </div>

      <el-table
        :data="treeData"
        row-key="id"
        :tree-props="{ children: 'children' }"
        default-expand-all
        border
        stripe
      >
        <el-table-column prop="name" label="分类名称" min-width="200" />
        <el-table-column prop="sortNum" label="排序" width="100" />
        <el-table-column label="状态" width="100">
          <template #default="{ row }">
            <el-switch
              :model-value="row.status === 1"
              @change="(val: boolean) => handleStatusChange(row, val)" />
          </template>
        </el-table-column>
        <el-table-column label="操作" width="280">
          <template #default="{ row }">
            <el-button type="primary" size="small" @click="handleAdd(row)">添加子分类</el-button>
            <el-button size="small" @click="handleEdit(row)">编辑</el-button>
            <el-button type="danger" size="small" @click="handleDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <!-- 新增/编辑弹窗 -->
    <el-dialog
      v-model="dialogVisible"
      :title="isEdit ? '编辑分类' : '新增分类'"
      width="500px"
      @closed="resetForm"
    >
      <el-form ref="formRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="分类名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入分类名称" />
        </el-form-item>
        <el-form-item label="上级分类">
          <el-tree-select
            v-model="form.parentId"
            :data="treeData"
            :props="{ value: 'id', label: 'name', children: 'children' }"
            placeholder="不选则为一级分类"
            check-strictly
            clearable
            style="width:100%"
          />
        </el-form-item>
        <el-form-item label="排序">
          <el-input-number v-model="form.sortNum" :min="0" />
        </el-form-item>
        <el-form-item label="状态">
          <el-switch :model-value="form.status === 1"
            @change="(val: boolean) => (form.status = val ? 1 : 0)" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitForm">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import * as categoryApi from '../../api/category'

const treeData = ref<any[]>([])
const dialogVisible = ref(false)
const isEdit = ref(false)
const editId = ref<number | null>(null)
const formRef = ref()
const form = ref({
  name: '',
  parentId: null as number | null,
  sortNum: 0,
  status: 1
})

const rules = {
  name: [{ required: true, message: '请输入分类名称', trigger: 'blur' }]
}

onMounted(() => fetchData())

async function fetchData() {
  treeData.value = await categoryApi.getTree()
}

function handleAdd(parent: any) {
  isEdit.value = false
  editId.value = null
  form.value = {
    name: '',
    parentId: parent?.id ?? null,
    sortNum: 0,
    status: 1
  }
  dialogVisible.value = true
}

function handleEdit(row: any) {
  isEdit.value = true
  editId.value = row.id
  form.value = {
    name: row.name,
    parentId: row.parentId,
    sortNum: row.sortNum ?? 0,
    status: row.status ?? 1
  }
  dialogVisible.value = true
}

async function submitForm() {
  await formRef.value.validate()
  const data = {
    name: form.value.name,
    parentId: form.value.parentId,
    sortNum: form.value.sortNum,
    status: form.value.status
  }
  if (isEdit.value) {
    await categoryApi.update(editId.value!, data)
    ElMessage.success('修改成功')
  } else {
    await categoryApi.create(data)
    ElMessage.success('新增成功')
  }
  dialogVisible.value = false
  fetchData()
}

async function handleDelete(row: any) {
  await ElMessageBox.confirm(`确认删除分类【${row.name}】吗？`, '提示', { type: 'warning' })
  try {
    await categoryApi.remove(row.id)
    ElMessage.success('删除成功')
    fetchData()
  } catch (err: any) {
    // 后端返回的错误提示（如"请先删除子分类"）
    ElMessage.error(err?.message || '删除失败')
  }
}

async function handleStatusChange(row: any, val: boolean) {
  await categoryApi.update(row.id, { status: val ? 1 : 0 })
  ElMessage.success(val ? '已启用' : '已禁用')
  fetchData()
}

function resetForm() {
  formRef.value?.resetFields()
}
</script>

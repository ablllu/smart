<template>
  <div class="page-container">
    <el-card>
      <el-form :inline="true" :model="query">
        <el-form-item label="店铺名">
          <el-input v-model="query.shopName" placeholder="输入店铺名" clearable />
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="query.status" placeholder="全部" clearable>
            <el-option label="营业" :value="1" />
            <el-option label="关闭" :value="0" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="fetchData">搜索</el-button>
          <el-button type="success" @click="openCreate">新增店铺</el-button>
        </el-form-item>
      </el-form>

      <el-table :data="list" border v-loading="loading">
        <el-table-column prop="id" label="ID" width="80" />
        <el-table-column prop="shopName" label="店铺名称" />
        <el-table-column prop="contactPhone" label="客服电话" width="130" />
        <el-table-column prop="rating" label="评分" width="80" />
        <el-table-column label="状态" width="80">
          <template #default="{ row }">
            <el-tag :type="row.status === 1 ? 'success' : 'danger'">
              {{ row.status === 1 ? '营业' : '关闭' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="创建时间" width="170" />
        <el-table-column label="操作" width="150" fixed="right">
          <template #default="{ row }">
            <el-button size="small" @click="openEdit(row)">编辑</el-button>
            <el-button size="small" type="danger" @click="handleDelete(row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <div style="margin-top:16px;display:flex;justify-content:flex-end">
        <el-pagination
          v-model:current-page="query.pageNum" v-model:page-size="query.pageSize"
          :total="total" :page-sizes="[10, 20, 50]"
          layout="total, sizes, prev, pager, next"
          @size-change="fetchData" @current-change="fetchData" />
      </div>
    </el-card>

    <el-dialog v-model="visible" :title="isEdit ? '编辑店铺' : '新增店铺'" width="500px">
      <el-form :model="form" label-width="100px">
        <el-form-item label="关联用户ID" required>
          <el-input-number v-model="form.userId" :min="1" style="width:100%" :disabled="isEdit" />
        </el-form-item>
        <el-form-item label="店铺名称" required>
          <el-input v-model="form.shopName" />
        </el-form-item>
        <el-form-item label="Logo URL">
          <el-input v-model="form.logo" placeholder="图片URL" />
        </el-form-item>
        <el-form-item label="店铺简介">
          <el-input v-model="form.description" type="textarea" :rows="2" />
        </el-form-item>
        <el-form-item label="客服电话">
          <el-input v-model="form.contactPhone" />
        </el-form-item>
        <el-form-item label="状态">
          <el-switch v-model="statusSwitch" active-text="营业" inactive-text="关闭" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="visible = false">取消</el-button>
        <el-button type="primary" @click="handleSubmit">确认</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import * as shopApi from '@/api/merchant-shop'

const list = ref<any[]>([])
const total = ref(0)
const loading = ref(false)
const visible = ref(false)
const isEdit = ref(false)
const currentId = ref<number | null>(null)
const query = reactive({ pageNum: 1, pageSize: 10, shopName: '', status: null as number | null })
const form = reactive({ userId: null as number | null, shopName: '', logo: '', description: '', contactPhone: '', status: 1 })

const statusSwitch = computed({
  get: () => form.status === 1,
  set: (v) => (form.status = v ? 1 : 0),
})

onMounted(() => fetchData())

async function fetchData() {
  loading.value = true
  try {
    const res = await shopApi.getPage(query)
    list.value = res.records
    total.value = res.total
  } finally {
    loading.value = false
  }
}

function openCreate() {
  isEdit.value = false
  currentId.value = null
  Object.assign(form, { userId: null, shopName: '', logo: '', description: '', contactPhone: '', status: 1 })
  visible.value = true
}

function openEdit(row: any) {
  isEdit.value = true
  currentId.value = row.id
  Object.assign(form, { userId: row.userId, shopName: row.shopName, logo: row.logo, description: row.description, contactPhone: row.contactPhone, status: row.status })
  visible.value = true
}

async function handleSubmit() {
  if (!form.shopName) { ElMessage.warning('请输入店铺名'); return }
  if (isEdit.value) {
    await shopApi.update(currentId.value!, form)
    ElMessage.success('修改成功')
  } else {
    if (!form.userId) { ElMessage.warning('请选择关联用户'); return }
    await shopApi.create(form)
    ElMessage.success('创建成功')
  }
  visible.value = false
  fetchData()
}

async function handleDelete(id: number) {
  await ElMessageBox.confirm('确认删除？', '提示', { type: 'warning' })
  await shopApi.remove(id)
  ElMessage.success('已删除')
  fetchData()
}
</script>

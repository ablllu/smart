<template>
  <div>
    <h2 class="page-title">用户管理</h2>

    <!-- 搜索 -->
    <div class="search-bar">
      <el-form :inline="true">
        <el-form-item label="用户名">
          <el-input v-model="searchForm.username" placeholder="请输入用户名" clearable />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="loadData">搜索</el-button>
          <el-button @click="resetSearch">重置</el-button>
        </el-form-item>
      </el-form>
    </div>

    <!-- 表格 -->
    <div class="table-card">
      <div class="toolbar">
        <el-button type="primary" @click="handleAdd">新增用户</el-button>
        <el-button type="success" @click="handleExport">导出 Excel</el-button>
        <el-upload
          style="margin:0;display:inline-block"
          :show-file-list="false"
          :before-upload="beforeImport"
        >
          <el-button type="warning">导入 Excel</el-button>
        </el-upload>
      </div>

      <el-table :data="tableData" border stripe>
        <el-table-column prop="id" label="ID" width="80" />
        <el-table-column prop="username" label="用户名" width="140" />
        <el-table-column prop="nickname" label="昵称" width="140" />
        <el-table-column label="头像" width="80">
          <template #default="{ row }">
            <el-avatar :src="row.avatar" :size="36" />
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="创建时间" min-width="170" />
        <el-table-column label="操作" width="150">
          <template #default="{ row }">
            <el-button type="primary" link @click="handleEdit(row)">编辑</el-button>
            <el-button type="danger" link @click="handleDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <div class="pagination">
        <el-pagination
          background
          layout="total, prev, pager, next"
          :total="total"
          :page-size="pageSize"
          :current-page="currentPage"
          @current-change="handlePageChange"
        />
      </div>
    </div>

    <UserFormDialog ref="dialogRef" @success="loadData" />
  </div>
</template>

<script setup lang="ts">
import * as userApi from '../../api/user'
import { onMounted, reactive, ref } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import UserFormDialog from './components/UserFormDialog.vue'
import { saveAs } from 'file-saver'

const dialogRef = ref()
const searchForm = reactive({ username: '' })
const tableData = ref<any[]>([])
const total = ref(0)
const currentPage = ref(1)
const pageSize = ref(10)

onMounted(() => loadData())

async function loadData() {
  const result = await userApi.getUserPage({
    pageNum: currentPage.value,
    pageSize: pageSize.value,
    username: searchForm.username
  })
  tableData.value = result.records
  total.value = Number(result.total)
}

function resetSearch() { searchForm.username = ''; loadData() }
function handleAdd() { dialogRef.value.openAdd() }
function handleEdit(row: any) { dialogRef.value.openEdit(row) }

async function handleDelete(row: any) {
  await ElMessageBox.confirm(`确认删除用户【${row.username}】吗？`, '提示', { type: 'warning' })
  await userApi.deleteUser(row.id)
  ElMessage.success('删除成功')
  loadData()
}

async function handleExport() {
  const blob = await userApi.exportUser()
  saveAs(blob, '用户数据.xlsx')
  ElMessage.success('导出成功')
}

async function beforeImport(file: File) {
  const isExcel = file.name.endsWith('.xlsx') || file.name.endsWith('.xls')
  if (!isExcel) { ElMessage.error('只能上传Excel文件'); return false }
  await userApi.importUser(file)
  ElMessage.success('导入成功')
  loadData()
  return false
}

function handlePageChange(page: number) { currentPage.value = page; loadData() }
</script>

<style scoped>
.page-title { font-size: 20px; font-weight: 600; color: #333; margin: 0 0 20px; }
.search-bar { background: #fff; border-radius: 10px; padding: 20px 24px; margin-bottom: 16px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); }
.table-card { background: #fff; border-radius: 10px; padding: 24px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); }
.toolbar { margin-bottom: 16px; display: flex; gap: 8px; }
.pagination { margin-top: 20px; display: flex; justify-content: flex-end; }
</style>

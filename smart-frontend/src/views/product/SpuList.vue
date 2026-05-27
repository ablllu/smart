<template>
  <div>
    <!-- 搜索栏 -->
    <el-card style="margin-bottom:16px">
      <el-form :model="query" inline>
        <el-form-item label="商品名称">
          <el-input v-model="query.name" placeholder="请输入" clearable />
        </el-form-item>
        <el-form-item label="分类">
          <el-tree-select
            v-model="query.categoryId"
            :data="categoryTree"
            :props="{ value: 'id', label: 'name', children: 'children' }"
            placeholder="全部分类"
            check-strictly
            clearable
            style="width:180px"
          />
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="query.status" placeholder="全部" clearable style="width:120px">
            <el-option label="上架" :value="1" />
            <el-option label="下架" :value="0" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleSearch">搜索</el-button>
          <el-button @click="handleReset">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <!-- 表格 -->
    <el-card>
      <div style="margin-bottom:16px">
        <el-button type="primary" @click="router.push('/product/add')">新增商品</el-button>
      </div>

      <el-table :data="tableData" v-loading="loading" border stripe>
        <el-table-column prop="id" label="ID" width="80" />
        <el-table-column prop="name" label="商品名称" min-width="180" />
        <el-table-column prop="categoryName" label="分类" width="120" />
        <el-table-column prop="brand" label="品牌" width="120" />
        <el-table-column label="主图" width="100">
          <template #default="{ row }">
            <el-image
              v-if="row.mainImage"
              :src="row.mainImage"
              :preview-src-list="[row.mainImage]"
              style="width:50px;height:50px"
              fit="cover"
            />
          </template>
        </el-table-column>
        <el-table-column label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="row.status === 1 ? 'success' : 'info'">
              {{ row.status === 1 ? '上架' : '下架' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="saleCount" label="销量" width="80" />
        <el-table-column prop="createTime" label="创建时间" width="170" />
        <el-table-column label="操作" width="260" fixed="right">
          <template #default="{ row }">
            <el-button
              :type="row.status === 1 ? 'warning' : 'success'"
              size="small"
              @click="handleToggleStatus(row)">
              {{ row.status === 1 ? '下架' : '上架' }}
            </el-button>
            <el-button type="primary" size="small" @click="showDetail(row.id)">详情</el-button>
            <el-button size="small" @click="router.push(`/product/edit/${row.id}`)">编辑</el-button>
            <el-button type="danger" size="small" @click="handleDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <div style="margin-top:16px;display:flex;justify-content:flex-end">
        <el-pagination
          v-model:current-page="query.pageNum"
          v-model:page-size="query.pageSize"
          :total="total"
          :page-sizes="[10, 20, 50]"
          layout="total, sizes, prev, pager, next"
          @size-change="fetchData"
          @current-change="fetchData"
        />
      </div>
    </el-card>

    <SpuDetailDrawer ref="detailRef" />
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage, ElMessageBox } from 'element-plus'
import * as spuApi from '../../api/spu'
import * as categoryApi from '../../api/category'
import SpuDetailDrawer from './components/SpuDetailDrawer.vue'

const router = useRouter()
const detailRef = ref()
const query = reactive({ pageNum: 1, pageSize: 10, name: '', categoryId: undefined as number | undefined, status: undefined as number | undefined })
const tableData = ref<any[]>([])
const total = ref(0)
const loading = ref(false)
const categoryTree = ref<any[]>([])

onMounted(() => {
  fetchData()
  loadCategoryTree()
})

async function fetchData() {
  loading.value = true
  try {
    const res = await spuApi.getPage({
      pageNum: query.pageNum,
      pageSize: query.pageSize,
      name: query.name || undefined,
      categoryId: query.categoryId,
      status: query.status
    })
    tableData.value = res.records
    total.value = res.total
  } finally {
    loading.value = false
  }
}

async function loadCategoryTree() {
  categoryTree.value = await categoryApi.getTree()
}

function handleSearch() {
  query.pageNum = 1
  fetchData()
}

function handleReset() {
  query.name = ''
  query.categoryId = undefined
  query.status = undefined
  query.pageNum = 1
  fetchData()
}

async function handleToggleStatus(row: any) {
  const newStatus = row.status === 1 ? 0 : 1
  const label = newStatus === 1 ? '上架' : '下架'
  await ElMessageBox.confirm(`确认${label}商品【${row.name}】吗？`, '提示', { type: 'warning' })
  await spuApi.updateStatus(row.id, newStatus)
  ElMessage.success(`已${label}`)
  fetchData()
}

async function handleDelete(row: any) {
  await ElMessageBox.confirm(`确认删除商品【${row.name}】吗？`, '提示', { type: 'warning' })
  await spuApi.remove(row.id)
  ElMessage.success('删除成功')
  fetchData()
}

function showDetail(id: number) {
  detailRef.value.open(id)
}
</script>

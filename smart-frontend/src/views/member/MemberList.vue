<template>
  <div>
    <h2 class="page-title">会员管理</h2>

    <div class="search-bar">
      <el-form :model="query" inline>
        <el-form-item label="用户名">
          <el-input v-model="query.username" placeholder="请输入" clearable />
        </el-form-item>
        <el-form-item label="手机号">
          <el-input v-model="query.phone" placeholder="请输入" clearable />
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="query.status" placeholder="全部" clearable style="width:120px">
            <el-option label="启用" :value="1" />
            <el-option label="禁用" :value="0" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleSearch">搜索</el-button>
          <el-button @click="handleReset">重置</el-button>
        </el-form-item>
      </el-form>
    </div>

    <div class="table-card">
      <el-table :data="tableData" v-loading="loading" border stripe>
        <el-table-column prop="id" label="ID" width="80" />
        <el-table-column prop="username" label="用户名" width="140" />
        <el-table-column prop="nickname" label="昵称" width="140" />
        <el-table-column prop="phone" label="手机号" width="140" />
        <el-table-column label="等级" width="120">
          <template #default="{ row }">
            <el-tag>{{ MemberLevelMap[row.memberLevel] }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="性别" width="80">
          <template #default="{ row }">{{ GenderMap[row.gender] }}</template>
        </el-table-column>
        <el-table-column label="状态" width="100">
          <template #default="{ row }">
            <el-switch :model-value="row.status === 1" @change="(val: boolean) => handleStatusChange(row.id, val ? 1 : 0)" />
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="创建时间" width="180" />
        <el-table-column label="操作" width="100" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" size="small" @click="showDetail(row.id)">详情</el-button>
          </template>
        </el-table-column>
      </el-table>

      <div class="pagination">
        <el-pagination
          v-model:current-page="query.pageNum" v-model:page-size="query.pageSize"
          :total="total" :page-sizes="[10, 20, 50]"
          layout="total, sizes, prev, pager, next"
          @size-change="fetchData" @current-change="fetchData" />
      </div>
    </div>

    <el-drawer v-model="drawerVisible" title="会员详情" size="500px">
      <template v-if="detail">
        <el-descriptions :column="2" border>
          <el-descriptions-item label="用户名">{{ detail.username }}</el-descriptions-item>
          <el-descriptions-item label="昵称">{{ detail.nickname }}</el-descriptions-item>
          <el-descriptions-item label="手机号">{{ detail.phone }}</el-descriptions-item>
          <el-descriptions-item label="邮箱">{{ detail.email }}</el-descriptions-item>
          <el-descriptions-item label="性别">{{ GenderMap[detail.gender] }}</el-descriptions-item>
          <el-descriptions-item label="等级">{{ MemberLevelMap[detail.memberLevel] }}</el-descriptions-item>
          <el-descriptions-item label="生日">{{ detail.birthday }}</el-descriptions-item>
          <el-descriptions-item label="状态">
            <el-tag :type="detail.status === 1 ? 'success' : 'danger'">{{ detail.status === 1 ? '启用' : '禁用' }}</el-tag>
          </el-descriptions-item>
        </el-descriptions>

        <h4 style="margin-top:20px">收货地址</h4>
        <el-table :data="detail.addresses || []" border size="small">
          <el-table-column prop="name" label="收件人" width="100" />
          <el-table-column prop="phone" label="电话" width="140" />
          <el-table-column label="地址">
            <template #default="{ row: addr }">{{ addr.province }}{{ addr.city }}{{ addr.district }}{{ addr.detail }}</template>
          </el-table-column>
          <el-table-column label="默认" width="80">
            <template #default="{ row: addr }">
              <el-tag v-if="addr.isDefault === 1" type="success" size="small">默认</el-tag>
            </template>
          </el-table-column>
        </el-table>
      </template>
    </el-drawer>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import * as memberApi from '../../api/member'
import { GenderMap, MemberLevelMap } from '../../utils/constants'

const query = reactive({ pageNum: 1, pageSize: 10, username: '', phone: '', status: undefined as number | undefined })
const tableData = ref<any[]>([])
const total = ref(0)
const loading = ref(false)
const drawerVisible = ref(false)
const detail = ref<any>(null)

onMounted(() => fetchData())

async function fetchData() {
  loading.value = true
  try {
    const res = await memberApi.getPage({ pageNum: query.pageNum, pageSize: query.pageSize, username: query.username || undefined, phone: query.phone || undefined, status: query.status })
    tableData.value = res.records; total.value = res.total
  } finally { loading.value = false }
}

function handleSearch() { query.pageNum = 1; fetchData() }
function handleReset() { query.username = ''; query.phone = ''; query.status = undefined; query.pageNum = 1; fetchData() }

async function handleStatusChange(id: number, status: number) {
  await memberApi.updateStatus(id, status)
  ElMessage.success(status === 1 ? '已启用' : '已禁用')
  fetchData()
}

async function showDetail(id: number) { detail.value = await memberApi.getById(id); drawerVisible.value = true }
</script>

<style scoped>
.page-title { font-size: 20px; font-weight: 600; color: #333; margin: 0 0 20px; }
.search-bar { background: #fff; border-radius: 10px; padding: 20px 24px; margin-bottom: 16px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); }
.table-card { background: #fff; border-radius: 10px; padding: 24px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); }
.pagination { margin-top: 20px; display: flex; justify-content: flex-end; }
</style>

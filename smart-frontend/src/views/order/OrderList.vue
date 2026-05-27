<template>
  <div>
    <h2 class="page-title">订单管理</h2>

    <div class="search-bar">
      <el-form :model="query" inline>
        <el-form-item label="订单号">
          <el-input v-model="query.orderNo" placeholder="请输入" clearable />
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="query.status" placeholder="全部" clearable style="width:120px">
            <el-option v-for="(v, k) in OrderStatusMap" :key="k" :label="v.label" :value="Number(k)" />
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
        <el-table-column prop="orderNo" label="订单号" width="180" />
        <el-table-column prop="totalAmount" label="总金额" width="100" />
        <el-table-column label="支付方式" width="90">
          <template #default="{ row }">{{ PayTypeMap[row.payType] }}</template>
        </el-table-column>
        <el-table-column label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="OrderStatusMap[row.status]?.type">{{ OrderStatusMap[row.status]?.label }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="receiverName" label="收货人" width="100" />
        <el-table-column prop="receiverPhone" label="收货电话" width="140" />
        <el-table-column prop="createTime" label="创建时间" width="180" />
        <el-table-column label="操作" width="200" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" size="small" @click="showDetail(row.id)">详情</el-button>
            <el-button v-if="row.status === 1" type="success" size="small" @click="handleShip(row.id)">发货</el-button>
            <el-button v-if="row.status === 0 || row.status === 1" type="danger" size="small" @click="handleCancel(row.id)">取消</el-button>
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

    <el-drawer v-model="drawerVisible" title="订单详情" size="600px">
      <template v-if="detail">
        <el-descriptions :column="2" border>
          <el-descriptions-item label="订单号">{{ detail.orderNo }}</el-descriptions-item>
          <el-descriptions-item label="状态">
            <el-tag :type="OrderStatusMap[detail.status]?.type">{{ OrderStatusMap[detail.status]?.label }}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="总金额">¥{{ detail.totalAmount }}</el-descriptions-item>
          <el-descriptions-item label="实付金额">¥{{ detail.payAmount }}</el-descriptions-item>
          <el-descriptions-item label="运费">¥{{ detail.freightAmount }}</el-descriptions-item>
          <el-descriptions-item label="支付方式">{{ PayTypeMap[detail.payType] }}</el-descriptions-item>
          <el-descriptions-item label="支付时间">{{ detail.payTime }}</el-descriptions-item>
          <el-descriptions-item label="收件人">{{ detail.receiverName }}</el-descriptions-item>
          <el-descriptions-item label="收件电话">{{ detail.receiverPhone }}</el-descriptions-item>
          <el-descriptions-item label="收件地址" :span="2">{{ detail.receiverAddress }}</el-descriptions-item>
          <el-descriptions-item label="备注" :span="2">{{ detail.remark || '无' }}</el-descriptions-item>
        </el-descriptions>

        <h4 style="margin-top:20px">商品明细</h4>
        <el-table :data="detail.items || []" border size="small">
          <el-table-column label="图片" width="80">
            <template #default="{ row: item }">
              <el-image v-if="item.image" :src="item.image" style="width:50px;height:50px" fit="cover" />
            </template>
          </el-table-column>
          <el-table-column prop="spuName" label="商品" />
          <el-table-column prop="skuName" label="规格" width="160" />
          <el-table-column prop="price" label="单价" width="100" />
          <el-table-column prop="quantity" label="数量" width="80" />
          <el-table-column label="小计" width="100">
            <template #default="{ row: item }">¥{{ item.price * item.quantity }}</template>
          </el-table-column>
        </el-table>
      </template>
    </el-drawer>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import * as orderApi from '../../api/order'
import { OrderStatusMap, PayTypeMap } from '../../utils/constants'

const query = reactive({ pageNum: 1, pageSize: 10, orderNo: '', status: undefined as number | undefined })
const tableData = ref<any[]>([])
const total = ref(0)
const loading = ref(false)
const drawerVisible = ref(false)
const detail = ref<any>(null)

onMounted(() => fetchData())

async function fetchData() {
  loading.value = true
  try {
    const res = await orderApi.getPage({ pageNum: query.pageNum, pageSize: query.pageSize, orderNo: query.orderNo || undefined, status: query.status })
    tableData.value = res.records; total.value = res.total
  } finally { loading.value = false }
}

function handleSearch() { query.pageNum = 1; fetchData() }
function handleReset() { query.orderNo = ''; query.status = undefined; query.pageNum = 1; fetchData() }

async function handleShip(id: number) {
  try { await ElMessageBox.confirm('确认发货？', '提示', { type: 'warning' }); await orderApi.ship(id); ElMessage.success('已发货'); fetchData() }
  catch { /* 取消 */ }
}

async function handleCancel(id: number) {
  try { await ElMessageBox.confirm('确认取消该订单？', '提示', { type: 'warning' }); await orderApi.cancel(id); ElMessage.success('已取消'); fetchData() }
  catch { /* 取消 */ }
}

async function showDetail(id: number) { detail.value = await orderApi.getById(id); drawerVisible.value = true }
</script>

<style scoped>
.page-title { font-size: 20px; font-weight: 600; color: #333; margin: 0 0 20px; }
.search-bar { background: #fff; border-radius: 10px; padding: 20px 24px; margin-bottom: 16px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); }
.table-card { background: #fff; border-radius: 10px; padding: 24px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); }
.pagination { margin-top: 20px; display: flex; justify-content: flex-end; }
</style>

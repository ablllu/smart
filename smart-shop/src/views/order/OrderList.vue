<template>
  <div class="order-page">
    <h2>我的订单</h2>

    <div class="order-list" v-loading="loading">
      <el-empty v-if="!loading && list.length === 0" description="暂无订单" />

      <div v-for="order in list" :key="order.id" class="order-item">
        <div class="order-header">
          <span>订单号：{{ order.orderNo }}</span>
          <el-tag :type="statusType(order.status)" size="small">
            {{ statusText(order.status) }}
          </el-tag>
        </div>
        <div class="order-meta">
          <span>金额：¥{{ order.payAmount }}</span>
          <span>{{ order.createTime }}</span>
        </div>
        <div class="order-actions">
          <el-button v-if="order.status === 0" type="primary" size="small" @click="handlePay(order.id)">
            去支付
          </el-button>
          <el-button v-if="order.status === 0" size="small" @click="handleCancel(order.id)">
            取消订单
          </el-button>
          <el-button v-if="order.status === 2" type="success" size="small" @click="handleReceive(order.id)">
            确认收货
          </el-button>
        </div>
      </div>

      <div class="pagination" v-if="total > 10">
        <el-pagination background layout="prev, pager, next"
          :total="total" :page-size="10" v-model:current-page="pageNum"
          @current-change="fetchData" />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import * as orderApi from '../../api/order'

const list = ref<any[]>([])
const total = ref(0)
const loading = ref(false)
const pageNum = ref(1)

onMounted(() => fetchData())

async function fetchData() {
  loading.value = true
  try {
    const res = await orderApi.getPage(pageNum.value)
    list.value = res.records
    total.value = res.total
  } finally {
    loading.value = false
  }
}

function statusText(status: number) {
  const map: Record<number, string> = { 0: '待付款', 1: '待发货', 2: '已发货', 3: '已完成', 4: '已取消' }
  return map[status] || '未知'
}

function statusType(status: number) {
  const map: Record<number, string> = { 0: 'warning', 1: 'primary', 2: 'info', 3: 'success', 4: 'danger' }
  return map[status] || 'info'
}

async function handlePay(id: number) {
  await orderApi.pay(id)
  ElMessage.success('支付成功')
  fetchData()
}

async function handleCancel(id: number) {
  await ElMessageBox.confirm('确认取消订单？', '提示', { type: 'warning' })
  await orderApi.cancel(id)
  ElMessage.success('订单已取消')
  fetchData()
}

async function handleReceive(id: number) {
  await ElMessageBox.confirm('确认已收到商品？', '提示', { type: 'success' })
  await orderApi.receive(id)
  ElMessage.success('收货成功')
  fetchData()
}
</script>

<style scoped>
.order-page { max-width: 800px; margin: 0 auto; }
.order-page h2 { margin: 0 0 20px; font-size: 20px; }

.order-item {
  background: #fff; border-radius: 10px; padding: 20px;
  margin-bottom: 12px; box-shadow: 0 1px 4px rgba(0,0,0,0.04);
}

.order-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px; font-size: 14px; }

.order-meta { display: flex; gap: 24px; font-size: 13px; color: #999; margin-bottom: 12px; }

.order-actions { display: flex; gap: 10px; }

.pagination { margin-top: 20px; display: flex; justify-content: center; }
</style>

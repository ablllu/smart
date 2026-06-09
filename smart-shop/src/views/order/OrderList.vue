<template>
  <div class="order-page">
    <h2>我的订单</h2>

    <div class="order-list" v-loading="loading">
      <el-empty v-if="!loading && list.length === 0" description="暂无订单" />

      <div v-for="order in list" :key="order.id" class="order-item" @click="showDetail(order.id)">
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
        <div class="order-actions" @click.stop>
          <el-button v-if="order.status === 0" type="primary" size="small" @click="handlePay(order.id)">
            去支付
          </el-button>
          <el-button v-if="order.status === 0" size="small" @click="handleCancel(order.id)">
            取消订单
          </el-button>
          <el-button v-if="order.status === 2" type="success" size="small" @click="handleReceive(order.id)">
            确认收货
          </el-button>
          <el-button v-if="order.status === 3" type="warning" size="small" @click="openReview(order)">
            评价
          </el-button>
        </div>
      </div>

      <div class="pagination" v-if="total > 10">
        <el-pagination background layout="prev, pager, next"
          :total="total" :page-size="10" v-model:current-page="pageNum"
          @current-change="fetchData" />
      </div>
    </div>

    <!-- 订单详情抽屉 -->
    <el-drawer v-model="drawerVisible" title="订单详情" size="500px">
      <template v-if="detail">
        <el-descriptions :column="1" border>
          <el-descriptions-item label="订单号">{{ detail.orderNo }}</el-descriptions-item>
          <el-descriptions-item label="状态">
            <el-tag :type="statusType(detail.status)">{{ statusText(detail.status) }}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="总金额">¥{{ detail.totalAmount }}</el-descriptions-item>
          <el-descriptions-item label="实付金额">¥{{ detail.payAmount }}</el-descriptions-item>
          <el-descriptions-item label="运费">¥{{ detail.freightAmount }}</el-descriptions-item>
          <el-descriptions-item label="收件人">{{ detail.receiverName }}</el-descriptions-item>
          <el-descriptions-item label="收件电话">{{ detail.receiverPhone }}</el-descriptions-item>
          <el-descriptions-item label="收件地址">{{ detail.receiverAddress }}</el-descriptions-item>
          <el-descriptions-item label="备注">{{ detail.remark || '无' }}</el-descriptions-item>
          <el-descriptions-item label="创建时间">{{ detail.createTime }}</el-descriptions-item>
          <el-descriptions-item v-if="detail.payTime" label="支付时间">{{ detail.payTime }}</el-descriptions-item>
        </el-descriptions>

        <h4 style="margin-top:20px;margin-bottom:12px">商品明细</h4>
        <div v-for="item in detail.items" :key="item.id" class="detail-item">
          <el-image v-if="item.image" :src="item.image" style="width:60px;height:60px;border-radius:6px" fit="cover" />
          <div class="detail-item-info">
            <div class="detail-item-name">{{ item.spuName }}</div>
            <div class="detail-item-spec">{{ item.skuName }}</div>
          </div>
          <div class="detail-item-right">
            <div>¥{{ item.price }} × {{ item.quantity }}</div>
            <div class="detail-item-total">小计：¥{{ item.totalAmount }}</div>
          </div>
        </div>
      </template>
    </el-drawer>

    <!-- 评价弹窗 -->
    <el-dialog v-model="reviewVisible" title="评价商品" width="420px">
      <div style="text-align:center">
        <p style="margin-bottom:12px">评分</p>
        <el-rate v-model="reviewRating" show-score />
        <p style="margin-top:20px;margin-bottom:8px">评价内容（选填）</p>
        <el-input v-model="reviewContent" type="textarea" :rows="3" placeholder="说说你的使用感受" />
      </div>
      <template #footer>
        <el-button @click="reviewVisible = false">取消</el-button>
        <el-button type="primary" @click="submitReview">提交评价</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import * as orderApi from '../../api/order'
import * as reviewApi from '../../api/review'

const list = ref<any[]>([])
const total = ref(0)
const loading = ref(false)
const pageNum = ref(1)
const drawerVisible = ref(false)
const detail = ref<any>(null)
const reviewVisible = ref(false)
const reviewRating = ref(5)
const reviewContent = ref('')
const currentReviewOrder = ref<any>(null)

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

async function showDetail(id: number) {
  try {
    detail.value = await orderApi.getDetail(id)
    drawerVisible.value = true
  } catch {
    ElMessage.error('加载订单详情失败')
  }
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

function openReview(order: any) {
  currentReviewOrder.value = order
  reviewRating.value = 5
  reviewContent.value = ''
  reviewVisible.value = true
}

async function submitReview() {
  await reviewApi.submit(currentReviewOrder.value.id, reviewRating.value, reviewContent.value || undefined)
  ElMessage.success('评价成功')
  reviewVisible.value = false
  fetchData()
}
</script>

<style scoped>
.order-page { max-width: 800px; margin: 0 auto; }
.order-page h2 { margin: 0 0 20px; font-size: 20px; }

.order-item {
  background: #fff; border-radius: 10px; padding: 20px;
  margin-bottom: 12px; box-shadow: 0 1px 4px rgba(0,0,0,0.04);
  cursor: pointer; transition: box-shadow 0.2s;
}
.order-item:hover { box-shadow: 0 2px 12px rgba(0,0,0,0.1); }

.order-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px; font-size: 14px; }

.order-meta { display: flex; gap: 24px; font-size: 13px; color: #999; margin-bottom: 12px; }

.order-actions { display: flex; gap: 10px; }

.pagination { margin-top: 20px; display: flex; justify-content: center; }

.detail-item {
  display: flex; align-items: center; gap: 12px;
  padding: 10px 0; border-bottom: 1px solid #f0f0f0;
}
.detail-item-info { flex: 1; }
.detail-item-name { font-size: 14px; font-weight: 500; }
.detail-item-spec { font-size: 12px; color: #999; margin-top: 2px; }
.detail-item-right { text-align: right; font-size: 13px; }
.detail-item-total { color: #e85d3a; font-weight: 500; margin-top: 2px; }
</style>

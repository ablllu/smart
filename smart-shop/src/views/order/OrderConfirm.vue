<template>
  <div class="confirm-page">
    <h2>确认下单</h2>

    <div class="confirm-card" v-loading="loading">
      <div class="amount-row">
        <span>应付金额</span>
        <span class="amount">¥{{ payAmount.toFixed(2) }}</span>
      </div>

      <el-button type="danger" class="pay-btn" size="large" :loading="submitting" @click="handleSubmit">
        确认下单
      </el-button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import * as cartApi from '../../api/cart'
import * as orderApi from '../../api/order'

const router = useRouter()
const payAmount = ref(0)
const loading = ref(false)
const submitting = ref(false)
const cartIds: number[] = JSON.parse(localStorage.getItem('checkout_cart_ids') || '[]')

onMounted(() => {
  if (cartIds.length === 0) {
    ElMessage.warning('请先选择商品')
    router.push('/cart')
    return
  }
  calcAmount()
})

async function calcAmount() {
  loading.value = true
  try {
    const list = await cartApi.getList()
    const selected = list.filter((item: any) => cartIds.includes(item.id))
    payAmount.value = selected.reduce((sum: number, item: any) => sum + item.price * item.quantity, 0)
  } finally {
    loading.value = false
  }
}

async function handleSubmit() {
  submitting.value = true
  try {
    const res = await orderApi.create({ cartIds })
    ElMessage.success(`下单成功，订单号：${res.orderNo}`)
    localStorage.removeItem('checkout_cart_ids')
    router.push('/order/list')
  } finally {
    submitting.value = false
  }
}
</script>

<style scoped>
.confirm-page { max-width: 500px; margin: 0 auto; }
.confirm-page h2 { margin: 0 0 20px; font-size: 20px; }

.confirm-card {
  background: #fff; border-radius: 12px; padding: 32px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.04);
}

.amount-row {
  display: flex; justify-content: space-between; align-items: center;
  padding: 20px 0; border-bottom: 1px solid #eee; margin-bottom: 24px;
  font-size: 16px; color: #333;
}
.amount { font-size: 28px; font-weight: 700; color: #e85d3a; }

.pay-btn { width: 100%; height: 48px; font-size: 18px; }
</style>

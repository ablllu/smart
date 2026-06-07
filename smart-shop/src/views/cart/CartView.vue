<template>
  <div class="cart-page">
    <h2>购物车</h2>

    <el-empty v-if="!loading && list.length === 0" description="购物车是空的">
      <el-button type="primary" @click="$router.push('/')">去逛逛</el-button>
    </el-empty>

    <div v-else class="cart-list" v-loading="loading">
      <div v-for="item in list" :key="item.id" class="cart-item">
        <img :src="item.mainImage" class="item-img" />
        <div class="item-info">
          <p class="item-name">{{ item.spuName }}</p>
          <p class="item-sku">{{ item.skuName }}</p>
          <p class="item-price">¥{{ item.price }}</p>
        </div>
        <div class="item-qty">
          <el-input-number
            v-model="item.quantity" :min="1" :max="99" size="small"
            @change="(val: number) => handleQty(item.id, val)"
          />
        </div>
        <p class="item-total">¥{{ (item.price * item.quantity).toFixed(2) }}</p>
        <el-button type="danger" size="small" circle @click="handleDel(item.id)">
          <el-icon><Delete /></el-icon>
        </el-button>
      </div>

      <div class="cart-footer">
        <el-button type="danger" @click="handleBuy" size="large">立即下单</el-button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Delete } from '@element-plus/icons-vue'
import * as cartApi from '../../api/cart'
import { useRouter } from 'vue-router'

const list = ref<any[]>([])
const loading = ref(false)
const router = useRouter()

onMounted(() => fetchData())

async function fetchData() {
  loading.value = true
  try {
    list.value = await cartApi.getList()
  } finally {
    loading.value = false
  }
}

async function handleQty(id: number, val: number) {
  await cartApi.updateQuantity(id, val)
}

async function handleDel(id: number) {
  await ElMessageBox.confirm('确认删除？', '提示', { type: 'warning' })
  await cartApi.remove(id)
  ElMessage.success('已删除')
  fetchData()
}


async function handleBuy() {
  const ids = list.value.map((item: any) => item.id)
  if (ids.length === 0) {
    ElMessage.warning('购物车是空的')
    return
  }
  // 把选中的购物车 ID 存 localStorage，下单页读取
  localStorage.setItem('checkout_cart_ids', JSON.stringify(ids))
  router.push('/order/confirm')
}

</script>

<style scoped>
.cart-page { max-width: 900px; margin: 0 auto; }
.cart-page h2 { margin: 0 0 20px; font-size: 20px; }

.cart-list { background: #fff; border-radius: 12px; padding: 20px; }

.cart-item {
  display: flex; align-items: center; gap: 16px;
  padding: 16px 0; border-bottom: 1px solid #f0f0f0;
}

.item-img { width: 80px; height: 80px; object-fit: cover; border-radius: 8px; }
.item-info { flex: 1; }
.item-name { margin: 0 0 4px; font-size: 15px; font-weight: 600; }
.item-sku { margin: 0 0 4px; font-size: 12px; color: #999; }
.item-price { margin: 0; font-size: 16px; font-weight: 700; color: #e85d3a; }

.item-qty { flex: 0 0 120px; }
.item-total { flex: 0 0 80px; text-align: right; font-size: 16px; font-weight: 700; color: #e85d3a; }

.cart-footer { margin-top: 20px; display: flex; justify-content: flex-end; }
</style>

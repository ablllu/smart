<template>
  <div class="detail" v-loading="loading">
    <div v-if="product" class="detail-body">
      <!-- 左侧图片 -->
      <div class="detail-images">
        <img :src="currentImage" class="main-image" />
        <div class="thumb-list" v-if="product.images?.length">
          <img
            v-for="(img, i) in product.images"
            :key="i"
            :src="img"
            :class="{ active: currentImage === img }"
            @click="currentImage = img"
          />
        </div>
      </div>

      <!-- 右侧信息 -->
      <div class="detail-info">
        <h1 class="product-title">{{ product.name }}</h1>
        <p class="product-brand">{{ product.brand }}</p>

        <!-- 价格区 -->
        <div class="price-box">
          <span class="price-current">¥{{ currentSku?.price }}</span>
          <span v-if="currentSku?.originalPrice" class="price-original">¥{{ currentSku.originalPrice }}</span>
        </div>

        <!-- SKU 选择 -->
        <div class="sku-section">
          <div
            v-for="sku in product.skus"
            :key="sku.id"
            class="sku-item"
            :class="{ selected: currentSku?.id === sku.id }"
            @click="currentSku = sku"
          >
            {{ sku.skuName }}
          </div>
        </div>

        <!-- 库存提示 -->
        <p class="stock-tip" v-if="currentSku">
          {{ currentSku.stock > 0 ? `库存 ${currentSku.stock} 件` : '暂时缺货' }}
        </p>

        <!-- 购买按钮 -->
        <div class="action-box">
          <el-button type="danger" size="large" @click="buyNow">立即购买</el-button>
          <el-button size="large" @click="addToCart">加入购物车</el-button>
        </div>

        <!-- 商品描述 -->
        <div class="desc-box" v-if="product.description">
          <h3>商品详情</h3>
          <div v-html="product.description" />
        </div>
      </div>
    </div>

    <el-empty v-else-if="!loading" description="商品不存在" />
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { ElMessage } from 'element-plus'
import * as productApi from '../../api/product'
import * as cartApi from '../../api/cart'
import * as orderApi from '../../api/order'
const router = useRouter()
const route = useRoute()
const product = ref<any>(null)
const currentSku = ref<any>(null)
const currentImage = ref('')
const loading = ref(false)

onMounted(async () => {
  loading.value = true
  try {
    const id = Number(route.params.id)
    product.value = await productApi.getDetail(id)
    if (product.value.skus?.length) {
      currentSku.value = product.value.skus[0]
    }
    currentImage.value = product.value.mainImage || (product.value.images?.[0] ?? '')
  } finally {
    loading.value = false
  }
})

async function buyNow() {
  if (!currentSku.value) {
    ElMessage.warning('请选择规格')
    return
  }
  try {
    await orderApi.create({
      spuId: product.value.id,
      skuId: currentSku.value.id,
      quantity: 1
    })
    ElMessage.success('下单成功，请付款')
    router.push(`/order/list`)
  } catch {
    ElMessage.error('下单失败')
  }
}

async function addToCart() {
  if (!currentSku.value) {
    ElMessage.warning('请选择规格')
    return
  }
  await cartApi.add({
    spuId: product.value.id,
    skuId: currentSku.value.id,
    quantity: 1
  })
  ElMessage.success('已加入购物车')
}

</script>

<style scoped>
.detail { max-width: 1200px; margin: 0 auto; }
.detail-body { display: flex; gap: 40px; background: #fff; border-radius: 12px; padding: 32px; }

.detail-images { flex: 0 0 420px; }
.main-image { width: 100%; aspect-ratio: 1; object-fit: cover; border-radius: 8px; background: #f9f9f9; }
.thumb-list { display: flex; gap: 10px; margin-top: 12px; }
.thumb-list img {
  width: 64px; height: 64px; object-fit: cover; border-radius: 6px;
  border: 2px solid transparent; cursor: pointer;
}
.thumb-list img.active { border-color: #e85d3a; }

.detail-info { flex: 1; }
.product-title { font-size: 24px; font-weight: 700; color: #222; margin: 0 0 8px; }
.product-brand { font-size: 14px; color: #999; margin: 0 0 20px; }

.price-box { background: #fff7f5; border-radius: 8px; padding: 16px; margin-bottom: 20px; }
.price-current { font-size: 28px; font-weight: 700; color: #e85d3a; }
.price-original { font-size: 16px; color: #bbb; text-decoration: line-through; margin-left: 12px; }

.sku-section { display: flex; flex-wrap: wrap; gap: 10px; margin-bottom: 16px; }
.sku-item {
  padding: 8px 18px; border: 1px solid #ddd; border-radius: 6px;
  cursor: pointer; font-size: 14px; color: #555;
}
.sku-item:hover { border-color: #e85d3a; }
.sku-item.selected { border-color: #e85d3a; color: #e85d3a; background: #fff7f5; }

.stock-tip { color: #999; font-size: 13px; margin-bottom: 20px; }

.action-box { display: flex; gap: 16px; margin-bottom: 30px; }
.action-box .el-button--large { height: 48px; padding: 0 36px; font-size: 16px; }

.desc-box { border-top: 1px solid #eee; padding-top: 24px; }
.desc-box h3 { font-size: 16px; margin: 0 0 12px; color: #333; }
</style>

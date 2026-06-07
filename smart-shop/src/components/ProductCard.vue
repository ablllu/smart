<template>
  <div class="product-card" @click="goDetail">
    <div class="card-image">
      <img :src="product.mainImage || '/placeholder.png'" :alt="product.name" />
    </div>
    <div class="card-info">
      <h3 class="card-name">{{ product.name }}</h3>
      <p class="card-brand">{{ product.brand }}</p>
      <div class="card-bottom">
        <span class="card-price">¥{{ product.minPrice }}</span>
        <span class="card-sale">已售 {{ product.saleCount }}</span>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'

const props = defineProps<{ product: any }>()
const router = useRouter()

function goDetail() {
  router.push(`/product/${props.product.id}`)
}
</script>

<style scoped>
.product-card {
  background: #fff;
  border-radius: 8px;
  overflow: hidden;
  cursor: pointer;
  transition: transform 0.2s, box-shadow 0.2s;
}
.product-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 6px 16px rgba(0,0,0,0.08);
}

.card-image {
  width: 100%;
  aspect-ratio: 4/3;
  overflow: hidden;
  background: #f5f5f5;
}
.card-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.card-info { padding: 10px; }

.card-name {
  margin: 0 0 2px;
  font-size: 13px;
  font-weight: 600;
  color: #222;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.card-brand { margin: 0 0 8px; font-size: 11px; color: #aaa; }

.card-bottom {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.card-price { font-size: 16px; font-weight: 700; color: #e85d3a; }

.card-sale { font-size: 11px; color: #bbb; }
</style>


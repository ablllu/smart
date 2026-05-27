<template>
  <div>
    <h2 style="margin-bottom:16px">控制台</h2>
    <div class="card-grid">
      <el-card v-for="card in cards" :key="card.label" shadow="hover">
        <div class="card-body">
          <div>
            <div class="card-label">{{ card.label }}</div>
            <div class="card-value">{{ card.value ?? '...' }}</div>
          </div>
          <el-icon :size="48" :color="card.color">
            <component :is="card.icon" />
          </el-icon>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import * as statisticsApi from '../../api/statistics'

const cards = ref([
  { label: '会员总数',  value: 0, icon: 'User',        color: '#409EFF' },
  { label: '订单总数',  value: 0, icon: 'Document',    color: '#67C23A' },
  { label: '今日订单',  value: 0, icon: 'TrendCharts', color: '#E6A23C' },
  { label: '待发货',    value: 0, icon: 'Van',         color: '#F56C6C' },
  { label: '待支付',    value: 0, icon: 'Wallet',      color: '#8E44AD' }
])

onMounted(async () => {
  const data = await statisticsApi.getOverview()
  cards.value[0].value = data.memberCount
  cards.value[1].value = data.orderCount
  cards.value[2].value = data.todayOrderCount
  cards.value[3].value = data.pendingShipCount
  cards.value[4].value = data.pendingPayCount
})
</script>

<style scoped>
.card-grid {
  display: flex;
  gap: 16px;
}
.card-grid > * {
  flex: 1;
}
.card-body {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.card-label {
  color: #909399;
  font-size: 14px;
}
.card-value {
  font-size: 28px;
  font-weight: bold;
  margin-top: 8px;
}
</style>
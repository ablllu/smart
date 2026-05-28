<template>
  <div class="dashboard">
    <h2 class="page-title">控制台</h2>
    <div class="card-grid">
      <div
        v-for="card in cards"
        :key="card.label"
        class="stat-card"
        :style="{ '--accent': card.color }"
      >
        <div class="stat-icon">
          <el-icon :size="28">
            <component :is="card.icon" />
          </el-icon>
        </div>
        <div class="stat-info">
          <div class="stat-label">{{ card.label }}</div>
          <div class="stat-value">{{ card.value ?? '...' }}</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import * as statisticsApi from '../../api/statistics'

const cards = ref([
  { label: '会员总数', value: 0, icon: 'User',       color: '#409eff' },
  { label: '订单总数', value: 0, icon: 'Document',   color: '#67c23a' },
  { label: '今日订单', value: 0, icon: 'TrendCharts', color: '#e6a23c' },
  { label: '待发货',   value: 0, icon: 'Van',        color: '#f56c6c' },
  { label: '待支付',   value: 0, icon: 'Wallet',     color: '#909399' },
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
.dashboard { max-width: 1200px; }

.page-title {
  font-size: 20px;
  font-weight: 600;
  color: #333;
  margin: 0 0 24px;
}

.card-grid {
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  gap: 20px;
}

.stat-card {
  background: #fff;
  border-radius: 10px;
  padding: 24px 20px;
  display: flex;
  align-items: center;
  gap: 16px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.04);
  transition: transform 0.2s, box-shadow 0.2s;
  cursor: default;
}
.stat-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(0,0,0,0.08);
}

.stat-icon {
  width: 52px; height: 52px;
  border-radius: 12px;
  background: var(--accent);
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}

.stat-label {
  font-size: 13px;
  color: #999;
  margin-bottom: 6px;
}
.stat-value {
  font-size: 26px;
  font-weight: 700;
  color: #2c2c2c;
  line-height: 1;
}

@media (max-width: 992px) {
  .card-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

@media (max-width: 576px) {
  .card-grid {
    grid-template-columns: 1fr;
    gap: 12px;
  }

  .stat-card {
    padding: 16px 14px;
  }

  .stat-icon {
    width: 42px; height: 42px;
    border-radius: 10px;
  }

  .stat-value {
    font-size: 22px;
  }

  .page-title {
    font-size: 18px;
    margin-bottom: 16px;
  }
}
</style>

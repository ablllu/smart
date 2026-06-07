<template>
  <div class="home">
    <!-- 搜索栏 -->
    <div class="search-bar">
      <el-input
        v-model="keyword"
        placeholder="搜索商品"
        size="large"
        clearable
        @keyup.enter="handleSearch"
      >
        <template #prefix>
          <el-icon><Search /></el-icon>
        </template>
      </el-input>
      <el-button type="primary" size="large" @click="handleSearch">搜索</el-button>
    </div>

    <!-- 商品网格 -->
    <div class="product-grid" v-loading="loading">
      <ProductCard
        v-for="item in list"
        :key="item.id"
        :product="item"
      />
    </div>

    <!-- 空状态 -->
    <el-empty v-if="!loading && list.length === 0" description="暂无商品" />

    <!-- 分页 -->
    <div class="pagination">
      <el-pagination
        background
        layout="prev, pager, next"
        :total="total"
        :page-size="pageSize"
        v-model:current-page="pageNum"
        @current-change="fetchData"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { Search } from '@element-plus/icons-vue'
import ProductCard from '../../components/ProductCard.vue'
import * as productApi from '../../api/product'


const keyword = ref('')
const list = ref<any[]>([])
const total = ref(0)
const loading = ref(false)
const pageNum = ref(1)
const pageSize = ref(8)

onMounted(() => {
  fetchData()
})

async function fetchData() {
    loading.value = true
    try {
        const res = await productApi.getPage({
            pageNum: pageNum.value,
            pageSize: pageSize.value,
            keyword: keyword.value || undefined
        })
        list.value = res.records
        total.value = Number(res.total)
    } finally {
        loading.value = false
    }
}

function handleSearch() {
  pageNum.value = 1
  fetchData()
}


</script>

<style scoped>
.home {
  max-width: 1200px;
  margin: 0 auto;
}

.search-bar {
  display: flex;
  gap: 12px;
  margin-bottom: 24px;
}
.search-bar .el-input {
  flex: 1;
}

.product-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 16px;
}

.pagination {
  margin-top: 32px;
  display: flex;
  justify-content: center;
}

@media (max-width: 768px) {
  .product-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 10px;
  }
}
</style>

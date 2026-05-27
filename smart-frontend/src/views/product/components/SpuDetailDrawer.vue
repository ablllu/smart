<template>
  <el-drawer v-model="visible" title="商品详情" size="600px" @close="onClose">
    <template v-if="detail">
      <h4>基本信息</h4>
      <el-descriptions :column="2" border>
        <el-descriptions-item label="ID">{{ detail.id }}</el-descriptions-item>
        <el-descriptions-item label="商品名称">{{ detail.name }}</el-descriptions-item>
        <el-descriptions-item label="分类">{{ detail.categoryName }}</el-descriptions-item>
        <el-descriptions-item label="品牌">{{ detail.brand || '-' }}</el-descriptions-item>
        <el-descriptions-item label="销量">{{ detail.saleCount }}</el-descriptions-item>
        <el-descriptions-item label="状态">
          <el-tag :type="detail.status === 1 ? 'success' : 'info'">
            {{ detail.status === 1 ? '上架' : '下架' }}
          </el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="主图" :span="2">
          <el-image
            v-if="detail.mainImage"
            :src="detail.mainImage"
            style="width:80px;height:80px"
            fit="cover"
          />
          <span v-else>-</span>
        </el-descriptions-item>
        <el-descriptions-item label="描述" :span="2">
          {{ detail.description || '-' }}
        </el-descriptions-item>
      </el-descriptions>

      <template v-if="detail.images?.length">
        <h4 style="margin-top:20px">轮播图</h4>
        <div style="display:flex;gap:8px;flex-wrap:wrap">
          <el-image
            v-for="(img, idx) in detail.images"
            :key="idx"
            :src="img"
            :preview-src-list="detail.images"
            :initial-index="idx"
            style="width:80px;height:80px"
            fit="cover"
          />
        </div>
      </template>

      <h4 style="margin-top:20px">SKU 列表</h4>
      <el-table :data="detail.skus || []" border size="small">
        <el-table-column prop="skuName" label="SKU 名称" min-width="120" />
        <el-table-column prop="specInfo" label="规格" width="120" />
        <el-table-column prop="price" label="售价" width="100" />
        <el-table-column prop="originalPrice" label="原价" width="100" />
        <el-table-column prop="stock" label="库存" width="80" />
        <el-table-column label="SKU图" width="80">
          <template #default="{ row }">
            <el-image
              v-if="row.image"
              :src="row.image"
              style="width:40px;height:40px"
              fit="cover"
            />
          </template>
        </el-table-column>
        <el-table-column label="状态" width="80">
          <template #default="{ row }">
            <el-tag :type="row.status === 1 ? 'success' : 'info'" size="small">
              {{ row.status === 1 ? '正常' : '停用' }}
            </el-tag>
          </template>
        </el-table-column>
      </el-table>
    </template>
  </el-drawer>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import * as spuApi from '../../../api/spu'

const visible = ref(false)
const detail = ref<any>(null)

async function open(id: number) {
  detail.value = await spuApi.getById(id)
  visible.value = true
}

function onClose() {
  detail.value = null
}

defineExpose({ open })
</script>

<template>
  <div>
    <el-page-header @back="$router.back()" :title="isEdit ? '编辑商品' : '新增商品'" />

    <el-card style="margin-top:16px">
      <el-tabs v-model="activeTab">
        <!-- 基本信息 -->
        <el-tab-pane label="基本信息" name="basic">
          <el-form ref="formRef" :model="form" :rules="rules" label-width="80px" style="max-width:700px">
            <el-form-item label="商品名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入商品名称" />
            </el-form-item>
            <el-form-item label="分类" prop="categoryId">
              <el-tree-select
                v-model="form.categoryId"
                :data="categoryTree"
                :props="{ value: 'id', label: 'name', children: 'children' }"
                placeholder="请选择分类"
                check-strictly
                style="width:100%"
              />
            </el-form-item>
            <el-form-item label="品牌">
              <el-input v-model="form.brand" placeholder="请输入品牌" />
            </el-form-item>
            <el-form-item label="主图">
              <ImageUpload v-model="form.mainImage" />
            </el-form-item>
            <el-form-item label="轮播图">
              <div v-for="(img, idx) in form.images" :key="idx" style="display:inline-block;margin-right:8px;margin-bottom:8px;position:relative">
                <el-image :src="img" style="width:80px;height:80px" fit="cover" />
                <el-icon
                  style="position:absolute;top:-8px;right:-8px;cursor:pointer;background:#f56c6c;color:#fff;border-radius:50%"
                  :size="16"
                  @click="removeImage(idx)"
                >
                  <Close />
                </el-icon>
              </div>
              <el-upload
                :show-file-list="false"
                :http-request="handleBannerUpload"
                style="display:inline-block"
              >
                <el-button size="small">上传轮播图</el-button>
              </el-upload>
            </el-form-item>
          </el-form>
        </el-tab-pane>

        <!-- SKU 列表 -->
        <el-tab-pane label="SKU 列表" name="sku">
          <template v-if="isEdit">
            <el-table :data="editSkus" border size="small">
              <el-table-column prop="skuName" label="SKU 名称" />
              <el-table-column prop="specInfo" label="规格" />
              <el-table-column prop="price" label="售价" width="100" />
              <el-table-column prop="originalPrice" label="原价" width="100" />
              <el-table-column prop="stock" label="库存" width="80" />
            </el-table>
            <div style="color:#909399;font-size:12px;margin-top:8px">编辑模式下 SKU 列表只读</div>
          </template>
          <SkuEditor v-else v-model="form.skus" />
        </el-tab-pane>

        <!-- 商品描述 -->
        <el-tab-pane label="商品描述" name="desc">
          <RichEditor v-model="form.description" />
        </el-tab-pane>
      </el-tabs>

      <div style="margin-top:24px;text-align:center">
        <el-button type="primary" @click="handleSubmit" :loading="submitting">保存</el-button>
        <el-button @click="$router.back()">取消</el-button>
      </div>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import * as spuApi from '../../api/spu'
import * as categoryApi from '../../api/category'
import * as uploadApi from '../../api/upload'
import ImageUpload from '../../components/ImageUpload.vue'
import RichEditor from '../../components/RichEditor.vue'
import SkuEditor from '../../components/SkuEditor.vue'

const route = useRoute()
const router = useRouter()

const isEdit = computed(() => !!route.params.id)
const activeTab = ref('basic')
const categoryTree = ref<any[]>([])
const formRef = ref()
const submitting = ref(false)
const editSkus = ref<any[]>([])

const form = ref({
  name: '',
  categoryId: null as number | null,
  brand: '',
  description: '',
  mainImage: '',
  images: [] as string[],
  skus: [] as any[]
})

const rules = {
  name: [{ required: true, message: '请输入商品名称', trigger: 'blur' }],
  categoryId: [{ required: true, message: '请选择分类', trigger: 'change' }]
}

onMounted(async () => {
  categoryTree.value = await categoryApi.getTree()
  if (isEdit.value) {
    const detail = await spuApi.getById(Number(route.params.id))
    form.value.name = detail.name
    form.value.categoryId = detail.categoryId
    form.value.brand = detail.brand || ''
    form.value.description = detail.description || ''
    form.value.mainImage = detail.mainImage || ''
    form.value.images = detail.images || []
    editSkus.value = detail.skus || []
  }
})

async function handleBannerUpload(options: any) {
  const result = await uploadApi.uploadImage(options.file)
  form.value.images.push(result.url)
}

function removeImage(idx: number) {
  form.value.images.splice(idx, 1)
}

async function handleSubmit() {
  await formRef.value.validate()
  submitting.value = true
  try {
    const data: any = {
      name: form.value.name,
      categoryId: form.value.categoryId,
      brand: form.value.brand,
      description: form.value.description,
      mainImage: form.value.mainImage,
      images: form.value.images
    }
    if (!isEdit.value) {
      data.skus = form.value.skus
      await spuApi.create(data)
      ElMessage.success('新增成功')
    } else {
      await spuApi.update(Number(route.params.id), data)
      ElMessage.success('修改成功')
    }
    router.push('/product/list')
  } finally {
    submitting.value = false
  }
}
</script>

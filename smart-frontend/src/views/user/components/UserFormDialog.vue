<template>
  <el-dialog
    v-model="visible"
    :title="title"
    width="500px"
    @close="handleClose"
  >
    <el-form
      ref="formRef"
      :model="form"
      :rules="rules"
      label-width="80px"
    >
      <el-form-item label="用户名" prop="username">
        <el-input v-model="form.username" />
      </el-form-item>

      <el-form-item label="密码" prop="password">
        <el-input v-model="form.password" show-password />
      </el-form-item>

      <el-form-item label="昵称" prop="nickname">
        <el-input v-model="form.nickname" />
      </el-form-item>

      <el-form-item label="头像">
        <el-upload
          class="avatar-uploader"
          :show-file-list="false"
          :before-upload="beforeUpload"
        >
          <img
            v-if="form.avatar"
            :src="form.avatar"
            class="avatar"
          />
          <el-icon v-else class="avatar-uploader-icon">
            <Plus />
          </el-icon>
        </el-upload>
      </el-form-item>
    </el-form>

    <template #footer>
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="submitForm">确定</el-button>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { ElMessage } from 'element-plus'
import * as userApi from '../../../api/user'
import * as uploadApi from '../../../api/upload'

const emit = defineEmits(['success'])

const visible = ref(false)
const title = ref('')
const formRef = ref()

const form = reactive({
  id: undefined,
  username: '',
  password: '',
  nickname: '',
  avatar: ''
})

const rules = {
  username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
  password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
  nickname: [{ required: true, message: '请输入昵称', trigger: 'blur' }]
}

function openAdd() {
  title.value = '新增用户'
  visible.value = true
  form.id = undefined
  form.username = ''
  form.password = ''
  form.nickname = ''
  form.avatar = ''
}

function openEdit(row: any) {
  title.value = '编辑用户'
  visible.value = true
  form.id = row.id
  form.username = row.username
  form.password = row.password
  form.nickname = row.nickname
  form.avatar = row.avatar
}

async function submitForm() {
  await formRef.value.validate()
  if (form.id) {
    await userApi.updateUser(form)
    ElMessage.success('修改成功')
  } else {
    await userApi.addUser(form)
    ElMessage.success('新增成功')
  }
  visible.value = false
  emit('success')
}

async function beforeUpload(file: File) {
  const isImage = file.type.startsWith('image/')
  if (!isImage) {
    ElMessage.error('只能上传图片文件')
    return false
  }

  const isLt2M = file.size / 1024 / 1024 < 2
  if (!isLt2M) {
    ElMessage.error('图片大小不能超过2MB')
    return false
  }

  try {
    const result = await uploadApi.uploadFile(file)
    form.avatar = typeof result === 'string' ? result : result.url
    ElMessage.success('上传成功')
  } catch {
    ElMessage.error('上传失败，请稍后重试')
  }

  return false
}

function handleClose() {
  formRef.value?.resetFields()
}

defineExpose({ openAdd, openEdit })
</script>

<style scoped>
.avatar-uploader {
  border: 1px dashed #dcdfe6;
  border-radius: 6px;
  cursor: pointer;
  width: 100px;
  height: 100px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.avatar {
  width: 100px;
  height: 100px;
  display: block;
  object-fit: cover;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
}
</style>

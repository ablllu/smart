<template>
  <div class="login-page">
    <div class="login-card">
      <h2>{{ isRegister ? '注册' : '登录' }}</h2>

      <el-form ref="formRef" :model="form" :rules="rules" label-width="0">
        <el-form-item prop="username">
          <el-input v-model="form.username" placeholder="用户名" size="large" />
        </el-form-item>

        <el-form-item prop="password">
          <el-input v-model="form.password" type="password" placeholder="密码" size="large"
            show-password @keyup.enter="submit" />
        </el-form-item>

        <el-form-item v-if="isRegister" prop="nickname">
          <el-input v-model="form.nickname" placeholder="昵称（选填）" size="large" />
        </el-form-item>

        <el-button type="primary" class="submit-btn" size="large" :loading="loading" @click="submit">
          {{ isRegister ? '注 册' : '登 录' }}
        </el-button>
      </el-form>

      <p class="toggle-tip">
        {{ isRegister ? '已有账号？' : '没有账号？' }}
        <a href="javascript:;" @click="isRegister = !isRegister">
          {{ isRegister ? '去登录' : '去注册' }}
        </a>
      </p>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import * as memberApi from '../../api/member'
import { useMemberStore } from '../../stores/member'

const router = useRouter()
const memberStore = useMemberStore()
const isRegister = ref(false)
const loading = ref(false)

const form = reactive({
  username: '',
  password: '',
  nickname: ''
})

const rules = {
  username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
  password: [{ required: true, message: '请输入密码', trigger: 'blur' }]
}

async function submit() {
  loading.value = true
  try {
    if (isRegister.value) {
      await memberApi.register(form)
      ElMessage.success('注册成功，请登录')
      isRegister.value = false
    } else {
      const res = await memberApi.login(form)
      memberStore.setLogin({
        memberId: res.memberId,
        username: res.username,
        nickname: res.nickname,
        token: res.token
      })
      ElMessage.success(`欢迎，${res.nickname || res.username}！`)
      router.push('/')
    }
  } finally {
    loading.value = false
  }
}
</script>

<style scoped>
.login-page {
  display: flex;
  justify-content: center;
  padding-top: 80px;
}

.login-card {
  width: 380px;
  background: #fff;
  border-radius: 12px;
  padding: 40px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.06);
}

.login-card h2 {
  text-align: center;
  margin: 0 0 30px;
  font-size: 22px;
  color: #333;
}

.submit-btn {
  width: 100%;
  height: 44px;
  font-size: 16px;
  letter-spacing: 4px;
}

.toggle-tip {
  text-align: center;
  margin: 16px 0 0;
  font-size: 13px;
  color: #999;
}
.toggle-tip a {
  color: #e85d3a;
  text-decoration: none;
}
</style>

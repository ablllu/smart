<template>
  <div class="login-container">
    <div class="login-card">
      <!-- 左侧品牌区 -->
      <div class="banner">
        <div class="banner-content">
          <h1>Smart 管理后台</h1>
          <p>高效 · 智能 · 一站式电商管理</p>
        </div>
      </div>

      <!-- 右侧登录区 -->
      <div class="form-panel">
        <h2>账号登录</h2>
        <el-input
          v-model="form.username"
          placeholder="用户名"
          :prefix-icon="User"
          size="large"
          autocomplete="off"
        />
        <el-input
          v-model="form.password"
          type="password"
          placeholder="密码"
          :prefix-icon="Lock"
          show-password
          size="large"
          autocomplete="new-password"
          @keyup.enter="handleLogin"
        />
        <el-button
          type="primary"
          class="login-btn"
          size="large"
          :loading="loading"
          @click="handleLogin"
        >
          {{ loading ? '登录中...' : '登 录' }}
        </el-button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { User, Lock } from '@element-plus/icons-vue'
import * as authApi from '../../api/auth'
import { loadDynamicRoutes } from '../../router'

const router = useRouter()
const form = reactive({ username: '', password: '' })
const loading = ref(false)

async function handleLogin() {
  if (!form.username || !form.password) {
    ElMessage.warning('请输入用户名和密码')
    return
  }
  loading.value = true
  try {
    const result = await authApi.login(form)
    localStorage.setItem('token', result.token)
    // 先加载动态路由再导航，避免 beforeEach 中异步加载+重定向导致白屏
    await loadDynamicRoutes()
    ElMessage.success(`欢迎，${result.nickname || result.username}！`)
    await router.push('/dashboard')
  } catch {
    // 错误已由拦截器处理
  } finally {
    loading.value = false
  }
}
</script>

<style scoped>
.login-container {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(-45deg, #fef9f3, #fdf3e8, #fef6ee, #fbf0e4);
  background-size: 400% 400%;
  animation: flowBg 12s ease infinite;
  overflow: hidden;
  padding: 16px;
}

@keyframes flowBg {
  0%   { background-position: 0% 50%; }
  50%  { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

.login-card {
  display: flex;
  width: 820px;
  max-width: 100%;
  min-height: 480px;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
}

/* 左侧品牌区 */
.banner {
  flex: 0 0 380px;
  background: linear-gradient(160deg, #eba278 0%, #e0885e 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
}

.banner::before {
  content: '';
  position: absolute;
  width: 300px;
  height: 300px;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.04);
  top: -60px;
  right: -80px;
}

.banner::after {
  content: '';
  position: absolute;
  width: 200px;
  height: 200px;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.03);
  bottom: -40px;
  left: -40px;
}

.banner-content {
  text-align: center;
  color: #fff;
  z-index: 1;
}

.banner-content h1 {
  font-family: 'Ma Shan Zheng', 'STKaiti', 'KaiTi', serif;
  font-size: 36px;
  font-weight: 400;
  margin: 0 0 12px;
  letter-spacing: 4px;
  color: #fff;
  text-shadow: 0 2px 8px rgba(0,0,0,0.2);
}

.banner-content p {
  font-size: 14px;
  opacity: 0.85;
  margin: 0;
  letter-spacing: 2px;
}

/* 右侧登录区 */
.form-panel {
  flex: 1;
  background: #fff;
  padding: 60px 50px;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
}

.form-panel h2 {
  font-size: 22px;
  font-weight: 600;
  color: #222;
  margin: 0;
  text-align: center;
  letter-spacing: 4px;
}

.login-btn {
  width: 100%;
  height: 44px;
  font-size: 16px;
  letter-spacing: 4px;
  background: #e85d3a;
  border: none;
  border-radius: 22px;
}
.login-btn:hover {
  background: #f07152;
}

/* 输入框：白色背景 + 去掉聚焦蓝光 */
.form-panel :deep(.el-input__wrapper) {
  background: #fff;
  box-shadow: none !important;
  border: 1px solid #e8e8e8;
  border-radius: 4px;
}
.form-panel :deep(.el-input__wrapper:hover) {
  border-color: #c0c0c0;
}
.form-panel :deep(.el-input.is-focus .el-input__wrapper) {
  border-color: #e85d3a;
  box-shadow: none !important;
}
.form-panel :deep(.el-input .el-input__wrapper) {
  box-shadow: none !important;
}

/* ===== 移动端适配 ===== */
@media (max-width: 768px) {
  .login-card {
    flex-direction: column;
    width: 100%;
    min-height: auto;
  }

  .banner {
    flex: 0 0 auto;
    padding: 36px 20px;
  }

  .banner-content h1 {
    font-size: 26px;
    letter-spacing: 2px;
  }

  .banner-content p {
    font-size: 12px;
    letter-spacing: 1px;
  }

  .form-panel {
    padding: 32px 24px;
    gap: 16px;
  }

  .form-panel h2 {
    font-size: 18px;
    letter-spacing: 2px;
  }
}
</style>

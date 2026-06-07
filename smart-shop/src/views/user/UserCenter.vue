<template>
  <div class="user-center">
    <h2>个人中心</h2>
    <div class="user-card" v-if="memberStore.isLogin">
      <p>用户名：{{ memberStore.username }}</p>
      <p>昵称：{{ memberStore.nickname || '-' }}</p>
      <el-button type="danger" @click="handleLogout">退出登录</el-button>
    </div>
    <el-empty v-else description="请先登录" />
  </div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
import { useMemberStore } from '../../stores/member'

const router = useRouter()
const memberStore = useMemberStore()

function handleLogout() {
  memberStore.logout()
  router.push('/')
}
</script>

<style scoped>
.user-center { max-width: 600px; margin: 0 auto; }
.user-card {
  background: #fff; border-radius: 12px; padding: 32px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.04);
}
.user-card p { margin: 0 0 12px; font-size: 15px; color: #555; }
</style>

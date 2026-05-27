<template>
  <el-container class="layout-container">
    <!-- 侧栏 -->
    <el-aside width="220px" class="aside">
      <div class="logo">
        <span class="logo-dot"></span>
        Smart Admin
      </div>

      <el-menu
        :default-active="route.path"
        background-color="transparent"
        text-color="rgba(255,255,255,0.65)"
        active-text-color="#fff"
        router
        class="side-menu"
      >
        <el-menu-item index="/dashboard">
          <el-icon><Odometer /></el-icon>
          <span>控制台</span>
        </el-menu-item>

        <template v-for="item in menuStore.menuTree[0]?.children || menuStore.menuTree" :key="item.id">
          <el-sub-menu v-if="item.type === 1 && item.children?.length" :index="item.path">
            <template #title>
              <span>{{ item.name }}</span>
            </template>
            <el-menu-item
              v-for="child in item.children.filter((c: any) => c.type === 2)"
              :key="child.id"
              :index="child.path"
            >
              {{ child.name }}
            </el-menu-item>
          </el-sub-menu>
          <el-menu-item
            v-else-if="item.type === 1 && item.component"
            :index="item.path"
          >
            <span>{{ item.name }}</span>
          </el-menu-item>
        </template>
      </el-menu>
    </el-aside>

    <!-- 右侧主体 -->
    <el-container class="main-container">
      <!-- 顶栏 -->
      <el-header class="header">
        <div class="header-left">
          <span class="greeting">欢迎回来</span>
        </div>
        <div class="header-right">
          <span class="nickname">管理员</span>
          <el-button class="logout-btn" text @click="logout">退出登录</el-button>
        </div>
      </el-header>

      <!-- 内容 -->
      <el-main class="main-content">
        <router-view v-slot="{ Component }">
          <transition name="fade" mode="out-in">
            <component :is="Component" />
          </transition>
        </router-view>
      </el-main>
    </el-container>
  </el-container>
</template>

<script setup lang="ts">
import { useRouter, useRoute } from 'vue-router'
import { useMenuStore } from '../stores/menu'
import * as authApi from '../api/auth'

const router = useRouter()
const route = useRoute()
const menuStore = useMenuStore()

async function logout() {
  try { await authApi.logout() } finally {
    localStorage.removeItem('token')
    router.push('/login')
  }
}
</script>

<style scoped>
.layout-container { height: 100vh; }

.aside {
  background: linear-gradient(180deg, #4a3f3a 0%, #5a4e46 100%);
  overflow-y: auto;
}

.logo {
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  font-size: 18px;
  font-weight: 700;
  color: #fff;
  letter-spacing: 2px;
  border-bottom: 1px solid rgba(255,255,255,0.08);
}
.logo-dot {
  width: 8px; height: 8px;
  border-radius: 50%;
  background: #e85d3a;
}

.side-menu {
  border-right: none;
  padding-top: 8px;
}
.side-menu :deep(.el-menu-item) {
  margin: 2px 8px;
  border-radius: 6px;
  font-size: 14px;
  font-weight: 400;
}
/* 一级菜单项（非子菜单中的）加粗 */
.side-menu > :deep(.el-menu-item) {
  font-size: 15px;
  font-weight: 600;
}
.side-menu :deep(.el-menu-item:hover) {
  background: rgba(255,255,255,0.08);
}
.side-menu :deep(.el-menu-item.is-active) {
  background: #409eff;
  color: #fff;
}
.side-menu :deep(.el-sub-menu .el-sub-menu__title) {
  margin: 2px 8px;
  border-radius: 6px;
  font-size: 15px;
  font-weight: 600;
}
.side-menu :deep(.el-sub-menu .el-sub-menu__title:hover) {
  background: rgba(255,255,255,0.08);
}
.side-menu :deep(.el-sub-menu .el-menu-item) {
  padding-left: 56px !important;
}

.main-container { background: #faf7f4; }

.header {
  background: #fff;
  border-bottom: 1px solid #f0ebe4;
  display: flex;
  justify-content: space-between;
  align-items: center;
  box-shadow: 0 1px 4px rgba(0,0,0,0.04);
}
.header-left { display: flex; align-items: center; }
.greeting { color: #999; font-size: 14px; }
.header-right { display: flex; align-items: center; gap: 16px; }
.nickname { color: #555; font-size: 14px; }
.logout-btn { color: #999; }
.logout-btn:hover { color: #f56c6c; }

.main-content {
  padding: 24px;
  min-height: 0;
}
</style>

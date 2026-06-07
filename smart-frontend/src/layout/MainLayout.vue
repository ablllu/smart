<template>
  <el-container class="layout-container">
    <!-- 手机遮罩层 -->
    <div v-if="sidebarVisible" class="sidebar-overlay" @click="sidebarVisible = false" />

    <!-- 侧栏 -->
    <el-aside width="220px" class="aside" :class="{ 'aside-mobile': sidebarVisible }">
      <!-- Logo -->
      <div class="logo">
        <div class="logo-icon">S</div>
        <div class="logo-text">
          <span class="logo-title">Smart</span>
          <span class="logo-sub">管理后台</span>
        </div>
      </div>

      <!-- 菜单 -->
      <el-menu
        :default-active="route.path"
        :default-openeds="defaultOpeneds"
        router
        class="side-menu"
        @select="sidebarVisible = false"
      >
        <el-menu-item index="/dashboard">
          <el-icon><Odometer /></el-icon>
          <span>控制台</span>
        </el-menu-item>

        <div class="menu-divider"></div>

        <!-- 遍历所有根节点 -->
        <template v-for="root in menuStore.menuTree" :key="root.id">
          <el-sub-menu v-if="root.children?.length" :index="root.path || String(root.id)">
            <template #title>
              <el-icon><component :is="menuIcons[root.name] || MenuIcon" /></el-icon>
              <span>{{ root.name }}</span>
            </template>
            <template v-for="child in root.children" :key="child.id">
              <el-sub-menu v-if="child.children?.length" :index="child.path">
                <template #title><span>{{ child.name }}</span></template>
                <el-menu-item
                  v-for="sub in child.children.filter((c: any) => c.type === 2)"
                  :key="sub.id"
                  :index="sub.path"
                >
                  <el-icon><component :is="subMenuIcons[sub.name] || DocumentIcon" /></el-icon>
                  <span>{{ sub.name }}</span>
                </el-menu-item>
              </el-sub-menu>
              <el-menu-item v-else-if="child.component" :index="child.path">
                <el-icon><component :is="subMenuIcons[child.name] || DocumentIcon" /></el-icon>
                <span>{{ child.name }}</span>
              </el-menu-item>
            </template>
          </el-sub-menu>
          <el-menu-item v-else-if="root.component" :index="root.path">
            <el-icon><MenuIcon /></el-icon>
            <span>{{ root.name }}</span>
          </el-menu-item>
        </template>

        <div class="menu-divider"></div>
      </el-menu>

      <!-- 底部用户 -->
      <div class="aside-footer">
        <div class="aside-user">
          <span class="aside-avatar">{{ (userStore.userInfo.nickname || userStore.userInfo.username || '管')[0] }}</span>
          <span class="aside-name">{{ userStore.userInfo.nickname || userStore.userInfo.username || '管理员' }}</span>
        </div>
      </div>
    </el-aside>

    <!-- 右侧主体 -->
    <el-container class="main-container">
      <!-- 顶栏 -->
      <el-header class="header">
        <div class="header-left">
          <el-button class="menu-toggle" text @click="sidebarVisible = !sidebarVisible">
            <el-icon :size="20"><Expand v-if="sidebarVisible" /><Fold v-else /></el-icon>
          </el-button>
          <span class="greeting">欢迎回来</span>
        </div>
        <div class="header-right">
          <div class="user-info">
            <span class="user-name">{{ userStore.userInfo.nickname || userStore.userInfo.username || '管理员' }}</span>
            <el-tag :type="roleTagType" size="small" effect="plain" class="user-role-tag">
              {{ RoleMap[userStore.userInfo.role] || '未知' }}
            </el-tag>
          </div>
          <el-button class="logout-btn" text @click="logout">退出登录</el-button>
        </div>
      </el-header>

      <!-- 内容 -->
      <el-main class="main-content">
        <router-view />
      </el-main>
    </el-container>
  </el-container>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { Expand, Fold, Menu as MenuIcon, Setting, Goods, ShoppingCart, User, Headset, Monitor, Document as DocumentIcon, Tickets, Grid, List, Avatar, Warning, Tools } from '@element-plus/icons-vue'
import { useMenuStore } from '../stores/menu'
import { useUserStore } from '../stores/user'
import * as authApi from '../api/auth'
import { RoleMap } from '../utils/constants'

const router = useRouter()
const route = useRoute()
const menuStore = useMenuStore()
const userStore = useUserStore()
const sidebarVisible = ref(false)

/** 收集所有子菜单 index，实现默认全部展开 */
const defaultOpeneds = computed(() => {
  const indexes: string[] = []
  function walk(items: any[]) {
    for (const item of items) {
      if (item.children?.length) {
        indexes.push(item.path || String(item.id))
        walk(item.children)
      }
    }
  }
  walk(menuStore.menuTree)
  return indexes
})

const menuIcons: Record<string, any> = {
  '系统管理': Setting,
  '商品管理': Goods,
  '订单管理': ShoppingCart,
  '会员管理': User,
  '售后管理': Headset,
  '店铺管理': Monitor,
  '系统配置': Setting,
}

const subMenuIcons: Record<string, any> = {
  '用户管理': User,
  '日志管理': DocumentIcon,
  '分类管理': Grid,
  '商品列表': List,
  '订单列表': Tickets,
  '会员列表': Avatar,
  '纠纷列表': Warning,
  '我的商品': List,
  '我的订单': Tickets,
  '配置管理': Tools,
}

const roleTagType = computed(() => {
  const map: Record<string, string> = {
    SUPER_ADMIN: 'danger',
    OPERATOR: 'warning',
    MERCHANT: 'primary',
    CS: 'success',
    BUYER: 'info'
  }
  return map[userStore.userInfo.role] || 'info'
})

async function logout() {
  try { await authApi.logout() } finally {
    localStorage.removeItem('token')
    router.push('/login')
  }
}
</script>

<style scoped>
.layout-container { height: 100vh; }

/* ===== 侧栏 ===== */
.aside {
  background: #fff;
  border-right: 1px solid #f0f0f0;
  overflow-y: auto;
  transition: transform 0.25s ease;
  display: flex;
  flex-direction: column;
}

/* Logo */
.logo {
  padding: 20px 20px 16px;
  display: flex;
  align-items: center;
  gap: 12px;
}
.logo-icon {
  width: 36px; height: 36px;
  border-radius: 8px;
  background: #e85d3a;
  color: #fff;
  font-size: 18px;
  font-weight: 700;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}
.logo-text {
  display: flex;
  flex-direction: column;
  line-height: 1.2;
}
.logo-title {
  font-size: 16px;
  font-weight: 700;
  color: #1a1a1a;
  letter-spacing: 0.5px;
}
.logo-sub {
  font-size: 11px;
  color: #999;
  letter-spacing: 0.5px;
}

/* 菜单 */
.side-menu {
  border-right: none;
  flex: 1;
  padding: 0 8px;
}
.side-menu :deep(.el-menu-item) {
  margin: 2px 0;
  border-radius: 8px;
  font-size: 14px;
  color: #555;
  height: 42px;
  line-height: 42px;
  transition: all 0.15s;
}
.side-menu > :deep(.el-menu-item) {
  font-size: 14px;
  font-weight: 500;
  color: #444;
}
.side-menu :deep(.el-menu-item:hover) {
  background: #f5f5f5;
  color: #333;
}
.side-menu :deep(.el-menu-item.is-active) {
  background: #fff7f5;
  color: #e85d3a;
  font-weight: 600;
}
/* 一级：根目录标题 */
.side-menu :deep(.el-sub-menu > .el-sub-menu__title) {
  padding-left: 20px !important;
  margin: 2px 0;
  border-radius: 8px;
  font-size: 14px;
  font-weight: 500;
  color: #444;
  height: 42px;
  line-height: 42px;
  transition: all 0.15s;
}
.side-menu :deep(.el-sub-menu > .el-sub-menu__title:hover) {
  background: #f5f5f5;
  color: #333;
}
.side-menu :deep(.el-sub-menu.is-active > .el-sub-menu__title) {
  color: #e85d3a;
}

/* 一级：根级直接菜单项（如控制台） */
.side-menu > :deep(.el-menu-item) {
  padding-left: 20px !important;
  font-size: 14px;
  font-weight: 500;
  color: #444;
}

/* 二级：子目录标题 */
.side-menu :deep(.el-sub-menu .el-sub-menu > .el-sub-menu__title) {
  padding-left: 45px !important;
}

/* 二级：子菜单项（有 component 的页面） */
.side-menu :deep(.el-sub-menu > .el-menu-item) {
  padding-left: 45px !important;
}

/* 三级：最内层按钮项 */
.side-menu :deep(.el-sub-menu .el-sub-menu > .el-menu-item) {
  padding-left: 65px !important;
}

/* 分隔线 */
.menu-divider {
  height: 1px;
  background: #f0f0f0;
  margin: 8px 12px;
}

/* 侧栏底部 */
.aside-footer {
  padding: 12px 16px;
  border-top: 1px solid #f0f0f0;
}
.aside-user {
  display: flex;
  align-items: center;
  gap: 10px;
}
.aside-avatar {
  width: 32px; height: 32px;
  border-radius: 50%;
  background: #e85d3a;
  color: #fff;
  font-size: 13px;
  font-weight: 600;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}
.aside-name {
  font-size: 13px;
  color: #555;
  font-weight: 500;
}

/* ===== 主内容区 ===== */
.main-container { background: #f7f5f2; }

/* ===== 顶栏 ===== */
.header {
  background: #fff;
  border-bottom: 1px solid #f0ebe4;
  display: flex;
  justify-content: space-between;
  align-items: center;
  box-shadow: none;
}
.header-left { display: flex; align-items: center; gap: 8px; }
.greeting { color: #999; font-size: 14px; }
.header-right { display: flex; align-items: center; gap: 16px; }
.user-info {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 3px;
}
.user-name {
  color: #1a1a1a;
  font-size: 14px;
  font-weight: 600;
  letter-spacing: 0.3px;
}
.user-role-tag {
  font-size: 11px;
  border-radius: 10px;
  padding: 0 10px;
  height: 20px;
  line-height: 18px;
}
.logout-btn { color: #999; }
.logout-btn:hover { color: #f56c6c; }

.menu-toggle {
  display: none;
  color: #555;
  padding: 4px;
}

.main-content {
  padding: 24px;
  min-height: 0;
}

/* 移动端遮罩 */
.sidebar-overlay {
  display: none;
}

/* ===== 移动端 ===== */
@media (max-width: 768px) {
  .menu-toggle {
    display: inline-flex;
  }

  .aside {
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    z-index: 1000;
    transform: translateX(-100%);
  }

  .aside-mobile {
    transform: translateX(0);
    box-shadow: 4px 0 20px rgba(0,0,0,0.3);
  }

  .sidebar-overlay {
    display: block;
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.4);
    z-index: 999;
  }

  .main-content {
    padding: 16px 12px;
  }

  .greeting { display: none; }
  .nickname { font-size: 13px; }
  .header-right { gap: 8px; }
}
</style>

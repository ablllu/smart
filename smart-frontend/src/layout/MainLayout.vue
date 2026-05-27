<template>

  <el-container class="layout-container">

    <!-- 左侧菜单 -->
    <el-aside width="220px" class="aside">

      <div class="logo">

        Smart Admin

      </div>

      <el-menu
        :default-active="route.path"
        background-color="#304156"
        text-color="#bfcbd9"
        active-text-color="#409EFF"
        router
        style="border-right:none"
      >
        <el-menu-item index="/dashboard">
          <el-icon><Odometer /></el-icon>
          <span>控制台</span>
        </el-menu-item>

        <template v-for="item in menuStore.menuTree[0]?.children || menuStore.menuTree" :key="item.id">
          <!-- type=1 有子节点 → 目录，渲染为子菜单 -->
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
          <!-- type=1/2 有 component → 直接菜单项 -->
          <el-menu-item
            v-else-if="item.type === 1 && item.component"
            :index="item.path"
          >
            <span>{{ item.name }}</span>
          </el-menu-item>
        </template>
      </el-menu>

    </el-aside>

    <!-- 右侧 -->
    <el-container>

      <!-- 顶部 -->
      <el-header class="header">

        <div></div>

        <div class="right-box">

          <span class="nickname">
            管理员
          </span>

          <el-button
            type="danger"
            text
            @click="logout"
          >
            退出登录
          </el-button>

        </div>

      </el-header>

      <!-- 内容区 -->
      <el-main class="main">

        <router-view />

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
  try {
    await authApi.logout()
  } finally {
    localStorage.removeItem('token')
    router.push('/login')
  }
}

</script>

<style scoped>

.layout-container {

  height: 100vh;
}

.aside {

  background: #304156;
}

.logo {

  height: 60px;

  color: white;

  display: flex;

  align-items: center;

  justify-content: center;

  font-size: 20px;

  font-weight: bold;
}

.header {

  background: white;

  border-bottom: 1px solid #eee;

  display: flex;

  justify-content: space-between;

  align-items: center;
}

.right-box {

  display: flex;

  align-items: center;
}

.nickname {

  margin-right: 10px;
}

.main {

  background: #f5f7fa;
}

</style>
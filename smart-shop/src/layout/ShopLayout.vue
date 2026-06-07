<template>
    <div class="shop-layout">
        <!--顶部导航-->
        <header class="shop-header">
            <div class="header-inner">
                <router-link to="/" class="logo">Smart 商城</router-link>
                <div class="header-actions">
                    <router-link to="/cart" class="nav-link">购物车</router-link>
                    <router-link v-if="isLogin" to="/order/list" class="nav-link">我的订单</router-link>
                    <template v-if="!isLogin">
                        <router-link to="/login" class="nav-link">登录</router-link>
                    </template>
                    <template v-else>
                        <router-link to="/user" class="nav-link">{{ nickname }}</router-link>
                    </template>
                </div>
            </div>
        </header>

        <!--主内容区-->
        <main class="shop-main">
            <router-view/>
        </main>

        <!--底部信息-->
        <footer class="shop-footer">
            <p>© 2026 Smart 商城</p>
        </footer>
    </div>
</template>

<script setup lang="ts">
import { computed } from 'vue';
import { useMemberStore } from '../stores/member';

const memberStore = useMemberStore();

const isLogin = computed(() => memberStore.isLogin)
const nickname = computed(() => memberStore.nickname || '我的')
</script>

<style scoped>
.shop-layout {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  background: #f5f5f5;
}

.shop-header {
  background: #fff;
  box-shadow: 0 2px 8px rgba(0,0,0,0.06);
  position: sticky;
  top: 0;
  z-index: 100;
}

.header-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
  height: 56px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.logo {
  font-size: 22px;
  font-weight: 700;
  color: #e85d3a;
  text-decoration: none;
}

.header-actions {
  display: flex;
  gap: 24px;
}

.nav-link {
  color: #666;
  text-decoration: none;
  font-size: 14px;
}

.nav-link:hover {
  color: #e85d3a;
}

.shop-main {
  flex: 1;
  max-width: 1200px;
  width: 100%;
  margin: 0 auto;
  padding: 24px 20px;
}

.shop-footer {
  background: #fff;
  border-top: 1px solid #eee;
  padding: 20px;
  text-align: center;
}

.shop-footer p {
  margin: 0;
  font-size: 13px;
  color: #999;
}
</style>
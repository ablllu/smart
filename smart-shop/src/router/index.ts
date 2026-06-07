import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      component: () => import('../layout/ShopLayout.vue'),
      children: [
        { path: '', name: 'home', component: () => import('../views/home/HomeView.vue') },
        { path: 'product/:id', name: 'product', component: () => import('../views/product/ProductDetail.vue') },
        { path: 'login', name: 'login', component: () => import('../views/login/LoginView.vue') },
        { path: 'cart', name: 'cart', component: () => import('../views/cart/CartView.vue') },
        { path: 'order/list', name: 'orderList', component: () => import('../views/order/OrderList.vue') },
        { path: 'order/confirm', name: 'orderConfirm', component: () => import('../views/order/OrderConfirm.vue') },
        { path: 'user', name: 'user', component: () => import('../views/user/UserCenter.vue') },
      ]
    }
  ]
})

router.beforeEach((to) => {
  const publicPages = ['/', '/login']
  const token = localStorage.getItem('shop_token')

  if(!token && !publicPages.includes(to.path) && !to.path.startsWith('/product/')) {
    return '/login'
  }
})

export default router

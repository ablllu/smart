import { createRouter, createWebHistory } from 'vue-router'
import { useMenuStore } from '../stores/menu'

// import.meta.glob 自动发现所有 .vue 文件
const viewModules = import.meta.glob('../views/**/*.vue')

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/login',
      component: () => import('../views/login/LoginView.vue')
    },
    {
      path: '/',
      name: 'layout',
      component: () => import('../layout/MainLayout.vue'),
      redirect: '/dashboard',
      children: [
        {
          path: 'dashboard',
          component: () => import('../views/dashboard/DashboardView.vue')
        },
        {
          path: 'users',
          component: () => import('../views/user/UserView.vue')
        },
        {
          path: 'product/add',
          component: () => import('../views/product/SpuForm.vue')
        },
        {
          path: 'product/edit/:id',
          component: () => import('../views/product/SpuForm.vue')
        }
      ]
    },
    {
      path: '/403',
      component: () => import('../layout/MainLayout.vue'),
      children: [
        {
          path: '',
          component: () => import('../views/error/Forbidden.vue')
        }
      ]
    },
    {
      path: '/:pathMatch(.*)*',
      component: () => import('../layout/MainLayout.vue'),
      children: [
        {
          path: '',
          component: () => import('../views/error/NotFound.vue')
        }
      ]
    }
  ]
})

// 标记动态路由是否已加载
let routesLoaded = false

router.beforeEach(async (to, _from) => {
  const token = localStorage.getItem('token')

  if (to.path === '/login') {
    if (token) {
      return '/dashboard'
    }
    return
  }

  if (!token) {
    return '/login'
  }

  // 加载动态菜单路由（只执行一次）
  if (!routesLoaded) {
    try {
      const menuStore = useMenuStore()
      await menuStore.fetchMenus()

      // 遍历菜单树，注册 type=2 的页面路由
      function addRoutes(items: any[]) {
        for (const item of items) {
          // 目录类型(type=0/1)且非空 → 递归子节点
          if ((item.type === 0 || item.type === 1) && item.children?.length) {
            addRoutes(item.children)
          }
          // 菜单类型(type=1/2)且有 component → 注册路由
          if ((item.type === 1 || item.type === 2) && item.component) {
            // component 如 "product/CategoryList" → "../views/product/CategoryList.vue"
            const key = `../views/${item.component}.vue`
            const comp = viewModules[key]
            if (comp) {
              router.addRoute('layout', {   // 添加到 MainLayout 子路由
                path: item.path.startsWith('/') ? item.path.slice(1) : item.path,
                component: comp,
                meta: { title: item.name }
              })
            } else {
              console.warn('未找到组件:', item.component)
            }
          }
        }
      }
      addRoutes(menuStore.menuTree)

      routesLoaded = true
      // 重试当前导航
      return { ...to, replace: true }
    } catch {
      // 菜单加载失败，标记已加载防止死循环，继续导航
      routesLoaded = true
      return
    }
  }
})

export default router

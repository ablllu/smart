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

// 加载动态菜单路由（导出供 LoginView 提前调用，避免 beforeEach 中重定向导致白屏）
export async function loadDynamicRoutes() {
  if (routesLoaded) return
  try {
    const menuStore = useMenuStore()
    await menuStore.fetchMenus()

    function addRoutes(items: any[]) {
      for (const item of items) {
        if ((item.type === 0 || item.type === 1) && item.children?.length) {
          addRoutes(item.children)
        }
        if ((item.type === 1 || item.type === 2) && item.component) {
          const key = `../views/${item.component}.vue`
          const comp = viewModules[key]
          if (comp) {
            router.addRoute('layout', {
              path: item.path.startsWith('/') ? item.path.slice(1) : item.path,
              component: comp,
              meta: { title: item.name }
            })
          }
        }
      }
    }
    addRoutes(menuStore.menuTree)
    routesLoaded = true
  } catch {
    routesLoaded = true
  }
}

export function isRoutesLoaded() {
  return routesLoaded
}

router.beforeEach(async (to, _from) => {
  const token = localStorage.getItem('token')

  if (to.path === '/login') {
    if (token) return '/dashboard'
    return
  }

  if (!token) return '/login'

  // 确保动态路由已加载
  if (!routesLoaded) {
    await loadDynamicRoutes()
    // 只有当前路径被 404 catch-all 捕获（即静态路由未命中）时才重试
    // 静态路由如 /dashboard 直接放行，避免导航中断导致白屏
    const isNotFound = to.matched.some((r) => r.path === '/:pathMatch(.*)*')
    if (isNotFound) {
      return { path: to.path, query: to.query, hash: to.hash, replace: true }
    }
  }
})

export default router

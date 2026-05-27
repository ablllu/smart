# Smart 前端

电商后台管理系统前端，基于 Vue 3 + TypeScript + Vite 构建。

## 技术栈

- **框架**: Vue 3 (Composition API + `<script setup>`)
- **构建工具**: Vite 8
- **语言**: TypeScript
- **UI 组件库**: Element Plus
- **状态管理**: Pinia
- **路由**: Vue Router 4
- **HTTP 请求**: Axios
- **富文本编辑器**: WangEditor
- **样式**: SCSS

## 项目结构

```
src/
├── api/                # API 接口封装
│   ├── request.ts      # Axios 实例 & 拦截器
│   ├── auth.ts         # 登录/登出
│   ├── category.ts     # 商品分类
│   ├── member.ts       # 会员管理
│   ├── menu.ts         # 菜单
│   ├── order.ts        # 订单
│   ├── spu.ts          # 商品
│   ├── upload.ts       # 文件上传
│   └── user.ts         # 用户管理
├── components/         # 公共组件
│   ├── ImageUpload.vue # 图片上传
│   ├── RichEditor.vue  # 富文本编辑器
│   └── SkuEditor.vue   # SKU 行编辑器
├── layout/
│   └── MainLayout.vue  # 主布局（侧边栏 + 顶栏）
├── router/
│   └── index.ts        # 路由配置 & 动态路由加载
├── stores/
│   └── menu.ts         # 菜单状态管理
├── views/
│   ├── dashboard/      # 控制台
│   ├── login/          # 登录页
│   ├── error/          # 404 / 403 错误页
│   ├── user/           # 用户管理
│   ├── member/         # 会员管理
│   ├── order/          # 订单管理
│   └── product/        # 商品管理（分类、商品列表、商品表单）
├── utils/
│   └── constants.ts    # 常量映射（性别、会员等级等）
└── main.ts             # 应用入口
```

## 功能模块

| 模块 | 功能 |
|------|------|
| 控制台 | 数据概览卡片 |
| 用户管理 | 用户 CRUD、Excel 导入导出 |
| 商品分类 | 树形表格展示、增删改 |
| 商品管理 | 商品分页列表、上下架、详情抽屉（含 SKU 列表） |
| 商品表单 | 分 Tab 编辑基本信息 / SKU / 富文本描述，支持图片上传 |
| 会员管理 | 会员分页列表、状态切换、详情抽屉 |
| 订单管理 | 订单列表 |

## 权限与路由

- 基于 **RBAC** 权限模型
- 菜单数据从后端 `/menus/current` 接口动态获取
- 路由守卫自动加载菜单并注册动态路由
- 未登录自动跳转登录页，已登录访问登录页自动跳控制台
- 401 清除 token 跳登录，403 跳无权限页

## 开发

```bash
# 安装依赖
npm install

# 启动开发服务器（默认 http://localhost:5173）
npm run dev

# 生产构建
npm run build

# 预览构建产物
npm run preview
```

## Docker 部署

```bash
# 在根目录下统一启动所有服务
docker-compose up -d

# 单独构建前端镜像
docker build -t smart-frontend .

# 运行容器
docker run -p 80:80 smart-frontend
```

前端容器基于 nginx 运行，内置了 SPA 路由支持和 API 反向代理，无需额外配置。

## 环境要求

- Node.js >= 18
- 后端服务运行在 http://localhost:8080

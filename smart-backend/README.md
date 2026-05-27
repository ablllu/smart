# Smart 后端

电商后台管理系统后端，基于 Spring Boot + MyBatis-Plus 构建。

## 技术栈

- **框架**: Spring Boot 2.6.13
- **语言**: Java 1.8
- **ORM**: MyBatis-Plus 3.5.5
- **数据库**: MySQL 8.0
- **缓存**: Redis
- **认证**: JWT (jjwt 0.11.5)
- **密码加密**: Spring Security Crypto (BCrypt)
- **接口文档**: SpringDoc OpenAPI 1.7.0 (Swagger UI)
- **Excel 导入导出**: Apache POI 5.2.5
- **AOP**: 审计日志、操作日志、幂等性校验
- **构建工具**: Maven
- **容器化**: Docker (eclipse-temurin:8-jre)

## 项目结构

```
src/main/java/com/bbpp/smartbackend/
├── SmartBackendApplication.java        # 启动类
├── common/                             # 公共模块
│   ├── audit/                          # 审计日志注解
│   ├── auth/                           # 登录用户上下文、角色校验
│   ├── exception/                      # 全局异常处理
│   ├── idempotent/                     # 幂等性注解
│   ├── log/                            # 操作日志注解
│   ├── page/                           # 分页封装
│   ├── properties/                     # 配置属性类
│   ├── result/                         # 统一响应封装 Result<T>
│   └── utils/                          # 工具类（JWT、密码、Redis、Excel）
├── framework/                          # 框架层
│   ├── aspect/                         # AOP 切面实现
│   ├── config/                         # 配置类（MyBatis、Redis、Jackson、Web）
│   └── interceptor/                    # JWT 登录拦截器
└── modules/                            # 业务模块
    ├── auth/                           # 认证（登录、登出、获取当前用户）
    ├── user/                           # 用户管理
    ├── member/                         # 会员管理
    ├── product/                        # 商品管理（SPU、SKU、分类）
    ├── order/                          # 订单管理
    ├── menu/                           # 菜单管理（RBAC）
    ├── statistics/                     # 数据统计
    ├── upload/                         # 文件上传
    ├── operationlog/                   # 操作日志
    ├── auditlog/                       # 审计日志
    └── task/job/                       # 定时任务
```

## 数据库表

| 表名 | 说明 |
|------|------|
| sys_user | 系统用户 |
| sys_menu | 系统菜单（RBAC） |
| sys_operation_log | 操作日志 |
| sys_audit_log | 审计日志 |
| ums_member | 会员 |
| ums_address | 会员地址 |
| pms_spu | 商品（SPU） |
| pms_sku | 商品规格（SKU） |
| pms_category | 商品分类 |
| oms_order | 订单 |
| oms_order_item | 订单明细 |

## API 接口

### 认证 `/auth`

| 方法 | 路径 | 说明 |
|------|------|------|
| POST | /auth/login | 登录（返回 JWT） |
| GET | /auth/me | 获取当前用户信息 |
| POST | /auth/logout | 退出登录 |

### 用户管理 `/users`

| 方法 | 路径 | 说明 |
|------|------|------|
| GET | /users/page | 分页查询 |
| GET | /users/{id} | 用户详情 |
| POST | /users/create | 新增用户（幂等） |
| PUT | /users/{id} | 修改用户（审计日志） |
| DELETE | /users/{id} | 删除用户（仅 ADMIN） |
| GET | /users/export/excel | 导出 Excel |
| POST | /users/import/excel | 导入 Excel |

### 商品管理 `/admin/spu`

| 方法 | 路径 | 说明 |
|------|------|------|
| GET | /admin/spu/page | 分页查询 |
| GET | /admin/spu/{id} | 商品详情 |
| POST | /admin/spu | 新增商品 |
| PUT | /admin/spu/{id} | 修改商品 |
| PUT | /admin/spu/{id}/status | 上下架 |
| DELETE | /admin/spu/{id} | 删除商品 |

### 商品分类 `/admin/category`

| 方法 | 路径 | 说明 |
|------|------|------|
| GET | /admin/category | 获取分类树 |
| POST | /admin/category | 新增分类 |
| PUT | /admin/category/{id} | 修改分类 |
| DELETE | /admin/category/{id} | 删除分类 |

### 订单管理 `/admin/order`

| 方法 | 路径 | 说明 |
|------|------|------|
| GET | /admin/order/page | 分页查询 |
| GET | /admin/order/{id} | 订单详情 |
| PUT | /admin/order/{id}/ship | 发货 |
| PUT | /admin/order/{id}/cancel | 取消订单 |

### 会员管理 `/admin/member`

| 方法 | 路径 | 说明 |
|------|------|------|
| GET | /admin/member/page | 分页查询 |
| GET | /admin/member/{id} | 会员详情 |
| PUT | /admin/member/{id}/status | 启用/禁用 |

### 菜单 `/menus`

| 方法 | 路径 | 说明 |
|------|------|------|
| GET | /menus/current | 获取当前用户菜单 |

### 文件上传 `/upload`

| 方法 | 路径 | 说明 |
|------|------|------|
| POST | /upload/image | 上传图片 |

### 数据统计 `/admin/statistics`

| 方法 | 路径 | 说明 |
|------|------|------|
| GET | /admin/statistics/overview | 控制台概览数据 |

## 核心特性

- **RBAC 权限模型**: 基于 sys_menu 表的动态菜单，支持目录/页面/按钮三种类型
- **JWT 认证**: 登录返回 Token，拦截器校验，Redis 存储 Token 支持主动失效
- **统一响应**: `Result<T>` 包装返回结果，全局异常处理
- **审计日志**: `@AuditLogAnnotation` 记录业务数据变更前后的值
- **操作日志**: `@OperationLogAnnotation` 记录用户操作行为
- **幂等性**: `@Idempotent` 注解防止重复提交
- **逻辑删除**: MyBatis-Plus 全局配置，`deleted=0` 未删除 / `deleted=1` 已删除
- **自动填充**: `createTime`、`updateTime` 字段自动填充

## 开发

```bash
# 环境要求
# - JDK 1.8+
# - Maven 3.6+
# - MySQL 8.0
# - Redis

# 创建数据库
mysql -u root -p -e "CREATE DATABASE smart_backend DEFAULT CHARACTER SET utf8mb4;"

# 导入表结构和测试数据
mysql -u root -p smart_backend < src/main/resources/sql/schema.sql

# 修改数据库连接配置
# 编辑 src/main/resources/application-dev.yml

# 运行
mvn spring-boot:run

# 打包
mvn clean package -DskipTests

# Docker 部署
# 在根目录下统一启动所有服务（推荐）
docker-compose up -d

# 单独构建后端镜像
docker build -t smart-backend .
docker run -p 8080:8080 smart-backend
```

## 环境要求

- JDK 1.8+
- Maven 3.6+
- MySQL 8.0
- Redis
- 服务默认运行在 http://localhost:8080

## 接口文档

启动服务后访问 Swagger UI：

```
http://localhost:8080/swagger-ui.html
```

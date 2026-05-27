# Smart

电商后台管理系统，前后端分离架构。

## 项目结构

```
smart/
├── docker-compose.yml      # 统一容器编排
├── smart-backend/          # 后端 - Spring Boot + MyBatis-Plus
│   ├── Dockerfile
│   └── ...
├── smart-frontend/         # 前端 - Vue 3 + Vite
│   ├── Dockerfile
│   ├── nginx.conf
│   └── ...
```

## 技术栈

| 层级 | 技术 |
|------|------|
| 前端 | Vue 3, TypeScript, Vite, Element Plus, Pinia |
| 后端 | Spring Boot 2.6, Java 8, MyBatis-Plus |
| 数据库 | MySQL 8.0 |
| 缓存 | Redis |
| 认证 | JWT (jjwt) |
| 容器化 | Docker + Docker Compose |

## 快速启动（Docker）

```bash
# 1. 构建后端 jar 包
cd smart-backend
mvn clean package -DskipTests
cd ..

# 2. 一键启动所有服务（MySQL + Redis + 后端 + 前端）
docker-compose up -d

# 3. 访问
# 前端: http://localhost
# 后端: http://localhost:8080
# Swagger: http://localhost:8080/swagger-ui.html
```

## 本地开发

### 后端

```bash
cd smart-backend
# 需要本地 MySQL 和 Redis
mvn spring-boot:run
# 运行在 http://localhost:8080
```

### 前端

```bash
cd smart-frontend
npm install
npm run dev
# 运行在 http://localhost:5173
```

## 服务端口

| 服务 | 端口 |
|------|------|
| 前端 (nginx) | 80 |
| 后端 (Spring Boot) | 8080 |
| MySQL | 3306 |
| Redis | 6379 |

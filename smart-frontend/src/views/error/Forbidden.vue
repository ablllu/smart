<template>
  <div class="error-page">
    <div class="error-code">403</div>
    <p>没有权限访问此页面</p>
    <el-button type="primary" @click="$router.push('/dashboard')">返回首页</el-button>
  </div>
</template>

<style scoped>
.error-page {
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: #555;
}
.error-code {
  font-size: 100px;
  font-weight: 700;
  color: #f56c6c;
  line-height: 1;
  margin-bottom: 8px;
  opacity: 0.8;
}
.error-page p {
  font-size: 16px;
  color: #999;
  margin: 0 0 24px;
}
</style>

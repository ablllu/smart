<template>
  <div>
    <h2 class="page-title">日志管理</h2>

    <div class="table-card">
      <el-tabs v-model="activeTab">
        <!-- ===== 操作日志 ===== -->
        <el-tab-pane label="操作日志" name="operation">
          <div class="search-bar">
            <el-form :inline="true">
              <el-form-item label="用户名">
                <el-input v-model="opSearch.username" placeholder="请输入" clearable />
              </el-form-item>
              <el-form-item label="操作类型">
                <el-input v-model="opSearch.operation" placeholder="模糊搜索" clearable />
              </el-form-item>
              <el-form-item label="时间">
                <el-date-picker
                  v-model="opSearch.timeRange"
                  type="datetimerange"
                  range-separator="至"
                  start-placeholder="开始"
                  end-placeholder="结束"
                  value-format="YYYY-MM-DDTHH:mm:ss"
                  style="width: 360px"
                />
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="loadOpLogs">搜索</el-button>
                <el-button @click="resetOpSearch">重置</el-button>
              </el-form-item>
            </el-form>
          </div>

          <el-table :data="opData" border stripe>
            <el-table-column prop="id" label="ID" width="70" />
            <el-table-column prop="username" label="用户名" width="120" />
            <el-table-column prop="operation" label="操作" min-width="140" />
            <el-table-column prop="method" label="请求方法" width="90" />
            <el-table-column prop="path" label="请求路径" min-width="180" />
            <el-table-column prop="ip" label="IP" width="140" />
            <el-table-column prop="createTime" label="时间" width="170" />
          </el-table>

          <div class="pagination">
            <el-pagination
              background
              layout="total, prev, pager, next"
              :total="opTotal"
              :page-size="opPageSize"
              :current-page="opPageNum"
              @current-change="(n: number) => { opPageNum = n; loadOpLogs() }"
            />
          </div>
        </el-tab-pane>

        <!-- ===== 审计日志 ===== -->
        <el-tab-pane label="审计日志" name="audit">
          <div class="search-bar">
            <el-form :inline="true">
              <el-form-item label="用户名">
                <el-input v-model="auditSearch.username" placeholder="请输入" clearable />
              </el-form-item>
              <el-form-item label="模块">
                <el-input v-model="auditSearch.moduleName" placeholder="请输入" clearable />
              </el-form-item>
              <el-form-item label="操作类型">
                <el-input v-model="auditSearch.operationType" placeholder="请输入" clearable />
              </el-form-item>
              <el-form-item label="时间">
                <el-date-picker
                  v-model="auditSearch.timeRange"
                  type="datetimerange"
                  range-separator="至"
                  start-placeholder="开始"
                  end-placeholder="结束"
                  value-format="YYYY-MM-DDTHH:mm:ss"
                  style="width: 360px"
                />
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="loadAuditLogs">搜索</el-button>
                <el-button @click="resetAuditSearch">重置</el-button>
              </el-form-item>
            </el-form>
          </div>

          <el-table :data="auditData" border stripe>
            <el-table-column prop="id" label="ID" width="70" />
            <el-table-column prop="username" label="用户名" width="120" />
            <el-table-column prop="moduleName" label="模块" width="120" />
            <el-table-column prop="operationType" label="操作类型" width="120" />
            <el-table-column prop="businessId" label="业务ID" width="80" />
            <el-table-column prop="oldData" label="旧数据" min-width="160">
              <template #default="{ row }">
                <span style="font-size:12px;color:#999">{{ row.oldData }}</span>
              </template>
            </el-table-column>
            <el-table-column prop="newData" label="新数据" min-width="160">
              <template #default="{ row }">
                <span style="font-size:12px;color:#999">{{ row.newData }}</span>
              </template>
            </el-table-column>
            <el-table-column prop="createTime" label="时间" width="170" />
          </el-table>

          <div class="pagination">
            <el-pagination
              background
              layout="total, prev, pager, next"
              :total="auditTotal"
              :page-size="auditPageSize"
              :current-page="auditPageNum"
              @current-change="(n: number) => { auditPageNum = n; loadAuditLogs() }"
            />
          </div>
        </el-tab-pane>

        <!-- ===== 登录日志 ===== -->
        <el-tab-pane label="登录日志" name="login">
          <div class="search-bar">
            <el-form :inline="true">
              <el-form-item label="用户名">
                <el-input v-model="loginSearch.username" placeholder="请输入" clearable />
              </el-form-item>
              <el-form-item label="状态">
                <el-select v-model="loginSearch.status" placeholder="全部" clearable style="width:120px">
                  <el-option label="登录成功" value="用户登录" />
                  <el-option label="登录失败" value="登录失败" />
                </el-select>
              </el-form-item>
              <el-form-item label="时间">
                <el-date-picker
                  v-model="loginSearch.timeRange"
                  type="datetimerange"
                  range-separator="至"
                  start-placeholder="开始"
                  end-placeholder="结束"
                  value-format="YYYY-MM-DDTHH:mm:ss"
                  style="width: 360px"
                />
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="loadLoginLogs">搜索</el-button>
                <el-button @click="resetLoginSearch">重置</el-button>
              </el-form-item>
            </el-form>
          </div>

          <el-table :data="loginData" border stripe>
            <el-table-column prop="id" label="ID" width="70" />
            <el-table-column prop="username" label="用户名" width="120" />
            <el-table-column prop="operation" label="状态" min-width="140">
              <template #default="{ row }">
                <el-tag
                  :type="row.operation?.includes('失败') ? 'danger' : 'success'"
                  size="small"
                >
                  {{ row.operation }}
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="ip" label="IP" width="140" />
            <el-table-column prop="createTime" label="时间" width="170" />
          </el-table>

          <div class="pagination">
            <el-pagination
              background
              layout="total, prev, pager, next"
              :total="loginTotal"
              :page-size="loginPageSize"
              :current-page="loginPageNum"
              @current-change="(n: number) => { loginPageNum = n; loadLoginLogs() }"
            />
          </div>
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted, watch } from 'vue'
import * as logApi from '../../../api/log'

// ==================== 操作日志 ====================
const activeTab = ref('operation')
const opData = ref<any[]>([])
const opTotal = ref(0)
const opPageNum = ref(1)
const opPageSize = ref(10)
const opSearch = reactive({ username: '', operation: '', timeRange: null as any })

async function loadOpLogs() {
  const params: any = { pageNum: opPageNum.value, pageSize: opPageSize.value }
  if (opSearch.username) params.username = opSearch.username
  if (opSearch.operation) params.operation = opSearch.operation
  if (opSearch.timeRange) {
    params.startTime = opSearch.timeRange[0]
    params.endTime = opSearch.timeRange[1]
  }
  const res = await logApi.getOperationLogPage(params)
  opData.value = res.records
  opTotal.value = Number(res.total) || 0
}

function resetOpSearch() {
  opSearch.username = ''
  opSearch.operation = ''
  opSearch.timeRange = null
  opPageNum.value = 1
  loadOpLogs()
}

// ==================== 审计日志 ====================
const auditData = ref<any[]>([])
const auditTotal = ref(0)
const auditPageNum = ref(1)
const auditPageSize = ref(10)
const auditSearch = reactive({ username: '', moduleName: '', operationType: '', timeRange: null as any })

async function loadAuditLogs() {
  const params: any = { pageNum: auditPageNum.value, pageSize: auditPageSize.value }
  if (auditSearch.username) params.username = auditSearch.username
  if (auditSearch.moduleName) params.moduleName = auditSearch.moduleName
  if (auditSearch.operationType) params.operationType = auditSearch.operationType
  if (auditSearch.timeRange) {
    params.startTime = auditSearch.timeRange[0]
    params.endTime = auditSearch.timeRange[1]
  }
  const res = await logApi.getAuditLogPage(params)
  auditData.value = res.records
  auditTotal.value = Number(res.total) || 0
}

function resetAuditSearch() {
  auditSearch.username = ''
  auditSearch.moduleName = ''
  auditSearch.operationType = ''
  auditSearch.timeRange = null
  auditPageNum.value = 1
  loadAuditLogs()
}

// ==================== 登录日志 ====================
const loginData = ref<any[]>([])
const loginTotal = ref(0)
const loginPageNum = ref(1)
const loginPageSize = ref(10)
const loginSearch = reactive({ username: '', status: '', timeRange: null as any })

async function loadLoginLogs() {
  const params: any = { pageNum: loginPageNum.value, pageSize: loginPageSize.value }
  if (loginSearch.username) params.username = loginSearch.username
  if (loginSearch.status) {
    // 登录失败是 "登录失败: xxx"，用模糊匹配前缀
    params.operation = loginSearch.status
  }
  // 不加筛选时，传 operation 为模糊匹配 "登录" 即可
  if (!params.operation) {
    params.operation = '登录'
  }
  if (loginSearch.timeRange) {
    params.startTime = loginSearch.timeRange[0]
    params.endTime = loginSearch.timeRange[1]
  }
  const res = await logApi.getOperationLogPage(params)
  loginData.value = res.records
  loginTotal.value = Number(res.total) || 0
}

function resetLoginSearch() {
  loginSearch.username = ''
  loginSearch.status = ''
  loginSearch.timeRange = null
  loginPageNum.value = 1
  loadLoginLogs()
}

// ==================== 初始化 ====================
onMounted(() => loadOpLogs())

const tabLoaded: Record<string, boolean> = { operation: true, audit: false, login: false }
watch(activeTab, (tab) => {
  if (!tabLoaded[tab]) {
    tabLoaded[tab] = true
    if (tab === 'audit') loadAuditLogs()
    if (tab === 'login') loadLoginLogs()
  }
})
</script>

<style scoped>
.page-title { font-size: 20px; font-weight: 600; color: #333; margin: 0 0 20px; }
.table-card { background: #fff; border-radius: 10px; padding: 24px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); }
.search-bar { margin-bottom: 16px; }
.pagination { margin-top: 20px; display: flex; justify-content: flex-end; }
</style>

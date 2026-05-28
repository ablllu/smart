import request from './request'

// 操作日志分页
export function getOperationLogPage(params: {
  pageNum: number
  pageSize: number
  username?: string
  operation?: string
  startTime?: string
  endTime?: string
}) {
  return request({
    url: '/operationLogs/page',
    method: 'get',
    params
  })
}

// 审计日志分页
export function getAuditLogPage(params: {
  pageNum: number
  pageSize: number
  username?: string
  moduleName?: string
  operationType?: string
  startTime?: string
  endTime?: string
}) {
  return request({
    url: '/auditLogs/page',
    method: 'get',
    params
  })
}

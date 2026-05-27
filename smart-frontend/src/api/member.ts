import request from './request'
export function getPage(params: any) {
  return request({ 
    url: '/admin/member/page', 
    method: 'get', 
    params })
}

export function getById(id: number) {
  return request({ 
    url: `/admin/member/${id}`, 
    method: 'get' })
}

export function updateStatus(id: number, status: number) {
  return request({ 
    url: `/admin/member/${id}/status`, 
    method: 'put', 
    params: { status } })
}
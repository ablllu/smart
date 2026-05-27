import request from './request'

export function getPage(params: any) {
  return request({ url: '/admin/spu/page', method: 'get', params })
}

export function getById(id: number) {
  return request({ url: `/admin/spu/${id}`, method: 'get' })
}

export function create(data: any) {
  return request({ url: '/admin/spu', method: 'post', data })
}

export function update(id: number, data: any) {
  return request({ url: `/admin/spu/${id}`, method: 'put', data })
}

export function updateStatus(id: number, status: number) {
  return request({ url: `/admin/spu/${id}/status`, method: 'put', params: { status } })
}

export function remove(id: number) {
  return request({ url: `/admin/spu/${id}`, method: 'delete' })
}
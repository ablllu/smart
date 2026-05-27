import request from './request'

export function getPage(params: any) {
  return request({ url: '/admin/order/page', method: 'get', params })
}

export function getById(id: number) {
  return request({ url: `/admin/order/${id}`, method: 'get' })
}

export function ship(id: number) {
  return request({ url: `/admin/order/${id}/ship`, method: 'put' })
}

export function cancel(id: number) {
  return request({ url: `/admin/order/${id}/cancel`, method: 'put' })
}
import request from './request'

export function getPage(params: any) {
  return request({ url: '/admin/merchant-shop/page', method: 'get', params })
}

export function getById(id: number) {
  return request({ url: `/admin/merchant-shop/${id}`, method: 'get' })
}

export function create(data: any) {
  return request({ url: '/admin/merchant-shop', method: 'post', data })
}

export function update(id: number, data: any) {
  return request({ url: `/admin/merchant-shop/${id}`, method: 'put', data })
}

export function remove(id: number) {
  return request({ url: `/admin/merchant-shop/${id}`, method: 'delete' })
}

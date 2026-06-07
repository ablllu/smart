import request from './request'

export function getList() {
  return request({ url: '/api/cart', method: 'get' })
}

export function add(data: { spuId: number; skuId: number; quantity: number }) {
  return request({ url: '/api/cart', method: 'post', data })
}

export function updateQuantity(id: number, quantity: number) {
  return request({ url: `/api/cart/${id}`, method: 'put', data: { quantity } })
}

export function remove(id: number) {
  return request({ url: `/api/cart/${id}`, method: 'delete' })
}

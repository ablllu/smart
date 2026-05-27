import request from './request'

export function getTree() {
  return request({ url: '/admin/category', method: 'get' })
}

export function create(data: any) {
  return request({ url: '/admin/category', method: 'post', data })
}

export function update(id: number, data: any) {
  return request({ url: `/admin/category/${id}`, method: 'put', data })
}

export function remove(id: number) {
  return request({ url: `/admin/category/${id}`, method: 'delete' })
}
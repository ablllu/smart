import request from './request'

export function getPage(pageNum: number, pageSize: number = 10) {
  return request({
    url: '/api/order/page',
    method: 'get',
    params: { pageNum, pageSize }
  })
}

export function getDetail(id: number) {
  return request({ url: `/api/order/${id}`, method: 'get' })
}

export function create(data: {
  cartIds?: number[]
  spuId?: number
  skuId?: number
  quantity?: number
  remark?: string
}) {
  return request({ url: '/api/order', method: 'post', data })
}

export function pay(id: number) {
  return request({ url: `/api/order/${id}/pay`, method: 'put' })
}

export function cancel(id: number) {
  return request({ url: `/api/order/${id}/cancel`, method: 'put' })
}

export function receive(id: number) {
  return request({ url: `/api/order/${id}/receive`, method: 'put' })
}

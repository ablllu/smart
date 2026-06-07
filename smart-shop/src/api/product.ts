import request from './request'

export function getPage(params: {
    pageNum: number
    pageSize: number
    keyword?: string
    categoryId?: number
    sort?: string
}) {
    return request({
        url: '/api/product/page',
        method: 'get',
        params
    })
}

export function getDetail(id: number) {
    return request({
        url: `/api/product/${id}`,
        method: 'get'
    })
}

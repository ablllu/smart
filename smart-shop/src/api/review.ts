import request from './request';

export function submit(orderId: number, rating: number, content?: string) {
    return request({
        url: '/api/review',
        method: 'post',
        params: {
            orderId,
            rating,
            content
        }
    })
}

export function getPage(spuId: number, pageNum: number = 1, pageSize: number = 10) {
    return request({
        url: '/api/review/page',
        method: 'get',
        params: {
            spuId,
            pageNum,
            pageSize
        }
    })
}
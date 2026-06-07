import request from './request'

export function login(data: { username: string; password: string }) {
    return request({
        url: '/api/member/login',
        method: 'post',
        data
    })
}

export function register(data: { username: string; password: string; nickname?: string })  {
    return request({
        url: '/api/member/register',
        method: 'post',
        data
    })
}
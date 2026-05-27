import request from './request'

interface LoginResult {
    userId: number
    username: string
    nickname: string
    token: string
}

export function login(data: { username: string, password: string }) : Promise<LoginResult> {
    return request({
        url: '/auth/login',
        method: 'post',
        data
    })
}

export function logout() {
    return request({
        url: '/auth/logout',
        method: 'post'
    })
}
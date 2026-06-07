import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  state: () => ({
    token: localStorage.getItem('token') || '',
    userInfo: {
      id: localStorage.getItem('userId') || '',
      username: localStorage.getItem('username') || '',
      nickname: localStorage.getItem('nickname') || '',
      role: localStorage.getItem('role') || ''
    },
    permissions: [] as string[]
  }),
  actions: {
    setToken(token: string) {
      this.token = token
      localStorage.setItem('token', token)
    },
    setUserInfo(userInfo: any) {
      this.userInfo = userInfo
      // 持久化到 localStorage，避免刷新后按钮消失
      if (userInfo.id) localStorage.setItem('userId', String(userInfo.id))
      if (userInfo.username) localStorage.setItem('username', userInfo.username)
      if (userInfo.nickname) localStorage.setItem('nickname', userInfo.nickname)
      if (userInfo.role) localStorage.setItem('role', userInfo.role)
    },
    setPermissions(permissions: string[]) {
      this.permissions = permissions
    },
    logout() {
      this.token = ''
      this.permissions = []
      this.userInfo = { id: '', username: '', nickname: '', role: '' }
      localStorage.removeItem('token')
      localStorage.removeItem('userId')
      localStorage.removeItem('username')
      localStorage.removeItem('nickname')
      localStorage.removeItem('role')
    }
  }
})

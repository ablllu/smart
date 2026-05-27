import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  state: () => ({
    token: localStorage.getItem('token') || '',
    userInfo: {
      id: '',
      username: '',
      nickname: ''
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
    },
    setPermissions(permissions: string[]) {
      this.permissions = permissions
    },
    logout() {
      this.token = ''
      this.permissions = []
      localStorage.removeItem('token')
    }
  }
})

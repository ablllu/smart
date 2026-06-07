import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useMemberStore = defineStore('member', () => {
  const token = ref(localStorage.getItem('shop_token') || '')
  const memberId = ref(Number(localStorage.getItem('shop_memberId')) || 0)
  const username = ref(localStorage.getItem('shop_username') || '')
  const nickname = ref(localStorage.getItem('shop_nickname') || '')

  const isLogin = computed(() => !!token.value)

  function setLogin(data: { memberId: number; username: string; nickname: string; token: string }) {
    token.value = data.token
    memberId.value = data.memberId
    username.value = data.username
    nickname.value = data.nickname || data.username

    localStorage.setItem('shop_token', data.token)
    localStorage.setItem('shop_memberId', String(data.memberId))
    localStorage.setItem('shop_username', data.username)
    localStorage.setItem('shop_nickname', nickname.value)
  }

  function logout() {
    token.value = ''
    memberId.value = 0
    username.value = ''
    nickname.value = ''
    localStorage.removeItem('shop_token')
    localStorage.removeItem('shop_memberId')
    localStorage.removeItem('shop_username')
    localStorage.removeItem('shop_nickname')
  }

  return { token, memberId, username, nickname, isLogin, setLogin, logout }
})

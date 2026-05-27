import { defineStore } from 'pinia'
import { ref } from 'vue'
import * as menuApi from '../api/menu'

export const useMenuStore = defineStore('menu', () => {
  const menuTree = ref<any[]>([])

  async function fetchMenus() {
    menuTree.value = await menuApi.getCurrentMenus()
  }

  return { menuTree, fetchMenus }
})
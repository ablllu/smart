import { useUserStore } from '../stores/user'

/**
 * 角色权限判断组合式函数
 * 原理：SUPER_ADMIN 自动通过所有检查，其余按角色字符串精确匹配
 */
export function useRole() {
  const userStore = useUserStore()

  /** 检查当前用户是否拥有指定角色之一 */
  function hasRole(...roles: string[]): boolean {
    if (!userStore.userInfo.role) return false
    // SUPER_ADMIN 通过所有检查
    if (userStore.userInfo.role === 'SUPER_ADMIN') return true
    return roles.includes(userStore.userInfo.role)
  }

  /** OPERATOR 级别及以上 */
  function isOperatorOrAbove(): boolean {
    return hasRole('SUPER_ADMIN', 'OPERATOR')
  }

  /** MERCHANT 级别及以上 */
  function isMerchantOrAbove(): boolean {
    return hasRole('SUPER_ADMIN', 'OPERATOR', 'MERCHANT')
  }

  /** 当前用户角色 */
  const currentRole = userStore.userInfo.role

  return { hasRole, isOperatorOrAbove, isMerchantOrAbove, currentRole }
}

export const GenderMap: Record<number, string> = {
  0: '未知', 1: '男', 2: '女'
}
// 会员等级
export const MemberLevelMap: Record<number, string> = {
  1: '普通会员', 2: '银牌会员', 3: '金牌会员'
}

export const OrderStatusMap: Record<number, { label: string; type: string }> = {
  0: { label: '待支付', type: 'warning' },
  1: { label: '待发货', type: 'primary' },
  2: { label: '已发货', type: 'info' },
  3: { label: '已完成', type: 'success' },
  4: { label: '已取消', type: 'danger' }
}

export const PayTypeMap: Record<number, string> = {
  1: '微信', 2: '支付宝', 3: '银行卡'
}

export const ProductStatusMap: Record<number, { label: string; type: string }> = {
  0: { label: '下架', type: 'info' },
  1: { label: '上架', type: 'success' }
}

/** 角色中文映射 */
export const RoleMap: Record<string, string> = {
  SUPER_ADMIN: '超级管理员',
  OPERATOR: '运营人员',
  MERCHANT: '商家',
  BUYER: '买家',
  CS: '客服'
}

/** 角色下拉选项 */
export const RoleOptions = [
  { label: '超级管理员', value: 'SUPER_ADMIN' },
  { label: '运营人员', value: 'OPERATOR' },
  { label: '商家', value: 'MERCHANT' },
  { label: '买家', value: 'BUYER' },
  { label: '客服', value: 'CS' }
] as const

/** 角色对应的 el-tag 类型 */
export function getRoleTagType(role: string): string {
  const map: Record<string, string> = {
    SUPER_ADMIN: 'danger',
    OPERATOR: 'warning',
    MERCHANT: 'primary',
    CS: 'success',
    BUYER: 'info'
  }
  return map[role] || 'info'
}
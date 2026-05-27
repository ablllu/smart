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
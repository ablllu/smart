import request from './request'

export function getOverview() {
  return request({ 
    url: '/admin/statistics/overview', 
    method: 'get' 
  })
}
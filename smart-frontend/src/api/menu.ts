import request from "./request";

export function getCurrentMenus() {
  return request({ 
    url: '/menus/current', 
    method: 'get' 
  })
}
import request from './request'

/**
 * 用户分页
 */
export function getUserPage(params: any) {
  return request({
    url: '/users/page',
    method: 'get',
    params
  })
}

/**
 * 新增用户
 */
export function addUser(data: any) {
  return request({
    url: '/users/create',
    method: 'post',
    data
  })
}

/**
 * 修改用户
 */
export function updateUser(data: any) {
  return request({
    url: `/users/${data.id}`,
    method: 'put',
    data
  })
}

/**
 * 删除用户
 */
export function deleteUser(id: number) {
  return request({
    url: `/users/${id}`,
    method: 'delete'
  })
}

/**
 * 导出用户
 */
export function exportUser() {

  return request({

    url: '/users/export/excel',

    method: 'get',

    responseType: 'blob'
  })
}

/**
 * 导入用户
 */
export function importUser(file: File) {

  const formData = new FormData()

  formData.append('file', file)

  return request({

    url: '/users/import/excel',

    method: 'post',

    headers: {

      'Content-Type': 'multipart/form-data'
    },

    data: formData
  })
}


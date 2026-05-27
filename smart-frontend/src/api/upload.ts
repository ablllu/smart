import request from './request'

/**
 * 上传文件
 */
export function uploadFile(file: File) {
  const formData = new FormData()
  formData.append('file', file)
  return request({
    url: '/upload/image',
    method: 'post',
    headers: { 'Content-Type': 'multipart/form-data' },
    data: formData
  })
}

export const uploadImage = uploadFile

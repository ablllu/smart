import axios from 'axios';
import { ElMessage } from 'element-plus';

const instance = axios.create({
  baseURL: '',
  timeout: 15000
});

// 请求拦截器：每个请求自动带上token
instance.interceptors.request.use((config) => {
    const token = localStorage.getItem('token')
    if (token) {
        config.headers['Authorization'] = token
    }
    return config
})

// 响应拦截器：解包后端的Result<T>包装
instance.interceptors.response.use(
    (response) => {
        const res = response.data

        // 如果响应类型是blob(文件流)，直接返回数据
        if(response.config.responseType === 'blob') {
            return response.data
        }
        if (res.code !== 200) {
            ElMessage.error(res.message || '请求失败')
            return Promise.reject(new Error(res.message))
        }
        return res.data
    },
    (error) => {
        if (error.response) {
            const status = error.response.status
            if (status === 401) {
                localStorage.removeItem('token')
                window.location.href = '/login'
                ElMessage.error('登录已过期，请重新登录')
            } else if (status === 403) {
                window.location.href = '/403'
                ElMessage.error('没有权限访问')
            } else {
                ElMessage.error('网络异常，请检查网络连接')
            }
        } else {
            ElMessage.error('网络异常，请检查网络连接')
        }
        return Promise.reject(error)
    }
)

// 包装函数，让返回类型为 Promise<any>
const request = (config: any): Promise<any> => instance(config)

export default request

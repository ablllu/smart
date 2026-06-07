import axios, { type AxiosRequestConfig } from 'axios'
import { ElMessage } from 'element-plus'

const instance = axios.create({
    baseURL: '',
    timeout: 15000
})

// 请求拦截器：每个请求自动带上token
instance.interceptors.request.use((config) => {
    const token = localStorage.getItem('shop_token')
    if(token) {
        config.headers['Authorization'] = token
    }
    return config
})

// 响应拦截器：解包后端的Result<T>包装
instance.interceptors.response.use(
    (res) => {
        const data = res.data
        if(data.code !== 200) {
            ElMessage.error(data.message || '请求失败')
            return Promise.reject(new Error(data.message))
        }
        return data.data
    },
    (error) => {
        ElMessage.error('网络异常，请检查网络连接')
        return Promise.reject(error)
    }
)

// 泛型包装函数：响应拦截器已解包为 data.data，此处将类型收窄为泛型 T
function request<T = any>(config: AxiosRequestConfig): Promise<T> {
    return instance(config) as Promise<T>
}

export default request
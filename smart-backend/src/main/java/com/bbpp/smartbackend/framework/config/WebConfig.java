package com.bbpp.smartbackend.framework.config;

import com.bbpp.smartbackend.framework.interceptor.LoginInterceptor;
import com.bbpp.smartbackend.framework.interceptor.MemberInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebConfig implements WebMvcConfigurer {

    private final LoginInterceptor loginInterceptor;
    private final MemberInterceptor memberInterceptor;

    public WebConfig(LoginInterceptor loginInterceptor, MemberInterceptor memberInterceptor) {
        this.loginInterceptor = loginInterceptor;
        this.memberInterceptor = memberInterceptor;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        // 添加登录拦截器
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns(
                        "/auth/login",
                        "/error",
                        "/uploads/**",
                        // 加入 Swagger 白名单
                        "/swagger-ui/**",
                        "/swagger-ui.html",
                        "/v3/api-docs/**",
                        "/api/**"
                );

        // 添加C端会员拦截器
        registry.addInterceptor(memberInterceptor)
                .addPathPatterns("/api/**")
                .excludePathPatterns(
                        "/api/product/**"  // 商品浏览公开
                );

    }


    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String path = System.getProperty("user.dir") + "/uploads/";

        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:"+path);
    }
}

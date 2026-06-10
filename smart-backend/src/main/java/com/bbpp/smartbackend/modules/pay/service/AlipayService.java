package com.bbpp.smartbackend.modules.pay.service;


import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.bbpp.smartbackend.framework.config.AlipayConfig;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Service
public class AlipayService {

    private final AlipayConfig alipayConfig;
    private AlipayClient alipayClient;
    public AlipayService(AlipayConfig alipayConfig) {
        this.alipayConfig = alipayConfig;
    }

    @PostConstruct
    public void init() {
        this.alipayClient = new DefaultAlipayClient(
                alipayConfig.getGateway(),
                alipayConfig.getAppId(),
                alipayConfig.getPrivateKey(),
                "json",
                "UTF-8",
                alipayConfig.getAlipayPublicKey(),
                "RSA2"
        );
    }

    /**
     * 生成 PC 端支付 HTML 页面
     * @param outTradeNo  商户订单号（你的 orderNo）
     * @param totalAmount 支付金额（元）
     * @param subject     商品描述
     * @return 支付宝返回的 HTML，给前端渲染
     */
    public String createPagePay(String outTradeNo, String totalAmount, String subject) throws AlipayApiException {
        // 创建【电脑网站支付】请求对象
        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();

        // 设置异步回调（支付宝后台通知你：支付成功）
        request.setNotifyUrl(alipayConfig.getNotifyUrl());

        // 设置同步跳转（支付成功后跳回你的页面）
        request.setReturnUrl(alipayConfig.getReturnUrl());

        // 组装订单参数（必须的 4 个）
        Map<String, Object> biz = new HashMap<>();
        biz.put("out_trade_no", outTradeNo);
        biz.put("total_amount", totalAmount);
        biz.put("subject", subject);
        biz.put("product_code", "FAST_INSTANT_TRADE_PAY");

        // 把参数转成 JSON 格式（支付宝要求）
        request.setBizContent(new JSONObject(biz).toString());

        // 执行请求 → 生成支付宝支付表单/链接 → 返回给前端
        return alipayClient.pageExecute(request).getBody();
    }

    /**
     * 验签：验证支付宝异步通知是否合法
     */
    public boolean verifySign(Map<String, String> params) throws AlipayApiException {
        return AlipaySignature.rsaCheckV1(params, alipayConfig.getAlipayPublicKey(), "UTF-8", "RSA2");
    }
}

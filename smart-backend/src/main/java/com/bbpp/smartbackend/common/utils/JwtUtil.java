package com.bbpp.smartbackend.common.utils;

import com.bbpp.smartbackend.common.properties.JwtProperties;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.stereotype.Component;

import java.util.Date;


@Component
public class JwtUtil {

    private final JwtProperties jwtProperties;

    public JwtUtil(JwtProperties jwtProperties) {
        this.jwtProperties = jwtProperties;
    }

    /**
     * 生成token
     * @param userId
     * @return
     */
    public String generateToken(Long userId, String username, String role) {

        return Jwts.builder()
                .setSubject("smart-backend")
                .claim("userId", userId)
                .claim("username", username)
                .claim("role", role)
                .setIssuedAt(new Date())
                .setExpiration(
                        new Date(System.currentTimeMillis() + jwtProperties.getExpire())
                )
                .signWith(
                        SignatureAlgorithm.HS256,
                        jwtProperties.getSecret()
                )
                .compact();
    }

    /**
     * 解析token
     * @param token
     * @return
     */
    public Claims parseToken(String token) {

        return Jwts.parser()
                .setSigningKey(jwtProperties.getSecret())
                .parseClaimsJws(token)
                .getBody();
    }
}

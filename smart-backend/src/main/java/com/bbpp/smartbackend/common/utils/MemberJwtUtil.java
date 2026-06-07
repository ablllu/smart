package com.bbpp.smartbackend.common.utils;


import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwt;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class MemberJwtUtil {

    @Value("${jwt.member.secret}")
    private String secret;

    @Value("${jwt.member.expire}")
    private long expire;

    public String generateToken(Long memberId, String username) {
        return Jwts.builder()
                .setSubject("smart-shop")
                .claim("memberId", memberId)
                .claim("username", username)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + expire))
                .signWith(SignatureAlgorithm.HS256, secret)
                .compact();
    }

    public Claims parseToken(String token) {
        return Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(token)
                .getBody();
    }
}

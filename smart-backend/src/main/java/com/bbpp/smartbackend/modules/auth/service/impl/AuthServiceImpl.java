package com.bbpp.smartbackend.modules.auth.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.bbpp.smartbackend.common.auth.LoginUser;
import com.bbpp.smartbackend.common.auth.UserContext;
import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.common.utils.JwtUtil;
import com.bbpp.smartbackend.common.utils.PasswordUtil;
import com.bbpp.smartbackend.common.utils.RedisUtils;
import com.bbpp.smartbackend.modules.auth.dto.LoginDTO;
import com.bbpp.smartbackend.modules.auth.service.AuthService;
import com.bbpp.smartbackend.modules.auth.vo.CurrentUserVO;
import com.bbpp.smartbackend.modules.auth.vo.LoginVO;
import com.bbpp.smartbackend.modules.user.entity.User;
import com.bbpp.smartbackend.modules.user.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class AuthServiceImpl implements AuthService {

    private final UserMapper userMapper;

    private final JwtUtil jwtUtil;

    private final RedisUtils redisUtils;

    public AuthServiceImpl(UserMapper userMapper,
                           JwtUtil jwtUtil,
                           RedisUtils redisUtils
    ) {
        this.userMapper = userMapper;
        this.jwtUtil = jwtUtil;
        this.redisUtils = redisUtils;
    }

    @Override
    public LoginVO login(LoginDTO dto) {

        log.info("用户尝试登录: {}", dto.getUsername());

        // 查询用户
        User user = userMapper.selectOne(
                new LambdaQueryWrapper<User>().eq(User::getUsername, dto.getUsername())
        );

        // 用户不存在
        if (user == null) {
            log.warn("用户不存在: {}", dto.getUsername());

            throw new BusinessException("用户不存在");
        }

        // 校验密码
        if(!PasswordUtil.matches(dto.getPassword(), user.getPassword())) {
            log.warn("密码错误: {}", dto.getUsername());

            throw new BusinessException(400, "用户名或密码错误");
        }

        // 校验状态
        if(user.getStatus() != null && user.getStatus() == 0) {
            log.warn("用户被禁用: {}", dto.getUsername());

            throw new BusinessException(403, "用户被禁用");
        }

        // 生成token
        String token = jwtUtil.generateToken(user.getId(), user.getUsername(), user.getRole());

        redisUtils.set("login:"+token, user.getId().toString(), 86400000L);
        log.info("用户登录成功: {}", dto.getUsername());

        return new LoginVO(user.getId(), user.getUsername(), user.getNickname(), token);
    }


    @Override
    public CurrentUserVO me() {

        // 获取当前登录用户
        LoginUser loginUser = UserContext.get();

        if(loginUser ==  null) {
            throw new BusinessException(401, "未登录");
        }

        // 查询数据库
        User user = userMapper.selectById(loginUser.getUserId());

        if(user == null) {
            throw new BusinessException(404, "用户不存在");
        }

        CurrentUserVO vo = new CurrentUserVO();

        vo.setUserId(user.getId());
        vo.setUsername(user.getUsername());
        vo.setNickname(user.getNickname());
        vo.setEmail(user.getEmail());
        vo.setPhone(user.getPhone());

        return vo;
    }

    @Override
    public void logout(String token) {

        redisUtils.delete("login:"+token);
    }
}

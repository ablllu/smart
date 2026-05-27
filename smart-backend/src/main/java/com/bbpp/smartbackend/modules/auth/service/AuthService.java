package com.bbpp.smartbackend.modules.auth.service;

import com.bbpp.smartbackend.modules.auth.dto.LoginDTO;
import com.bbpp.smartbackend.modules.auth.vo.CurrentUserVO;
import com.bbpp.smartbackend.modules.auth.vo.LoginVO;

public interface AuthService {

    LoginVO login(LoginDTO dto);

    CurrentUserVO me();

    void logout(String token);
}

package com.bbpp.smartbackend.modules.user.service;

import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.modules.user.dto.UserCreateDTO;
import com.bbpp.smartbackend.modules.user.dto.UserPageDTO;
import com.bbpp.smartbackend.modules.user.dto.UserUpdateDTO;
import com.bbpp.smartbackend.modules.user.entity.User;
import com.bbpp.smartbackend.modules.user.vo.UserDetailVO;
import com.bbpp.smartbackend.modules.user.vo.UserVO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface UserService {
    List<UserVO> listUsers();

    User getUserByUsername(String username);

    void createUser(UserCreateDTO dto);

    UserDetailVO getUserById(Long id);

    void updateUser(Long id, UserUpdateDTO dto);

    void deleteUser(Long id);

    PageResult<UserDetailVO> pageUsers(UserPageDTO dto);

    List<UserDetailVO> listAll();

    void importUsers(MultipartFile file) throws Exception;

    //void downloadImportTemplate(HttpServletResponse response) throws Exception;
}

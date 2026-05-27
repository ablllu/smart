package com.bbpp.smartbackend.modules.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bbpp.smartbackend.common.auth.LoginUser;
import com.bbpp.smartbackend.common.auth.UserContext;
import com.bbpp.smartbackend.common.exception.BusinessException;
import com.bbpp.smartbackend.common.page.PageResult;
import com.bbpp.smartbackend.common.utils.ExcelUtils;
import com.bbpp.smartbackend.common.utils.PasswordUtil;
import com.bbpp.smartbackend.common.utils.RedisUtils;
import com.bbpp.smartbackend.modules.user.dto.UserCreateDTO;
import com.bbpp.smartbackend.modules.user.dto.UserPageDTO;
import com.bbpp.smartbackend.modules.user.dto.UserUpdateDTO;
import com.bbpp.smartbackend.modules.user.entity.User;
import com.bbpp.smartbackend.modules.user.mapper.UserMapper;
import com.bbpp.smartbackend.modules.user.service.UserService;
import com.bbpp.smartbackend.modules.user.vo.UserDetailVO;
import com.bbpp.smartbackend.modules.user.vo.UserVO;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;

    private final RedisUtils redisUtils;

    public UserServiceImpl(
            UserMapper userMapper,
            RedisUtils redisUtils
    ) {
        this.userMapper = userMapper;
        this.redisUtils = redisUtils;
    }

    @Override
    public List<UserVO> listUsers() {
        List<User> users = userMapper.selectList(new QueryWrapper<>());

        //Entity -> VO
//      return users.stream().map(this::toVO).collect(Collectors.toList());
        List<UserVO> voList = new ArrayList<>();
        for (User user : users) {
            UserVO vo = toVO(user);
            voList.add(vo);
        }
        return voList;
    }

    //Entity -> UserVO
    private UserVO toVO(User user) {
        UserVO vo = new UserVO();

        vo.setId(user.getId());
        vo.setUsername(user.getUsername());
        vo.setNickname(user.getNickname());
        vo.setAvatar(user.getAvatar());
        return vo;
    }

    //Entity -> UserDetailVO
    private UserDetailVO toDetailVO(User user) {
        UserDetailVO detailVO = new UserDetailVO();
        detailVO.setId(user.getId());
        detailVO.setUsername(user.getUsername());
        detailVO.setNickname(user.getNickname());
        detailVO.setEmail(user.getEmail());
        detailVO.setPhone(user.getPhone());
        detailVO.setStatus(user.getStatus());
        detailVO.setCreateTime(user.getCreateTime());
        detailVO.setAvatar(user.getAvatar());

        return detailVO;
    }



    @Override
    public void createUser(UserCreateDTO dto) {
        User user = new User();

        //DTO -> Entity
        user.setUsername(dto.getUsername());
        user.setPassword(PasswordUtil.encode(dto.getPassword()));
        user.setNickname(dto.getNickname());
        user.setAvatar(dto.getAvatar());

        userMapper.insert(user);
    }

    @Override
    public User getUserByUsername(String username) {
        if (username == null || username.trim().isEmpty()) {
            throw new BusinessException(400, "用户名不能为空");
        }

        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username);
        User user = userMapper.selectOne(wrapper);

        if(user == null) {
            throw new BusinessException(404, "用户不存在");
        }

        return user;
    }

    @Override
    public UserDetailVO getUserById(Long id) {

        String key = "user:" + id;

        // 1. 查询缓存
        Object cache = redisUtils.get(key);

        if(cache != null) {
            if(cache.equals("NULL")) {
                throw new BusinessException(404, "用户不存在");
            }
            return (UserDetailVO) cache;
        }

        //2. 查询数据库
        User user = userMapper.selectById(id);
        if(user == null) {
            redisUtils.set(key, "NULL", 86400000L);
            throw new BusinessException(404, "用户不存在");
        }

        // 3. 转VO
        UserDetailVO vo = new UserDetailVO();
        vo.setId(user.getId());
        vo.setUsername(user.getUsername());
        vo.setNickname(user.getNickname());
        vo.setPhone(user.getPhone());
        vo.setEmail(user.getEmail());
        vo.setStatus(user.getStatus());

        return vo;
    }


    @Override
    public void updateUser(Long id, UserUpdateDTO dto) {

        User user = userMapper.selectById(id);

        if(user == null) {
            throw new BusinessException(404, "用户不存在");
        }

        //更新字段
        user.setPassword(PasswordUtil.encode(dto.getPassword()));
        user.setNickname(dto.getNickname());
        user.setPhone(dto.getPhone());
        user.setEmail(dto.getEmail());
        user.setStatus(dto.getStatus());
        user.setAvatar(dto.getAvatar());

        userMapper.updateById(user);

        redisUtils.delete(
                "user:" + id
        );
    }


    @Override
    public void deleteUser(Long id) {
        User user = userMapper.selectById(id);

        // 先更新 username，添加唯一后缀避免联合索引冲突
        String uniqueSuffix = "_del_" + System.currentTimeMillis() + "_" + id;
        user.setUsername(user.getUsername() + uniqueSuffix);
        userMapper.updateById(user);

        // 再调用 deleteById，让 MyBatis-Plus 自动执行逻辑删除（设置 deleted=1）
        userMapper.deleteById(id);

        redisUtils.delete(
                "user:" + id
        );
    }


    @Override
    public PageResult<UserDetailVO> pageUsers(UserPageDTO dto) {
        Page<User> page = new Page<>(dto.getPageNum(), dto.getPageSize());

        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();

        // 角色权限
        LoginUser loginUser = UserContext.get();
        // 非管理员只能查询自己
        if(!loginUser.getRole().equals("ADMIN")) {
            wrapper.eq(User::getId, loginUser.getUserId());
        }

        // 用户名模糊匹配
        wrapper.like(
                dto.getUsername() != null && !dto.getUsername().trim().isEmpty(),
                User::getUsername,
                dto.getUsername()
        );

        // 状态查询
        wrapper.eq(
                dto.getStatus() != null,
                User::getStatus,
                dto.getStatus()
        );

        // 按创建时间倒序
        wrapper.orderByDesc(User::getCreateTime);


        Page<User> userPage = userMapper.selectPage(page, wrapper);
        // 第二个参数如果传new QueryWrapper<>() 可以往里添加分页筛选条件

        //Entity -> VO
        List<UserDetailVO> records = userPage.getRecords().stream().map(this::toDetailVO).collect(Collectors.toList());

        return new PageResult<>(userPage.getTotal(),  records);
    }


    @Override
    public List<UserDetailVO> listAll() {

        List<User> users = userMapper.selectList(null);

        return users.stream().map(this::toDetailVO).collect(Collectors.toList());

    }

    @Override
    public void importUsers(MultipartFile file) throws   Exception{

        try(Workbook workbook = new XSSFWorkbook(file.getInputStream())) {
            Sheet sheet = workbook.getSheetAt(0);

            for(int i = 1; i <= sheet.getLastRowNum(); i++) {

                Row row = sheet.getRow(i);

                User user = new User();

                if(row.getCell(1) != null) {
                    user.setUsername(row.getCell(1).getStringCellValue());
                }

                if(row.getCell(2) != null) {
                    user.setNickname(row.getCell(2).getStringCellValue());
                }

                if(row.getCell(3) != null) {
                    user.setEmail(row.getCell(3).getStringCellValue());
                }

                if(row.getCell(4) != null) {
                    user.setPhone(row.getCell(4).getStringCellValue());
                }
                user.setPassword(PasswordUtil.encode("123456"));

                userMapper.insert(user);

            }
        } catch (Exception e) {
            throw new BusinessException(500, "Excel 导入失败: " + e.getMessage());
        }



    }
}

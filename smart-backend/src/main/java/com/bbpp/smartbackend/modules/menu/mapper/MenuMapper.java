package com.bbpp.smartbackend.modules.menu.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bbpp.smartbackend.modules.menu.entity.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MenuMapper extends BaseMapper<Menu> {

    @Select("SELECT menu_id FROM sys_role_menu WHERE role = #{role}")
    List<Long> selectMenuIdsByRole(String role);
}

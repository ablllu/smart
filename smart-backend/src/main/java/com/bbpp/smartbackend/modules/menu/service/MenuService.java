package com.bbpp.smartbackend.modules.menu.service;

import com.bbpp.smartbackend.modules.menu.vo.MenuVO;

import java.util.List;

public interface MenuService {

    List<MenuVO> getCurrentUserMenus();
}

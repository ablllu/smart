package com.bbpp.smartbackend.modules.menu.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.bbpp.smartbackend.common.auth.LoginUser;
import com.bbpp.smartbackend.common.auth.UserContext;
import com.bbpp.smartbackend.modules.menu.entity.Menu;
import com.bbpp.smartbackend.modules.menu.mapper.MenuMapper;
import com.bbpp.smartbackend.modules.menu.service.MenuService;
import com.bbpp.smartbackend.modules.menu.vo.MenuVO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    private final MenuMapper menuMapper;

    public MenuServiceImpl(MenuMapper menuMapper) {
        this.menuMapper = menuMapper;
    }

    @Override
    public List<MenuVO> getCurrentUserMenus() {
        LoginUser loginUser = UserContext.get();

        String role = loginUser.getRole();

        List<Long> menuIds = menuMapper.selectMenuIdsByRole(role);

        List<Menu> menus = menuMapper.selectBatchIds(menuIds);

        if(menuIds != null && !menuIds.isEmpty()) {
            menus = menuMapper.selectBatchIds(menuIds);
        }

        menus.sort(Comparator.comparingInt(Menu::getSortNum));

        return buildTree(menus, 0L);
    }

    private List<MenuVO> buildTree(List<Menu> menus, Long parentId) {

        List<MenuVO> list = new ArrayList<>();

        for(Menu menu: menus) {
            if(menu.getParentId().equals(parentId)) {

                MenuVO vo = new MenuVO();

                vo.setId(menu.getId());

                vo.setName(menu.getName());

                vo.setPath(menu.getPath());

                vo.setComponent(
                        menu.getComponent()
                );

                vo.setType(menu.getType());

                vo.setChildren(
                        buildTree(
                                menus,
                                menu.getId()
                        )
                );

                list.add(vo);

                vo.setSortNum(menu.getSortNum());
            }
        }

        return list;
    }
}

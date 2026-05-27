package com.bbpp.smartbackend.modules.menu.controller;


import com.bbpp.smartbackend.common.result.Result;
import com.bbpp.smartbackend.modules.menu.service.MenuService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/menus")
public class MenuController {

    private final MenuService menuService;

    public MenuController(MenuService menuService) {
        this.menuService = menuService;
    }

    @Operation(summary = "获取当前用户菜单")
    @GetMapping("/current")
    public Result<?> current() {

        return Result.success(menuService.getCurrentUserMenus());
    }
}

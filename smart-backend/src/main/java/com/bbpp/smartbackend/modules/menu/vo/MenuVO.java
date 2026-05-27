package com.bbpp.smartbackend.modules.menu.vo;

import lombok.Data;

import java.util.List;


@Data
public class MenuVO {

    private Long id;

    private String name;

    private String path;

    private String component;

    private Integer type;

    private List<MenuVO> children;
}

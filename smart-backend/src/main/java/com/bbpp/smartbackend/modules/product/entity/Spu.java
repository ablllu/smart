package com.bbpp.smartbackend.modules.product.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * SPU (Standard Product Unit) - 标准化产品单元
 * 定义：一组具有相同属性特征的商品集合（抽象概念）
 * id 商品id
 * name 商品名称
 * category_id 分类id
 * brand 商品品牌
 * description 商品描述
 * main_image 主图
 * images 商品图片
 * status 商品状态
 * sale_count 销量
 * create_time 创建时间
 * update_time 更新时间
 * deleted 逻辑删除
 */
@Data
@TableName("pms_spu")
public class Spu {

    private Long id;

    private String name;

    private Long categoryId;

    private String brand;

    private String description;

    private String mainImage;

    private String images;

    private Integer status;

    private Integer saleCount;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @TableLogic
    private Integer deleted;
}


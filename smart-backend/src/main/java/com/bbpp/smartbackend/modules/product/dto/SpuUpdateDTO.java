package com.bbpp.smartbackend.modules.product.dto;

import lombok.Data;

import java.util.List;


@Data
public class SpuUpdateDTO {

    private String name;

    private Long categoryId;

    private String brand;

    private String description;

    private String mainImage;

    private List< String> images;
}

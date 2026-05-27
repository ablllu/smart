package com.bbpp.smartbackend.modules.product.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class SpuPageDTO {

    private Integer pageNum = 1;

    private Integer pageSize = 10;

    private String name;

    private  Long categoryId;

    private Integer status;
}

-- ============================================
-- 电商后台管理系统 - 建表SQL
-- 数据库: smart_backend
-- ============================================

-- 1. 商品分类表
CREATE TABLE pms_category (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL COMMENT '分类名称',
    parent_id BIGINT DEFAULT 0 COMMENT '父分类ID，0为顶级',
    icon VARCHAR(255) COMMENT '图标',
    sort_num INT DEFAULT 0 COMMENT '排序',
    status TINYINT DEFAULT 1 COMMENT '0-禁用 1-启用',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted TINYINT DEFAULT 0 COMMENT '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品分类表';

-- 2. 商品SPU表
CREATE TABLE pms_spu (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL COMMENT '商品名称',
    category_id BIGINT NOT NULL COMMENT '分类ID',
    brand VARCHAR(100) COMMENT '品牌',
    description TEXT COMMENT '商品描述(富文本)',
    main_image VARCHAR(500) COMMENT '主图URL',
    images TEXT COMMENT '轮播图URL，JSON数组',
    status TINYINT DEFAULT 0 COMMENT '0-下架 1-上架 2-草稿',
    sale_count INT DEFAULT 0 COMMENT '销量',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted TINYINT DEFAULT 0 COMMENT '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品SPU表';

-- 3. 商品SKU表
CREATE TABLE pms_sku (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    spu_id BIGINT NOT NULL COMMENT 'SPU ID',
    sku_name VARCHAR(200) NOT NULL COMMENT 'SKU名称，如"红色/XL"',
    spec_info VARCHAR(500) COMMENT '规格信息JSON，如{"颜色":"红色","尺码":"XL"}',
    price DECIMAL(10,2) NOT NULL COMMENT '售价',
    original_price DECIMAL(10,2) COMMENT '原价/划线价',
    cost_price DECIMAL(10,2) COMMENT '成本价',
    stock INT NOT NULL DEFAULT 0 COMMENT '库存',
    locked_stock INT DEFAULT 0 COMMENT '锁定库存(下单未付款)',
    image VARCHAR(500) COMMENT 'SKU图片',
    status TINYINT DEFAULT 1 COMMENT '0-禁用 1-启用',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted TINYINT DEFAULT 0 COMMENT '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品SKU表';

-- 4. 会员表
CREATE TABLE ums_member (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL COMMENT '用户名',
    password VARCHAR(100) NOT NULL COMMENT '密码',
    nickname VARCHAR(50) COMMENT '昵称',
    phone VARCHAR(20) COMMENT '手机号',
    email VARCHAR(100) COMMENT '邮箱',
    avatar VARCHAR(500) COMMENT '头像',
    gender TINYINT DEFAULT 0 COMMENT '0-未知 1-男 2-女',
    birthday DATE COMMENT '生日',
    member_level TINYINT DEFAULT 1 COMMENT '会员等级',
    status TINYINT DEFAULT 1 COMMENT '0-禁用 1-启用',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted TINYINT DEFAULT 0 COMMENT '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员表';

-- 5. 收货地址表
CREATE TABLE ums_address (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    member_id BIGINT NOT NULL COMMENT '会员ID',
    name VARCHAR(50) NOT NULL COMMENT '收货人姓名',
    phone VARCHAR(20) NOT NULL COMMENT '收货人手机号',
    province VARCHAR(50) COMMENT '省',
    city VARCHAR(50) COMMENT '市',
    district VARCHAR(50) COMMENT '区',
    detail VARCHAR(200) COMMENT '详细地址',
    is_default TINYINT DEFAULT 0 COMMENT '是否默认地址',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted TINYINT DEFAULT 0 COMMENT '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收货地址表';

-- 6. 订单表
CREATE TABLE oms_order (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_no VARCHAR(32) NOT NULL COMMENT '订单号',
    member_id BIGINT NOT NULL COMMENT '会员ID',
    total_amount DECIMAL(10,2) NOT NULL COMMENT '订单总金额',
    pay_amount DECIMAL(10,2) NOT NULL COMMENT '实付金额',
    freight_amount DECIMAL(10,2) DEFAULT 0 COMMENT '运费',
    pay_type TINYINT COMMENT '1-微信 2-支付宝 3-银行卡',
    pay_time DATETIME COMMENT '支付时间',
    status TINYINT DEFAULT 0 COMMENT '0-待付款 1-待发货 2-待收货 3-已完成 4-已取消',
    receiver_name VARCHAR(50) COMMENT '收货人',
    receiver_phone VARCHAR(20) COMMENT '收货人手机',
    receiver_address VARCHAR(500) COMMENT '收货地址',
    remark VARCHAR(500) COMMENT '订单备注',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted TINYINT DEFAULT 0 COMMENT '逻辑删除',
    UNIQUE KEY uk_order_no (order_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- 7. 订单明细表
CREATE TABLE oms_order_item (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT NOT NULL COMMENT '订单ID',
    order_no VARCHAR(32) NOT NULL COMMENT '订单号',
    spu_id BIGINT NOT NULL COMMENT 'SPU ID',
    sku_id BIGINT NOT NULL COMMENT 'SKU ID',
    spu_name VARCHAR(200) COMMENT '商品名称',
    sku_name VARCHAR(200) COMMENT 'SKU名称',
    spec_info VARCHAR(500) COMMENT '规格信息',
    image VARCHAR(500) COMMENT '商品图片',
    price DECIMAL(10,2) NOT NULL COMMENT '单价',
    quantity INT NOT NULL COMMENT '数量',
    total_amount DECIMAL(10,2) NOT NULL COMMENT '小计',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    deleted TINYINT DEFAULT 0 COMMENT '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单明细表';
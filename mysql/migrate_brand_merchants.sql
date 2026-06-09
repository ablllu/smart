-- ============================================================
-- 迁移：按品牌创建商家账号，并将商品归属到对应商家
-- 执行前请确认数据库已有数据
-- 默认密码: 123456
-- BCrypt: $2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy
-- ============================================================

-- ----------------------------
-- 1. 创建品牌商家用户 (sys_user)
-- ----------------------------

-- 3C数码 - 手机
INSERT INTO `sys_user` VALUES (3000000000000000001, 'm_apple',        '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'Apple旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000002, 'm_huawei',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '华为旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000003, 'm_xiaomi',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '小米旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000004, 'm_oppo',         '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'OPPO旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000005, 'm_vivo',         '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'vivo旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000006, 'm_samsung',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '三星旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000007, 'm_honor',        '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '荣耀旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000008, 'm_oneplus',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '一加旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 3C数码 - 耳机/音箱
INSERT INTO `sys_user` VALUES (3000000000000000009, 'm_sony',         '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '索尼旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000010, 'm_bose',         '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'Bose旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000011, 'm_jbl',          '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'JBL旗舰店',      NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000012, 'm_marshall',     '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'Marshall旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 3C数码 - 配件/充电
INSERT INTO `sys_user` VALUES (3000000000000000013, 'm_anker',        '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'Anker旗舰店',    NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000014, 'm_baseus',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '倍思旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000015, 'm_romoss',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '罗马仕旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 3C数码 - 电脑
INSERT INTO `sys_user` VALUES (3000000000000000016, 'm_lenovo',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '联想旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000017, 'm_rog',          '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'ROG旗舰店',      NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000018, 'm_hp',           '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '惠普旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000019, 'm_dell',         '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '戴尔旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 3C数码 - 显示器/外设
INSERT INTO `sys_user` VALUES (3000000000000000020, 'm_lg',           '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'LG旗舰店',       NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000021, 'm_redmagic',     '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '红魔旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000022, 'm_logitech',     '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '罗技旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000023, 'm_steelseries',  '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '赛睿旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000024, 'm_keychron',     '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'Keychron旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000025, 'm_razer',        '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '雷蛇旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 家电 - 空调
INSERT INTO `sys_user` VALUES (3000000000000000026, 'm_gree',         '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '格力旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000027, 'm_midea',        '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '美的旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000028, 'm_haier',        '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '海尔旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 家电 - 洗衣机/冰箱
INSERT INTO `sys_user` VALUES (3000000000000000029, 'm_littleswan',   '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '小天鹅旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000030, 'm_siemens',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '西门子旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000031, 'm_ronshen',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '容声旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000032, 'm_casarte',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '卡萨帝旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 家电 - 厨房小电器
INSERT INTO `sys_user` VALUES (3000000000000000033, 'm_supor',        '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '苏泊尔旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000034, 'm_philips',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '飞利浦旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000035, 'm_joyoung',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '九阳旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 家电 - 扫地机器人
INSERT INTO `sys_user` VALUES (3000000000000000036, 'm_roborock',     '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '石头旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000037, 'm_ecovacs',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '科沃斯旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000038, 'm_dreame',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '追觅旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 家电 - 电视
INSERT INTO `sys_user` VALUES (3000000000000000039, 'm_tcl',          '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'TCL旗舰店',      NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000040, 'm_hisense',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '海信旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 服饰 - 女装
INSERT INTO `sys_user` VALUES (3000000000000000041, 'm_eifini',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '伊芙丽旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000042, 'm_peacebird',    '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '太平鸟旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 服饰 - 男装
INSERT INTO `sys_user` VALUES (3000000000000000043, 'm_uniqlo',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '优衣库旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000044, 'm_semir',        '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '森马旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000045, 'm_heilanhome',   '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '海澜之家旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000046, 'm_toread',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '探路者旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000047, 'm_baoxiniao',    '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '报喜鸟旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000048, 'm_vancl',        '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '凡客诚品旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 服饰 - 运动鞋
INSERT INTO `sys_user` VALUES (3000000000000000049, 'm_nike',         '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'Nike旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000050, 'm_adidas',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'Adidas旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000051, 'm_qiaodan',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '乔丹旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 箱包
INSERT INTO `sys_user` VALUES (3000000000000000052, 'm_tumi',         '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'TUMI旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 美妆护肤
INSERT INTO `sys_user` VALUES (3000000000000000053, 'm_hr',           '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '赫莲娜旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000054, 'm_proya',        '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '珀莱雅旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000055, 'm_fuerjia',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '敷尔佳旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000056, 'm_chando',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '自然堂旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 美妆 - 彩妆
INSERT INTO `sys_user` VALUES (3000000000000000057, 'm_givenchy',     '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '纪梵希旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000058, 'm_lancome',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '兰蔻旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000059, 'm_perfectdiary', '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '完美日记旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 食品 - 生鲜/坚果
INSERT INTO `sys_user` VALUES (3000000000000000060, 'm_chanzhifashi', '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '产地直发旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000061, 'm_3squirrels',   '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '三只松鼠旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000062, 'm_bestore',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '良品铺子旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000063, 'm_bcfood',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '百草味旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 食品 - 酒水/咖啡
INSERT INTO `sys_user` VALUES (3000000000000000064, 'm_moutai',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '贵州茅台旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000065, 'm_saturnbird',   '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '三顿半旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 家具
INSERT INTO `sys_user` VALUES (3000000000000000066, 'm_yuanshimuyu',  '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '源氏木语旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000067, 'm_kuka',         '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '顾家家居旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000068, 'm_derucci',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '慕思旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 运动户外
INSERT INTO `sys_user` VALUES (3000000000000000069, 'm_shuhua',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '舒华旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000070, 'm_keep',         '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'Keep旗舰店',     NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000071, 'm_naturehike',   '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', 'NatureHike旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000072, 'm_mobigarden',   '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '牧高笛旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 宠物
INSERT INTO `sys_user` VALUES (3000000000000000073, 'm_yanxuan',      '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '网易严选旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000074, 'm_royalcanin',   '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '皇家宠物食品旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000075, 'm_purena',       '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '伯纳天纯旗舰店', NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);

-- 珠宝
INSERT INTO `sys_user` VALUES (3000000000000000076, 'm_chowtaifook',  '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '周大福旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);
INSERT INTO `sys_user` VALUES (3000000000000000077, 'm_laofengxiang', '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcioT0lQTz8wy', '老凤祥旗舰店',   NULL, NULL, 1, now(), 'MERCHANT', 0, now(), NULL);


-- ----------------------------
-- 2. 商品归属到对应商家 (UPDATE pms_spu SET merchant_id)
-- ----------------------------

-- Apple (id=1,13,17,22,34)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000001 WHERE `id` IN (1,13,17,22,34,2057691866230591489,2057693667856125953);

-- 华为 (id=2,9,14,18,27,35)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000002 WHERE `id` IN (2,9,14,18,27,35);

-- 小米 (id=3,11,15,19,30,31,37,66,81)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000003 WHERE `id` IN (3,11,15,19,30,31,37,66,81);

-- OPPO (id=4,12,16,20)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000004 WHERE `id` IN (4,12,16,20);

-- vivo (id=5)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000005 WHERE `id` = 5;

-- Samsung (id=6)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000006 WHERE `id` = 6;

-- 荣耀 (id=7,10)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000007 WHERE `id` IN (7,10);

-- 一加 (id=8)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000008 WHERE `id` = 8;

-- Sony (id=21,23)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000009 WHERE `id` IN (21,23);

-- Bose (id=24)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000010 WHERE `id` = 24;

-- JBL (id=25)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000011 WHERE `id` = 25;

-- Marshall (id=26)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000012 WHERE `id` = 26;

-- Anker (id=28,33)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000013 WHERE `id` IN (28,33);

-- 倍思 (id=29)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000014 WHERE `id` = 29;

-- 罗马仕 (id=32)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000015 WHERE `id` = 32;

-- 联想 (id=36,39)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000016 WHERE `id` IN (36,39);

-- ROG (id=38)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000017 WHERE `id` = 38;

-- 惠普 (id=40)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000018 WHERE `id` = 40;

-- Dell (id=41)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000019 WHERE `id` = 41;

-- LG (id=42)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000020 WHERE `id` = 42;

-- 红魔 (id=43)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000021 WHERE `id` = 43;

-- Logitech (id=44,47,48)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000022 WHERE `id` IN (44,47,48);

-- SteelSeries (id=45)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000023 WHERE `id` = 45;

-- Keychron (id=46)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000024 WHERE `id` = 46;

-- Razer (id=49)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000025 WHERE `id` = 49;

-- 格力 (id=50)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000026 WHERE `id` = 50;

-- 美的 (id=51,58,60)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000027 WHERE `id` IN (51,58,60);

-- 海尔 (id=52,54)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000028 WHERE `id` IN (52,54);

-- 小天鹅 (id=53)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000029 WHERE `id` = 53;

-- 西门子 (id=55)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000030 WHERE `id` = 55;

-- 容声 (id=56)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000031 WHERE `id` = 56;

-- 卡萨帝 (id=57)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000032 WHERE `id` = 57;

-- 苏泊尔 (id=59)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000033 WHERE `id` = 59;

-- 飞利浦 (id=61)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000034 WHERE `id` = 61;

-- 九阳 (id=62)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000035 WHERE `id` = 62;

-- 石头 (id=63)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000036 WHERE `id` = 63;

-- 科沃斯 (id=64)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000037 WHERE `id` = 64;

-- 追觅 (id=65)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000038 WHERE `id` = 65;

-- TCL (id=67)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000039 WHERE `id` = 67;

-- 海信 (id=68)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000040 WHERE `id` = 68;

-- 伊芙丽 (id=69)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000041 WHERE `id` = 69;

-- 太平鸟 (id=70)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000042 WHERE `id` = 70;

-- 优衣库 (id=71)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000043 WHERE `id` = 71;

-- 森马 (id=72)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000044 WHERE `id` = 72;

-- 海澜之家 (id=73)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000045 WHERE `id` = 73;

-- 探路者 (id=74,82)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000046 WHERE `id` IN (74,82);

-- 报喜鸟 (id=75)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000047 WHERE `id` = 75;

-- 凡客诚品 (id=76)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000048 WHERE `id` = 76;

-- Nike (id=77)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000049 WHERE `id` = 77;

-- Adidas (id=78)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000050 WHERE `id` = 78;

-- 乔丹 (id=79)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000051 WHERE `id` = 79;

-- TUMI (id=80)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000052 WHERE `id` = 80;

-- 赫莲娜 (id=83)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000053 WHERE `id` = 83;

-- 珀莱雅 (id=84)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000054 WHERE `id` = 84;

-- 敷尔佳 (id=85)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000055 WHERE `id` = 85;

-- 自然堂 (id=86)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000056 WHERE `id` = 86;

-- 纪梵希 (id=87)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000057 WHERE `id` = 87;

-- 兰蔻 (id=88)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000058 WHERE `id` = 88;

-- 完美日记 (id=89)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000059 WHERE `id` = 89;

-- 产地直发 (id=90,91)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000060 WHERE `id` IN (90,91);

-- 三只松鼠 (id=92)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000061 WHERE `id` = 92;

-- 良品铺子 (id=93)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000062 WHERE `id` = 93;

-- 百草味 (id=94)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000063 WHERE `id` = 94;

-- 贵州茅台 (id=96)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000064 WHERE `id` = 96;

-- 三顿半 (id=97)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000065 WHERE `id` = 97;

-- 源氏木语 (id=98,100)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000066 WHERE `id` IN (98,100);

-- 顾家家居 (id=99)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000067 WHERE `id` = 99;

-- 慕思 (id=101)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000068 WHERE `id` = 101;

-- 舒华 (id=102)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000069 WHERE `id` = 102;

-- Keep (id=103)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000070 WHERE `id` = 103;

-- NatureHike (id=104)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000071 WHERE `id` = 104;

-- 牧高笛 (id=105)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000072 WHERE `id` = 105;

-- 网易严选 (id=106)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000073 WHERE `id` = 106;

-- 皇家 (id=107,109)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000074 WHERE `id` IN (107,109);

-- 伯纳天纯 (id=108)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000075 WHERE `id` = 108;

-- 周大福 (id=110)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000076 WHERE `id` = 110;

-- 老凤祥 (id=111)
UPDATE `pms_spu` SET `merchant_id` = 3000000000000000077 WHERE `id` = 111;

/*
 Navicat Premium Dump SQL

 Source Server         : smart
 Source Server Type    : MySQL
 Source Server Version : 80045 (8.0.45)
 Source Host           : localhost:3306
 Source Schema         : smart_backend

 Target Server Type    : MySQL
 Target Server Version : 80045 (8.0.45)
 File Encoding         : 65001

 Date: 09/06/2026 22:32:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for merchant_shop
-- ----------------------------
DROP TABLE IF EXISTS `merchant_shop`;
CREATE TABLE `merchant_shop`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '关联sys_user.id',
  `shop_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺名称',
  `logo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺Logo URL',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺简介',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客服电话',
  `rating` decimal(2, 1) NULL DEFAULT 5.0 COMMENT '店铺评分',
  `status` tinyint NULL DEFAULT 1 COMMENT '0-关闭 1-营业',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商家店铺表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchant_shop
-- ----------------------------
INSERT INTO `merchant_shop` VALUES (1, 2062441501356679170, '默认店铺', NULL, NULL, NULL, 5.0, 1, '2026-06-09 22:22:17', '2026-06-09 22:22:17');

-- ----------------------------
-- Table structure for oms_cart
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart`;
CREATE TABLE `oms_cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NOT NULL,
  `spu_id` bigint NOT NULL,
  `sku_id` bigint NOT NULL,
  `quantity` int NOT NULL DEFAULT 1,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member`(`member_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_cart
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `member_id` bigint NOT NULL COMMENT '会员ID',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NOT NULL COMMENT '实付金额',
  `freight_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '运费',
  `pay_type` tinyint NULL DEFAULT NULL COMMENT '1-微信 2-支付宝 3-银行卡',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `status` tinyint NULL DEFAULT 0 COMMENT '0-待付款 1-待发货 2-待收货 3-已完成 4-已取消',
  `receiver_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货人',
  `receiver_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货人手机',
  `receiver_address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货地址',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  `merchant_id` bigint NULL DEFAULT NULL COMMENT '商家用户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_no`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2063497202405371907 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES (1, '20260522000000001', 1, 12999.00, 12999.00, 0.00, NULL, NULL, 4, '张三', '13800001111', '广东省深圳市南山区科技园路1号', '请尽快发货', '2026-05-22 09:30:00', '2026-05-22 23:37:51', 0, NULL);
INSERT INTO `oms_order` VALUES (2, '20260522000000002', 2, 16998.00, 16998.00, 0.00, 1, '2026-05-22 10:00:00', 2, '李四', '13900002222', '北京市朝阳区望京SOHO T1 10F', '送礼用，请包装好', '2026-05-22 09:45:00', '2026-05-22 23:37:51', 0, NULL);
INSERT INTO `oms_order` VALUES (3, '20260522000000003', 3, 5699.00, 5699.00, 10.00, 2, '2026-05-21 15:30:00', 2, '王五', '13700003333', '上海市浦东新区张江高科技园区', '', '2026-05-21 15:20:00', '2026-05-22 23:37:51', 0, NULL);
INSERT INTO `oms_order` VALUES (4, '20260521000000004', 1, 6999.00, 6999.00, 0.00, 1, '2026-05-21 08:00:00', 3, '张三', '13800001111', '广东省深圳市南山区科技园路1号', '', '2026-05-21 07:50:00', '2026-05-22 23:37:51', 0, NULL);
INSERT INTO `oms_order` VALUES (5, '20260520000000005', 2, 14248.00, 14248.00, 0.00, 3, NULL, 4, '李四', '13900002222', '北京市朝阳区望京SOHO T1 10F', '不想要了', '2026-05-20 12:00:00', '2026-05-22 23:37:51', 0, NULL);
INSERT INTO `oms_order` VALUES (2062893987867553794, '202606050667228077', 2062847231003889666, 18997.00, 18997.00, 0.00, NULL, NULL, 4, NULL, NULL, NULL, NULL, '2026-06-05 21:47:08', '2026-06-05 21:47:08', 0, NULL);
INSERT INTO `oms_order` VALUES (2062894816007741441, '202606050667425522', 2062847231003889666, 6999.00, 6999.00, 0.00, NULL, '2026-06-05 21:50:35', 1, NULL, NULL, NULL, NULL, '2026-06-05 21:50:26', '2026-06-05 21:50:26', 0, NULL);
INSERT INTO `oms_order` VALUES (2062912817461387265, '202606050671717405', 2062847231003889666, 8999.00, 8999.00, 0.00, NULL, NULL, 4, NULL, NULL, NULL, NULL, '2026-06-05 23:01:57', '2026-06-05 23:01:57', 0, NULL);
INSERT INTO `oms_order` VALUES (2063497202405371906, '202606070811045632', 2062847231003889666, 8999.00, 8999.00, 0.00, NULL, '2026-06-07 13:44:09', 3, NULL, NULL, NULL, NULL, '2026-06-07 13:44:06', '2026-06-07 13:44:06', 0, NULL);

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `spu_id` bigint NOT NULL COMMENT 'SPU ID',
  `sku_id` bigint NOT NULL COMMENT 'SKU ID',
  `spu_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品名称',
  `sku_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SKU名称',
  `spec_info` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格信息',
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商品图片',
  `price` decimal(10, 2) NOT NULL COMMENT '单价',
  `quantity` int NOT NULL COMMENT '数量',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '小计',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2063497202405371908 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
INSERT INTO `oms_order_item` VALUES (1, 1, '20260522000000001', 1, 4, 'iPhone 16 Pro Max', '原色/1TB', '{\"颜色\":\"原色\",\"存储\":\"1TB\"}', '', 12999.00, 1, 12999.00, '2026-05-22 23:37:51', 0);
INSERT INTO `oms_order_item` VALUES (2, 2, '20260522000000002', 1, 1, 'iPhone 16 Pro Max', '黑色/256GB', '{\"颜色\":\"黑色\",\"存储\":\"256GB\"}', '', 8999.00, 1, 8999.00, '2026-05-22 23:37:51', 0);
INSERT INTO `oms_order_item` VALUES (3, 2, '20260522000000002', 2, 6, '华为 Mate 70 Pro', '雅丹黑/1TB', '{\"颜色\":\"雅丹黑\",\"存储\":\"1TB\"}', '', 7999.00, 1, 7999.00, '2026-05-22 23:37:51', 0);
INSERT INTO `oms_order_item` VALUES (4, 3, '20260522000000003', 3, 9, '小米 15 Pro', '黑色/512GB', '{\"颜色\":\"黑色\",\"存储\":\"512GB\"}', '', 5699.00, 1, 5699.00, '2026-05-22 23:37:51', 0);
INSERT INTO `oms_order_item` VALUES (5, 4, '20260521000000004', 2, 7, '华为 Mate 70 Pro', '白沙银/512GB', '{\"颜色\":\"白沙银\",\"存储\":\"512GB\"}', '', 6999.00, 1, 6999.00, '2026-05-22 23:37:51', 0);
INSERT INTO `oms_order_item` VALUES (6, 5, '20260520000000005', 2, 5, '华为 Mate 70 Pro', '雅丹黑/512GB', '{\"颜色\":\"雅丹黑\",\"存储\":\"512GB\"}', '', 6999.00, 1, 6999.00, '2026-05-22 23:37:51', 0);
INSERT INTO `oms_order_item` VALUES (7, 5, '20260520000000005', 1, 3, 'iPhone 16 Pro Max', '原色/256GB', '{\"颜色\":\"原色\",\"存储\":\"256GB\"}', '', 8999.00, 1, 8999.00, '2026-05-22 23:37:51', 0);
INSERT INTO `oms_order_item` VALUES (2062893987896913921, 2062893987867553794, '202606050667228077', 1, 1, 'iPhone 16 Pro Max', '黑色/256GB', NULL, NULL, 8999.00, 1, 8999.00, '2026-06-05 21:47:08', 0);
INSERT INTO `oms_order_item` VALUES (2062893987896913922, 2062893987867553794, '202606050667228077', 3, 8, '小米 15 Pro', '白色/256GB', NULL, NULL, 4999.00, 2, 9998.00, '2026-06-05 21:47:08', 0);
INSERT INTO `oms_order_item` VALUES (2062894816007741442, 2062894816007741441, '202606050667425522', 2, 5, '华为 Mate 70 Pro', '雅丹黑/512GB', NULL, NULL, 6999.00, 1, 6999.00, '2026-06-05 21:50:25', 0);
INSERT INTO `oms_order_item` VALUES (2062912817461387266, 2062912817461387265, '202606050671717405', 1, 1, 'iPhone 16 Pro Max', '黑色/256GB', NULL, NULL, 8999.00, 1, 8999.00, '2026-06-05 23:01:57', 0);
INSERT INTO `oms_order_item` VALUES (2063497202405371907, 2063497202405371906, '202606070811045632', 1, 1, 'iPhone 16 Pro Max', '黑色/256GB', NULL, NULL, 8999.00, 1, 8999.00, '2026-06-07 13:44:05', 0);

-- ----------------------------
-- Table structure for oms_review
-- ----------------------------
DROP TABLE IF EXISTS `oms_review`;
CREATE TABLE `oms_review`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `spu_id` bigint NOT NULL COMMENT '商品SPU ID',
  `member_id` bigint NOT NULL COMMENT '会员ID',
  `rating` tinyint NOT NULL COMMENT '评分 1-5',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评价内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_spu_id`(`spu_id` ASC) USING BTREE,
  INDEX `idx_member_id`(`member_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2064353442916388866 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品评价表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_review
-- ----------------------------
INSERT INTO `oms_review` VALUES (2064353442916388865, 2063497202405371906, '202606070811045632', 1, 2062847231003889666, 5, '非常好', '2026-06-09 22:26:29', '2026-06-09 22:26:29', 0);

-- ----------------------------
-- Table structure for pms_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_category`;
CREATE TABLE `pms_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父分类ID，0为顶级',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `sort_num` int NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NULL DEFAULT 1 COMMENT '0-禁用 1-启用',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2057445280091111427 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_category
-- ----------------------------
INSERT INTO `pms_category` VALUES (1, '手机数码', 0, 'mobile', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (2, '电脑办公', 0, 'pc', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (3, '家用电器', 0, 'appliance', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (4, '服饰鞋包', 0, 'fashion', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (5, '美妆个护', 0, 'beauty', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (6, '食品生鲜', 0, 'food', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (7, '家具家装', 0, 'furniture', 7, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (8, '汽车用品', 0, 'car', 8, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (9, '母婴玩具', 0, 'baby', 9, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10, '图书文娱', 0, 'book', 10, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (11, '运动户外', 0, 'sport', 11, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (12, '珠宝配饰', 0, 'jewelry', 12, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (13, '医药健康', 0, 'medical', 13, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (14, '宠物生活', 0, 'pet', 14, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (15, '鲜花绿植', 0, 'flower', 15, 0, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (101, '智能手机', 1, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (102, '平板电脑', 1, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (103, '智能手表', 1, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (104, '手机配件', 1, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (105, '摄影摄像', 1, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (106, '智能穿戴', 1, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (107, '耳机音箱', 1, '', 7, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (201, '笔记本', 2, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (202, '台式机', 2, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (203, '显示器', 2, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (204, '电脑配件', 2, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (205, '外设装备', 2, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (206, '办公设备', 2, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (207, '网络设备', 2, '', 7, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (208, '游戏设备', 2, '', 8, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (301, '空调', 3, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (302, '洗衣机', 3, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (303, '冰箱', 3, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (304, '厨房电器', 3, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (305, '生活电器', 3, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (306, '个护电器', 3, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (307, '影音娱乐', 3, '', 7, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (401, '女装', 4, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (402, '男装', 4, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (403, '内衣配饰', 4, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (404, '鞋靴', 4, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (405, '箱包', 4, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (406, '童装', 4, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (501, '面部护肤', 5, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (502, '彩妆', 5, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (503, '香水', 5, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (504, '身体护理', 5, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (505, '口腔护理', 5, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (506, '洗发护发', 5, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (601, '新鲜水果', 6, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (602, '蔬菜蛋类', 6, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (603, '肉禽海鲜', 6, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (604, '牛奶乳品', 6, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (605, '零食小吃', 6, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (606, '茗茶酒饮', 6, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (607, '粮油调味', 6, '', 7, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (701, '客厅家具', 7, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (702, '卧室家具', 7, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (703, '书房家具', 7, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (704, '厨房卫浴', 7, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (705, '灯具照明', 7, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (706, '家装建材', 7, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (801, '车载电器', 8, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (802, '汽车装饰', 8, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (803, '安全出行', 8, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (804, '美容养护', 8, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (805, '维修配件', 8, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (901, '奶粉辅食', 9, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (902, '纸尿裤', 9, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (903, '童装童鞋', 9, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (904, '喂养用品', 9, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (905, '益智玩具', 9, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (906, '孕产用品', 9, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1001, '小说文学', 10, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1002, '少儿图书', 10, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1003, '教育考试', 10, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1004, '经管科技', 10, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1005, '生活艺术', 10, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1006, '音乐影视', 10, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1101, '运动服饰', 11, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1102, '运动鞋靴', 11, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1103, '健身器材', 11, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1104, '户外装备', 11, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1105, '骑行运动', 11, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1106, '垂钓用品', 11, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1201, '金银首饰', 12, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1202, '翡翠玉石', 12, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1203, '钟表', 12, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1204, '眼镜', 12, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1205, '发饰帽子', 12, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1301, '中西药品', 13, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1302, '保健品', 13, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1303, '医疗器械', 13, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1304, '隐形眼镜', 13, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1401, '猫粮狗粮', 14, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1402, '宠物零食', 14, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1403, '宠物玩具', 14, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1404, '宠物窝垫', 14, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1405, '猫砂洁具', 14, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1501, '鲜花', 15, '', 1, 0, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1502, '绿植盆栽', 15, '', 2, 0, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1503, '仿真花艺', 15, '', 3, 0, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1504, '园艺工具', 15, '', 4, 0, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10101, '5G手机', 101, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10102, '折叠屏手机', 101, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10103, '游戏手机', 101, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10104, '老人手机', 101, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:47:14', 1);
INSERT INTO `pms_category` VALUES (10401, '手机壳', 104, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10402, '充电器', 104, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10403, '数据线', 104, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10404, '手机膜', 104, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10405, '手机支架', 104, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10406, '充电宝', 104, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10501, '微单相机', 105, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10502, '单反相机', 105, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10503, '运动相机', 105, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10504, '无人机', 105, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10505, '镜头滤镜', 105, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10701, '真无线耳机', 107, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10702, '头戴式耳机', 107, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10703, '蓝牙音箱', 107, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10704, '智能音箱', 107, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (10705, '降噪耳机', 107, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20101, '轻薄本', 201, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20102, '游戏本', 201, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20103, '商务本', 201, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20104, '二合一平板', 201, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20401, '内存条', 204, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20402, '固态硬盘', 204, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20403, '机械硬盘', 204, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20404, '显卡', 204, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20405, '主板', 204, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20406, 'CPU处理器', 204, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20407, '电源', 204, '', 7, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20408, '机箱', 204, '', 8, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20501, '键盘', 205, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20502, '鼠标', 205, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20503, '鼠标垫', 205, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20504, '摄像头', 205, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20505, 'U盘', 205, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (20506, '移动硬盘', 205, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30101, '壁挂空调', 301, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30102, '柜式空调', 301, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30103, '中央空调', 301, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30104, '移动空调', 301, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30401, '电饭煲', 304, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30402, '微波炉', 304, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30403, '烤箱', 304, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30404, '电压力锅', 304, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30405, '空气炸锅', 304, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30406, '破壁机', 304, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30407, '电磁炉', 304, '', 7, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30408, '油烟机', 304, '', 8, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30409, '洗碗机', 304, '', 9, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30501, '扫地机器人', 305, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30502, '吸尘器', 305, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30503, '加湿器', 305, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30504, '电风扇', 305, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30505, '净水器', 305, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30701, '智能电视', 307, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30702, '投影仪', 307, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30703, '家庭影院', 307, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (30704, '音响功放', 307, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40101, '连衣裙', 401, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40102, 'T恤衫', 401, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40103, '外套大衣', 401, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40104, '裤装', 401, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40105, '半身裙', 401, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40106, '针织衫', 401, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40107, '卫衣', 401, '', 7, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40108, '西装', 401, '', 8, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40201, '夹克', 402, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40202, '衬衫', 402, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40203, 'T恤', 402, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40204, '休闲裤', 402, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40205, '牛仔裤', 402, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40206, '卫衣帽衫', 402, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40207, '西装西裤', 402, '', 7, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40208, '羽绒服', 402, '', 8, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40401, '运动鞋', 404, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40402, '休闲鞋', 404, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40403, '高跟鞋', 404, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40404, '皮鞋', 404, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40405, '凉鞋拖鞋', 404, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40406, '靴子', 404, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40501, '双肩包', 405, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40502, '单肩包', 405, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40503, '手提包', 405, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40504, '行李箱', 405, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (40505, '钱包卡包', 405, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (50101, '面霜', 501, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (50102, '精华液', 501, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (50103, '面膜', 501, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (50104, '爽肤水', 501, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (50105, '洁面乳', 501, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (50106, '眼霜', 501, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (50107, '防晒霜', 501, '', 7, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (50108, '卸妆', 501, '', 8, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (50201, '口红唇膏', 502, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (50202, '粉底液', 502, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (50203, '眼影', 502, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (50204, '眉笔眉粉', 502, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (50205, '腮红', 502, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (50206, '指甲油', 502, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60101, '苹果', 601, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60102, '柑橘橙柚', 601, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60103, '热带水果', 601, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60104, '葡萄提子', 601, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60105, '瓜类', 601, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60106, '进口水果', 601, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60301, '猪肉', 603, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60302, '牛肉', 603, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60303, '羊肉', 603, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60304, '鸡肉', 603, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60305, '海鲜水产', 603, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60306, '冷冻调理', 603, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60501, '坚果炒货', 605, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60502, '膨化食品', 605, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60503, '饼干糕点', 605, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60504, '糖果巧克力', 605, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60505, '蜜饯果干', 605, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60506, '肉干豆干', 605, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60601, '绿茶', 606, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60602, '红茶', 606, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60603, '白酒', 606, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60604, '红酒', 606, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60605, '啤酒', 606, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60606, '咖啡奶茶', 606, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (60607, '饮料果汁', 606, '', 7, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (70101, '沙发', 701, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (70102, '茶几', 701, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (70103, '电视柜', 701, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (70104, '鞋柜', 701, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (70201, '床', 702, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (70202, '床垫', 702, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (70203, '衣柜', 702, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (70204, '梳妆台', 702, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (70601, '地板', 706, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (70602, '瓷砖', 706, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (70603, '涂料', 706, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (70604, '卫浴洁具', 706, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (70605, '五金工具', 706, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (80101, '行车记录仪', 801, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (80102, '车载充电器', 801, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (80103, '车载吸尘器', 801, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (80104, '车载净化器', 801, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (80105, '车载冰箱', 801, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (90501, '积木拼插', 905, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (90502, '遥控模型', 905, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (90503, '毛绒玩具', 905, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (90504, '早教玩具', 905, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (90505, '儿童车', 905, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (110301, '跑步机', 1103, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (110302, '动感单车', 1103, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (110303, '哑铃杠铃', 1103, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (110304, '瑜伽用品', 1103, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (110305, '拉力带', 1103, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (110306, '腹肌轮', 1103, '', 6, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (110401, '帐篷', 1104, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (110402, '睡袋', 1104, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (110403, '登山杖', 1104, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (110404, '户外背包', 1104, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (110405, '户外炉具', 1104, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (120101, '黄金首饰', 1201, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (120102, '铂金首饰', 1201, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (120103, '银饰', 1201, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (120104, '钻石', 1201, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (120105, '婚戒', 1201, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (120301, '机械表', 1203, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (120302, '石英表', 1203, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (120303, '智能手表', 1203, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (120304, '挂钟座钟', 1203, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (140101, '猫粮', 1401, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (140102, '狗粮', 1401, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (140103, '猫罐头', 1401, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (140104, '狗罐头', 1401, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (150101, '玫瑰花束', 1501, '', 1, 0, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (150102, '百合花束', 1501, '', 2, 0, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (150103, '向日葵', 1501, '', 3, 0, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (150104, '康乃馨', 1501, '', 4, 0, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (150105, '混搭花束', 1501, '', 5, 0, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (2057445280091111426, '老人手机', 101, '', 4, 1, '2026-05-21 20:55:55', '2026-05-21 20:55:55', 0);

-- ----------------------------
-- Table structure for pms_sku
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku`;
CREATE TABLE `pms_sku`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `spu_id` bigint NOT NULL COMMENT 'SPU ID',
  `sku_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'SKU名称，如\"红色/XL\"',
  `spec_info` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格信息JSON，如{\"颜色\":\"红色\",\"尺码\":\"XL\"}',
  `price` decimal(10, 2) NOT NULL COMMENT '售价',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价/划线价',
  `cost_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '成本价',
  `stock` int NOT NULL DEFAULT 0 COMMENT '库存',
  `locked_stock` int NULL DEFAULT 0 COMMENT '锁定库存(下单未付款)',
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'SKU图片',
  `status` tinyint NULL DEFAULT 1 COMMENT '0-禁用 1-启用',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2057693667923234819 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品SKU表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_sku
-- ----------------------------
INSERT INTO `pms_sku` VALUES (1, 1, '黑色/256GB', '{\"颜色\":\"黑色\",\"存储\":\"256GB\"}', 8999.00, 9999.00, 7200.00, 500, 23, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (2, 1, '黑色/512GB', '{\"颜色\":\"黑色\",\"存储\":\"512GB\"}', 10499.00, 10999.00, 8400.00, 320, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (3, 1, '原色/256GB', '{\"颜色\":\"原色钛金属\",\"存储\":\"256GB\"}', 8999.00, 9999.00, 7200.00, 450, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (4, 1, '原色/1TB', '{\"颜色\":\"原色钛金属\",\"存储\":\"1TB\"}', 12999.00, 13999.00, 10400.00, 120, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (5, 2, '雅丹黑/512GB', '{\"颜色\":\"雅丹黑\",\"存储\":\"512GB\"}', 6999.00, 6999.00, 5600.00, 600, 30, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (6, 2, '雅丹黑/1TB', '{\"颜色\":\"雅丹黑\",\"存储\":\"1TB\"}', 7999.00, 7999.00, 6400.00, 250, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (7, 2, '羽砂白/512GB', '{\"颜色\":\"羽砂白\",\"存储\":\"512GB\"}', 6999.00, 6999.00, 5600.00, 380, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (8, 3, '白色/256GB', '{\"颜色\":\"白色\",\"存储\":\"256GB\"}', 4999.00, 5299.00, 3900.00, 700, 45, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (9, 3, '白色/512GB', '{\"颜色\":\"白色\",\"存储\":\"512GB\"}', 5699.00, 5999.00, 4500.00, 420, 20, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (10, 3, '黑色/512GB', '{\"颜色\":\"黑色\",\"存储\":\"512GB\"}', 5699.00, 5999.00, 4500.00, 380, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (11, 4, '黑色/256GB', '{\"颜色\":\"黑色\",\"存储\":\"256GB\"}', 5999.00, 6299.00, 4700.00, 330, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (12, 4, '黑色/512GB', '{\"颜色\":\"黑色\",\"存储\":\"512GB\"}', 6699.00, 6999.00, 5300.00, 200, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (13, 4, '棕色/512GB', '{\"颜色\":\"棕色\",\"存储\":\"512GB\"}', 6699.00, 6999.00, 5300.00, 180, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (14, 5, '星耀黑/256GB', '{\"颜色\":\"星耀黑\",\"存储\":\"256GB\"}', 4999.00, 4999.00, 3900.00, 410, 22, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (15, 5, '星耀黑/512GB', '{\"颜色\":\"星耀黑\",\"存储\":\"512GB\"}', 5699.00, 5699.00, 4500.00, 250, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (16, 5, '月光白/512GB', '{\"颜色\":\"月光白\",\"存储\":\"512GB\"}', 5699.00, 5699.00, 4500.00, 200, 7, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (17, 6, '钛灰/256GB', '{\"颜色\":\"钛灰\",\"存储\":\"256GB\"}', 8999.00, 9699.00, 7200.00, 150, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (18, 6, '钛灰/512GB', '{\"颜色\":\"钛灰\",\"存储\":\"512GB\"}', 10199.00, 10899.00, 8200.00, 100, 3, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (19, 6, '钛蓝/1TB', '{\"颜色\":\"钛蓝\",\"存储\":\"1TB\"}', 13199.00, 13899.00, 10600.00, 50, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (20, 7, '黑色/256GB', '{\"颜色\":\"黑色\",\"存储\":\"256GB\"}', 4499.00, 4799.00, 3500.00, 380, 16, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (21, 7, '黑色/512GB', '{\"颜色\":\"黑色\",\"存储\":\"512GB\"}', 5299.00, 5599.00, 4200.00, 220, 9, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (22, 7, '绿色/512GB', '{\"颜色\":\"绿色\",\"存储\":\"512GB\"}', 5299.00, 5599.00, 4200.00, 180, 6, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (23, 8, '砂岩黑/256GB', '{\"颜色\":\"砂岩黑\",\"存储\":\"256GB\"}', 4299.00, 4599.00, 3400.00, 350, 14, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (24, 8, '砂岩黑/512GB', '{\"颜色\":\"砂岩黑\",\"存储\":\"512GB\"}', 4999.00, 5299.00, 4000.00, 200, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (25, 8, '薄荷绿/512GB', '{\"颜色\":\"薄荷绿\",\"存储\":\"512GB\"}', 4999.00, 5299.00, 4000.00, 160, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (26, 9, '曜石黑/512GB', '{\"颜色\":\"曜石黑\",\"存储\":\"512GB\"}', 13999.00, 14999.00, 11200.00, 200, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (27, 9, '曜石黑/1TB', '{\"颜色\":\"曜石黑\",\"存储\":\"1TB\"}', 15999.00, 16999.00, 12800.00, 100, 3, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (28, 9, '羽砂金/1TB', '{\"颜色\":\"羽砂金\",\"存储\":\"1TB\"}', 15999.00, 16999.00, 12800.00, 80, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (29, 10, '黑色/512GB', '{\"颜色\":\"黑色\",\"存储\":\"512GB\"}', 8999.00, 9999.00, 7200.00, 180, 7, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (30, 10, '黑色/1TB', '{\"颜色\":\"黑色\",\"存储\":\"1TB\"}', 10999.00, 11999.00, 8800.00, 90, 4, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (31, 10, '紫色/1TB', '{\"颜色\":\"紫色\",\"存储\":\"1TB\"}', 10999.00, 11999.00, 8800.00, 70, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (32, 11, '黑色/512GB', '{\"颜色\":\"黑色\",\"存储\":\"512GB\"}', 7999.00, 8999.00, 6400.00, 160, 6, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (33, 11, '黑色/1TB', '{\"颜色\":\"黑色\",\"存储\":\"1TB\"}', 9999.00, 10999.00, 8000.00, 80, 3, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (34, 11, '金色/1TB', '{\"颜色\":\"金色\",\"存储\":\"1TB\"}', 9999.00, 10999.00, 8000.00, 60, 1, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (35, 12, '黑色/512GB', '{\"颜色\":\"黑色\",\"存储\":\"512GB\"}', 7499.00, 8299.00, 6000.00, 140, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (36, 12, '黑色/1TB', '{\"颜色\":\"黑色\",\"存储\":\"1TB\"}', 9299.00, 10299.00, 7400.00, 70, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (37, 12, '绿色/1TB', '{\"颜色\":\"绿色\",\"存储\":\"1TB\"}', 9299.00, 10299.00, 7400.00, 50, 1, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (38, 13, '午夜色/46mm GPS', '{\"颜色\":\"午夜色\",\"尺寸\":\"46mm\",\"版本\":\"GPS\"}', 3299.00, 3499.00, 2600.00, 400, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (39, 13, '午夜色/46mm 蜂窝', '{\"颜色\":\"午夜色\",\"尺寸\":\"46mm\",\"版本\":\"蜂窝\"}', 3999.00, 4199.00, 3200.00, 280, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (40, 13, '星光色/42mm GPS', '{\"颜色\":\"星光色\",\"尺寸\":\"42mm\",\"版本\":\"GPS\"}', 2999.00, 3199.00, 2400.00, 350, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (41, 13, '星光色/42mm 蜂窝', '{\"颜色\":\"星光色\",\"尺寸\":\"42mm\",\"版本\":\"蜂窝\"}', 3699.00, 3899.00, 2900.00, 220, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (42, 14, '幻夜黑/48mm', '{\"颜色\":\"幻夜黑\",\"尺寸\":\"48mm\"}', 2488.00, 2688.00, 1900.00, 500, 25, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (43, 14, '星云灰/48mm', '{\"颜色\":\"星云灰\",\"尺寸\":\"48mm\"}', 2488.00, 2688.00, 1900.00, 380, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (44, 14, '钛金属/48mm', '{\"颜色\":\"钛金属\",\"尺寸\":\"48mm\"}', 3288.00, 3488.00, 2600.00, 150, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (45, 15, '黑色', '{\"颜色\":\"黑色\"}', 1299.00, 1499.00, 1000.00, 600, 30, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (46, 15, '银色', '{\"颜色\":\"银色\"}', 1299.00, 1499.00, 1000.00, 450, 22, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (47, 15, '橙色', '{\"颜色\":\"橙色\"}', 1399.00, 1599.00, 1080.00, 320, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (48, 16, '曜石黑', '{\"颜色\":\"曜石黑\"}', 1999.00, 2199.00, 1550.00, 280, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (49, 16, '浮光金', '{\"颜色\":\"浮光金\"}', 1999.00, 2199.00, 1550.00, 200, 6, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (50, 16, '星云灰', '{\"颜色\":\"星云灰\"}', 1999.00, 2199.00, 1550.00, 180, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (51, 17, '白色', '{\"颜色\":\"白色\"}', 1899.00, 1999.00, 1450.00, 800, 50, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (52, 17, '黑色', '{\"颜色\":\"黑色\"}', 1899.00, 1999.00, 1450.00, 650, 35, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (53, 18, '陶瓷白', '{\"颜色\":\"陶瓷白\"}', 1199.00, 1299.00, 900.00, 700, 40, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (54, 18, '冰霜银', '{\"颜色\":\"冰霜银\"}', 1199.00, 1299.00, 900.00, 550, 28, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (55, 18, '星河蓝', '{\"颜色\":\"星河蓝\"}', 1199.00, 1299.00, 900.00, 420, 20, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (56, 19, '星耀黑', '{\"颜色\":\"星耀黑\"}', 699.00, 799.00, 520.00, 900, 55, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (57, 19, '薄荷绿', '{\"颜色\":\"薄荷绿\"}', 699.00, 799.00, 520.00, 700, 40, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (58, 19, '晴雪白', '{\"颜色\":\"晴雪白\"}', 699.00, 799.00, 520.00, 600, 30, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (59, 20, '黑色', '{\"颜色\":\"黑色\"}', 899.00, 999.00, 680.00, 450, 22, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (60, 20, '白色', '{\"颜色\":\"白色\"}', 899.00, 999.00, 680.00, 380, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (61, 21, '黑色', '{\"颜色\":\"黑色\"}', 1599.00, 1799.00, 1250.00, 320, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (62, 21, '铂金银', '{\"颜色\":\"铂金银\"}', 1599.00, 1799.00, 1250.00, 250, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (63, 22, '午夜色', '{\"颜色\":\"午夜色\"}', 4399.00, 4399.00, 3500.00, 200, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (64, 22, '星光色', '{\"颜色\":\"星光色\"}', 4399.00, 4399.00, 3500.00, 180, 6, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (65, 22, '橙色', '{\"颜色\":\"橙色\"}', 4399.00, 4399.00, 3500.00, 120, 3, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (66, 23, '黑色', '{\"颜色\":\"黑色\"}', 2299.00, 2499.00, 1800.00, 380, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (67, 23, '铂金银', '{\"颜色\":\"铂金银\"}', 2299.00, 2499.00, 1800.00, 280, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (68, 23, '午夜蓝', '{\"颜色\":\"午夜蓝\"}', 2399.00, 2599.00, 1900.00, 200, 7, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (69, 24, '黑色', '{\"颜色\":\"黑色\"}', 2999.00, 3299.00, 2400.00, 250, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (70, 24, '白色', '{\"颜色\":\"白色\"}', 2999.00, 3299.00, 2400.00, 200, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (71, 24, '砂岩白', '{\"颜色\":\"砂岩白\"}', 2999.00, 3299.00, 2400.00, 150, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (72, 25, '黑色', '{\"颜色\":\"黑色\"}', 599.00, 699.00, 450.00, 500, 30, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (73, 25, '蓝色', '{\"颜色\":\"蓝色\"}', 599.00, 699.00, 450.00, 420, 22, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (74, 25, '红色', '{\"颜色\":\"红色\"}', 599.00, 699.00, 450.00, 350, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (75, 25, '迷彩绿', '{\"颜色\":\"迷彩绿\"}', 649.00, 749.00, 490.00, 280, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (76, 26, '经典黑金', '{\"颜色\":\"经典黑金\"}', 999.00, 1099.00, 780.00, 320, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (77, 26, '奶油白', '{\"颜色\":\"奶油白\"}', 999.00, 1099.00, 780.00, 280, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (78, 27, '曜石黑', '{\"颜色\":\"曜石黑\"}', 499.00, 599.00, 380.00, 450, 25, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (79, 27, '云杉绿', '{\"颜色\":\"云杉绿\"}', 499.00, 599.00, 380.00, 350, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (80, 28, '黑色/单口', '{\"颜色\":\"黑色\",\"型号\":\"单口\"}', 199.00, 249.00, 150.00, 600, 35, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (81, 28, '黑色/三口', '{\"颜色\":\"黑色\",\"型号\":\"三口\"}', 279.00, 329.00, 210.00, 450, 25, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (82, 28, '白色/三口', '{\"颜色\":\"白色\",\"型号\":\"三口\"}', 279.00, 329.00, 210.00, 400, 20, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (83, 29, '黑色', '{\"颜色\":\"黑色\"}', 129.00, 149.00, 95.00, 800, 45, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (84, 29, '白色', '{\"颜色\":\"白色\"}', 129.00, 149.00, 95.00, 650, 35, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (85, 30, '黑色', '{\"颜色\":\"黑色\"}', 79.00, 99.00, 55.00, 500, 28, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (86, 30, '白色', '{\"颜色\":\"白色\"}', 79.00, 99.00, 55.00, 420, 20, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (87, 31, '黑色', '{\"颜色\":\"黑色\"}', 129.00, 149.00, 95.00, 700, 45, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (88, 31, '白色', '{\"颜色\":\"白色\"}', 129.00, 149.00, 95.00, 550, 30, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (89, 31, '蓝色', '{\"颜色\":\"蓝色\"}', 129.00, 149.00, 95.00, 380, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (90, 32, '曜石黑', '{\"颜色\":\"曜石黑\"}', 89.00, 109.00, 65.00, 900, 60, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (91, 32, '象牙白', '{\"颜色\":\"象牙白\"}', 89.00, 109.00, 65.00, 750, 45, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (92, 33, '黑色', '{\"颜色\":\"黑色\"}', 399.00, 459.00, 310.00, 280, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (93, 33, '白色', '{\"颜色\":\"白色\"}', 399.00, 459.00, 310.00, 200, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (94, 34, '午夜色/16GB/512GB', '{\"颜色\":\"午夜色\",\"内存\":\"16GB\",\"存储\":\"512GB\"}', 8999.00, 9499.00, 7200.00, 300, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (95, 34, '午夜色/24GB/1TB', '{\"颜色\":\"午夜色\",\"内存\":\"24GB\",\"存储\":\"1TB\"}', 11499.00, 11999.00, 9200.00, 150, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (96, 34, '星光色/16GB/512GB', '{\"颜色\":\"星光色\",\"内存\":\"16GB\",\"存储\":\"512GB\"}', 8999.00, 9499.00, 7200.00, 250, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (97, 34, '星光色/24GB/1TB', '{\"颜色\":\"星光色\",\"内存\":\"24GB\",\"存储\":\"1TB\"}', 11499.00, 11999.00, 9200.00, 120, 4, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (98, 35, '砚黑/16GB/1TB', '{\"颜色\":\"砚黑\",\"内存\":\"16GB\",\"存储\":\"1TB\"}', 8999.00, 9999.00, 7200.00, 200, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (99, 35, '砚黑/32GB/1TB', '{\"颜色\":\"砚黑\",\"内存\":\"32GB\",\"存储\":\"1TB\"}', 10999.00, 11999.00, 8800.00, 100, 3, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (100, 35, '皓月银/32GB/1TB', '{\"颜色\":\"皓月银\",\"内存\":\"32GB\",\"存储\":\"1TB\"}', 10999.00, 11999.00, 8800.00, 80, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (101, 36, '深灰/16GB/1TB', '{\"颜色\":\"深空灰\",\"内存\":\"16GB\",\"存储\":\"1TB\"}', 6999.00, 7499.00, 5500.00, 280, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (102, 36, '深灰/32GB/1TB', '{\"颜色\":\"深空灰\",\"内存\":\"32GB\",\"存储\":\"1TB\"}', 7999.00, 8499.00, 6400.00, 150, 6, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (103, 36, '银灰/32GB/2TB', '{\"颜色\":\"银灰色\",\"内存\":\"32GB\",\"存储\":\"2TB\"}', 8999.00, 9499.00, 7200.00, 80, 3, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (104, 37, '深空灰/16GB/1TB', '{\"颜色\":\"深空灰\",\"内存\":\"16GB\",\"存储\":\"1TB\"}', 5999.00, 6499.00, 4700.00, 250, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (105, 37, '深空灰/32GB/1TB', '{\"颜色\":\"深空灰\",\"内存\":\"32GB\",\"存储\":\"1TB\"}', 6999.00, 7499.00, 5500.00, 130, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (106, 37, '银色/32GB/2TB', '{\"颜色\":\"银色\",\"内存\":\"32GB\",\"存储\":\"2TB\"}', 7999.00, 8499.00, 6400.00, 70, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (107, 38, '黑色/16GB/1TB', '{\"颜色\":\"黑色\",\"内存\":\"16GB\",\"存储\":\"1TB\"}', 12999.00, 13999.00, 10500.00, 120, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (108, 38, '黑色/32GB/2TB', '{\"颜色\":\"黑色\",\"内存\":\"32GB\",\"存储\":\"2TB\"}', 15999.00, 16999.00, 12900.00, 60, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (109, 38, '月耀白/32GB/2TB', '{\"颜色\":\"月耀白\",\"内存\":\"32GB\",\"存储\":\"2TB\"}', 15999.00, 16999.00, 12900.00, 40, 1, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (110, 39, '钛晶灰/16GB/1TB', '{\"颜色\":\"钛晶灰\",\"内存\":\"16GB\",\"存储\":\"1TB\"}', 9999.00, 10999.00, 8000.00, 180, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (111, 39, '钛晶灰/32GB/2TB', '{\"颜色\":\"钛晶灰\",\"内存\":\"32GB\",\"存储\":\"2TB\"}', 12499.00, 13499.00, 10000.00, 90, 3, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (112, 39, '冰魄白/32GB/2TB', '{\"颜色\":\"冰魄白\",\"内存\":\"32GB\",\"存储\":\"2TB\"}', 12499.00, 13499.00, 10000.00, 70, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (113, 40, '暗影黑/16GB/1TB', '{\"颜色\":\"暗影黑\",\"内存\":\"16GB\",\"存储\":\"1TB\"}', 8999.00, 9499.00, 7200.00, 150, 7, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (114, 40, '暗影黑/32GB/2TB', '{\"颜色\":\"暗影黑\",\"内存\":\"32GB\",\"存储\":\"2TB\"}', 10999.00, 11499.00, 8800.00, 80, 3, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (115, 40, '魅影白/32GB/2TB', '{\"颜色\":\"魅影白\",\"内存\":\"32GB\",\"存储\":\"2TB\"}', 10999.00, 11499.00, 8800.00, 60, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (116, 41, '银色', '{\"颜色\":\"银色\"}', 23999.00, 24999.00, 19200.00, 30, 1, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (117, 41, '黑色', '{\"颜色\":\"黑色\"}', 23999.00, 24999.00, 19200.00, 25, 0, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (118, 42, '黑色', '{\"颜色\":\"黑色\"}', 3999.00, 4499.00, 3200.00, 150, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (119, 42, '白色', '{\"颜色\":\"白色\"}', 3999.00, 4499.00, 3200.00, 120, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (120, 43, '暗夜黑', '{\"颜色\":\"暗夜黑\"}', 3199.00, 3699.00, 2500.00, 180, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (121, 43, '银翼灰', '{\"颜色\":\"银翼灰\"}', 3199.00, 3699.00, 2500.00, 140, 6, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (122, 44, '石墨黑/全尺寸', '{\"颜色\":\"石墨黑\",\"尺寸\":\"全尺寸\"}', 699.00, 799.00, 520.00, 400, 20, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (123, 44, '珍珠白/全尺寸', '{\"颜色\":\"珍珠白\",\"尺寸\":\"全尺寸\"}', 699.00, 799.00, 520.00, 350, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (124, 44, '石墨黑/Mini', '{\"颜色\":\"石墨黑\",\"尺寸\":\"Mini\"}', 499.00, 599.00, 380.00, 300, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (125, 45, '黑色/英语', '{\"颜色\":\"黑色\",\"配列\":\"英语\"}', 1599.00, 1799.00, 1250.00, 200, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (126, 45, '黑色/中文', '{\"颜色\":\"黑色\",\"配列\":\"中文\"}', 1699.00, 1899.00, 1350.00, 150, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (127, 46, '碳黑/RGB/红轴', '{\"颜色\":\"碳黑\",\"背光\":\"RGB\",\"轴体\":\"红轴\"}', 829.00, 929.00, 650.00, 180, 9, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (128, 46, '碳黑/RGB/茶轴', '{\"颜色\":\"碳黑\",\"背光\":\"RGB\",\"轴体\":\"茶轴\"}', 829.00, 929.00, 650.00, 160, 7, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (129, 46, '银白/RGB/红轴', '{\"颜色\":\"银白\",\"背光\":\"RGB\",\"轴体\":\"红轴\"}', 829.00, 929.00, 650.00, 140, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (130, 46, '银白/RGB/茶轴', '{\"颜色\":\"银白\",\"背光\":\"RGB\",\"轴体\":\"茶轴\"}', 829.00, 929.00, 650.00, 120, 4, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (131, 47, '石墨黑', '{\"颜色\":\"石墨黑\"}', 799.00, 899.00, 600.00, 450, 22, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (132, 47, '珍珠白', '{\"颜色\":\"珍珠白\"}', 799.00, 899.00, 600.00, 350, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (133, 48, '黑色', '{\"颜色\":\"黑色\"}', 999.00, 1099.00, 780.00, 350, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (134, 48, '白色', '{\"颜色\":\"白色\"}', 999.00, 1099.00, 780.00, 280, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (135, 48, '品红', '{\"颜色\":\"品红\"}', 1099.00, 1199.00, 860.00, 180, 6, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (136, 49, '黑色', '{\"颜色\":\"黑色\"}', 999.00, 1099.00, 780.00, 300, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (137, 49, '白色', '{\"颜色\":\"白色\"}', 999.00, 1099.00, 780.00, 240, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (138, 50, '皓雪白/1.5匹', '{\"颜色\":\"皓雪白\",\"匹数\":\"1.5匹\"}', 3299.00, 3699.00, 2600.00, 280, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (139, 50, '奢华金/1.5匹', '{\"颜色\":\"奢华金\",\"匹数\":\"1.5匹\"}', 3499.00, 3899.00, 2800.00, 180, 6, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (140, 50, '皓雪白/大1.5匹', '{\"颜色\":\"皓雪白\",\"匹数\":\"大1.5匹\"}', 3699.00, 4099.00, 2900.00, 200, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (141, 51, '冰莹白/1.5匹', '{\"颜色\":\"冰莹白\",\"匹数\":\"1.5匹\"}', 2999.00, 3399.00, 2400.00, 320, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (142, 51, '冰莹白/大1.5匹', '{\"颜色\":\"冰莹白\",\"匹数\":\"大1.5匹\"}', 3399.00, 3799.00, 2700.00, 220, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (143, 51, '鎏金咖/大1.5匹', '{\"颜色\":\"鎏金咖\",\"匹数\":\"大1.5匹\"}', 3599.00, 3999.00, 2850.00, 150, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (144, 52, '白色/1.5匹', '{\"颜色\":\"白色\",\"匹数\":\"1.5匹\"}', 2799.00, 3099.00, 2200.00, 350, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (145, 52, '白色/大1.5匹', '{\"颜色\":\"白色\",\"匹数\":\"大1.5匹\"}', 3199.00, 3499.00, 2500.00, 250, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (146, 53, '巴赫银', '{\"颜色\":\"巴赫银\"}', 3999.00, 4599.00, 3200.00, 220, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (147, 53, '深空灰', '{\"颜色\":\"深空灰\"}', 3999.00, 4599.00, 3200.00, 180, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (148, 54, '星蕴银', '{\"颜色\":\"星蕴银\"}', 3299.00, 3799.00, 2600.00, 280, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (149, 54, '玉墨银', '{\"颜色\":\"玉墨银\"}', 3499.00, 3999.00, 2800.00, 200, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (150, 55, '白色', '{\"颜色\":\"白色\"}', 5999.00, 6499.00, 4800.00, 150, 6, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (151, 55, '银色', '{\"颜色\":\"银色\"}', 5999.00, 6499.00, 4800.00, 120, 4, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (152, 56, '星蕴银/513L', '{\"颜色\":\"星蕴银\",\"容量\":\"513L\"}', 4299.00, 4999.00, 3500.00, 200, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (153, 56, '星河银/513L', '{\"颜色\":\"星河银\",\"容量\":\"513L\"}', 4499.00, 5199.00, 3700.00, 150, 6, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (154, 57, '原石冰极/555L', '{\"颜色\":\"原石冰极\",\"容量\":\"555L\"}', 10999.00, 12999.00, 8800.00, 80, 3, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (155, 57, '晶钻紫/555L', '{\"颜色\":\"晶钻紫\",\"容量\":\"555L\"}', 10999.00, 12999.00, 8800.00, 60, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (156, 58, '莫兰迪灰/508L', '{\"颜色\":\"莫兰迪灰\",\"容量\":\"508L\"}', 5999.00, 6999.00, 4800.00, 160, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (157, 58, '锦绣金/508L', '{\"颜色\":\"锦绣金\",\"容量\":\"508L\"}', 6299.00, 7299.00, 5000.00, 120, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (158, 59, '深棕色/4L', '{\"颜色\":\"深棕色\",\"容量\":\"4L\"}', 499.00, 599.00, 380.00, 500, 30, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (159, 59, '香槟金/4L', '{\"颜色\":\"香槟金\",\"容量\":\"4L\"}', 499.00, 599.00, 380.00, 400, 22, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (160, 60, '星耀黑/3L', '{\"颜色\":\"星耀黑\",\"容量\":\"3L\"}', 699.00, 799.00, 540.00, 380, 20, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (161, 60, '珍珠白/3L', '{\"颜色\":\"珍珠白\",\"容量\":\"3L\"}', 699.00, 799.00, 540.00, 300, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (162, 61, '黑色/6.2L', '{\"颜色\":\"黑色\",\"容量\":\"6.2L\"}', 899.00, 1099.00, 700.00, 350, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (163, 61, '白色/6.2L', '{\"颜色\":\"白色\",\"容量\":\"6.2L\"}', 899.00, 1099.00, 700.00, 280, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (164, 62, '白色/5L', '{\"颜色\":\"白色\",\"容量\":\"5L\"}', 399.00, 499.00, 300.00, 450, 25, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (165, 62, '墨绿色/5L', '{\"颜色\":\"墨绿色\",\"容量\":\"5L\"}', 399.00, 499.00, 300.00, 350, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (166, 63, '白色/水箱版', '{\"颜色\":\"白色\",\"版本\":\"水箱版\"}', 3999.00, 4599.00, 3200.00, 250, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (167, 63, '白色/上下水版', '{\"颜色\":\"白色\",\"版本\":\"上下水版\"}', 4499.00, 5099.00, 3600.00, 180, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (168, 63, '黑色/上下水版', '{\"颜色\":\"黑色\",\"版本\":\"上下水版\"}', 4499.00, 5099.00, 3600.00, 120, 4, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (169, 64, '月岩灰/水箱版', '{\"颜色\":\"月岩灰\",\"版本\":\"水箱版\"}', 3799.00, 4299.00, 3000.00, 220, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (170, 64, '月岩灰/上下水版', '{\"颜色\":\"月岩灰\",\"版本\":\"上下水版\"}', 4299.00, 4799.00, 3400.00, 150, 6, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (171, 65, '深空灰/水箱版', '{\"颜色\":\"深空灰\",\"版本\":\"水箱版\"}', 4599.00, 5299.00, 3700.00, 200, 9, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (172, 65, '深空灰/上下水版', '{\"颜色\":\"深空灰\",\"版本\":\"上下水版\"}', 5099.00, 5799.00, 4100.00, 130, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (173, 66, '深空灰/85英寸', '{\"颜色\":\"深空灰\",\"尺寸\":\"85英寸\"}', 6999.00, 7999.00, 5600.00, 150, 6, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (174, 66, '深空灰/75英寸', '{\"颜色\":\"深空灰\",\"尺寸\":\"75英寸\"}', 4999.00, 5999.00, 4000.00, 120, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (175, 67, '枪色/75英寸', '{\"颜色\":\"枪色\",\"尺寸\":\"75英寸\"}', 8999.00, 9999.00, 7200.00, 100, 4, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (176, 67, '枪色/85英寸', '{\"颜色\":\"枪色\",\"尺寸\":\"85英寸\"}', 11999.00, 12999.00, 9600.00, 60, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (177, 68, '流砂锖/65英寸', '{\"颜色\":\"流砂锖\",\"尺寸\":\"65英寸\"}', 6999.00, 7999.00, 5600.00, 130, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (178, 68, '流砂锖/75英寸', '{\"颜色\":\"流砂锖\",\"尺寸\":\"75英寸\"}', 9999.00, 10999.00, 8000.00, 80, 3, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (179, 69, '碎花蓝/S', '{\"颜色\":\"碎花蓝\",\"尺码\":\"S\"}', 599.00, 799.00, 420.00, 250, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (180, 69, '碎花蓝/M', '{\"颜色\":\"碎花蓝\",\"尺码\":\"M\"}', 599.00, 799.00, 420.00, 350, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (181, 69, '碎花蓝/L', '{\"颜色\":\"碎花蓝\",\"尺码\":\"L\"}', 599.00, 799.00, 420.00, 280, 14, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (182, 69, '碎花粉/M', '{\"颜色\":\"碎花粉\",\"尺码\":\"M\"}', 599.00, 799.00, 420.00, 200, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (183, 69, '碎花粉/L', '{\"颜色\":\"碎花粉\",\"尺码\":\"L\"}', 599.00, 799.00, 420.00, 180, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (184, 70, '黑色/S', '{\"颜色\":\"黑色\",\"尺码\":\"S\"}', 459.00, 599.00, 320.00, 300, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (185, 70, '黑色/M', '{\"颜色\":\"黑色\",\"尺码\":\"M\"}', 459.00, 599.00, 320.00, 400, 22, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (186, 70, '黑色/L', '{\"颜色\":\"黑色\",\"尺码\":\"L\"}', 459.00, 599.00, 320.00, 320, 16, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (187, 70, '藏青色/M', '{\"颜色\":\"藏青色\",\"尺码\":\"M\"}', 459.00, 599.00, 320.00, 250, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (188, 70, '藏青色/L', '{\"颜色\":\"藏青色\",\"尺码\":\"L\"}', 459.00, 599.00, 320.00, 200, 9, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (189, 71, '白色/S', '{\"颜色\":\"白色\",\"尺码\":\"S\"}', 129.00, 149.00, 85.00, 600, 35, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (190, 71, '白色/M', '{\"颜色\":\"白色\",\"尺码\":\"M\"}', 129.00, 149.00, 85.00, 800, 50, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (191, 71, '白色/L', '{\"颜色\":\"白色\",\"尺码\":\"L\"}', 129.00, 149.00, 85.00, 650, 40, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (192, 71, '黑色/M', '{\"颜色\":\"黑色\",\"尺码\":\"M\"}', 129.00, 149.00, 85.00, 700, 45, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (193, 71, '黑色/L', '{\"颜色\":\"黑色\",\"尺码\":\"L\"}', 129.00, 149.00, 85.00, 550, 30, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (194, 71, '雾霾蓝/M', '{\"颜色\":\"雾霾蓝\",\"尺码\":\"M\"}', 129.00, 149.00, 85.00, 380, 20, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (195, 72, '雾蓝/S', '{\"颜色\":\"雾蓝\",\"尺码\":\"S\"}', 89.00, 119.00, 58.00, 500, 28, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (196, 72, '雾蓝/M', '{\"颜色\":\"雾蓝\",\"尺码\":\"M\"}', 89.00, 119.00, 58.00, 700, 42, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (197, 72, '雾蓝/L', '{\"颜色\":\"雾蓝\",\"尺码\":\"L\"}', 89.00, 119.00, 58.00, 550, 30, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (198, 72, '黑色/M', '{\"颜色\":\"黑色\",\"尺码\":\"M\"}', 89.00, 119.00, 58.00, 600, 35, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (199, 72, '白色/M', '{\"颜色\":\"白色\",\"尺码\":\"M\"}', 89.00, 119.00, 58.00, 450, 25, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (200, 73, '深蓝色/M', '{\"颜色\":\"深蓝色\",\"尺码\":\"M\"}', 699.00, 899.00, 480.00, 300, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (201, 73, '深蓝色/L', '{\"颜色\":\"深蓝色\",\"尺码\":\"L\"}', 699.00, 899.00, 480.00, 420, 22, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (202, 73, '深蓝色/XL', '{\"颜色\":\"深蓝色\",\"尺码\":\"XL\"}', 699.00, 899.00, 480.00, 350, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (203, 73, '卡其色/L', '{\"颜色\":\"卡其色\",\"尺码\":\"L\"}', 699.00, 899.00, 480.00, 280, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (204, 73, '卡其色/XL', '{\"颜色\":\"卡其色\",\"尺码\":\"XL\"}', 699.00, 899.00, 480.00, 220, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (205, 74, '军绿色/M', '{\"颜色\":\"军绿色\",\"尺码\":\"M\"}', 459.00, 599.00, 320.00, 280, 14, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (206, 74, '军绿色/L', '{\"颜色\":\"军绿色\",\"尺码\":\"L\"}', 459.00, 599.00, 320.00, 350, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (207, 74, '军绿色/XL', '{\"颜色\":\"军绿色\",\"尺码\":\"XL\"}', 459.00, 599.00, 320.00, 250, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (208, 74, '黑色/L', '{\"颜色\":\"黑色\",\"尺码\":\"L\"}', 459.00, 599.00, 320.00, 300, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (209, 74, '黑色/XL', '{\"颜色\":\"黑色\",\"尺码\":\"XL\"}', 459.00, 599.00, 320.00, 220, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (210, 75, '白色/38', '{\"颜色\":\"白色\",\"尺码\":\"38\"}', 459.00, 559.00, 320.00, 220, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (211, 75, '白色/39', '{\"颜色\":\"白色\",\"尺码\":\"39\"}', 459.00, 559.00, 320.00, 350, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (212, 75, '白色/40', '{\"颜色\":\"白色\",\"尺码\":\"40\"}', 459.00, 559.00, 320.00, 400, 22, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (213, 75, '白色/41', '{\"颜色\":\"白色\",\"尺码\":\"41\"}', 459.00, 559.00, 320.00, 300, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (214, 75, '浅蓝色/39', '{\"颜色\":\"浅蓝色\",\"尺码\":\"39\"}', 459.00, 559.00, 320.00, 280, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (215, 75, '浅蓝色/40', '{\"颜色\":\"浅蓝色\",\"尺码\":\"40\"}', 459.00, 559.00, 320.00, 350, 16, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (216, 75, '浅蓝色/41', '{\"颜色\":\"浅蓝色\",\"尺码\":\"41\"}', 459.00, 559.00, 320.00, 250, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (217, 76, '白色/M', '{\"颜色\":\"白色\",\"尺码\":\"M\"}', 169.00, 199.00, 110.00, 500, 30, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (218, 76, '白色/L', '{\"颜色\":\"白色\",\"尺码\":\"L\"}', 169.00, 199.00, 110.00, 650, 40, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (219, 76, '白色/XL', '{\"颜色\":\"白色\",\"尺码\":\"XL\"}', 169.00, 199.00, 110.00, 500, 28, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (220, 76, '蓝色/L', '{\"颜色\":\"蓝色\",\"尺码\":\"L\"}', 169.00, 199.00, 110.00, 450, 25, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (221, 76, '蓝色/XL', '{\"颜色\":\"蓝色\",\"尺码\":\"XL\"}', 169.00, 199.00, 110.00, 380, 20, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (222, 77, '黑白/38', '{\"颜色\":\"黑白\",\"尺码\":\"38\"}', 899.00, 999.00, 650.00, 220, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (223, 77, '黑白/39', '{\"颜色\":\"黑白\",\"尺码\":\"39\"}', 899.00, 999.00, 650.00, 300, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (224, 77, '黑白/40', '{\"颜色\":\"黑白\",\"尺码\":\"40\"}', 899.00, 999.00, 650.00, 400, 25, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (225, 77, '黑白/41', '{\"颜色\":\"黑白\",\"尺码\":\"41\"}', 899.00, 999.00, 650.00, 380, 22, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (226, 77, '黑白/42', '{\"颜色\":\"黑白\",\"尺码\":\"42\"}', 899.00, 999.00, 650.00, 320, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (227, 77, '黑白/43', '{\"颜色\":\"黑白\",\"尺码\":\"43\"}', 899.00, 999.00, 650.00, 250, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (228, 77, '全黑/40', '{\"颜色\":\"全黑\",\"尺码\":\"40\"}', 899.00, 999.00, 650.00, 280, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (229, 77, '全黑/41', '{\"颜色\":\"全黑\",\"尺码\":\"41\"}', 899.00, 999.00, 650.00, 300, 16, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (230, 77, '全黑/42', '{\"颜色\":\"全黑\",\"尺码\":\"42\"}', 899.00, 999.00, 650.00, 250, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (231, 78, '核心黑/39', '{\"颜色\":\"核心黑\",\"尺码\":\"39\"}', 799.00, 899.00, 580.00, 280, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (232, 78, '核心黑/40', '{\"颜色\":\"核心黑\",\"尺码\":\"40\"}', 799.00, 899.00, 580.00, 380, 22, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (233, 78, '核心黑/41', '{\"颜色\":\"核心黑\",\"尺码\":\"41\"}', 799.00, 899.00, 580.00, 420, 25, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (234, 78, '核心黑/42', '{\"颜色\":\"核心黑\",\"尺码\":\"42\"}', 799.00, 899.00, 580.00, 350, 20, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (235, 78, '核心黑/43', '{\"颜色\":\"核心黑\",\"尺码\":\"43\"}', 799.00, 899.00, 580.00, 280, 14, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (236, 78, '云白/40', '{\"颜色\":\"云白\",\"尺码\":\"40\"}', 799.00, 899.00, 580.00, 300, 16, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (237, 78, '云白/41', '{\"颜色\":\"云白\",\"尺码\":\"41\"}', 799.00, 899.00, 580.00, 350, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (238, 78, '云白/42', '{\"颜色\":\"云白\",\"尺码\":\"42\"}', 799.00, 899.00, 580.00, 280, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (239, 79, '橙红/40', '{\"颜色\":\"橙红\",\"尺码\":\"40\"}', 699.00, 799.00, 500.00, 220, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (240, 79, '橙红/41', '{\"颜色\":\"橙红\",\"尺码\":\"41\"}', 699.00, 799.00, 500.00, 300, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (241, 79, '橙红/42', '{\"颜色\":\"橙红\",\"尺码\":\"42\"}', 699.00, 799.00, 500.00, 320, 16, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (242, 79, '橙红/43', '{\"颜色\":\"橙红\",\"尺码\":\"43\"}', 699.00, 799.00, 500.00, 250, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (243, 79, '荧光绿/41', '{\"颜色\":\"荧光绿\",\"尺码\":\"41\"}', 699.00, 799.00, 500.00, 200, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (244, 79, '荧光绿/42', '{\"颜色\":\"荧光绿\",\"尺码\":\"42\"}', 699.00, 799.00, 500.00, 220, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (245, 80, '黑色', '{\"颜色\":\"黑色\"}', 2499.00, 2999.00, 2000.00, 120, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (246, 80, '海军蓝', '{\"颜色\":\"海军蓝\"}', 2499.00, 2999.00, 2000.00, 100, 3, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (247, 81, '深空灰', '{\"颜色\":\"深空灰\"}', 199.00, 249.00, 140.00, 500, 30, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (248, 81, '黑色', '{\"颜色\":\"黑色\"}', 199.00, 249.00, 140.00, 600, 35, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (249, 81, '军绿色', '{\"颜色\":\"军绿色\"}', 199.00, 249.00, 140.00, 350, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (250, 82, '军绿色/40L', '{\"颜色\":\"军绿色\",\"容量\":\"40L\"}', 459.00, 599.00, 350.00, 200, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (251, 82, '深蓝色/40L', '{\"颜色\":\"深蓝色\",\"容量\":\"40L\"}', 459.00, 599.00, 350.00, 180, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (252, 83, '经典版/50ml', '{\"规格\":\"50ml\"}', 3880.00, 3880.00, 3100.00, 180, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (253, 83, '轻盈版/50ml', '{\"规格\":\"50ml\",\"版本\":\"轻盈版\"}', 3880.00, 3880.00, 3100.00, 150, 6, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (254, 84, '滋润型/50g', '{\"类型\":\"滋润型\",\"规格\":\"50g\"}', 189.00, 239.00, 130.00, 600, 35, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (255, 84, '清爽型/50g', '{\"类型\":\"清爽型\",\"规格\":\"50g\"}', 189.00, 239.00, 130.00, 500, 28, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (256, 85, '5片/盒', '{\"规格\":\"5片/盒\"}', 139.00, 169.00, 95.00, 700, 45, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (257, 86, '5片/盒', '{\"规格\":\"5片/盒\"}', 99.00, 129.00, 68.00, 550, 30, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (258, 87, '#306 正红', '{\"色号\":\"#306 正红\"}', 340.00, 380.00, 260.00, 280, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (259, 87, '#307 珊瑚红', '{\"色号\":\"#307 珊瑚红\"}', 340.00, 380.00, 260.00, 220, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (260, 87, '#308 干枯玫瑰', '{\"色号\":\"#308 干枯玫瑰\"}', 340.00, 380.00, 260.00, 250, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (261, 88, '#196 胡萝卜', '{\"色号\":\"#196 胡萝卜\"}', 290.00, 310.00, 220.00, 350, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (262, 88, '#274 奶茶色', '{\"色号\":\"#274 奶茶色\"}', 290.00, 310.00, 220.00, 300, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (263, 88, '#888 野莓红', '{\"色号\":\"#888 野莓红\"}', 290.00, 310.00, 220.00, 280, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (264, 89, '镜面水光01', '{\"色号\":\"镜面水光01 草莓红\"}', 69.00, 89.00, 42.00, 500, 30, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (265, 89, '镜面水光02', '{\"色号\":\"镜面水光02 蜜桃粉\"}', 69.00, 89.00, 42.00, 450, 25, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (266, 89, '镜面水光03', '{\"色号\":\"镜面水光03 奶茶杏\"}', 69.00, 89.00, 42.00, 420, 22, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (267, 90, '果径80-85mm/5kg', '{\"果径\":\"80-85mm\",\"规格\":\"5kg\"}', 79.90, 99.00, 48.00, 500, 35, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (268, 90, '果径85-90mm/5kg', '{\"果径\":\"85-90mm\",\"规格\":\"5kg\"}', 99.00, 119.00, 60.00, 300, 20, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (269, 91, '果径80mm+/3kg', '{\"果径\":\"80mm+\",\"规格\":\"3kg\"}', 49.90, 59.90, 30.00, 600, 40, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (270, 91, '果径75-80mm/3kg', '{\"果径\":\"75-80mm\",\"规格\":\"3kg\"}', 39.90, 49.90, 24.00, 450, 28, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (271, 92, '每日坚果/750g', '{\"规格\":\"750g/30袋\"}', 99.00, 139.00, 65.00, 700, 50, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (272, 93, '盐焗味/500g', '{\"口味\":\"盐焗味\",\"规格\":\"500g\"}', 69.90, 89.90, 45.00, 550, 35, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (273, 93, '原味/500g', '{\"口味\":\"原味\",\"规格\":\"500g\"}', 69.90, 89.90, 45.00, 450, 28, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (274, 94, '奶油味/500g', '{\"口味\":\"奶油味\",\"规格\":\"500g\"}', 59.90, 79.90, 38.00, 500, 30, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (275, 94, '原味/500g', '{\"口味\":\"原味\",\"规格\":\"500g\"}', 59.90, 79.90, 38.00, 400, 22, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (276, 96, '53度/500ml', '{\"度数\":\"53%vol\",\"规格\":\"500ml\"}', 1499.00, 1499.00, 969.00, 100, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (277, 97, '64颗混合装', '{\"规格\":\"64颗混合装\"}', 189.00, 219.00, 135.00, 450, 25, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (278, 97, '36颗经典装', '{\"规格\":\"36颗经典装\"}', 119.00, 139.00, 85.00, 380, 20, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (279, 98, '燕麦色/2.8m三人位', '{\"颜色\":\"燕麦色\",\"规格\":\"2.8m三人位\"}', 4999.00, 5999.00, 3800.00, 60, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (280, 98, '烟灰色/2.8m三人位', '{\"颜色\":\"烟灰色\",\"规格\":\"2.8m三人位\"}', 4999.00, 5999.00, 3800.00, 50, 1, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (281, 98, '燕麦色/3.2m带贵妃', '{\"颜色\":\"燕麦色\",\"规格\":\"3.2m带贵妃位\"}', 5999.00, 6999.00, 4600.00, 40, 1, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (282, 99, '深棕色/三人位电动', '{\"颜色\":\"深棕色\",\"规格\":\"三人位电动\"}', 8999.00, 10999.00, 7000.00, 35, 1, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (283, 99, '灰白色/三人位电动', '{\"颜色\":\"灰白色\",\"规格\":\"三人位电动\"}', 8999.00, 10999.00, 7000.00, 30, 0, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (284, 100, '胡桃色/1.8m*2m', '{\"颜色\":\"胡桃色\",\"尺寸\":\"1.8m*2m\"}', 4499.00, 5499.00, 3500.00, 45, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (285, 100, '原木色/1.8m*2m', '{\"颜色\":\"原木色\",\"尺寸\":\"1.8m*2m\"}', 4499.00, 5499.00, 3500.00, 40, 1, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (286, 100, '胡桃色/1.5m*2m', '{\"颜色\":\"胡桃色\",\"尺寸\":\"1.5m*2m\"}', 3799.00, 4599.00, 2900.00, 35, 1, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (287, 101, '深灰/1.8m*2m', '{\"颜色\":\"深灰\",\"尺寸\":\"1.8m*2m\"}', 7999.00, 9999.00, 6200.00, 30, 1, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (288, 101, '米白/1.8m*2m', '{\"颜色\":\"米白\",\"尺寸\":\"1.8m*2m\"}', 7999.00, 9999.00, 6200.00, 25, 0, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (289, 102, '深灰', '{\"颜色\":\"深灰\"}', 5299.00, 5999.00, 4200.00, 80, 3, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (290, 102, '银灰', '{\"颜色\":\"银灰\"}', 5299.00, 5999.00, 4200.00, 60, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (291, 103, '静谧黑', '{\"颜色\":\"静谧黑\"}', 2499.00, 2999.00, 1900.00, 150, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (292, 103, '霜晨白', '{\"颜色\":\"霜晨白\"}', 2499.00, 2999.00, 1900.00, 120, 5, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (293, 104, '橄榄绿/双人', '{\"颜色\":\"橄榄绿\",\"规格\":\"双人\"}', 599.00, 799.00, 450.00, 200, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (294, 104, '暖沙色/双人', '{\"颜色\":\"暖沙色\",\"规格\":\"双人\"}', 599.00, 799.00, 450.00, 180, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (295, 105, '卡其色/4-6人', '{\"颜色\":\"卡其色\",\"规格\":\"4-6人\"}', 1299.00, 1699.00, 1000.00, 100, 4, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (296, 105, '军绿色/4-6人', '{\"颜色\":\"军绿色\",\"规格\":\"4-6人\"}', 1299.00, 1699.00, 1000.00, 80, 3, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (297, 106, '全阶段/5.4kg', '{\"规格\":\"5.4kg\"}', 199.00, 259.00, 140.00, 400, 25, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (298, 106, '全阶段/1.8kg', '{\"规格\":\"1.8kg\"}', 89.00, 109.00, 60.00, 300, 18, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (299, 107, '鸡肉味/5.4kg', '{\"规格\":\"5.4kg\"}', 309.00, 369.00, 230.00, 280, 15, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (300, 107, '鸡肉味/2kg', '{\"规格\":\"2kg\"}', 139.00, 169.00, 100.00, 220, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (301, 108, '小型犬/10kg', '{\"规格\":\"10kg\"}', 299.00, 399.00, 220.00, 250, 12, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (302, 108, '小型犬/2kg', '{\"规格\":\"2kg\"}', 79.00, 99.00, 55.00, 200, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (303, 109, '鸡肉米饭/15kg', '{\"规格\":\"15kg\"}', 469.00, 569.00, 350.00, 180, 8, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (304, 109, '鸡肉米饭/3kg', '{\"规格\":\"3kg\"}', 119.00, 149.00, 85.00, 200, 10, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (305, 110, '素圈/30g', '{\"款式\":\"素圈\",\"克重\":\"30g\"}', 21800.00, 22800.00, 18500.00, 25, 1, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (306, 110, '雕花/30g', '{\"款式\":\"雕花\",\"克重\":\"30g\"}', 22800.00, 23800.00, 19300.00, 20, 1, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (307, 111, '8g/链长45cm', '{\"克重\":\"8g\",\"链长\":\"45cm\"}', 5880.00, 6180.00, 5000.00, 40, 2, NULL, 1, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_sku` VALUES (2057691866297700354, 2057691866230591489, 'iPhone 15 Pro 128GB 黑色', '{\"颜色\":\"黑色\",\"存储\":\"128GB\"}', 7999.00, 8999.00, 6000.00, 100, 0, 'https://example.com/iphone15pro-black.jpg', 1, '2026-05-22 13:15:46', '2026-05-22 13:22:12', 1);
INSERT INTO `pms_sku` VALUES (2057691866297700355, 2057691866230591489, 'iPhone 15 Pro 256GB 白色', '{\"颜色\":\"白色\",\"存储\":\"256GB\"}', 8999.00, 9999.00, 6800.00, 80, 0, 'https://example.com/iphone15pro-white.jpg', 1, '2026-05-22 13:15:46', '2026-05-22 13:22:12', 1);
INSERT INTO `pms_sku` VALUES (2057691866297700356, 2057691866230591489, 'iPhone 15 Pro 512GB 蓝色', '{\"颜色\":\"蓝色\",\"存储\":\"512GB\"}', 10999.00, 11999.00, 8200.00, 50, 0, 'https://example.com/iphone15pro-blue.jpg', 1, '2026-05-22 13:15:46', '2026-05-22 13:22:12', 1);
INSERT INTO `pms_sku` VALUES (2057693667856125954, 2057693667856125953, 'iPhone 15 Pro 128GB 黑色', '{\"颜色\":\"黑色\",\"存储\":\"128GB\"}', 7999.00, 8999.00, 6000.00, 100, 0, 'https://example.com/iphone15pro-black.jpg', 1, '2026-05-22 13:22:55', '2026-05-22 13:22:55', 0);
INSERT INTO `pms_sku` VALUES (2057693667856125955, 2057693667856125953, 'iPhone 15 Pro 256GB 白色', '{\"颜色\":\"白色\",\"存储\":\"256GB\"}', 8999.00, 9999.00, 6800.00, 80, 0, 'https://example.com/iphone15pro-white.jpg', 1, '2026-05-22 13:22:55', '2026-05-22 13:22:55', 0);
INSERT INTO `pms_sku` VALUES (2057693667923234818, 2057693667856125953, 'iPhone 15 Pro 512GB 蓝色', '{\"颜色\":\"蓝色\",\"存储\":\"512GB\"}', 10999.00, 11999.00, 8200.00, 50, 0, 'https://example.com/iphone15pro-blue.jpg', 1, '2026-05-22 13:22:55', '2026-05-22 13:22:55', 0);

-- ----------------------------
-- Table structure for pms_spu
-- ----------------------------
DROP TABLE IF EXISTS `pms_spu`;
CREATE TABLE `pms_spu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `category_id` bigint NOT NULL COMMENT '分类ID',
  `brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '商品描述(富文本)',
  `main_image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主图URL',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '轮播图URL，JSON数组',
  `status` tinyint NULL DEFAULT 0 COMMENT '0-下架 1-上架 2-草稿',
  `sale_count` int NULL DEFAULT 0 COMMENT '销量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  `merchant_id` bigint NULL DEFAULT NULL COMMENT '商家用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2057693667856125954 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品SPU表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_spu
-- ----------------------------
INSERT INTO `pms_spu` VALUES (1, 'iPhone 16 Pro Max', 10101, 'Apple', '<p>A18 Pro芯片 | 6.9英寸OLED屏 | 钛金属边框 | 4800万三摄</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=iPhone+16+Pro+Max', '[\"/uploads/product/iphone16pm_1.jpg\",\"/uploads/product/iphone16pm_2.jpg\",\"/uploads/product/iphone16pm_3.jpg\"]', 1, 12890, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (2, '华为 Mate 70 Pro', 10101, '华为', '<p>麒麟9100芯片 | 6.8英寸OLED曲面屏 | 卫星通信 | 5000万XMAGE影像</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=华为+Mate+70+Pro', '[\"/uploads/product/mate70pro_1.jpg\",\"/uploads/product/mate70pro_2.jpg\"]', 1, 9870, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (3, '小米 15 Pro', 10101, '小米', '<p>骁龙8 Gen4 | 6.73英寸2K屏 | 徕卡光学镜头 | 120W快充</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=小米+15+Pro', '[\"/uploads/product/mi15pro_1.jpg\",\"/uploads/product/mi15pro_2.jpg\"]', 1, 7650, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (4, 'OPPO Find X7 Ultra', 10101, 'OPPO', '<p>骁龙8 Gen4 | 6.82英寸曲面屏 | 哈苏影像 | 100W超级闪充</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=OPPO+Find+X7+Ultra', '[\"/uploads/product/findx7u_1.jpg\",\"/uploads/product/findx7u_2.jpg\"]', 1, 5420, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (5, 'vivo X200 Pro', 10101, 'vivo', '<p>天玑9400 | 6.78英寸AMOLED | 蔡司超级长焦 | 蓝海超充</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=vivo+X200+Pro', '[\"/uploads/product/vivox200p_1.jpg\",\"/uploads/product/vivox200p_2.jpg\"]', 1, 4890, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (6, '三星 Galaxy S25 Ultra', 10101, 'Samsung', '<p>骁龙8 Gen4 | 6.9英寸Dynamic AMOLED | S Pen | 2亿像素主摄</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=三星+Galaxy+S25+Ultra', '[\"/uploads/product/s25u_1.jpg\",\"/uploads/product/s25u_2.jpg\"]', 1, 3120, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (7, '荣耀 Magic7 Pro', 10101, '荣耀', '<p>骁龙8 Gen4 | 6.8英寸绿洲护眼屏 | 青海湖电池 | 卫星通信</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=荣耀+Magic7+Pro', '[\"/uploads/product/magic7pro_1.jpg\",\"/uploads/product/magic7pro_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (8, '一加 13', 10101, '一加', '<p>骁龙8 Gen4 | 6.82英寸东方屏 | 哈苏影像 | 100W快充</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=一加+13', '[\"/uploads/product/oneplus13_1.jpg\",\"/uploads/product/oneplus13_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (9, '华为 Mate X6 典藏版', 10102, '华为', '<p>麒麟9100 | 7.93英寸折叠大屏 | 玄武钢化玻璃 | 卫星通话</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=华为+Mate+X6+典藏版', '[\"/uploads/product/matex6_1.jpg\",\"/uploads/product/matex6_2.jpg\"]', 1, 2850, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (10, '荣耀 Magic V3', 10102, '荣耀', '<p>骁龙8 Gen4 | 7.92英寸内屏 | 钛合金铰链 | 青海湖双电池</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=荣耀+Magic+V3', '[\"/uploads/product/magicv3_1.jpg\",\"/uploads/product/magicv3_2.jpg\"]', 1, 1930, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (11, '小米 MIX Fold 4', 10102, '小米', '<p>骁龙8 Gen4 | 8.03英寸内屏 | 徕卡全焦段四摄 | 龙骨转轴</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=小米+MIX+Fold+4', '[\"/uploads/product/mixfold4_1.jpg\",\"/uploads/product/mixfold4_2.jpg\"]', 1, 1560, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (12, 'OPPO Find N4', 10102, 'OPPO', '<p>骁龙8 Gen4 | 7.8英寸内屏 | 精工铰链 | 哈苏影像</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=OPPO+Find+N4', '[\"/uploads/product/findn4_1.jpg\",\"/uploads/product/findn4_2.jpg\"]', 1, 1120, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (13, 'Apple Watch Series 10', 103, 'Apple', '<p>S10芯片 | 全天候视网膜显示屏 | 体温感应 | 水深计</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=Apple+Watch+Series+10', '[\"/uploads/product/aw10_1.jpg\",\"/uploads/product/aw10_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (14, '华为 Watch GT 5 Pro', 103, '华为', '<p>蓝宝石表镜 | 14天长续航 | ECG心电分析 | 高尔夫模式</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=华为+Watch+GT+5+Pro', '[\"/uploads/product/hwgt5_1.jpg\",\"/uploads/product/hwgt5_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (15, '小米 Watch S4 Sport', 103, '小米', '<p>钛合金表体 | 1.43英寸AMOLED | eSIM独立通话 | 150+运动模式</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=小米+Watch+S4+Sport', '[\"/uploads/product/mis4_1.jpg\",\"/uploads/product/mis4_2.jpg\"]', 1, 3450, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (16, 'OPPO Watch X', 103, 'OPPO', '<p>骁龙W5 Gen2 | 1.5英寸AMOLED | 全智能模式 | 85+运动模式</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=OPPO+Watch+X', '[\"/uploads/product/oppowx_1.jpg\",\"/uploads/product/oppowx_2.jpg\"]', 1, 2100, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (17, 'AirPods Pro 3', 10701, 'Apple', '<p>H3芯片 | 自适应降噪 | 空间音频 | USB-C接口 | 6小时续航</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=AirPods+Pro+3', '[\"/uploads/product/app3_1.jpg\",\"/uploads/product/app3_2.jpg\"]', 1, 9870, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (18, '华为 FreeBuds Pro 4', 10701, '华为', '<p>智慧动态降噪 | 超感知原声双单元 | 星闪连接 | 36h续航</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=华为+FreeBuds+Pro+4', '[\"/uploads/product/hwfb4_1.jpg\",\"/uploads/product/hwfb4_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (19, '小米 Buds 5 Pro', 10701, '小米', '<p>圈铁同轴三单元 | Hi-Res Audio | 独立空间音频 | LHDC 5.0</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=小米+Buds+5+Pro', '[\"/uploads/product/mibuds5_1.jpg\",\"/uploads/product/mibuds5_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (20, 'OPPO Enco X3', 10701, 'OPPO', '<p>同轴双单元 | 丹拿联合调音 | LDAC高清传输 | 49dB降噪</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=OPPO+Enco+X3', '[\"/uploads/product/encox3_1.jpg\",\"/uploads/product/encox3_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (21, '索尼 WF-1000XM6', 10701, 'Sony', '<p>全新集成处理器V3 | Hi-Res Audio | 骨传导通话 | 8h续航</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=索尼+WF-1000XM6', '[\"/uploads/product/sonyxm6_1.jpg\",\"/uploads/product/sonyxm6_2.jpg\"]', 1, 2870, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (22, 'AirPods Max 2', 10702, 'Apple', '<p>H2芯片 | 自适应降噪 | 空间音频 | 数码旋钮 | 20h续航</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=AirPods+Max+2', '[\"/uploads/product/apm2_1.jpg\",\"/uploads/product/apm2_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (23, '索尼 WH-1000XM6', 10702, 'Sony', '<p>双芯降噪系统 | 碳纤维振膜 | Hi-Res Audio | 30h续航</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=索尼+WH-1000XM6', '[\"/uploads/product/whxm6_1.jpg\",\"/uploads/product/whxm6_2.jpg\"]', 1, 4560, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (24, 'Bose QC Ultra', 10702, 'Bose', '<p>空间音频 | CustomTune智能调音 | 沉浸式音效 | 24h续航</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=Bose+QC+Ultra', '[\"/uploads/product/boseqc_1.jpg\",\"/uploads/product/boseqc_2.jpg\"]', 1, 3120, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (25, 'JBL Flip 7', 10703, 'JBL', '<p>赛道扬声器 | IP68防水 | 12h续航 | PartyBoost串联</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=JBL+Flip+7', '[\"/uploads/product/jblflip7_1.jpg\",\"/uploads/product/jblflip7_2.jpg\"]', 1, 5670, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (26, 'Marshall Emberton III', 10703, 'Marshall', '<p>经典复古造型 | 360°环绕音 | IP67防水 | 32h超长续航</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=Marshall+Emberton+III', '[\"/uploads/product/marshalle3_1.jpg\",\"/uploads/product/marshalle3_2.jpg\"]', 1, 3450, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (27, '华为 Sound Joy 2', 10703, '华为', '<p>帝瓦雷联合调音 | IP67防水 | NFC一碰传 | 26h续航</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=华为+Sound+Joy+2', '[\"/uploads/product/hwsj2_1.jpg\",\"/uploads/product/hwsj2_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (28, '氮化镓充电器 100W', 10402, 'Anker', '<p>三口快充 | GaN氮化镓 | 100W大功率 | 折叠插脚</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=氮化镓充电器+100W', '[\"/uploads/product/anker100w_1.jpg\",\"/uploads/product/anker100w_2.jpg\"]', 1, 8760, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (29, '氮化镓充电器 65W', 10402, '倍思', '<p>双C口+U口 | 65W快充 | 可折叠插脚 | 支持笔记本</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=氮化镓充电器+65W', '[\"/uploads/product/baseus65w_1.jpg\",\"/uploads/product/baseus65w_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (30, '无线充电板 15W', 10402, '小米', '<p>Qi认证 | 15W快充 | 双线圈 | LED指示灯 | 异物检测</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=无线充电板+15W', '[\"/uploads/product/miwireless_1.jpg\",\"/uploads/product/miwireless_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (31, '小米磁吸充电宝 10000mAh', 10406, '小米', '<p>MagSafe磁吸 | 10000mAh | 15W无线+有线快充 | 轻薄机身</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=小米磁吸充电宝+10000mAh', '[\"/uploads/product/mimagsafe_1.jpg\",\"/uploads/product/mimagsafe_2.jpg\"]', 1, 7650, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (32, '罗马仕 20000mAh快充', 10406, '罗马仕', '<p>20000mAh大容量 | 22.5W快充 | 三输入四输出 | LED电量显示</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=罗马仕+20000mAh快充', '[\"/uploads/product/romoss20000_1.jpg\",\"/uploads/product/romoss20000_2.jpg\"]', 1, 9870, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (33, 'Anker PowerCore+ 26800mAh', 10406, 'Anker', '<p>26800mAh | 60W PD快充 | 双USB-C | 可充笔记本</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=Anker+PowerCore++26800mAh', '[\"/uploads/product/anker26800_1.jpg\",\"/uploads/product/anker26800_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (34, 'MacBook Air 15英寸 M4', 20101, 'Apple', '<p>M4芯片 | 15.3英寸Liquid Retina | 18h续航 | 1.51kg</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=MacBook+Air+15英寸+M4', '[\"/uploads/product/mba15m4_1.jpg\",\"/uploads/product/mba15m4_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (35, 'MateBook X Pro 2025', 20101, '华为', '<p>Ultra9 285H | 14.2英寸OLED | 触控屏 | 980g超轻机身</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=MateBook+X+Pro+2025', '[\"/uploads/product/matebookxp_1.jpg\",\"/uploads/product/matebookxp_2.jpg\"]', 1, 3670, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (36, 'ThinkBook 14+ 2025', 20101, '联想', '<p>Ultra7 265H | 14英寸2.8K | 120Hz高刷 | 全接口</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=ThinkBook+14++2025', '[\"/uploads/product/thinkbook14_1.jpg\",\"/uploads/product/thinkbook14_2.jpg\"]', 1, 4560, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (37, '小米笔记本 Pro 16', 20101, '小米', '<p>Ultra9 285H | 16英寸3.1K OLED | 触控屏 | CNC一体机身</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=小米笔记本+Pro+16', '[\"/uploads/product/mibookpro16_1.jpg\",\"/uploads/product/mibookpro16_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (38, 'ROG 枪神9 Plus', 20102, 'ROG', '<p>i9-14900HX | RTX 5070 | 18英寸2.5K 240Hz | 星云屏</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=ROG+枪神9+Plus', '[\"/uploads/product/rog9p_1.jpg\",\"/uploads/product/rog9p_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (39, '联想拯救者 Y9000P 2025', 20102, '联想', '<p>i9-14900HX | RTX 5070 | 16英寸2.5K 240Hz | 140W满血</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=联想拯救者+Y9000P+2025', '[\"/uploads/product/y9000p_1.jpg\",\"/uploads/product/y9000p_2.jpg\"]', 1, 4560, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (40, '暗影精灵 10', 20102, '惠普', '<p>i7-14700HX | RTX 5070 | 16.1英寸QHD 240Hz | 四区RGB键盘</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=暗影精灵+10', '[\"/uploads/product/omen10_1.jpg\",\"/uploads/product/omen10_2.jpg\"]', 1, 2870, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (41, 'Dell U3224KB 32英寸 6K', 203, 'Dell', '<p>32英寸IPS Black | 6K分辨率 | Thunderbolt 4 | 内置摄像头</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=Dell+U3224KB+32英寸+6K', '[\"/uploads/product/dellu3224_1.jpg\",\"/uploads/product/dellu3224_2.jpg\"]', 1, 1230, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (42, 'LG 27GP950 27英寸 4K 160Hz', 203, 'LG', '<p>27英寸Nano IPS | 4K 160Hz | HDMI 2.1 | G-Sync Compatible</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=LG+27GP950+27英寸+4K+160Hz', '[\"/uploads/product/lg27gp950_1.jpg\",\"/uploads/product/lg27gp950_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (43, '红魔 5088 电竞显示器', 203, '红魔', '<p>27英寸MiniLED | 4K 160Hz / FHD 320Hz双模 | 1152分区</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=红魔+5088+电竞显示器', '[\"/uploads/product/redmagic5088_1.jpg\",\"/uploads/product/redmagic5088_2.jpg\"]', 1, 1890, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (44, 'MX Keys S 无线键盘', 20501, 'Logitech', '<p>Perfect Stroke按键 | 多设备切换 | 智能背光 | USB-C充电</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=MX+Keys+S+无线键盘', '[\"/uploads/product/mxkeyss_1.jpg\",\"/uploads/product/mxkeyss_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (45, 'Apex Pro TKL 磁轴键盘', 20501, 'SteelSeries', '<p>OmniPoint 2.0磁轴 | 快速触发 | 87键紧凑布局 | OLED屏幕</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=Apex+Pro+TKL+磁轴键盘', '[\"/uploads/product/apexpro_1.jpg\",\"/uploads/product/apexpro_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (46, 'Keychron Q6 Max 机械键盘', 20501, 'Keychron', '<p>Gasket结构 | 佳达隆木星轴 | 双色注塑PBT键帽 | QMK/VIA</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=Keychron+Q6+Max+机械键盘', '[\"/uploads/product/keychronq6_1.jpg\",\"/uploads/product/keychronq6_2.jpg\"]', 1, 1870, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (47, 'MX Master 4S 无线鼠标', 20502, 'Logitech', '<p>8000DPI | 电磁滚轮 | 多设备跨屏 | USB-C快充 | 人体工学</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=MX+Master+4S+无线鼠标', '[\"/uploads/product/mxmaster4s_1.jpg\",\"/uploads/product/mxmaster4s_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (48, 'GPW 3 狗屁王三代', 20502, 'Logitech', '<p>HERO 3传感器 | 32000DPI | 60g轻量化 | LIGHTSPEED无线</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=GPW+3+狗屁王三代', '[\"/uploads/product/gpw3_1.jpg\",\"/uploads/product/gpw3_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (49, '毒蝰 V4 Pro', 20502, 'Razer', '<p>Focus Pro 35K传感器 | 58g轻量 | 8000Hz轮询 | 第三代光微动</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=毒蝰+V4+Pro', '[\"/uploads/product/viperv4_1.jpg\",\"/uploads/product/viperv4_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (50, '格力 冷静王+ 1.5匹 新一级', 30101, '格力', '<p>1.5匹变频 | 新一级能效 | 56℃净菌自洁 | 18分贝低噪</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=格力+冷静王++1.5匹+新一级', '[\"/uploads/product/gree15_1.jpg\",\"/uploads/product/gree15_2.jpg\"]', 1, 7650, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (51, '美的 风尊 大1.5匹 新一级', 30101, '美的', '<p>大1.5匹变频 | 180°旋转风 | 新一级能效 | 第四代智清洁</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=美的+风尊+大1.5匹+新一级', '[\"/uploads/product/midea15_1.jpg\",\"/uploads/product/midea15_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (52, '海尔 劲爽 1.5匹 新一级', 30101, '海尔', '<p>1.5匹变频 | 56℃高温自清洁 | PMV舒适模式 | 17分贝</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=海尔+劲爽+1.5匹+新一级', '[\"/uploads/product/haier15_1.jpg\",\"/uploads/product/haier15_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (53, '小天鹅 水魔方 10kg洗烘一体', 302, '小天鹅', '<p>10kg洗+7kg烘 | 水魔方冷水洗 | U.2紫外线除菌 | 超薄嵌入</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=小天鹅+水魔方+10kg洗烘一体', '[\"/uploads/product/littleswan10_1.jpg\",\"/uploads/product/littleswan10_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (54, '海尔 精华洗 10kg', 302, '海尔', '<p>10kg变频 | 精华湿洗科技 | 双喷淋 | 智能投放 | 超薄525mm</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=海尔+精华洗+10kg', '[\"/uploads/product/haier10_1.jpg\",\"/uploads/product/haier10_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (55, '西门子 iQ500 10kg洗烘一体', 302, '西门子', '<p>10kg洗+6kg烘 | i-Dos智能投放 | 热风清新 | BLDC变频</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=西门子+iQ500+10kg洗烘一体', '[\"/uploads/product/siemens10_1.jpg\",\"/uploads/product/siemens10_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (56, '容声 513L 双系统十字对开', 303, '容声', '<p>513L大容量 | 双系统循环 | 全空间净化 | -34℃深冷锁鲜</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=容声+513L+双系统十字对开', '[\"/uploads/product/ronshen513_1.jpg\",\"/uploads/product/ronshen513_2.jpg\"]', 1, 3450, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (57, '卡萨帝 555L 法式多门', 303, '卡萨帝', '<p>555L | MSA控氧保鲜 | 双重杀菌净化 | 自由嵌入安装</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=卡萨帝+555L+法式多门', '[\"/uploads/product/casarte555_1.jpg\",\"/uploads/product/casarte555_2.jpg\"]', 1, 2100, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (58, '美的 508L 微晶一周鲜', 303, '美的', '<p>508L | PST智能净化 | 微晶一周鲜 | -32℃深冷锁鲜</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=美的+508L+微晶一周鲜', '[\"/uploads/product/midea508_1.jpg\",\"/uploads/product/midea508_2.jpg\"]', 1, 2870, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (59, '苏泊尔 IH球釜电饭煲 4L', 30401, '苏泊尔', '<p>IH电磁加热 | 球釜内胆 | 24h预约 | 4L容量 | 触控面板</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=苏泊尔+IH球釜电饭煲+4L', '[\"/uploads/product/suporih_1.jpg\",\"/uploads/product/suporih_2.jpg\"]', 1, 8760, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (60, '美的 纤V 电饭煲 3L', 30401, '美的', '<p>IH加热 | 备长炭铜釜 | 智能感温系统 | 3L容量 | 超薄机身</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=美的+纤V+电饭煲+3L', '[\"/uploads/product/mideaih_1.jpg\",\"/uploads/product/mideaih_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (61, '飞利浦 空气炸锅 6.2L', 30405, '飞利浦', '<p>Rapid Air高速热风 | 少油健康 | 6.2L大容量 | 触控面板</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=飞利浦+空气炸锅+6.2L', '[\"/uploads/product/philipsaf_1.jpg\",\"/uploads/product/philipsaf_2.jpg\"]', 1, 7650, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (62, '九阳 可视空气炸锅 5L', 30405, '九阳', '<p>可视窗口 | 360°热风循环 | 5L容量 | 12大菜单 | 不粘内胆</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=九阳+可视空气炸锅+5L', '[\"/uploads/product/joyoungaf_1.jpg\",\"/uploads/product/joyoungaf_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (63, '石头 G30 自清洁扫拖机器人', 30501, '石头', '<p>7000Pa吸力 | 热水洗拖布 | 全能基站 | 避障系统4.0</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=石头+G30+自清洁扫拖机器人', '[\"/uploads/product/roborockg30_1.jpg\",\"/uploads/product/roborockg30_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (64, '科沃斯 X5 PRO', 30501, '科沃斯', '<p>12800Pa吸力 | 全能基站 | 方圆形机身 | AIVI 3D避障</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=科沃斯+X5+PRO', '[\"/uploads/product/ecovacsx5_1.jpg\",\"/uploads/product/ecovacsx5_2.jpg\"]', 1, 3450, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (65, '追觅 X50 Ultra', 30501, '追觅', '<p>19500Pa吸力 | 仿生机械臂 | 热水洗拖布 | 全能基站</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=追觅+X50+Ultra', '[\"/uploads/product/dreamex50_1.jpg\",\"/uploads/product/dreamex50_2.jpg\"]', 1, 2870, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (66, '小米电视 S Pro 85英寸', 30701, '小米', '<p>85英寸MiniLED | 4K 144Hz | 2400nits | 240分区 | HyperOS</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=小米电视+S+Pro+85英寸', '[\"/uploads/product/mitv85_1.jpg\",\"/uploads/product/mitv85_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (67, 'TCL Q10K Pro 75英寸', 30701, 'TCL', '<p>75英寸QD-MiniLED | 4K 144Hz | 5000nits | 5000+分区</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=TCL+Q10K+Pro+75英寸', '[\"/uploads/product/tcl75q10k_1.jpg\",\"/uploads/product/tcl75q10k_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (68, '海信 U8N 65英寸', 30701, '海信', '<p>65英寸ULED X | 5000nits | 2000+分区 | 信芯AI画质芯片</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=海信+U8N+65英寸', '[\"/uploads/product/hisense65u8n_1.jpg\",\"/uploads/product/hisense65u8n_2.jpg\"]', 1, 1870, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (69, '法式复古碎花连衣裙', 40101, '伊芙丽', '<p>100%桑蚕丝 | 法式V领 | 收腰A字版型 | 中长款 | 优雅碎花</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=法式复古碎花连衣裙', '[\"/uploads/product/floraldress_1.jpg\",\"/uploads/product/floraldress_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (70, '通勤垂感直筒连衣裙', 40101, '太平鸟', '<p>醋酸混纺面料 | 直筒版型 | 简约纯色 | 职场通勤 | 中长款</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=通勤垂感直筒连衣裙', '[\"/uploads/product/office_dress_1.jpg\",\"/uploads/product/office_dress_2.jpg\"]', 1, 3450, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (71, '纯棉宽松印花T恤', 40102, '优衣库', '<p>100%新疆长绒棉 | 210g重磅 | 宽松落肩 | 原创印花</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=纯棉宽松印花T恤', '[\"/uploads/product/cottontee_1.jpg\",\"/uploads/product/cottontee_2.jpg\"]', 1, 8760, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (72, '冰氧吧凉感T恤', 40102, '森马', '<p>冰氧吧面料 | 接触凉感 | UPF50+防晒 | 宽松版型 | 多色可选</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=冰氧吧凉感T恤', '[\"/uploads/product/icete_1.jpg\",\"/uploads/product/icete_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (73, '商务休闲轻奢夹克', 40201, '海澜之家', '<p>高支棉面料 | 立领设计 | 商务休闲两穿 | 防风保暖</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=商务休闲轻奢夹克', '[\"/uploads/product/bizjacket_1.jpg\",\"/uploads/product/bizjacket_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (74, '防泼水户外机能夹克', 40201, '探路者', '<p>防泼水面料 | 多口袋设计 | 连帽可收纳 | 轻薄透气</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=防泼水户外机能夹克', '[\"/uploads/product/outdoorjacket_1.jpg\",\"/uploads/product/outdoorjacket_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (75, '免烫抗皱修身衬衫', 40202, '报喜鸟', '<p>100%长绒棉 | 免烫抗皱科技 | 修身版型 | 八字领 | 商务正装</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=免烫抗皱修身衬衫', '[\"/uploads/product/nonironshirt_1.jpg\",\"/uploads/product/nonironshirt_2.jpg\"]', 1, 4560, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (76, '弹力牛津纺衬衫', 40202, '凡客诚品', '<p>弹力牛津纺 | 经典领尖扣 | 加厚密织 | 不缩水不变形</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=弹力牛津纺衬衫', '[\"/uploads/product/oxfordshirt_1.jpg\",\"/uploads/product/oxfordshirt_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (77, 'Air Zoom Pegasus 42', 40401, 'Nike', '<p>ZoomX泡棉 | Flyknit鞋面 | 前后掌Zoom Air | 公路跑鞋</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=Air+Zoom+Pegasus+42', '[\"/uploads/product/pegasus42_1.jpg\",\"/uploads/product/pegasus42_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (78, 'Ultraboost 5.0 DNA', 40401, 'Adidas', '<p>BOOST中底 | Primeknit+编织鞋面 | LEP推进系统 | 城市跑鞋</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=Ultraboost+5.0+DNA', '[\"/uploads/product/ub5_1.jpg\",\"/uploads/product/ub5_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (79, '飞影PB 5.0 碳板跑鞋', 40401, '乔丹', '<p>全掌碳板 | 超临界物理发泡 | 轻量化 | 竞赛级马拉松鞋</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=飞影PB+5.0+碳板跑鞋', '[\"/uploads/product/feiyingpb5_1.jpg\",\"/uploads/product/feiyingpb5_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (80, 'Explorer 探索者双肩包', 40501, 'TUMI', '<p>弹道尼龙 | FXT保护层 | 15英寸笔记本仓 | RFID防盗</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=Explorer+探索者双肩包', '[\"/uploads/product/tumiexplorer_1.jpg\",\"/uploads/product/tumiexplorer_2.jpg\"]', 1, 2100, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (81, '休闲简约双肩包', 40501, '小米', '<p>防泼水面料 | 15.6英寸笔记本仓 | YKK拉链 | 透气背板</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=休闲简约双肩包', '[\"/uploads/product/mibackpack_1.jpg\",\"/uploads/product/mibackpack_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (82, '户外徒步登山背包 40L', 40501, '探路者', '<p>40L大容量 | 背负系统 | 防雨罩 | 多点外挂 | 水袋仓</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=户外徒步登山背包+40L', '[\"/uploads/product/trekking40_1.jpg\",\"/uploads/product/trekking40_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (83, '黑绷带活颜修护面霜 50ml', 50101, '赫莲娜', '<p>30%玻色因 | 夜间修护抗老 | 舒缓修复 | 贵妇面霜</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=黑绷带活颜修护面霜+50ml', '[\"/uploads/product/hrblackband_1.jpg\",\"/uploads/product/hrblackband_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (84, '红宝石面霜 3.0 50g', 50101, '珀莱雅', '<p>超分子维A醇 | 胜肽组合 | 淡纹紧致 | 温和不刺激</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=红宝石面霜+3.0+50g', '[\"/uploads/product/proyaruby_1.jpg\",\"/uploads/product/proyaruby_2.jpg\"]', 1, 8760, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (85, '玻尿酸水光面膜 5片装', 50103, '敷尔佳', '<p>医用重组胶原蛋白 | 补水修复 | 械字号 | 敏感肌可用</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=玻尿酸水光面膜+5片装', '[\"/uploads/product/fuerjia_1.jpg\",\"/uploads/product/fuerjia_2.jpg\"]', 1, 9870, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (86, '安瓶鲜注精华面膜 5片', 50103, '自然堂', '<p>烟酰胺+传明酸 | 膜液分离 | 新鲜激活 | 提亮肤色</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=安瓶鲜注精华面膜+5片', '[\"/uploads/product/zrtmask_1.jpg\",\"/uploads/product/zrtmask_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (87, '小羊皮高定唇膏 #306', 50201, '纪梵希', '<p>真皮压纹管身 | 丝缎质地 | 高定色调 | 滋润不拔干</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=小羊皮高定唇膏+#306', '[\"/uploads/product/givenchy306_1.jpg\",\"/uploads/product/givenchy306_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (88, '绝色精华唇膏 #196', 50201, '兰蔻', '<p>玫瑰精华 | 奶油哑光 | 显白不挑皮 | 持色8小时</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=绝色精华唇膏+#196', '[\"/uploads/product/lancome196_1.jpg\",\"/uploads/product/lancome196_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (89, '琉璃唇釉镜面水光', 50201, '完美日记', '<p>水光镜面 | 不沾杯 | 8h持妆 | 高饱和显色</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=琉璃唇釉镜面水光', '[\"/uploads/product/perfectliptint_1.jpg\",\"/uploads/product/perfectliptint_2.jpg\"]', 1, 7650, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (90, '新疆阿克苏冰糖心苹果 5kg装', 60101, '产地直发', '<p>新疆阿克苏核心产区 | 果径80-85mm | 冰糖心 | 脆甜多汁</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=新疆阿克苏冰糖心苹果+5kg装', '[\"/uploads/product/aksu_apple_1.jpg\",\"/uploads/product/aksu_apple_2.jpg\"]', 1, 8760, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (91, '山东烟台红富士苹果 3kg', 60101, '产地直发', '<p>烟台栖霞核心产区 | 果径80mm+ | 皮薄肉脆 | 汁多味甜</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=山东烟台红富士苹果+3kg', '[\"/uploads/product/yantai_apple_1.jpg\",\"/uploads/product/yantai_apple_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (92, '每日坚果 混合装 750g/30袋', 60501, '三只松鼠', '<p>6种坚果果干 | 科学配比 | 独立小袋 | 每日一袋</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=每日坚果+混合装+750g/30袋', '[\"/uploads/product/dailynuts_1.jpg\",\"/uploads/product/dailynuts_2.jpg\"]', 1, 9870, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (93, '开心果 盐焗味 500g', 60501, '良品铺子', '<p>美国加州开心果 | 自然开口 | 盐焗轻调味 | 大颗粒</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=开心果+盐焗味+500g', '[\"/uploads/product/pistachio_1.jpg\",\"/uploads/product/pistachio_2.jpg\"]', 1, 7650, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (94, '夏威夷果 奶油味 500g', 60501, '百草味', '<p>澳洲夏威夷果 | 奶油轻甜 | 开口器赠送 | 大颗粒直径20mm+</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=夏威夷果+奶油味+500g', '[\"/uploads/product/macadamia_1.jpg\",\"/uploads/product/macadamia_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (96, '飞天茅台 53度 500ml', 60603, '贵州茅台', '<p>酱香型 | 12987古法工艺 | 五年窖藏 | 53%vol</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=飞天茅台+53度+500ml', '[\"/uploads/product/moutai_1.jpg\",\"/uploads/product/moutai_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (97, '三顿半 精品速溶咖啡 64颗', 60606, '三顿半', '<p>冷萃超即溶 | 64颗混合装 | 1-6号烘焙度 | 3秒溶于冰水</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=三顿半+精品速溶咖啡+64颗', '[\"/uploads/product/saturnbird_1.jpg\",\"/uploads/product/saturnbird_2.jpg\"]', 1, 8760, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (98, '云朵沙发 三人位 2.8m', 70101, '源氏木语', '<p>北美FAS级白橡木 | 科技布面料 | 高回弹海绵 | 实木框架</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=云朵沙发+三人位+2.8m', '[\"/uploads/product/cloudsofa_1.jpg\",\"/uploads/product/cloudsofa_2.jpg\"]', 1, 2100, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (99, '头层牛皮电动功能沙发 三人位', 70101, '顾家家居', '<p>意大利头层牛皮 | 电动伸缩 | 零重力躺位 | USB充电口</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=头层牛皮电动功能沙发+三人位', '[\"/uploads/product/kuka_sofa_1.jpg\",\"/uploads/product/kuka_sofa_2.jpg\"]', 1, 1560, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (100, '实木软包床 1.8m×2m', 70201, '源氏木语', '<p>北美黑胡桃木 | 高密度海绵软包 | 静音龙骨 | 气压储物</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=实木软包床+1.8m×2m', '[\"/uploads/product/woodbed_1.jpg\",\"/uploads/product/woodbed_2.jpg\"]', 1, 1890, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (101, '真皮轻奢大床 1.8m×2m', 70201, '慕思', '<p>头层牛皮靠背 | 齐边设计 | 金属高脚 | 实木排骨架</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=真皮轻奢大床+1.8m×2m', '[\"/uploads/product/leatherbed_1.jpg\",\"/uploads/product/leatherbed_2.jpg\"]', 1, 1230, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (102, '舒华 E9 智能折叠跑步机', 110301, '舒华', '<p>3.0HP无刷电机 | 18km/h | 电动18段坡度 | 可折叠 | 智能APP</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=舒华+E9+智能折叠跑步机', '[\"/uploads/product/shuhua_e9_1.jpg\",\"/uploads/product/shuhua_e9_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (103, 'Keep C2 Lite 家用跑步机', 110301, 'Keep', '<p>2.0HP马达 | 15km/h | 全折叠 | Keep APP联动 | 静音马达</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=Keep+C2+Lite+家用跑步机', '[\"/uploads/product/keepc2_1.jpg\",\"/uploads/product/keepc2_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (104, '云尚 3 四季双人帐篷', 110401, 'NatureHike', '<p>20D尼龙面料 | PU2000+防水 | 双开门 | 2.1kg超轻 | 3-4季通用</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=云尚+3+四季双人帐篷', '[\"/uploads/product/nhcloud3_1.jpg\",\"/uploads/product/nhcloud3_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (105, '繁星 3 家庭帐篷 4-6人', 110401, '牧高笛', '<p>150D牛津布 | PU3000+防水 | 一室一厅结构 | 防暴雨</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=繁星+3+家庭帐篷+4-6人', '[\"/uploads/product/mobigarden_star3_1.jpg\",\"/uploads/product/mobigarden_star3_2.jpg\"]', 1, 1230, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (106, '全价全阶段猫粮 5.4kg', 140101, '网易严选', '<p>70%鲜肉含量 | 无谷配方 | 冻干生骨肉包裹 | 全阶段通用</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=全价全阶段猫粮+5.4kg', '[\"/uploads/product/yanxuan_cat_1.jpg\",\"/uploads/product/yanxuan_cat_2.jpg\"]', 1, 7650, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (107, '无谷天然猫粮 鸡肉味 5.4kg', 140101, '皇家', '<p>精准营养配方 | 理想体重控制 | 毛球排出 | 泌尿健康</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=无谷天然猫粮+鸡肉味+5.4kg', '[\"/uploads/product/royalcanin_cat_1.jpg\",\"/uploads/product/royalcanin_cat_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (108, '小型犬全价狗粮 10kg', 140102, '伯纳天纯', '<p>鲜肉酶解技术 | 无谷低敏 | 添加益生菌 | 小型犬专属颗粒</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=小型犬全价狗粮+10kg', '[\"/uploads/product/purena_dog_1.jpg\",\"/uploads/product/purena_dog_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (109, '全价狗粮 鸡肉米饭 15kg', 140102, '皇家', '<p>精准营养 | 理想体态 | 高消化蛋白 | 牙齿健康支持</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=全价狗粮+鸡肉米饭+15kg', '[\"/uploads/product/royalcanin_dog_1.jpg\",\"/uploads/product/royalcanin_dog_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (110, '足金古法传承手镯 30g', 120101, '周大福', '<p>足金999 | 古法花丝錾刻 | 哑光质感 | 30g±0.5g</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=足金古法传承手镯+30g', '[\"/uploads/product/chowtaifook_bangle_1.jpg\",\"/uploads/product/chowtaifook_bangle_2.jpg\"]', 1, 1230, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (111, '足金如意锁项链 8g', 120101, '老凤祥', '<p>足金999 | 3D硬金工艺 | 如意锁吊坠 | 链长45cm</p>', 'https://dummyimage.com/400x400/eee/e85d3a&text=足金如意锁项链+8g', '[\"/uploads/product/laofengxiang_necklace_1.jpg\",\"/uploads/product/laofengxiang_necklace_2.jpg\"]', 1, 2100, '2026-05-22 12:50:13', '2026-06-05 22:42:21', 0, NULL);
INSERT INTO `pms_spu` VALUES (2057691866230591489, 'iPhone 15 Pro', 10101, 'Apple', '最新款 iPhone，搭载 A17 Pro 芯片', 'https://dummyimage.com/400x400/eee/e85d3a&text=iPhone+15+Pro', '[\"https://example.com/iphone15pro-1.jpg\",\"https://example.com/iphone15pro-2.jpg\",\"https://example.com/iphone15pro-3.jpg\"]', 2, 0, '2026-05-22 13:15:46', '2026-06-05 22:42:21', 1, NULL);
INSERT INTO `pms_spu` VALUES (2057693667856125953, 'iPhone 15 Pro', 10101, 'Apple', '测试商品', 'https://dummyimage.com/400x400/eee/e85d3a&text=iPhone+15+Pro', '[\"https://example.com/iphone15pro-1.jpg\",\"https://example.com/iphone15pro-2.jpg\",\"https://example.com/iphone15pro-3.jpg\"]', 0, 0, '2026-05-22 13:22:55', '2026-06-05 22:42:21', 0, NULL);

-- ----------------------------
-- Table structure for sys_audit_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_audit_log`;
CREATE TABLE `sys_audit_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `module_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operation_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `business_id` bigint NULL DEFAULT NULL,
  `old_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `new_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2064353027143421954 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_audit_log
-- ----------------------------
INSERT INTO `sys_audit_log` VALUES (2059905421491249153, 1, 'admin', '用户管理', '更新用户', 2059226432355373058, NULL, '[\"2059226432355373058\",{\"username\":\"xionger\",\"nickname\":\"熊三\",\"password\":\"123456\",\"avatar\":\"/uploads/a7836e21-7ba3-456d-8a4e-3c3195308722.jpg\"}]', '2026-05-28 15:51:38');
INSERT INTO `sys_audit_log` VALUES (2059909175280050178, 1, 'admin', '用户管理', '更新用户', 2059226432355373058, '{\"id\":\"2059226432355373058\",\"username\":\"xionger\",\"password\":\"$2a$10$XemML54svhbrfHi3l4alL.XJKFpUjB6bg6u86BeZs9kCbFnO68Vwa\",\"nickname\":\"熊三\",\"status\":1,\"createTime\":\"2026-05-26T18:53:35\",\"role\":\"USER\",\"deleted\":0,\"updateTime\":\"2026-05-26T18:53:35\",\"avatar\":\"/uploads/a7836e21-7ba3-456d-8a4e-3c3195308722.jpg\"}', '[\"2059226432355373058\",{\"username\":\"xionger\",\"nickname\":\"熊二\",\"password\":\"123456\",\"avatar\":\"/uploads/a7836e21-7ba3-456d-8a4e-3c3195308722.jpg\"}]', '2026-05-28 16:06:33');
INSERT INTO `sys_audit_log` VALUES (2059909753980755969, 1, 'admin', '认证管理', '用户登出', NULL, NULL, '[\"eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzbWFydC1iYWNrZW5kIiwidXNlcklkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzc5OTU0ODIyLCJleHAiOjE3ODAwNDEyMjJ9.TZ_G5MthjiOa3duFYEqo-YaaTsS0Q-wQEME9e2lxYcQ\"]', '2026-05-28 16:08:51');
INSERT INTO `sys_audit_log` VALUES (2059909928350556162, 2059226432355373058, 'xionger', '认证管理', '用户登出', NULL, NULL, '[\"eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzbWFydC1iYWNrZW5kIiwidXNlcklkIjoyMDU5MjI2NDMyMzU1MzczMDU4LCJ1c2VybmFtZSI6Inhpb25nZXIiLCJyb2xlIjoiVVNFUiIsImlhdCI6MTc3OTk1NTc0MSwiZXhwIjoxNzgwMDQyMTQxfQ.bcjmkE9zS8wBYzZ9odeFfQ5o3j6LJGN4Dy3kQGcGQWc\"]', '2026-05-28 16:09:32');
INSERT INTO `sys_audit_log` VALUES (2059910008948301826, 1, 'admin', '认证管理', '用户登出', NULL, NULL, '[\"eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzbWFydC1iYWNrZW5kIiwidXNlcklkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzc5OTU1Nzc5LCJleHAiOjE3ODAwNDIxNzl9.Bz9wYhkwOWT5QQzDsI2c2UdC9MmPjxCWeDj3Wq3TqTM\"]', '2026-05-28 16:09:52');
INSERT INTO `sys_audit_log` VALUES (2059910067056189441, 1, 'admin', '认证管理', '用户登出', NULL, NULL, '[\"eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzbWFydC1iYWNrZW5kIiwidXNlcklkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzc5OTU1Nzk3LCJleHAiOjE3ODAwNDIxOTd9.7zNmBY7hD1KWdH3RQvG9n2Hu4qGkvnMGCUYCxwfk5JQ\"]', '2026-05-28 16:10:05');
INSERT INTO `sys_audit_log` VALUES (2059911403466301443, 1, 'admin', '认证管理', '用户登出', NULL, NULL, '[\"eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzbWFydC1iYWNrZW5kIiwidXNlcklkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzc5OTU1ODEzLCJleHAiOjE3ODAwNDIyMTN9.IAD8tVS9P_LaBYcq4ZyfDcEC4GZeHKSXo08sGWxocpo\"]', '2026-05-28 16:15:24');
INSERT INTO `sys_audit_log` VALUES (2059968118308077569, 1, 'admin', '用户管理', '更新用户', 1, '{\"id\":\"1\",\"username\":\"admin\",\"password\":\"$2a$10$Dmy60CNBtsNGNFL16jPL4.p9fjcgboTN2MIrw.Hdb92kps6jXDRFi\",\"nickname\":\"管理员\",\"status\":1,\"createTime\":\"2026-05-16T16:10:04\",\"role\":\"ADMIN\",\"deleted\":0,\"updateTime\":\"2026-05-19T15:18:53\"}', '[\"1\",{\"username\":\"admin\",\"nickname\":\"管理员\",\"password\":\"admin727381\"}]', '2026-05-28 20:00:46');
INSERT INTO `sys_audit_log` VALUES (2061444579783270402, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-01 21:47:42');
INSERT INTO `sys_audit_log` VALUES (2061444640621649922, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-01 21:47:56');
INSERT INTO `sys_audit_log` VALUES (2061444956326912001, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-01 21:49:12');
INSERT INTO `sys_audit_log` VALUES (2061444962756780035, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-01 21:49:13');
INSERT INTO `sys_audit_log` VALUES (2061444968033214466, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-01 21:49:14');
INSERT INTO `sys_audit_log` VALUES (2061445079052247041, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-01 21:49:41');
INSERT INTO `sys_audit_log` VALUES (2061445107040837633, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":0}]', '2026-06-01 21:49:47');
INSERT INTO `sys_audit_log` VALUES (2061445135255920642, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-01 21:49:54');
INSERT INTO `sys_audit_log` VALUES (2061445144210759681, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-01 21:49:56');
INSERT INTO `sys_audit_log` VALUES (2061445150934228993, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":1}]', '2026-06-01 21:49:58');
INSERT INTO `sys_audit_log` VALUES (2061445170605514754, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":0}]', '2026-06-01 21:50:03');
INSERT INTO `sys_audit_log` VALUES (2061445176855027714, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":0}]', '2026-06-01 21:50:04');
INSERT INTO `sys_audit_log` VALUES (2061445182089519105, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":0}]', '2026-06-01 21:50:05');
INSERT INTO `sys_audit_log` VALUES (2061445183150678018, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":1}]', '2026-06-01 21:50:06');
INSERT INTO `sys_audit_log` VALUES (2061445185755340802, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-01 21:50:06');
INSERT INTO `sys_audit_log` VALUES (2061445206777192451, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":0}]', '2026-06-01 21:50:11');
INSERT INTO `sys_audit_log` VALUES (2061445214603763714, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":0}]', '2026-06-01 21:50:13');
INSERT INTO `sys_audit_log` VALUES (2061445225311821827, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-01 21:50:16');
INSERT INTO `sys_audit_log` VALUES (2061445229283827714, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-01 21:50:17');
INSERT INTO `sys_audit_log` VALUES (2061445232995786754, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":1}]', '2026-06-01 21:50:18');
INSERT INTO `sys_audit_log` VALUES (2061445236443504641, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":1}]', '2026-06-01 21:50:18');
INSERT INTO `sys_audit_log` VALUES (2061445241921265666, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-01 21:50:20');
INSERT INTO `sys_audit_log` VALUES (2061445249752031234, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":0}]', '2026-06-01 21:50:22');
INSERT INTO `sys_audit_log` VALUES (2061445257545048065, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":0}]', '2026-06-01 21:50:23');
INSERT INTO `sys_audit_log` VALUES (2061445262326554627, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":0}]', '2026-06-01 21:50:25');
INSERT INTO `sys_audit_log` VALUES (2061445264474038273, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":0}]', '2026-06-01 21:50:25');
INSERT INTO `sys_audit_log` VALUES (2061445741953605635, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-01 21:52:19');
INSERT INTO `sys_audit_log` VALUES (2061445748207312898, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-01 21:52:20');
INSERT INTO `sys_audit_log` VALUES (2061445771410202626, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":0}]', '2026-06-01 21:52:26');
INSERT INTO `sys_audit_log` VALUES (2061445776695025666, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":0}]', '2026-06-01 21:52:27');
INSERT INTO `sys_audit_log` VALUES (2061445836757458947, 1, 'admin', '商品分类', '修改分类', 2057445280091111426, '{\"id\":\"2057445280091111426\",\"name\":\"老人手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:55:55\",\"updateTime\":\"2026-05-21T20:55:55\",\"deleted\":0}', '[\"2057445280091111426\",{\"status\":1}]', '2026-06-01 21:52:41');
INSERT INTO `sys_audit_log` VALUES (2061445844722442243, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":1}]', '2026-06-01 21:52:43');
INSERT INTO `sys_audit_log` VALUES (2061445862107832323, 1, 'admin', '商品分类', '修改分类', 2057445280091111426, '{\"id\":\"2057445280091111426\",\"name\":\"老人手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:55:55\",\"updateTime\":\"2026-05-21T20:55:55\",\"deleted\":0}', '[\"2057445280091111426\",{\"status\":0}]', '2026-06-01 21:52:48');
INSERT INTO `sys_audit_log` VALUES (2061445868978102275, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":0}]', '2026-06-01 21:52:49');
INSERT INTO `sys_audit_log` VALUES (2061446004886134785, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-01 21:53:22');
INSERT INTO `sys_audit_log` VALUES (2061446028084830209, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":0}]', '2026-06-01 21:53:27');
INSERT INTO `sys_audit_log` VALUES (2061446729989021698, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-01 21:56:14');
INSERT INTO `sys_audit_log` VALUES (2061446753716199426, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":0}]', '2026-06-01 21:56:20');
INSERT INTO `sys_audit_log` VALUES (2061446757331689475, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-01 21:56:21');
INSERT INTO `sys_audit_log` VALUES (2061446765535748098, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-01 21:56:23');
INSERT INTO `sys_audit_log` VALUES (2061446767498682370, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":1}]', '2026-06-01 21:56:23');
INSERT INTO `sys_audit_log` VALUES (2061446771097395202, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":1}]', '2026-06-01 21:56:24');
INSERT INTO `sys_audit_log` VALUES (2061446772078862339, 1, 'admin', '商品分类', '修改分类', 2057445280091111426, '{\"id\":\"2057445280091111426\",\"name\":\"老人手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:55:55\",\"updateTime\":\"2026-05-21T20:55:55\",\"deleted\":0}', '[\"2057445280091111426\",{\"status\":1}]', '2026-06-01 21:56:24');
INSERT INTO `sys_audit_log` VALUES (2061446773907578881, 1, 'admin', '商品分类', '修改分类', 102, '{\"id\":\"102\",\"name\":\"平板电脑\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"102\",{\"status\":1}]', '2026-06-01 21:56:25');
INSERT INTO `sys_audit_log` VALUES (2061446777376268290, 1, 'admin', '商品分类', '修改分类', 103, '{\"id\":\"103\",\"name\":\"智能手表\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"103\",{\"status\":1}]', '2026-06-01 21:56:26');
INSERT INTO `sys_audit_log` VALUES (2061446778869440515, 1, 'admin', '商品分类', '修改分类', 104, '{\"id\":\"104\",\"name\":\"手机配件\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"104\",{\"status\":1}]', '2026-06-01 21:56:26');
INSERT INTO `sys_audit_log` VALUES (2061446782602371073, 1, 'admin', '商品分类', '修改分类', 10401, '{\"id\":\"10401\",\"name\":\"手机壳\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10401\",{\"status\":1}]', '2026-06-01 21:56:27');
INSERT INTO `sys_audit_log` VALUES (2061446788151435266, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":0}]', '2026-06-01 21:56:28');
INSERT INTO `sys_audit_log` VALUES (2061446791225860098, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":0}]', '2026-06-01 21:56:29');
INSERT INTO `sys_audit_log` VALUES (2061446792328962051, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":0}]', '2026-06-01 21:56:29');
INSERT INTO `sys_audit_log` VALUES (2061446793633390595, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":0}]', '2026-06-01 21:56:30');
INSERT INTO `sys_audit_log` VALUES (2061446796678455298, 1, 'admin', '商品分类', '修改分类', 2057445280091111426, '{\"id\":\"2057445280091111426\",\"name\":\"老人手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:55:55\",\"updateTime\":\"2026-05-21T20:55:55\",\"deleted\":0}', '[\"2057445280091111426\",{\"status\":0}]', '2026-06-01 21:56:30');
INSERT INTO `sys_audit_log` VALUES (2061446797794140163, 1, 'admin', '商品分类', '修改分类', 102, '{\"id\":\"102\",\"name\":\"平板电脑\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"102\",{\"status\":0}]', '2026-06-01 21:56:31');
INSERT INTO `sys_audit_log` VALUES (2061446802554675201, 1, 'admin', '商品分类', '修改分类', 104, '{\"id\":\"104\",\"name\":\"手机配件\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"104\",{\"status\":0}]', '2026-06-01 21:56:32');
INSERT INTO `sys_audit_log` VALUES (2061446805595545602, 1, 'admin', '商品分类', '修改分类', 10401, '{\"id\":\"10401\",\"name\":\"手机壳\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10401\",{\"status\":0}]', '2026-06-01 21:56:32');
INSERT INTO `sys_audit_log` VALUES (2061446811203330050, 1, 'admin', '商品分类', '修改分类', 103, '{\"id\":\"103\",\"name\":\"智能手表\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"103\",{\"status\":0}]', '2026-06-01 21:56:34');
INSERT INTO `sys_audit_log` VALUES (2061446819231227907, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-01 21:56:36');
INSERT INTO `sys_audit_log` VALUES (2061446828823601154, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-01 21:56:38');
INSERT INTO `sys_audit_log` VALUES (2061446832422313987, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-01 21:56:39');
INSERT INTO `sys_audit_log` VALUES (2061446834058092545, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":1}]', '2026-06-01 21:56:39');
INSERT INTO `sys_audit_log` VALUES (2061446837149294595, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":1}]', '2026-06-01 21:56:40');
INSERT INTO `sys_audit_log` VALUES (2061446841616228355, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":0}]', '2026-06-01 21:56:41');
INSERT INTO `sys_audit_log` VALUES (2061446852504641538, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":0}]', '2026-06-01 21:56:44');
INSERT INTO `sys_audit_log` VALUES (2061446858510884866, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":0}]', '2026-06-01 21:56:45');
INSERT INTO `sys_audit_log` VALUES (2061446860729671683, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":0}]', '2026-06-01 21:56:46');
INSERT INTO `sys_audit_log` VALUES (2061446865158856707, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":0}]', '2026-06-01 21:56:47');
INSERT INTO `sys_audit_log` VALUES (2061446900026105858, 1, 'admin', '商品分类', '修改分类', 2057445280091111426, '{\"id\":\"2057445280091111426\",\"name\":\"老人手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:55:55\",\"updateTime\":\"2026-05-21T20:55:55\",\"deleted\":0}', '[\"2057445280091111426\",{\"status\":1}]', '2026-06-01 21:56:55');
INSERT INTO `sys_audit_log` VALUES (2061446922411106306, 1, 'admin', '商品分类', '修改分类', 2057445280091111426, '{\"id\":\"2057445280091111426\",\"name\":\"老人手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:55:55\",\"updateTime\":\"2026-05-21T20:55:55\",\"deleted\":0}', '[\"2057445280091111426\",{\"status\":0}]', '2026-06-01 21:57:00');
INSERT INTO `sys_audit_log` VALUES (2061446931214950403, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-01 21:57:02');
INSERT INTO `sys_audit_log` VALUES (2061446952924667906, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":0}]', '2026-06-01 21:57:08');
INSERT INTO `sys_audit_log` VALUES (2061447360288055298, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-01 21:58:45');
INSERT INTO `sys_audit_log` VALUES (2061447366726311939, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-01 21:58:46');
INSERT INTO `sys_audit_log` VALUES (2061447762039463939, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-01 22:00:20');
INSERT INTO `sys_audit_log` VALUES (2061447777856184321, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-01 22:00:24');
INSERT INTO `sys_audit_log` VALUES (2061447787549220865, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":0}]', '2026-06-01 22:00:27');
INSERT INTO `sys_audit_log` VALUES (2061447799213580290, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":0}]', '2026-06-01 22:00:29');
INSERT INTO `sys_audit_log` VALUES (2061448461045391361, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-01 22:03:07');
INSERT INTO `sys_audit_log` VALUES (2061448463708774401, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-01 22:03:08');
INSERT INTO `sys_audit_log` VALUES (2061448466250522627, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-01 22:03:08');
INSERT INTO `sys_audit_log` VALUES (2062441501553811457, 1, 'admin', '用户管理', '创建用户', NULL, NULL, '[{\"username\":\"merchant\",\"password\":\"123456\",\"nickname\":\"商家\",\"avatar\":\"\",\"role\":\"MERCHANT\"}]', '2026-06-04 15:49:06');
INSERT INTO `sys_audit_log` VALUES (2062786632333062146, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-05 14:40:32');
INSERT INTO `sys_audit_log` VALUES (2062787231535525889, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-05 14:42:55');
INSERT INTO `sys_audit_log` VALUES (2062787253433987074, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-05 14:43:00');
INSERT INTO `sys_audit_log` VALUES (2062787273197547521, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-05 14:43:05');
INSERT INTO `sys_audit_log` VALUES (2062788172120780803, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-05 14:46:39');
INSERT INTO `sys_audit_log` VALUES (2062788267109183489, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-05 14:47:02');
INSERT INTO `sys_audit_log` VALUES (2062788343877529603, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-05 14:47:20');
INSERT INTO `sys_audit_log` VALUES (2062788678805286913, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-05 14:48:40');
INSERT INTO `sys_audit_log` VALUES (2062788692583575553, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-05 14:48:43');
INSERT INTO `sys_audit_log` VALUES (2062788699638394882, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":1}]', '2026-06-05 14:48:45');
INSERT INTO `sys_audit_log` VALUES (2062788722476380163, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":0}]', '2026-06-05 14:48:50');
INSERT INTO `sys_audit_log` VALUES (2062788861244899330, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":0}]', '2026-06-05 14:49:23');
INSERT INTO `sys_audit_log` VALUES (2062788883571179522, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-05 14:49:29');
INSERT INTO `sys_audit_log` VALUES (2062788896380583938, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":0}]', '2026-06-05 14:49:32');
INSERT INTO `sys_audit_log` VALUES (2062788921353469954, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":1}]', '2026-06-05 14:49:38');
INSERT INTO `sys_audit_log` VALUES (2062788937933553665, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-05 14:49:42');
INSERT INTO `sys_audit_log` VALUES (2062788973002129409, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":0}]', '2026-06-05 14:49:50');
INSERT INTO `sys_audit_log` VALUES (2062788988894347266, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-05 14:49:54');
INSERT INTO `sys_audit_log` VALUES (2062789362837520385, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-05 14:51:23');
INSERT INTO `sys_audit_log` VALUES (2062789363873513474, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-05 14:51:23');
INSERT INTO `sys_audit_log` VALUES (2062789364590739460, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":1}]', '2026-06-05 14:51:23');
INSERT INTO `sys_audit_log` VALUES (2062789364653654018, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-05 14:51:23');
INSERT INTO `sys_audit_log` VALUES (2062789364720762882, 1, 'admin', '商品分类', '修改分类', 102, '{\"id\":\"102\",\"name\":\"平板电脑\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"102\",{\"status\":1}]', '2026-06-05 14:51:23');
INSERT INTO `sys_audit_log` VALUES (2062789364720762883, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":1}]', '2026-06-05 14:51:23');
INSERT INTO `sys_audit_log` VALUES (2062789364720762884, 1, 'admin', '商品分类', '修改分类', 2057445280091111426, '{\"id\":\"2057445280091111426\",\"name\":\"老人手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:55:55\",\"updateTime\":\"2026-05-21T20:55:55\",\"deleted\":0}', '[\"2057445280091111426\",{\"status\":1}]', '2026-06-05 14:51:23');
INSERT INTO `sys_audit_log` VALUES (2062789365299576835, 1, 'admin', '商品分类', '修改分类', 103, '{\"id\":\"103\",\"name\":\"智能手表\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"103\",{\"status\":1}]', '2026-06-05 14:51:24');
INSERT INTO `sys_audit_log` VALUES (2062789366142631937, 1, 'admin', '商品分类', '修改分类', 104, '{\"id\":\"104\",\"name\":\"手机配件\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"104\",{\"status\":1}]', '2026-06-05 14:51:24');
INSERT INTO `sys_audit_log` VALUES (2062789366142631938, 1, 'admin', '商品分类', '修改分类', 10403, '{\"id\":\"10403\",\"name\":\"数据线\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10403\",{\"status\":1}]', '2026-06-05 14:51:24');
INSERT INTO `sys_audit_log` VALUES (2062789366142631939, 1, 'admin', '商品分类', '修改分类', 10404, '{\"id\":\"10404\",\"name\":\"手机膜\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10404\",{\"status\":1}]', '2026-06-05 14:51:24');
INSERT INTO `sys_audit_log` VALUES (2062789366142631940, 1, 'admin', '商品分类', '修改分类', 10401, '{\"id\":\"10401\",\"name\":\"手机壳\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10401\",{\"status\":1}]', '2026-06-05 14:51:24');
INSERT INTO `sys_audit_log` VALUES (2062789366142631941, 1, 'admin', '商品分类', '修改分类', 10402, '{\"id\":\"10402\",\"name\":\"充电器\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10402\",{\"status\":1}]', '2026-06-05 14:51:24');
INSERT INTO `sys_audit_log` VALUES (2062789366796943361, 1, 'admin', '商品分类', '修改分类', 10405, '{\"id\":\"10405\",\"name\":\"手机支架\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10405\",{\"status\":1}]', '2026-06-05 14:51:24');
INSERT INTO `sys_audit_log` VALUES (2062789367572889601, 1, 'admin', '商品分类', '修改分类', 10406, '{\"id\":\"10406\",\"name\":\"充电宝\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10406\",{\"status\":1}]', '2026-06-05 14:51:24');
INSERT INTO `sys_audit_log` VALUES (2062789367639998466, 1, 'admin', '商品分类', '修改分类', 10501, '{\"id\":\"10501\",\"name\":\"微单相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10501\",{\"status\":1}]', '2026-06-05 14:51:24');
INSERT INTO `sys_audit_log` VALUES (2062789367639998467, 1, 'admin', '商品分类', '修改分类', 10502, '{\"id\":\"10502\",\"name\":\"单反相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10502\",{\"status\":1}]', '2026-06-05 14:51:24');
INSERT INTO `sys_audit_log` VALUES (2062789367639998468, 1, 'admin', '商品分类', '修改分类', 105, '{\"id\":\"105\",\"name\":\"摄影摄像\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"105\",{\"status\":1}]', '2026-06-05 14:51:24');
INSERT INTO `sys_audit_log` VALUES (2062789367639998469, 1, 'admin', '商品分类', '修改分类', 10503, '{\"id\":\"10503\",\"name\":\"运动相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10503\",{\"status\":1}]', '2026-06-05 14:51:24');
INSERT INTO `sys_audit_log` VALUES (2062789368227201025, 1, 'admin', '商品分类', '修改分类', 10504, '{\"id\":\"10504\",\"name\":\"无人机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10504\",{\"status\":1}]', '2026-06-05 14:51:24');
INSERT INTO `sys_audit_log` VALUES (2062789368998952961, 1, 'admin', '商品分类', '修改分类', 10505, '{\"id\":\"10505\",\"name\":\"镜头滤镜\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10505\",{\"status\":1}]', '2026-06-05 14:51:25');
INSERT INTO `sys_audit_log` VALUES (2062789369066061825, 1, 'admin', '商品分类', '修改分类', 106, '{\"id\":\"106\",\"name\":\"智能穿戴\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"106\",{\"status\":1}]', '2026-06-05 14:51:25');
INSERT INTO `sys_audit_log` VALUES (2062789369128976386, 1, 'admin', '商品分类', '修改分类', 107, '{\"id\":\"107\",\"name\":\"耳机音箱\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"107\",{\"status\":1}]', '2026-06-05 14:51:25');
INSERT INTO `sys_audit_log` VALUES (2062789369128976387, 1, 'admin', '商品分类', '修改分类', 10702, '{\"id\":\"10702\",\"name\":\"头戴式耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10702\",{\"status\":1}]', '2026-06-05 14:51:25');
INSERT INTO `sys_audit_log` VALUES (2062789369128976388, 1, 'admin', '商品分类', '修改分类', 10701, '{\"id\":\"10701\",\"name\":\"真无线耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10701\",{\"status\":1}]', '2026-06-05 14:51:25');
INSERT INTO `sys_audit_log` VALUES (2062789369653264385, 1, 'admin', '商品分类', '修改分类', 10703, '{\"id\":\"10703\",\"name\":\"蓝牙音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10703\",{\"status\":1}]', '2026-06-05 14:51:25');
INSERT INTO `sys_audit_log` VALUES (2062789370445987842, 1, 'admin', '商品分类', '修改分类', 10704, '{\"id\":\"10704\",\"name\":\"智能音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10704\",{\"status\":1}]', '2026-06-05 14:51:25');
INSERT INTO `sys_audit_log` VALUES (2062789370508902402, 1, 'admin', '商品分类', '修改分类', 10705, '{\"id\":\"10705\",\"name\":\"降噪耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10705\",{\"status\":1}]', '2026-06-05 14:51:25');
INSERT INTO `sys_audit_log` VALUES (2062789391564308482, 1, 'admin', '商品分类', '修改分类', 2, '{\"id\":\"2\",\"name\":\"电脑办公\",\"parentId\":\"0\",\"icon\":\"pc\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"2\",{\"status\":1}]', '2026-06-05 14:51:30');
INSERT INTO `sys_audit_log` VALUES (2062789392608690177, 1, 'admin', '商品分类', '修改分类', 201, '{\"id\":\"201\",\"name\":\"笔记本\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"201\",{\"status\":1}]', '2026-06-05 14:51:30');
INSERT INTO `sys_audit_log` VALUES (2062789393325916162, 1, 'admin', '商品分类', '修改分类', 20104, '{\"id\":\"20104\",\"name\":\"二合一平板\",\"parentId\":\"201\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20104\",{\"status\":1}]', '2026-06-05 14:51:30');
INSERT INTO `sys_audit_log` VALUES (2062789393325916163, 1, 'admin', '商品分类', '修改分类', 20102, '{\"id\":\"20102\",\"name\":\"游戏本\",\"parentId\":\"201\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20102\",{\"status\":1}]', '2026-06-05 14:51:30');
INSERT INTO `sys_audit_log` VALUES (2062789393325916164, 1, 'admin', '商品分类', '修改分类', 20103, '{\"id\":\"20103\",\"name\":\"商务本\",\"parentId\":\"201\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20103\",{\"status\":1}]', '2026-06-05 14:51:30');
INSERT INTO `sys_audit_log` VALUES (2062789393325916165, 1, 'admin', '商品分类', '修改分类', 20101, '{\"id\":\"20101\",\"name\":\"轻薄本\",\"parentId\":\"201\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20101\",{\"status\":1}]', '2026-06-05 14:51:30');
INSERT INTO `sys_audit_log` VALUES (2062789393325916166, 1, 'admin', '商品分类', '修改分类', 202, '{\"id\":\"202\",\"name\":\"台式机\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"202\",{\"status\":1}]', '2026-06-05 14:51:30');
INSERT INTO `sys_audit_log` VALUES (2062789394043142145, 1, 'admin', '商品分类', '修改分类', 203, '{\"id\":\"203\",\"name\":\"显示器\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"203\",{\"status\":1}]', '2026-06-05 14:51:30');
INSERT INTO `sys_audit_log` VALUES (2062789394768756737, 1, 'admin', '商品分类', '修改分类', 20402, '{\"id\":\"20402\",\"name\":\"固态硬盘\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20402\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789394768756739, 1, 'admin', '商品分类', '修改分类', 20401, '{\"id\":\"20401\",\"name\":\"内存条\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20401\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789394768756740, 1, 'admin', '商品分类', '修改分类', 20403, '{\"id\":\"20403\",\"name\":\"机械硬盘\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20403\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789394768756741, 1, 'admin', '商品分类', '修改分类', 204, '{\"id\":\"204\",\"name\":\"电脑配件\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"204\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789394831671297, 1, 'admin', '商品分类', '修改分类', 20404, '{\"id\":\"20404\",\"name\":\"显卡\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20404\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789395473399810, 1, 'admin', '商品分类', '修改分类', 20405, '{\"id\":\"20405\",\"name\":\"主板\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20405\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789396186431489, 1, 'admin', '商品分类', '修改分类', 20406, '{\"id\":\"20406\",\"name\":\"CPU处理器\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20406\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789396312260610, 1, 'admin', '商品分类', '修改分类', 20407, '{\"id\":\"20407\",\"name\":\"电源\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20407\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789396312260611, 1, 'admin', '商品分类', '修改分类', 205, '{\"id\":\"205\",\"name\":\"外设装备\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"205\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789396312260612, 1, 'admin', '商品分类', '修改分类', 20501, '{\"id\":\"20501\",\"name\":\"键盘\",\"parentId\":\"205\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20501\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789396312260613, 1, 'admin', '商品分类', '修改分类', 20408, '{\"id\":\"20408\",\"name\":\"机箱\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20408\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789396891074562, 1, 'admin', '商品分类', '修改分类', 20502, '{\"id\":\"20502\",\"name\":\"鼠标\",\"parentId\":\"205\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20502\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789397667020801, 1, 'admin', '商品分类', '修改分类', 20503, '{\"id\":\"20503\",\"name\":\"鼠标垫\",\"parentId\":\"205\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20503\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789397734129668, 1, 'admin', '商品分类', '修改分类', 20506, '{\"id\":\"20506\",\"name\":\"移动硬盘\",\"parentId\":\"205\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20506\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789397797044225, 1, 'admin', '商品分类', '修改分类', 20505, '{\"id\":\"20505\",\"name\":\"U盘\",\"parentId\":\"205\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20505\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789397797044226, 1, 'admin', '商品分类', '修改分类', 206, '{\"id\":\"206\",\"name\":\"办公设备\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"206\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789397797044227, 1, 'admin', '商品分类', '修改分类', 20504, '{\"id\":\"20504\",\"name\":\"摄像头\",\"parentId\":\"205\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20504\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789398321332226, 1, 'admin', '商品分类', '修改分类', 207, '{\"id\":\"207\",\"name\":\"网络设备\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"207\",{\"status\":1}]', '2026-06-05 14:51:31');
INSERT INTO `sys_audit_log` VALUES (2062789399105667073, 1, 'admin', '商品分类', '修改分类', 208, '{\"id\":\"208\",\"name\":\"游戏设备\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"208\",{\"status\":1}]', '2026-06-05 14:51:32');
INSERT INTO `sys_audit_log` VALUES (2062789408224083970, 1, 'admin', '商品分类', '修改分类', 3, '{\"id\":\"3\",\"name\":\"家用电器\",\"parentId\":\"0\",\"icon\":\"appliance\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"3\",{\"status\":1}]', '2026-06-05 14:51:34');
INSERT INTO `sys_audit_log` VALUES (2062789409335574530, 1, 'admin', '商品分类', '修改分类', 301, '{\"id\":\"301\",\"name\":\"空调\",\"parentId\":\"3\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"301\",{\"status\":1}]', '2026-06-05 14:51:34');
INSERT INTO `sys_audit_log` VALUES (2062789409981497345, 1, 'admin', '商品分类', '修改分类', 30103, '{\"id\":\"30103\",\"name\":\"中央空调\",\"parentId\":\"301\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30103\",{\"status\":1}]', '2026-06-05 14:51:34');
INSERT INTO `sys_audit_log` VALUES (2062789410044411906, 1, 'admin', '商品分类', '修改分类', 30102, '{\"id\":\"30102\",\"name\":\"柜式空调\",\"parentId\":\"301\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30102\",{\"status\":1}]', '2026-06-05 14:51:34');
INSERT INTO `sys_audit_log` VALUES (2062789410044411907, 1, 'admin', '商品分类', '修改分类', 302, '{\"id\":\"302\",\"name\":\"洗衣机\",\"parentId\":\"3\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"302\",{\"status\":1}]', '2026-06-05 14:51:34');
INSERT INTO `sys_audit_log` VALUES (2062789410044411908, 1, 'admin', '商品分类', '修改分类', 30101, '{\"id\":\"30101\",\"name\":\"壁挂空调\",\"parentId\":\"301\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30101\",{\"status\":1}]', '2026-06-05 14:51:34');
INSERT INTO `sys_audit_log` VALUES (2062789410044411909, 1, 'admin', '商品分类', '修改分类', 30104, '{\"id\":\"30104\",\"name\":\"移动空调\",\"parentId\":\"301\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30104\",{\"status\":1}]', '2026-06-05 14:51:34');
INSERT INTO `sys_audit_log` VALUES (2062789410757443586, 1, 'admin', '商品分类', '修改分类', 303, '{\"id\":\"303\",\"name\":\"冰箱\",\"parentId\":\"3\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"303\",{\"status\":1}]', '2026-06-05 14:51:34');
INSERT INTO `sys_audit_log` VALUES (2062789411474669575, 1, 'admin', '商品分类', '修改分类', 30402, '{\"id\":\"30402\",\"name\":\"微波炉\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30402\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789411541778433, 1, 'admin', '商品分类', '修改分类', 30404, '{\"id\":\"30404\",\"name\":\"电压力锅\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30404\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789411541778434, 1, 'admin', '商品分类', '修改分类', 304, '{\"id\":\"304\",\"name\":\"厨房电器\",\"parentId\":\"3\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"304\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789411541778435, 1, 'admin', '商品分类', '修改分类', 30403, '{\"id\":\"30403\",\"name\":\"烤箱\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30403\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789411541778436, 1, 'admin', '商品分类', '修改分类', 30401, '{\"id\":\"30401\",\"name\":\"电饭煲\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30401\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789412196089857, 1, 'admin', '商品分类', '修改分类', 30405, '{\"id\":\"30405\",\"name\":\"空气炸锅\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30405\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789412972036102, 1, 'admin', '商品分类', '修改分类', 30409, '{\"id\":\"30409\",\"name\":\"洗碗机\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":9,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30409\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789412972036103, 1, 'admin', '商品分类', '修改分类', 305, '{\"id\":\"305\",\"name\":\"生活电器\",\"parentId\":\"3\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"305\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789412972036104, 1, 'admin', '商品分类', '修改分类', 30407, '{\"id\":\"30407\",\"name\":\"电磁炉\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30407\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789412972036105, 1, 'admin', '商品分类', '修改分类', 30408, '{\"id\":\"30408\",\"name\":\"油烟机\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30408\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789412972036106, 1, 'admin', '商品分类', '修改分类', 30406, '{\"id\":\"30406\",\"name\":\"破壁机\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30406\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789413626347522, 1, 'admin', '商品分类', '修改分类', 30501, '{\"id\":\"30501\",\"name\":\"扫地机器人\",\"parentId\":\"305\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30501\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789414402293762, 1, 'admin', '商品分类', '修改分类', 30502, '{\"id\":\"30502\",\"name\":\"吸尘器\",\"parentId\":\"305\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30502\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789414469402626, 1, 'admin', '商品分类', '修改分类', 30503, '{\"id\":\"30503\",\"name\":\"加湿器\",\"parentId\":\"305\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30503\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789414536511490, 1, 'admin', '商品分类', '修改分类', 30504, '{\"id\":\"30504\",\"name\":\"电风扇\",\"parentId\":\"305\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30504\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789414536511491, 1, 'admin', '商品分类', '修改分类', 306, '{\"id\":\"306\",\"name\":\"个护电器\",\"parentId\":\"3\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"306\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789414536511492, 1, 'admin', '商品分类', '修改分类', 30505, '{\"id\":\"30505\",\"name\":\"净水器\",\"parentId\":\"305\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30505\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789415056605186, 1, 'admin', '商品分类', '修改分类', 307, '{\"id\":\"307\",\"name\":\"影音娱乐\",\"parentId\":\"3\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"307\",{\"status\":1}]', '2026-06-05 14:51:35');
INSERT INTO `sys_audit_log` VALUES (2062789415899660289, 1, 'admin', '商品分类', '修改分类', 30701, '{\"id\":\"30701\",\"name\":\"智能电视\",\"parentId\":\"307\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30701\",{\"status\":1}]', '2026-06-05 14:51:36');
INSERT INTO `sys_audit_log` VALUES (2062789415899660290, 1, 'admin', '商品分类', '修改分类', 30702, '{\"id\":\"30702\",\"name\":\"投影仪\",\"parentId\":\"307\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30702\",{\"status\":1}]', '2026-06-05 14:51:36');
INSERT INTO `sys_audit_log` VALUES (2062789415966769153, 1, 'admin', '商品分类', '修改分类', 30704, '{\"id\":\"30704\",\"name\":\"音响功放\",\"parentId\":\"307\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30704\",{\"status\":1}]', '2026-06-05 14:51:36');
INSERT INTO `sys_audit_log` VALUES (2062789415966769154, 1, 'admin', '商品分类', '修改分类', 30703, '{\"id\":\"30703\",\"name\":\"家庭影院\",\"parentId\":\"307\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30703\",{\"status\":1}]', '2026-06-05 14:51:36');
INSERT INTO `sys_audit_log` VALUES (2062789425479450626, 1, 'admin', '商品分类', '修改分类', 4, '{\"id\":\"4\",\"name\":\"服饰鞋包\",\"parentId\":\"0\",\"icon\":\"fashion\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"4\",{\"status\":1}]', '2026-06-05 14:51:38');
INSERT INTO `sys_audit_log` VALUES (2062789426582552577, 1, 'admin', '商品分类', '修改分类', 401, '{\"id\":\"401\",\"name\":\"女装\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"401\",{\"status\":1}]', '2026-06-05 14:51:38');
INSERT INTO `sys_audit_log` VALUES (2062789427291389953, 1, 'admin', '商品分类', '修改分类', 40102, '{\"id\":\"40102\",\"name\":\"T恤衫\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40102\",{\"status\":1}]', '2026-06-05 14:51:38');
INSERT INTO `sys_audit_log` VALUES (2062789427291389954, 1, 'admin', '商品分类', '修改分类', 40101, '{\"id\":\"40101\",\"name\":\"连衣裙\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40101\",{\"status\":1}]', '2026-06-05 14:51:38');
INSERT INTO `sys_audit_log` VALUES (2062789427291389955, 1, 'admin', '商品分类', '修改分类', 40103, '{\"id\":\"40103\",\"name\":\"外套大衣\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40103\",{\"status\":1}]', '2026-06-05 14:51:38');
INSERT INTO `sys_audit_log` VALUES (2062789427291389956, 1, 'admin', '商品分类', '修改分类', 40105, '{\"id\":\"40105\",\"name\":\"半身裙\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40105\",{\"status\":1}]', '2026-06-05 14:51:38');
INSERT INTO `sys_audit_log` VALUES (2062789427291389957, 1, 'admin', '商品分类', '修改分类', 40104, '{\"id\":\"40104\",\"name\":\"裤装\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40104\",{\"status\":1}]', '2026-06-05 14:51:38');
INSERT INTO `sys_audit_log` VALUES (2062789428000227329, 1, 'admin', '商品分类', '修改分类', 40106, '{\"id\":\"40106\",\"name\":\"针织衫\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40106\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789428776173572, 1, 'admin', '商品分类', '修改分类', 40107, '{\"id\":\"40107\",\"name\":\"卫衣\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40107\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789428839088129, 1, 'admin', '商品分类', '修改分类', 40108, '{\"id\":\"40108\",\"name\":\"西装\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40108\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789428839088130, 1, 'admin', '商品分类', '修改分类', 40202, '{\"id\":\"40202\",\"name\":\"衬衫\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40202\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789428839088131, 1, 'admin', '商品分类', '修改分类', 402, '{\"id\":\"402\",\"name\":\"男装\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"402\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789428839088132, 1, 'admin', '商品分类', '修改分类', 40201, '{\"id\":\"40201\",\"name\":\"夹克\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40201\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789429426290689, 1, 'admin', '商品分类', '修改分类', 40203, '{\"id\":\"40203\",\"name\":\"T恤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40203\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789430206431234, 1, 'admin', '商品分类', '修改分类', 40204, '{\"id\":\"40204\",\"name\":\"休闲裤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40204\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789430273540098, 1, 'admin', '商品分类', '修改分类', 40205, '{\"id\":\"40205\",\"name\":\"牛仔裤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40205\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789430273540099, 1, 'admin', '商品分类', '修改分类', 40208, '{\"id\":\"40208\",\"name\":\"羽绒服\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40208\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789430273540100, 1, 'admin', '商品分类', '修改分类', 40207, '{\"id\":\"40207\",\"name\":\"西装西裤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40207\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789430273540101, 1, 'admin', '商品分类', '修改分类', 40206, '{\"id\":\"40206\",\"name\":\"卫衣帽衫\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40206\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789430856548354, 1, 'admin', '商品分类', '修改分类', 403, '{\"id\":\"403\",\"name\":\"内衣配饰\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"403\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789431636688897, 1, 'admin', '商品分类', '修改分类', 404, '{\"id\":\"404\",\"name\":\"鞋靴\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"404\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789431707992066, 1, 'admin', '商品分类', '修改分类', 40403, '{\"id\":\"40403\",\"name\":\"高跟鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40403\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789431707992067, 1, 'admin', '商品分类', '修改分类', 40402, '{\"id\":\"40402\",\"name\":\"休闲鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40402\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789431707992068, 1, 'admin', '商品分类', '修改分类', 40401, '{\"id\":\"40401\",\"name\":\"运动鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40401\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789431707992069, 1, 'admin', '商品分类', '修改分类', 40404, '{\"id\":\"40404\",\"name\":\"皮鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40404\",{\"status\":1}]', '2026-06-05 14:51:39');
INSERT INTO `sys_audit_log` VALUES (2062789432286806017, 1, 'admin', '商品分类', '修改分类', 40405, '{\"id\":\"40405\",\"name\":\"凉鞋拖鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40405\",{\"status\":1}]', '2026-06-05 14:51:40');
INSERT INTO `sys_audit_log` VALUES (2062789433071140865, 1, 'admin', '商品分类', '修改分类', 40406, '{\"id\":\"40406\",\"name\":\"靴子\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40406\",{\"status\":1}]', '2026-06-05 14:51:40');
INSERT INTO `sys_audit_log` VALUES (2062789433134055425, 1, 'admin', '商品分类', '修改分类', 40502, '{\"id\":\"40502\",\"name\":\"单肩包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40502\",{\"status\":1}]', '2026-06-05 14:51:40');
INSERT INTO `sys_audit_log` VALUES (2062789433134055426, 1, 'admin', '商品分类', '修改分类', 40503, '{\"id\":\"40503\",\"name\":\"手提包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40503\",{\"status\":1}]', '2026-06-05 14:51:40');
INSERT INTO `sys_audit_log` VALUES (2062789433134055427, 1, 'admin', '商品分类', '修改分类', 40501, '{\"id\":\"40501\",\"name\":\"双肩包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40501\",{\"status\":1}]', '2026-06-05 14:51:40');
INSERT INTO `sys_audit_log` VALUES (2062789433134055428, 1, 'admin', '商品分类', '修改分类', 405, '{\"id\":\"405\",\"name\":\"箱包\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"405\",{\"status\":1}]', '2026-06-05 14:51:40');
INSERT INTO `sys_audit_log` VALUES (2062789433725452289, 1, 'admin', '商品分类', '修改分类', 40504, '{\"id\":\"40504\",\"name\":\"行李箱\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40504\",{\"status\":1}]', '2026-06-05 14:51:40');
INSERT INTO `sys_audit_log` VALUES (2062789434505592833, 1, 'admin', '商品分类', '修改分类', 40505, '{\"id\":\"40505\",\"name\":\"钱包卡包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40505\",{\"status\":1}]', '2026-06-05 14:51:40');
INSERT INTO `sys_audit_log` VALUES (2062789434572701697, 1, 'admin', '商品分类', '修改分类', 5, '{\"id\":\"5\",\"name\":\"美妆个护\",\"parentId\":\"0\",\"icon\":\"beauty\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"5\",{\"status\":1}]', '2026-06-05 14:51:40');
INSERT INTO `sys_audit_log` VALUES (2062789434572701698, 1, 'admin', '商品分类', '修改分类', 406, '{\"id\":\"406\",\"name\":\"童装\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"406\",{\"status\":1}]', '2026-06-05 14:51:40');
INSERT INTO `sys_audit_log` VALUES (2062789436258811911, 1, 'admin', '商品分类', '修改分类', 501, '{\"id\":\"501\",\"name\":\"面部护肤\",\"parentId\":\"5\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"501\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789436321726465, 1, 'admin', '商品分类', '修改分类', 50101, '{\"id\":\"50101\",\"name\":\"面霜\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50101\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789436321726466, 1, 'admin', '商品分类', '修改分类', 50103, '{\"id\":\"50103\",\"name\":\"面膜\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50103\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789436321726467, 1, 'admin', '商品分类', '修改分类', 50102, '{\"id\":\"50102\",\"name\":\"精华液\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50102\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789436321726468, 1, 'admin', '商品分类', '修改分类', 50105, '{\"id\":\"50105\",\"name\":\"洁面乳\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50105\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789436321726469, 1, 'admin', '商品分类', '修改分类', 50104, '{\"id\":\"50104\",\"name\":\"爽肤水\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50104\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789437693263873, 1, 'admin', '商品分类', '修改分类', 50106, '{\"id\":\"50106\",\"name\":\"眼霜\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50106\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789437760372738, 1, 'admin', '商品分类', '修改分类', 50202, '{\"id\":\"50202\",\"name\":\"粉底液\",\"parentId\":\"502\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50202\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789437760372739, 1, 'admin', '商品分类', '修改分类', 50108, '{\"id\":\"50108\",\"name\":\"卸妆\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50108\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789437760372740, 1, 'admin', '商品分类', '修改分类', 502, '{\"id\":\"502\",\"name\":\"彩妆\",\"parentId\":\"5\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"502\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789437760372741, 1, 'admin', '商品分类', '修改分类', 50107, '{\"id\":\"50107\",\"name\":\"防晒霜\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50107\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789437760372742, 1, 'admin', '商品分类', '修改分类', 50201, '{\"id\":\"50201\",\"name\":\"口红唇膏\",\"parentId\":\"502\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50201\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789439127715842, 1, 'admin', '商品分类', '修改分类', 50203, '{\"id\":\"50203\",\"name\":\"眼影\",\"parentId\":\"502\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50203\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789439194824708, 1, 'admin', '商品分类', '修改分类', 50206, '{\"id\":\"50206\",\"name\":\"指甲油\",\"parentId\":\"502\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50206\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789439194824709, 1, 'admin', '商品分类', '修改分类', 50205, '{\"id\":\"50205\",\"name\":\"腮红\",\"parentId\":\"502\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50205\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789439194824710, 1, 'admin', '商品分类', '修改分类', 50204, '{\"id\":\"50204\",\"name\":\"眉笔眉粉\",\"parentId\":\"502\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50204\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789439194824711, 1, 'admin', '商品分类', '修改分类', 504, '{\"id\":\"504\",\"name\":\"身体护理\",\"parentId\":\"5\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"504\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789439194824712, 1, 'admin', '商品分类', '修改分类', 503, '{\"id\":\"503\",\"name\":\"香水\",\"parentId\":\"5\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"503\",{\"status\":1}]', '2026-06-05 14:51:41');
INSERT INTO `sys_audit_log` VALUES (2062789440566362113, 1, 'admin', '商品分类', '修改分类', 505, '{\"id\":\"505\",\"name\":\"口腔护理\",\"parentId\":\"5\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"505\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789440629276674, 1, 'admin', '商品分类', '修改分类', 506, '{\"id\":\"506\",\"name\":\"洗发护发\",\"parentId\":\"5\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"506\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789440629276675, 1, 'admin', '商品分类', '修改分类', 6, '{\"id\":\"6\",\"name\":\"食品生鲜\",\"parentId\":\"0\",\"icon\":\"food\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"6\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789442382495746, 1, 'admin', '商品分类', '修改分类', 601, '{\"id\":\"601\",\"name\":\"新鲜水果\",\"parentId\":\"6\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"601\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789442445410306, 1, 'admin', '商品分类', '修改分类', 60101, '{\"id\":\"60101\",\"name\":\"苹果\",\"parentId\":\"601\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60101\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789442445410307, 1, 'admin', '商品分类', '修改分类', 60103, '{\"id\":\"60103\",\"name\":\"热带水果\",\"parentId\":\"601\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60103\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789442445410308, 1, 'admin', '商品分类', '修改分类', 60105, '{\"id\":\"60105\",\"name\":\"瓜类\",\"parentId\":\"601\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60105\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789442445410309, 1, 'admin', '商品分类', '修改分类', 60104, '{\"id\":\"60104\",\"name\":\"葡萄提子\",\"parentId\":\"601\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60104\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789442445410310, 1, 'admin', '商品分类', '修改分类', 60102, '{\"id\":\"60102\",\"name\":\"柑橘橙柚\",\"parentId\":\"601\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60102\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789443816947713, 1, 'admin', '商品分类', '修改分类', 60106, '{\"id\":\"60106\",\"name\":\"进口水果\",\"parentId\":\"601\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60106\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789443884056577, 1, 'admin', '商品分类', '修改分类', 602, '{\"id\":\"602\",\"name\":\"蔬菜蛋类\",\"parentId\":\"6\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"602\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789443884056578, 1, 'admin', '商品分类', '修改分类', 60301, '{\"id\":\"60301\",\"name\":\"猪肉\",\"parentId\":\"603\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60301\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789443884056579, 1, 'admin', '商品分类', '修改分类', 60302, '{\"id\":\"60302\",\"name\":\"牛肉\",\"parentId\":\"603\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60302\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789443884056580, 1, 'admin', '商品分类', '修改分类', 603, '{\"id\":\"603\",\"name\":\"肉禽海鲜\",\"parentId\":\"6\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"603\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789443884056581, 1, 'admin', '商品分类', '修改分类', 60303, '{\"id\":\"60303\",\"name\":\"羊肉\",\"parentId\":\"603\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60303\",{\"status\":1}]', '2026-06-05 14:51:42');
INSERT INTO `sys_audit_log` VALUES (2062789445247205377, 1, 'admin', '商品分类', '修改分类', 60304, '{\"id\":\"60304\",\"name\":\"鸡肉\",\"parentId\":\"603\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60304\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789445314314242, 1, 'admin', '商品分类', '修改分类', 605, '{\"id\":\"605\",\"name\":\"零食小吃\",\"parentId\":\"6\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"605\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789445314314243, 1, 'admin', '商品分类', '修改分类', 604, '{\"id\":\"604\",\"name\":\"牛奶乳品\",\"parentId\":\"6\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"604\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789445314314244, 1, 'admin', '商品分类', '修改分类', 60501, '{\"id\":\"60501\",\"name\":\"坚果炒货\",\"parentId\":\"605\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60501\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789445314314245, 1, 'admin', '商品分类', '修改分类', 60306, '{\"id\":\"60306\",\"name\":\"冷冻调理\",\"parentId\":\"603\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60306\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789445314314246, 1, 'admin', '商品分类', '修改分类', 60305, '{\"id\":\"60305\",\"name\":\"海鲜水产\",\"parentId\":\"603\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60305\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789446685851650, 1, 'admin', '商品分类', '修改分类', 60502, '{\"id\":\"60502\",\"name\":\"膨化食品\",\"parentId\":\"605\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60502\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789446748766213, 1, 'admin', '商品分类', '修改分类', 60503, '{\"id\":\"60503\",\"name\":\"饼干糕点\",\"parentId\":\"605\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60503\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789446815875074, 1, 'admin', '商品分类', '修改分类', 60505, '{\"id\":\"60505\",\"name\":\"蜜饯果干\",\"parentId\":\"605\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60505\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789446815875075, 1, 'admin', '商品分类', '修改分类', 60506, '{\"id\":\"60506\",\"name\":\"肉干豆干\",\"parentId\":\"605\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60506\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789446815875076, 1, 'admin', '商品分类', '修改分类', 60504, '{\"id\":\"60504\",\"name\":\"糖果巧克力\",\"parentId\":\"605\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60504\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789446815875077, 1, 'admin', '商品分类', '修改分类', 606, '{\"id\":\"606\",\"name\":\"茗茶酒饮\",\"parentId\":\"6\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"606\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789448120303617, 1, 'admin', '商品分类', '修改分类', 60601, '{\"id\":\"60601\",\"name\":\"绿茶\",\"parentId\":\"606\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60601\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789448250327047, 1, 'admin', '商品分类', '修改分类', 60603, '{\"id\":\"60603\",\"name\":\"白酒\",\"parentId\":\"606\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60603\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789448309047297, 1, 'admin', '商品分类', '修改分类', 60605, '{\"id\":\"60605\",\"name\":\"啤酒\",\"parentId\":\"606\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60605\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789448309047298, 1, 'admin', '商品分类', '修改分类', 60604, '{\"id\":\"60604\",\"name\":\"红酒\",\"parentId\":\"606\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60604\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789448309047299, 1, 'admin', '商品分类', '修改分类', 60606, '{\"id\":\"60606\",\"name\":\"咖啡奶茶\",\"parentId\":\"606\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60606\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789448309047300, 1, 'admin', '商品分类', '修改分类', 60602, '{\"id\":\"60602\",\"name\":\"红茶\",\"parentId\":\"606\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60602\",{\"status\":1}]', '2026-06-05 14:51:43');
INSERT INTO `sys_audit_log` VALUES (2062789449554755586, 1, 'admin', '商品分类', '修改分类', 60607, '{\"id\":\"60607\",\"name\":\"饮料果汁\",\"parentId\":\"606\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60607\",{\"status\":1}]', '2026-06-05 14:51:44');
INSERT INTO `sys_audit_log` VALUES (2062789449621864450, 1, 'admin', '商品分类', '修改分类', 607, '{\"id\":\"607\",\"name\":\"粮油调味\",\"parentId\":\"6\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"607\",{\"status\":1}]', '2026-06-05 14:51:44');
INSERT INTO `sys_audit_log` VALUES (2062789456156590081, 1, 'admin', '商品分类', '修改分类', 7, '{\"id\":\"7\",\"name\":\"家具家装\",\"parentId\":\"0\",\"icon\":\"furniture\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"7\",{\"status\":1}]', '2026-06-05 14:51:45');
INSERT INTO `sys_audit_log` VALUES (2062789457263886337, 1, 'admin', '商品分类', '修改分类', 701, '{\"id\":\"701\",\"name\":\"客厅家具\",\"parentId\":\"7\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"701\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789457914003457, 1, 'admin', '商品分类', '修改分类', 70101, '{\"id\":\"70101\",\"name\":\"沙发\",\"parentId\":\"701\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"70101\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789457914003458, 1, 'admin', '商品分类', '修改分类', 70103, '{\"id\":\"70103\",\"name\":\"电视柜\",\"parentId\":\"701\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"70103\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789457914003459, 1, 'admin', '商品分类', '修改分类', 70104, '{\"id\":\"70104\",\"name\":\"鞋柜\",\"parentId\":\"701\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"70104\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789457914003460, 1, 'admin', '商品分类', '修改分类', 70102, '{\"id\":\"70102\",\"name\":\"茶几\",\"parentId\":\"701\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"70102\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789457914003461, 1, 'admin', '商品分类', '修改分类', 702, '{\"id\":\"702\",\"name\":\"卧室家具\",\"parentId\":\"7\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"702\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789458694144002, 1, 'admin', '商品分类', '修改分类', 70201, '{\"id\":\"70201\",\"name\":\"床\",\"parentId\":\"702\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"70201\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789459344261123, 1, 'admin', '商品分类', '修改分类', 70202, '{\"id\":\"70202\",\"name\":\"床垫\",\"parentId\":\"702\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"70202\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789459344261124, 1, 'admin', '商品分类', '修改分类', 70203, '{\"id\":\"70203\",\"name\":\"衣柜\",\"parentId\":\"702\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"70203\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789459344261125, 1, 'admin', '商品分类', '修改分类', 70204, '{\"id\":\"70204\",\"name\":\"梳妆台\",\"parentId\":\"702\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"70204\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789459344261126, 1, 'admin', '商品分类', '修改分类', 704, '{\"id\":\"704\",\"name\":\"厨房卫浴\",\"parentId\":\"7\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"704\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789459344261127, 1, 'admin', '商品分类', '修改分类', 703, '{\"id\":\"703\",\"name\":\"书房家具\",\"parentId\":\"7\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"703\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789460128595970, 1, 'admin', '商品分类', '修改分类', 705, '{\"id\":\"705\",\"name\":\"灯具照明\",\"parentId\":\"7\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"705\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789460778713090, 1, 'admin', '商品分类', '修改分类', 706, '{\"id\":\"706\",\"name\":\"家装建材\",\"parentId\":\"7\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"706\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789460778713094, 1, 'admin', '商品分类', '修改分类', 70601, '{\"id\":\"70601\",\"name\":\"地板\",\"parentId\":\"706\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"70601\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789460841627650, 1, 'admin', '商品分类', '修改分类', 70603, '{\"id\":\"70603\",\"name\":\"涂料\",\"parentId\":\"706\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"70603\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789460841627651, 1, 'admin', '商品分类', '修改分类', 70602, '{\"id\":\"70602\",\"name\":\"瓷砖\",\"parentId\":\"706\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"70602\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789460841627652, 1, 'admin', '商品分类', '修改分类', 70604, '{\"id\":\"70604\",\"name\":\"卫浴洁具\",\"parentId\":\"706\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"70604\",{\"status\":1}]', '2026-06-05 14:51:46');
INSERT INTO `sys_audit_log` VALUES (2062789461558853633, 1, 'admin', '商品分类', '修改分类', 70605, '{\"id\":\"70605\",\"name\":\"五金工具\",\"parentId\":\"706\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"70605\",{\"status\":1}]', '2026-06-05 14:51:47');
INSERT INTO `sys_audit_log` VALUES (2062789467481210882, 1, 'admin', '商品分类', '修改分类', 8, '{\"id\":\"8\",\"name\":\"汽车用品\",\"parentId\":\"0\",\"icon\":\"car\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"8\",{\"status\":1}]', '2026-06-05 14:51:48');
INSERT INTO `sys_audit_log` VALUES (2062789468592701442, 1, 'admin', '商品分类', '修改分类', 801, '{\"id\":\"801\",\"name\":\"车载电器\",\"parentId\":\"8\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"801\",{\"status\":1}]', '2026-06-05 14:51:48');
INSERT INTO `sys_audit_log` VALUES (2062789469251207174, 1, 'admin', '商品分类', '修改分类', 80102, '{\"id\":\"80102\",\"name\":\"车载充电器\",\"parentId\":\"801\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"80102\",{\"status\":1}]', '2026-06-05 14:51:48');
INSERT INTO `sys_audit_log` VALUES (2062789469305733122, 1, 'admin', '商品分类', '修改分类', 80103, '{\"id\":\"80103\",\"name\":\"车载吸尘器\",\"parentId\":\"801\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"80103\",{\"status\":1}]', '2026-06-05 14:51:48');
INSERT INTO `sys_audit_log` VALUES (2062789469305733123, 1, 'admin', '商品分类', '修改分类', 80105, '{\"id\":\"80105\",\"name\":\"车载冰箱\",\"parentId\":\"801\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"80105\",{\"status\":1}]', '2026-06-05 14:51:48');
INSERT INTO `sys_audit_log` VALUES (2062789469305733124, 1, 'admin', '商品分类', '修改分类', 80104, '{\"id\":\"80104\",\"name\":\"车载净化器\",\"parentId\":\"801\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"80104\",{\"status\":1}]', '2026-06-05 14:51:48');
INSERT INTO `sys_audit_log` VALUES (2062789469305733125, 1, 'admin', '商品分类', '修改分类', 80101, '{\"id\":\"80101\",\"name\":\"行车记录仪\",\"parentId\":\"801\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"80101\",{\"status\":1}]', '2026-06-05 14:51:48');
INSERT INTO `sys_audit_log` VALUES (2062789470027153410, 1, 'admin', '商品分类', '修改分类', 802, '{\"id\":\"802\",\"name\":\"汽车装饰\",\"parentId\":\"8\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"802\",{\"status\":1}]', '2026-06-05 14:51:49');
INSERT INTO `sys_audit_log` VALUES (2062789470677270529, 1, 'admin', '商品分类', '修改分类', 803, '{\"id\":\"803\",\"name\":\"安全出行\",\"parentId\":\"8\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"803\",{\"status\":1}]', '2026-06-05 14:51:49');
INSERT INTO `sys_audit_log` VALUES (2062789470740185089, 1, 'admin', '商品分类', '修改分类', 805, '{\"id\":\"805\",\"name\":\"维修配件\",\"parentId\":\"8\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"805\",{\"status\":1}]', '2026-06-05 14:51:49');
INSERT INTO `sys_audit_log` VALUES (2062789470740185090, 1, 'admin', '商品分类', '修改分类', 804, '{\"id\":\"804\",\"name\":\"美容养护\",\"parentId\":\"8\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"804\",{\"status\":1}]', '2026-06-05 14:51:49');
INSERT INTO `sys_audit_log` VALUES (2062789473361625090, 1, 'admin', '商品分类', '修改分类', 9, '{\"id\":\"9\",\"name\":\"母婴玩具\",\"parentId\":\"0\",\"icon\":\"baby\",\"sortNum\":9,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"9\",{\"status\":1}]', '2026-06-05 14:51:49');
INSERT INTO `sys_audit_log` VALUES (2062789474473115649, 1, 'admin', '商品分类', '修改分类', 901, '{\"id\":\"901\",\"name\":\"奶粉辅食\",\"parentId\":\"9\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"901\",{\"status\":1}]', '2026-06-05 14:51:50');
INSERT INTO `sys_audit_log` VALUES (2062789475064512515, 1, 'admin', '商品分类', '修改分类', 902, '{\"id\":\"902\",\"name\":\"纸尿裤\",\"parentId\":\"9\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"902\",{\"status\":1}]', '2026-06-05 14:51:50');
INSERT INTO `sys_audit_log` VALUES (2062789475064512516, 1, 'admin', '商品分类', '修改分类', 905, '{\"id\":\"905\",\"name\":\"益智玩具\",\"parentId\":\"9\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"905\",{\"status\":1}]', '2026-06-05 14:51:50');
INSERT INTO `sys_audit_log` VALUES (2062789475064512517, 1, 'admin', '商品分类', '修改分类', 90501, '{\"id\":\"90501\",\"name\":\"积木拼插\",\"parentId\":\"905\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"90501\",{\"status\":1}]', '2026-06-05 14:51:50');
INSERT INTO `sys_audit_log` VALUES (2062789475064512518, 1, 'admin', '商品分类', '修改分类', 903, '{\"id\":\"903\",\"name\":\"童装童鞋\",\"parentId\":\"9\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"903\",{\"status\":1}]', '2026-06-05 14:51:50');
INSERT INTO `sys_audit_log` VALUES (2062789475064512519, 1, 'admin', '商品分类', '修改分类', 904, '{\"id\":\"904\",\"name\":\"喂养用品\",\"parentId\":\"9\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"904\",{\"status\":1}]', '2026-06-05 14:51:50');
INSERT INTO `sys_audit_log` VALUES (2062789475911761921, 1, 'admin', '商品分类', '修改分类', 90502, '{\"id\":\"90502\",\"name\":\"遥控模型\",\"parentId\":\"905\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"90502\",{\"status\":1}]', '2026-06-05 14:51:50');
INSERT INTO `sys_audit_log` VALUES (2062789476498964481, 1, 'admin', '商品分类', '修改分类', 906, '{\"id\":\"906\",\"name\":\"孕产用品\",\"parentId\":\"9\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"906\",{\"status\":1}]', '2026-06-05 14:51:50');
INSERT INTO `sys_audit_log` VALUES (2062789476498964482, 1, 'admin', '商品分类', '修改分类', 90503, '{\"id\":\"90503\",\"name\":\"毛绒玩具\",\"parentId\":\"905\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"90503\",{\"status\":1}]', '2026-06-05 14:51:50');
INSERT INTO `sys_audit_log` VALUES (2062789476498964483, 1, 'admin', '商品分类', '修改分类', 90505, '{\"id\":\"90505\",\"name\":\"儿童车\",\"parentId\":\"905\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"90505\",{\"status\":1}]', '2026-06-05 14:51:50');
INSERT INTO `sys_audit_log` VALUES (2062789476498964484, 1, 'admin', '商品分类', '修改分类', 90504, '{\"id\":\"90504\",\"name\":\"早教玩具\",\"parentId\":\"905\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"90504\",{\"status\":1}]', '2026-06-05 14:51:50');
INSERT INTO `sys_audit_log` VALUES (2062789478860357634, 1, 'admin', '商品分类', '修改分类', 10, '{\"id\":\"10\",\"name\":\"图书文娱\",\"parentId\":\"0\",\"icon\":\"book\",\"sortNum\":10,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10\",{\"status\":1}]', '2026-06-05 14:51:51');
INSERT INTO `sys_audit_log` VALUES (2062789479904739330, 1, 'admin', '商品分类', '修改分类', 1001, '{\"id\":\"1001\",\"name\":\"小说文学\",\"parentId\":\"10\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1001\",{\"status\":1}]', '2026-06-05 14:51:51');
INSERT INTO `sys_audit_log` VALUES (2062789480554856450, 1, 'admin', '商品分类', '修改分类', 1006, '{\"id\":\"1006\",\"name\":\"音乐影视\",\"parentId\":\"10\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1006\",{\"status\":1}]', '2026-06-05 14:51:51');
INSERT INTO `sys_audit_log` VALUES (2062789480554856451, 1, 'admin', '商品分类', '修改分类', 1003, '{\"id\":\"1003\",\"name\":\"教育考试\",\"parentId\":\"10\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1003\",{\"status\":1}]', '2026-06-05 14:51:51');
INSERT INTO `sys_audit_log` VALUES (2062789480554856452, 1, 'admin', '商品分类', '修改分类', 1005, '{\"id\":\"1005\",\"name\":\"生活艺术\",\"parentId\":\"10\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1005\",{\"status\":1}]', '2026-06-05 14:51:51');
INSERT INTO `sys_audit_log` VALUES (2062789480554856453, 1, 'admin', '商品分类', '修改分类', 1004, '{\"id\":\"1004\",\"name\":\"经管科技\",\"parentId\":\"10\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1004\",{\"status\":1}]', '2026-06-05 14:51:51');
INSERT INTO `sys_audit_log` VALUES (2062789480554856454, 1, 'admin', '商品分类', '修改分类', 1002, '{\"id\":\"1002\",\"name\":\"少儿图书\",\"parentId\":\"10\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1002\",{\"status\":1}]', '2026-06-05 14:51:51');
INSERT INTO `sys_audit_log` VALUES (2062789483297931265, 1, 'admin', '商品分类', '修改分类', 11, '{\"id\":\"11\",\"name\":\"运动户外\",\"parentId\":\"0\",\"icon\":\"sport\",\"sortNum\":11,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"11\",{\"status\":1}]', '2026-06-05 14:51:52');
INSERT INTO `sys_audit_log` VALUES (2062789484413616129, 1, 'admin', '商品分类', '修改分类', 1101, '{\"id\":\"1101\",\"name\":\"运动服饰\",\"parentId\":\"11\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1101\",{\"status\":1}]', '2026-06-05 14:51:52');
INSERT INTO `sys_audit_log` VALUES (2062789484992430087, 1, 'admin', '商品分类', '修改分类', 110302, '{\"id\":\"110302\",\"name\":\"动感单车\",\"parentId\":\"1103\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"110302\",{\"status\":1}]', '2026-06-05 14:51:52');
INSERT INTO `sys_audit_log` VALUES (2062789485055344642, 1, 'admin', '商品分类', '修改分类', 110303, '{\"id\":\"110303\",\"name\":\"哑铃杠铃\",\"parentId\":\"1103\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"110303\",{\"status\":1}]', '2026-06-05 14:51:52');
INSERT INTO `sys_audit_log` VALUES (2062789485055344643, 1, 'admin', '商品分类', '修改分类', 1103, '{\"id\":\"1103\",\"name\":\"健身器材\",\"parentId\":\"11\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1103\",{\"status\":1}]', '2026-06-05 14:51:52');
INSERT INTO `sys_audit_log` VALUES (2062789485055344644, 1, 'admin', '商品分类', '修改分类', 110301, '{\"id\":\"110301\",\"name\":\"跑步机\",\"parentId\":\"1103\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"110301\",{\"status\":1}]', '2026-06-05 14:51:52');
INSERT INTO `sys_audit_log` VALUES (2062789485055344645, 1, 'admin', '商品分类', '修改分类', 1102, '{\"id\":\"1102\",\"name\":\"运动鞋靴\",\"parentId\":\"11\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1102\",{\"status\":1}]', '2026-06-05 14:51:52');
INSERT INTO `sys_audit_log` VALUES (2062789485831290882, 1, 'admin', '商品分类', '修改分类', 110304, '{\"id\":\"110304\",\"name\":\"瑜伽用品\",\"parentId\":\"1103\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"110304\",{\"status\":1}]', '2026-06-05 14:51:52');
INSERT INTO `sys_audit_log` VALUES (2062789486418493441, 1, 'admin', '商品分类', '修改分类', 110305, '{\"id\":\"110305\",\"name\":\"拉力带\",\"parentId\":\"1103\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"110305\",{\"status\":1}]', '2026-06-05 14:51:52');
INSERT INTO `sys_audit_log` VALUES (2062789486485602305, 1, 'admin', '商品分类', '修改分类', 110402, '{\"id\":\"110402\",\"name\":\"睡袋\",\"parentId\":\"1104\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"110402\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789486485602306, 1, 'admin', '商品分类', '修改分类', 110401, '{\"id\":\"110401\",\"name\":\"帐篷\",\"parentId\":\"1104\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"110401\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789486485602307, 1, 'admin', '商品分类', '修改分类', 1104, '{\"id\":\"1104\",\"name\":\"户外装备\",\"parentId\":\"11\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1104\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789486485602308, 1, 'admin', '商品分类', '修改分类', 110306, '{\"id\":\"110306\",\"name\":\"腹肌轮\",\"parentId\":\"1103\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"110306\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789487261548545, 1, 'admin', '商品分类', '修改分类', 110403, '{\"id\":\"110403\",\"name\":\"登山杖\",\"parentId\":\"1104\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"110403\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789487857139714, 1, 'admin', '商品分类', '修改分类', 110404, '{\"id\":\"110404\",\"name\":\"户外背包\",\"parentId\":\"1104\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"110404\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789487920054274, 1, 'admin', '商品分类', '修改分类', 110405, '{\"id\":\"110405\",\"name\":\"户外炉具\",\"parentId\":\"1104\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"110405\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789487920054275, 1, 'admin', '商品分类', '修改分类', 1106, '{\"id\":\"1106\",\"name\":\"垂钓用品\",\"parentId\":\"11\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1106\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789487920054276, 1, 'admin', '商品分类', '修改分类', 1105, '{\"id\":\"1105\",\"name\":\"骑行运动\",\"parentId\":\"11\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1105\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789487920054277, 1, 'admin', '商品分类', '修改分类', 12, '{\"id\":\"12\",\"name\":\"珠宝配饰\",\"parentId\":\"0\",\"icon\":\"jewelry\",\"sortNum\":12,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"12\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789489744576513, 1, 'admin', '商品分类', '修改分类', 120101, '{\"id\":\"120101\",\"name\":\"黄金首饰\",\"parentId\":\"1201\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"120101\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789489744576514, 1, 'admin', '商品分类', '修改分类', 120105, '{\"id\":\"120105\",\"name\":\"婚戒\",\"parentId\":\"1201\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"120105\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789489744576515, 1, 'admin', '商品分类', '修改分类', 120103, '{\"id\":\"120103\",\"name\":\"银饰\",\"parentId\":\"1201\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"120103\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789489744576516, 1, 'admin', '商品分类', '修改分类', 120104, '{\"id\":\"120104\",\"name\":\"钻石\",\"parentId\":\"1201\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"120104\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789489744576517, 1, 'admin', '商品分类', '修改分类', 120102, '{\"id\":\"120102\",\"name\":\"铂金首饰\",\"parentId\":\"1201\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"120102\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789489744576518, 1, 'admin', '商品分类', '修改分类', 1201, '{\"id\":\"1201\",\"name\":\"金银首饰\",\"parentId\":\"12\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1201\",{\"status\":1}]', '2026-06-05 14:51:53');
INSERT INTO `sys_audit_log` VALUES (2062789491170639879, 1, 'admin', '商品分类', '修改分类', 1202, '{\"id\":\"1202\",\"name\":\"翡翠玉石\",\"parentId\":\"12\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1202\",{\"status\":1}]', '2026-06-05 14:51:54');
INSERT INTO `sys_audit_log` VALUES (2062789491233554433, 1, 'admin', '商品分类', '修改分类', 120302, '{\"id\":\"120302\",\"name\":\"石英表\",\"parentId\":\"1203\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"120302\",{\"status\":1}]', '2026-06-05 14:51:54');
INSERT INTO `sys_audit_log` VALUES (2062789491233554434, 1, 'admin', '商品分类', '修改分类', 120301, '{\"id\":\"120301\",\"name\":\"机械表\",\"parentId\":\"1203\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"120301\",{\"status\":1}]', '2026-06-05 14:51:54');
INSERT INTO `sys_audit_log` VALUES (2062789491233554435, 1, 'admin', '商品分类', '修改分类', 1203, '{\"id\":\"1203\",\"name\":\"钟表\",\"parentId\":\"12\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1203\",{\"status\":1}]', '2026-06-05 14:51:54');
INSERT INTO `sys_audit_log` VALUES (2062789491233554436, 1, 'admin', '商品分类', '修改分类', 120303, '{\"id\":\"120303\",\"name\":\"智能手表\",\"parentId\":\"1203\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"120303\",{\"status\":1}]', '2026-06-05 14:51:54');
INSERT INTO `sys_audit_log` VALUES (2062789491233554437, 1, 'admin', '商品分类', '修改分类', 120304, '{\"id\":\"120304\",\"name\":\"挂钟座钟\",\"parentId\":\"1203\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"120304\",{\"status\":1}]', '2026-06-05 14:51:54');
INSERT INTO `sys_audit_log` VALUES (2062789492596703234, 1, 'admin', '商品分类', '修改分类', 1204, '{\"id\":\"1204\",\"name\":\"眼镜\",\"parentId\":\"12\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1204\",{\"status\":1}]', '2026-06-05 14:51:54');
INSERT INTO `sys_audit_log` VALUES (2062789492659617793, 1, 'admin', '商品分类', '修改分类', 1205, '{\"id\":\"1205\",\"name\":\"发饰帽子\",\"parentId\":\"12\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1205\",{\"status\":1}]', '2026-06-05 14:51:54');
INSERT INTO `sys_audit_log` VALUES (2062789492915470338, 1, 'admin', '商品分类', '修改分类', 13, '{\"id\":\"13\",\"name\":\"医药健康\",\"parentId\":\"0\",\"icon\":\"medical\",\"sortNum\":13,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"13\",{\"status\":1}]', '2026-06-05 14:51:54');
INSERT INTO `sys_audit_log` VALUES (2062789494614163457, 1, 'admin', '商品分类', '修改分类', 1302, '{\"id\":\"1302\",\"name\":\"保健品\",\"parentId\":\"13\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1302\",{\"status\":1}]', '2026-06-05 14:51:54');
INSERT INTO `sys_audit_log` VALUES (2062789494614163458, 1, 'admin', '商品分类', '修改分类', 1301, '{\"id\":\"1301\",\"name\":\"中西药品\",\"parentId\":\"13\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1301\",{\"status\":1}]', '2026-06-05 14:51:54');
INSERT INTO `sys_audit_log` VALUES (2062789494614163459, 1, 'admin', '商品分类', '修改分类', 1304, '{\"id\":\"1304\",\"name\":\"隐形眼镜\",\"parentId\":\"13\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1304\",{\"status\":1}]', '2026-06-05 14:51:54');
INSERT INTO `sys_audit_log` VALUES (2062789494614163460, 1, 'admin', '商品分类', '修改分类', 1303, '{\"id\":\"1303\",\"name\":\"医疗器械\",\"parentId\":\"13\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1303\",{\"status\":1}]', '2026-06-05 14:51:54');
INSERT INTO `sys_audit_log` VALUES (2062789495734042625, 1, 'admin', '商品分类', '修改分类', 14, '{\"id\":\"14\",\"name\":\"宠物生活\",\"parentId\":\"0\",\"icon\":\"pet\",\"sortNum\":14,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"14\",{\"status\":1}]', '2026-06-05 14:51:55');
INSERT INTO `sys_audit_log` VALUES (2062789496509988866, 1, 'admin', '商品分类', '修改分类', 1401, '{\"id\":\"1401\",\"name\":\"猫粮狗粮\",\"parentId\":\"14\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1401\",{\"status\":1}]', '2026-06-05 14:51:55');
INSERT INTO `sys_audit_log` VALUES (2062789497420152834, 1, 'admin', '商品分类', '修改分类', 140102, '{\"id\":\"140102\",\"name\":\"狗粮\",\"parentId\":\"1401\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"140102\",{\"status\":1}]', '2026-06-05 14:51:55');
INSERT INTO `sys_audit_log` VALUES (2062789497420152835, 1, 'admin', '商品分类', '修改分类', 140103, '{\"id\":\"140103\",\"name\":\"猫罐头\",\"parentId\":\"1401\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"140103\",{\"status\":1}]', '2026-06-05 14:51:55');
INSERT INTO `sys_audit_log` VALUES (2062789497420152836, 1, 'admin', '商品分类', '修改分类', 140104, '{\"id\":\"140104\",\"name\":\"狗罐头\",\"parentId\":\"1401\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"140104\",{\"status\":1}]', '2026-06-05 14:51:55');
INSERT INTO `sys_audit_log` VALUES (2062789497420152837, 1, 'admin', '商品分类', '修改分类', 1402, '{\"id\":\"1402\",\"name\":\"宠物零食\",\"parentId\":\"14\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1402\",{\"status\":1}]', '2026-06-05 14:51:55');
INSERT INTO `sys_audit_log` VALUES (2062789497420152838, 1, 'admin', '商品分类', '修改分类', 140101, '{\"id\":\"140101\",\"name\":\"猫粮\",\"parentId\":\"1401\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"140101\",{\"status\":1}]', '2026-06-05 14:51:55');
INSERT INTO `sys_audit_log` VALUES (2062789497944440834, 1, 'admin', '商品分类', '修改分类', 1403, '{\"id\":\"1403\",\"name\":\"宠物玩具\",\"parentId\":\"14\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1403\",{\"status\":1}]', '2026-06-05 14:51:55');
INSERT INTO `sys_audit_log` VALUES (2062789499970289665, 1, 'admin', '商品分类', '修改分类', 1405, '{\"id\":\"1405\",\"name\":\"猫砂洁具\",\"parentId\":\"14\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1405\",{\"status\":1}]', '2026-06-05 14:51:56');
INSERT INTO `sys_audit_log` VALUES (2062789500037398530, 1, 'admin', '商品分类', '修改分类', 1404, '{\"id\":\"1404\",\"name\":\"宠物窝垫\",\"parentId\":\"14\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1404\",{\"status\":1}]', '2026-06-05 14:51:56');
INSERT INTO `sys_audit_log` VALUES (2062789500360359938, 1, 'admin', '商品分类', '修改分类', 15, '{\"id\":\"15\",\"name\":\"鲜花绿植\",\"parentId\":\"0\",\"icon\":\"flower\",\"sortNum\":15,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"15\",{\"status\":1}]', '2026-06-05 14:51:56');
INSERT INTO `sys_audit_log` VALUES (2062789502042275842, 1, 'admin', '商品分类', '修改分类', 150101, '{\"id\":\"150101\",\"name\":\"玫瑰花束\",\"parentId\":\"1501\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"150101\",{\"status\":1}]', '2026-06-05 14:51:56');
INSERT INTO `sys_audit_log` VALUES (2062789502042275843, 1, 'admin', '商品分类', '修改分类', 150104, '{\"id\":\"150104\",\"name\":\"康乃馨\",\"parentId\":\"1501\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"150104\",{\"status\":1}]', '2026-06-05 14:51:56');
INSERT INTO `sys_audit_log` VALUES (2062789502042275844, 1, 'admin', '商品分类', '修改分类', 150105, '{\"id\":\"150105\",\"name\":\"混搭花束\",\"parentId\":\"1501\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"150105\",{\"status\":1}]', '2026-06-05 14:51:56');
INSERT INTO `sys_audit_log` VALUES (2062789502042275845, 1, 'admin', '商品分类', '修改分类', 150103, '{\"id\":\"150103\",\"name\":\"向日葵\",\"parentId\":\"1501\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"150103\",{\"status\":1}]', '2026-06-05 14:51:56');
INSERT INTO `sys_audit_log` VALUES (2062789502042275846, 1, 'admin', '商品分类', '修改分类', 1501, '{\"id\":\"1501\",\"name\":\"鲜花\",\"parentId\":\"15\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1501\",{\"status\":1}]', '2026-06-05 14:51:56');
INSERT INTO `sys_audit_log` VALUES (2062789502042275847, 1, 'admin', '商品分类', '修改分类', 150102, '{\"id\":\"150102\",\"name\":\"百合花束\",\"parentId\":\"1501\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"150102\",{\"status\":1}]', '2026-06-05 14:51:56');
INSERT INTO `sys_audit_log` VALUES (2062789503476727809, 1, 'admin', '商品分类', '修改分类', 1502, '{\"id\":\"1502\",\"name\":\"绿植盆栽\",\"parentId\":\"15\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1502\",{\"status\":1}]', '2026-06-05 14:51:57');
INSERT INTO `sys_audit_log` VALUES (2062789503476727810, 1, 'admin', '商品分类', '修改分类', 1503, '{\"id\":\"1503\",\"name\":\"仿真花艺\",\"parentId\":\"15\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1503\",{\"status\":1}]', '2026-06-05 14:51:57');
INSERT INTO `sys_audit_log` VALUES (2062789503476727811, 1, 'admin', '商品分类', '修改分类', 1504, '{\"id\":\"1504\",\"name\":\"园艺工具\",\"parentId\":\"15\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1504\",{\"status\":1}]', '2026-06-05 14:51:57');
INSERT INTO `sys_audit_log` VALUES (2062789837121028099, 1, 'admin', '商品管理', '商品上下架', 2057693667856125953, '{\"id\":\"2057693667856125953\",\"name\":\"iPhone 15 Pro\",\"categoryId\":\"10101\",\"brand\":\"Apple\",\"description\":\"测试商品\",\"mainImage\":\"https://example.com/iphone15pro-main.jpg\",\"images\":\"[\\\"https://example.com/iphone15pro-1.jpg\\\",\\\"https://example.com/iphone15pro-2.jpg\\\",\\\"https://example.com/iphone15pro-3.jpg\\\"]\",\"status\":1,\"saleCount\":0,\"createTime\":\"2026-05-22T13:22:55\",\"updateTime\":\"2026-05-22T13:22:55\",\"deleted\":0}', '[\"2057693667856125953\",0]', '2026-06-05 14:53:16');
INSERT INTO `sys_audit_log` VALUES (2062790014917574657, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-05 14:53:59');
INSERT INTO `sys_audit_log` VALUES (2062790016016482305, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-05 14:53:59');
INSERT INTO `sys_audit_log` VALUES (2062790016729513990, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-05 14:53:59');
INSERT INTO `sys_audit_log` VALUES (2062790016792428545, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":1}]', '2026-06-05 14:53:59');
INSERT INTO `sys_audit_log` VALUES (2062790016792428546, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":1}]', '2026-06-05 14:53:59');
INSERT INTO `sys_audit_log` VALUES (2062790016792428547, 1, 'admin', '商品分类', '修改分类', 2057445280091111426, '{\"id\":\"2057445280091111426\",\"name\":\"老人手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:55:55\",\"updateTime\":\"2026-05-21T20:55:55\",\"deleted\":0}', '[\"2057445280091111426\",{\"status\":1}]', '2026-06-05 14:53:59');
INSERT INTO `sys_audit_log` VALUES (2062790016792428548, 1, 'admin', '商品分类', '修改分类', 102, '{\"id\":\"102\",\"name\":\"平板电脑\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"102\",{\"status\":1}]', '2026-06-05 14:53:59');
INSERT INTO `sys_audit_log` VALUES (2062790017446739969, 1, 'admin', '商品分类', '修改分类', 103, '{\"id\":\"103\",\"name\":\"智能手表\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"103\",{\"status\":1}]', '2026-06-05 14:53:59');
INSERT INTO `sys_audit_log` VALUES (2062790018163965954, 1, 'admin', '商品分类', '修改分类', 104, '{\"id\":\"104\",\"name\":\"手机配件\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"104\",{\"status\":1}]', '2026-06-05 14:53:59');
INSERT INTO `sys_audit_log` VALUES (2062790018231074818, 1, 'admin', '商品分类', '修改分类', 10404, '{\"id\":\"10404\",\"name\":\"手机膜\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10404\",{\"status\":1}]', '2026-06-05 14:53:59');
INSERT INTO `sys_audit_log` VALUES (2062790018231074819, 1, 'admin', '商品分类', '修改分类', 10401, '{\"id\":\"10401\",\"name\":\"手机壳\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10401\",{\"status\":1}]', '2026-06-05 14:53:59');
INSERT INTO `sys_audit_log` VALUES (2062790018231074820, 1, 'admin', '商品分类', '修改分类', 10402, '{\"id\":\"10402\",\"name\":\"充电器\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10402\",{\"status\":1}]', '2026-06-05 14:53:59');
INSERT INTO `sys_audit_log` VALUES (2062790018231074821, 1, 'admin', '商品分类', '修改分类', 10403, '{\"id\":\"10403\",\"name\":\"数据线\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10403\",{\"status\":1}]', '2026-06-05 14:53:59');
INSERT INTO `sys_audit_log` VALUES (2062790018881191938, 1, 'admin', '商品分类', '修改分类', 10405, '{\"id\":\"10405\",\"name\":\"手机支架\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10405\",{\"status\":1}]', '2026-06-05 14:53:59');
INSERT INTO `sys_audit_log` VALUES (2062790019539697665, 1, 'admin', '商品分类', '修改分类', 10406, '{\"id\":\"10406\",\"name\":\"充电宝\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10406\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790019665526786, 1, 'admin', '商品分类', '修改分类', 10503, '{\"id\":\"10503\",\"name\":\"运动相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10503\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790019665526787, 1, 'admin', '商品分类', '修改分类', 105, '{\"id\":\"105\",\"name\":\"摄影摄像\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"105\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790019665526788, 1, 'admin', '商品分类', '修改分类', 10502, '{\"id\":\"10502\",\"name\":\"单反相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10502\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790019665526789, 1, 'admin', '商品分类', '修改分类', 10501, '{\"id\":\"10501\",\"name\":\"微单相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10501\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790020311449602, 1, 'admin', '商品分类', '修改分类', 10504, '{\"id\":\"10504\",\"name\":\"无人机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10504\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790020965761026, 1, 'admin', '商品分类', '修改分类', 10505, '{\"id\":\"10505\",\"name\":\"镜头滤镜\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10505\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790021028675590, 1, 'admin', '商品分类', '修改分类', 10701, '{\"id\":\"10701\",\"name\":\"真无线耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10701\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790021091590145, 1, 'admin', '商品分类', '修改分类', 107, '{\"id\":\"107\",\"name\":\"耳机音箱\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"107\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790021091590146, 1, 'admin', '商品分类', '修改分类', 10702, '{\"id\":\"10702\",\"name\":\"头戴式耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10702\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790021091590147, 1, 'admin', '商品分类', '修改分类', 106, '{\"id\":\"106\",\"name\":\"智能穿戴\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"106\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790021737512962, 1, 'admin', '商品分类', '修改分类', 10703, '{\"id\":\"10703\",\"name\":\"蓝牙音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10703\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790022391824386, 1, 'admin', '商品分类', '修改分类', 10704, '{\"id\":\"10704\",\"name\":\"智能音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10704\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790022521847810, 1, 'admin', '商品分类', '修改分类', 2, '{\"id\":\"2\",\"name\":\"电脑办公\",\"parentId\":\"0\",\"icon\":\"pc\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"2\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790022521847811, 1, 'admin', '商品分类', '修改分类', 10705, '{\"id\":\"10705\",\"name\":\"降噪耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10705\",{\"status\":1}]', '2026-06-05 14:54:00');
INSERT INTO `sys_audit_log` VALUES (2062790024279261185, 1, 'admin', '商品分类', '修改分类', 201, '{\"id\":\"201\",\"name\":\"笔记本\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"201\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790024279261186, 1, 'admin', '商品分类', '修改分类', 202, '{\"id\":\"202\",\"name\":\"台式机\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"202\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790024279261187, 1, 'admin', '商品分类', '修改分类', 20103, '{\"id\":\"20103\",\"name\":\"商务本\",\"parentId\":\"201\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20103\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790024279261188, 1, 'admin', '商品分类', '修改分类', 20101, '{\"id\":\"20101\",\"name\":\"轻薄本\",\"parentId\":\"201\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20101\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790024279261189, 1, 'admin', '商品分类', '修改分类', 20102, '{\"id\":\"20102\",\"name\":\"游戏本\",\"parentId\":\"201\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20102\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790024279261190, 1, 'admin', '商品分类', '修改分类', 20104, '{\"id\":\"20104\",\"name\":\"二合一平板\",\"parentId\":\"201\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20104\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790025717907457, 1, 'admin', '商品分类', '修改分类', 203, '{\"id\":\"203\",\"name\":\"显示器\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"203\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790025717907459, 1, 'admin', '商品分类', '修改分类', 204, '{\"id\":\"204\",\"name\":\"电脑配件\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"204\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790025780822018, 1, 'admin', '商品分类', '修改分类', 20401, '{\"id\":\"20401\",\"name\":\"内存条\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20401\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790025780822019, 1, 'admin', '商品分类', '修改分类', 20402, '{\"id\":\"20402\",\"name\":\"固态硬盘\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20402\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790025780822020, 1, 'admin', '商品分类', '修改分类', 20404, '{\"id\":\"20404\",\"name\":\"显卡\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20404\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790025780822021, 1, 'admin', '商品分类', '修改分类', 20403, '{\"id\":\"20403\",\"name\":\"机械硬盘\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20403\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790027135582210, 1, 'admin', '商品分类', '修改分类', 20406, '{\"id\":\"20406\",\"name\":\"CPU处理器\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20406\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790027135582211, 1, 'admin', '商品分类', '修改分类', 20405, '{\"id\":\"20405\",\"name\":\"主板\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20405\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790027198496769, 1, 'admin', '商品分类', '修改分类', 20408, '{\"id\":\"20408\",\"name\":\"机箱\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20408\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790027198496770, 1, 'admin', '商品分类', '修改分类', 20407, '{\"id\":\"20407\",\"name\":\"电源\",\"parentId\":\"204\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20407\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790027198496771, 1, 'admin', '商品分类', '修改分类', 205, '{\"id\":\"205\",\"name\":\"外设装备\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"205\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790027198496772, 1, 'admin', '商品分类', '修改分类', 20501, '{\"id\":\"20501\",\"name\":\"键盘\",\"parentId\":\"205\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20501\",{\"status\":1}]', '2026-06-05 14:54:01');
INSERT INTO `sys_audit_log` VALUES (2062790028574228482, 1, 'admin', '商品分类', '修改分类', 20503, '{\"id\":\"20503\",\"name\":\"鼠标垫\",\"parentId\":\"205\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20503\",{\"status\":1}]', '2026-06-05 14:54:02');
INSERT INTO `sys_audit_log` VALUES (2062790028574228483, 1, 'admin', '商品分类', '修改分类', 20502, '{\"id\":\"20502\",\"name\":\"鼠标\",\"parentId\":\"205\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20502\",{\"status\":1}]', '2026-06-05 14:54:02');
INSERT INTO `sys_audit_log` VALUES (2062790028637143042, 1, 'admin', '商品分类', '修改分类', 20504, '{\"id\":\"20504\",\"name\":\"摄像头\",\"parentId\":\"205\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20504\",{\"status\":1}]', '2026-06-05 14:54:02');
INSERT INTO `sys_audit_log` VALUES (2062790028637143043, 1, 'admin', '商品分类', '修改分类', 20506, '{\"id\":\"20506\",\"name\":\"移动硬盘\",\"parentId\":\"205\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20506\",{\"status\":1}]', '2026-06-05 14:54:02');
INSERT INTO `sys_audit_log` VALUES (2062790028637143044, 1, 'admin', '商品分类', '修改分类', 20505, '{\"id\":\"20505\",\"name\":\"U盘\",\"parentId\":\"205\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"20505\",{\"status\":1}]', '2026-06-05 14:54:02');
INSERT INTO `sys_audit_log` VALUES (2062790028637143045, 1, 'admin', '商品分类', '修改分类', 206, '{\"id\":\"206\",\"name\":\"办公设备\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"206\",{\"status\":1}]', '2026-06-05 14:54:02');
INSERT INTO `sys_audit_log` VALUES (2062790030004486146, 1, 'admin', '商品分类', '修改分类', 208, '{\"id\":\"208\",\"name\":\"游戏设备\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"208\",{\"status\":1}]', '2026-06-05 14:54:02');
INSERT INTO `sys_audit_log` VALUES (2062790030004486148, 1, 'admin', '商品分类', '修改分类', 207, '{\"id\":\"207\",\"name\":\"网络设备\",\"parentId\":\"2\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"207\",{\"status\":1}]', '2026-06-05 14:54:02');
INSERT INTO `sys_audit_log` VALUES (2062790030071595010, 1, 'admin', '商品分类', '修改分类', 3, '{\"id\":\"3\",\"name\":\"家用电器\",\"parentId\":\"0\",\"icon\":\"appliance\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"3\",{\"status\":1}]', '2026-06-05 14:54:02');
INSERT INTO `sys_audit_log` VALUES (2062790031757705217, 1, 'admin', '商品分类', '修改分类', 302, '{\"id\":\"302\",\"name\":\"洗衣机\",\"parentId\":\"3\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"302\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790031757705218, 1, 'admin', '商品分类', '修改分类', 30102, '{\"id\":\"30102\",\"name\":\"柜式空调\",\"parentId\":\"301\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30102\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790031757705219, 1, 'admin', '商品分类', '修改分类', 30101, '{\"id\":\"30101\",\"name\":\"壁挂空调\",\"parentId\":\"301\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30101\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790031757705220, 1, 'admin', '商品分类', '修改分类', 30104, '{\"id\":\"30104\",\"name\":\"移动空调\",\"parentId\":\"301\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30104\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790031757705221, 1, 'admin', '商品分类', '修改分类', 301, '{\"id\":\"301\",\"name\":\"空调\",\"parentId\":\"3\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"301\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790031757705222, 1, 'admin', '商品分类', '修改分类', 30103, '{\"id\":\"30103\",\"name\":\"中央空调\",\"parentId\":\"301\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30103\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790033179574273, 1, 'admin', '商品分类', '修改分类', 30404, '{\"id\":\"30404\",\"name\":\"电压力锅\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30404\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790033179574274, 1, 'admin', '商品分类', '修改分类', 30401, '{\"id\":\"30401\",\"name\":\"电饭煲\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30401\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790033179574275, 1, 'admin', '商品分类', '修改分类', 30402, '{\"id\":\"30402\",\"name\":\"微波炉\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30402\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790033179574276, 1, 'admin', '商品分类', '修改分类', 304, '{\"id\":\"304\",\"name\":\"厨房电器\",\"parentId\":\"3\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"304\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790033179574277, 1, 'admin', '商品分类', '修改分类', 30403, '{\"id\":\"30403\",\"name\":\"烤箱\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30403\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790033179574278, 1, 'admin', '商品分类', '修改分类', 303, '{\"id\":\"303\",\"name\":\"冰箱\",\"parentId\":\"3\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"303\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790034601443330, 1, 'admin', '商品分类', '修改分类', 30405, '{\"id\":\"30405\",\"name\":\"空气炸锅\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30405\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790034601443331, 1, 'admin', '商品分类', '修改分类', 305, '{\"id\":\"305\",\"name\":\"生活电器\",\"parentId\":\"3\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"305\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790034601443332, 1, 'admin', '商品分类', '修改分类', 30407, '{\"id\":\"30407\",\"name\":\"电磁炉\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30407\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790034601443333, 1, 'admin', '商品分类', '修改分类', 30409, '{\"id\":\"30409\",\"name\":\"洗碗机\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":9,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30409\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790034601443334, 1, 'admin', '商品分类', '修改分类', 30408, '{\"id\":\"30408\",\"name\":\"油烟机\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30408\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790034601443335, 1, 'admin', '商品分类', '修改分类', 30406, '{\"id\":\"30406\",\"name\":\"破壁机\",\"parentId\":\"304\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30406\",{\"status\":1}]', '2026-06-05 14:54:03');
INSERT INTO `sys_audit_log` VALUES (2062790036040089602, 1, 'admin', '商品分类', '修改分类', 306, '{\"id\":\"306\",\"name\":\"个护电器\",\"parentId\":\"3\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"306\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790036040089603, 1, 'admin', '商品分类', '修改分类', 30502, '{\"id\":\"30502\",\"name\":\"吸尘器\",\"parentId\":\"305\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30502\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790036040089604, 1, 'admin', '商品分类', '修改分类', 30505, '{\"id\":\"30505\",\"name\":\"净水器\",\"parentId\":\"305\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30505\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790036040089605, 1, 'admin', '商品分类', '修改分类', 30501, '{\"id\":\"30501\",\"name\":\"扫地机器人\",\"parentId\":\"305\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30501\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790036040089606, 1, 'admin', '商品分类', '修改分类', 30503, '{\"id\":\"30503\",\"name\":\"加湿器\",\"parentId\":\"305\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30503\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790036040089607, 1, 'admin', '商品分类', '修改分类', 30504, '{\"id\":\"30504\",\"name\":\"电风扇\",\"parentId\":\"305\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30504\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790037461958657, 1, 'admin', '商品分类', '修改分类', 307, '{\"id\":\"307\",\"name\":\"影音娱乐\",\"parentId\":\"3\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"307\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790037529067522, 1, 'admin', '商品分类', '修改分类', 30702, '{\"id\":\"30702\",\"name\":\"投影仪\",\"parentId\":\"307\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30702\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790037529067523, 1, 'admin', '商品分类', '修改分类', 30704, '{\"id\":\"30704\",\"name\":\"音响功放\",\"parentId\":\"307\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30704\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790037529067524, 1, 'admin', '商品分类', '修改分类', 30703, '{\"id\":\"30703\",\"name\":\"家庭影院\",\"parentId\":\"307\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30703\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790037529067525, 1, 'admin', '商品分类', '修改分类', 30701, '{\"id\":\"30701\",\"name\":\"智能电视\",\"parentId\":\"307\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"30701\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790037529067526, 1, 'admin', '商品分类', '修改分类', 4, '{\"id\":\"4\",\"name\":\"服饰鞋包\",\"parentId\":\"0\",\"icon\":\"fashion\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"4\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790039353589765, 1, 'admin', '商品分类', '修改分类', 40101, '{\"id\":\"40101\",\"name\":\"连衣裙\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40101\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790039353589766, 1, 'admin', '商品分类', '修改分类', 40104, '{\"id\":\"40104\",\"name\":\"裤装\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40104\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790039353589767, 1, 'admin', '商品分类', '修改分类', 401, '{\"id\":\"401\",\"name\":\"女装\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"401\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790039353589768, 1, 'admin', '商品分类', '修改分类', 40105, '{\"id\":\"40105\",\"name\":\"半身裙\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40105\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790039353589769, 1, 'admin', '商品分类', '修改分类', 40103, '{\"id\":\"40103\",\"name\":\"外套大衣\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40103\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790039353589770, 1, 'admin', '商品分类', '修改分类', 40102, '{\"id\":\"40102\",\"name\":\"T恤衫\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40102\",{\"status\":1}]', '2026-06-05 14:54:04');
INSERT INTO `sys_audit_log` VALUES (2062790040779653122, 1, 'admin', '商品分类', '修改分类', 40106, '{\"id\":\"40106\",\"name\":\"针织衫\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40106\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790040976785409, 1, 'admin', '商品分类', '修改分类', 40108, '{\"id\":\"40108\",\"name\":\"西装\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40108\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790040976785410, 1, 'admin', '商品分类', '修改分类', 40107, '{\"id\":\"40107\",\"name\":\"卫衣\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40107\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790040976785411, 1, 'admin', '商品分类', '修改分类', 40202, '{\"id\":\"40202\",\"name\":\"衬衫\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40202\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790040976785412, 1, 'admin', '商品分类', '修改分类', 40201, '{\"id\":\"40201\",\"name\":\"夹克\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40201\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790040976785413, 1, 'admin', '商品分类', '修改分类', 402, '{\"id\":\"402\",\"name\":\"男装\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"402\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790042151190529, 1, 'admin', '商品分类', '修改分类', 40203, '{\"id\":\"40203\",\"name\":\"T恤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40203\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790042415431682, 1, 'admin', '商品分类', '修改分类', 40205, '{\"id\":\"40205\",\"name\":\"牛仔裤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40205\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790042415431683, 1, 'admin', '商品分类', '修改分类', 40207, '{\"id\":\"40207\",\"name\":\"西装西裤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40207\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790042415431684, 1, 'admin', '商品分类', '修改分类', 40208, '{\"id\":\"40208\",\"name\":\"羽绒服\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40208\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790042415431685, 1, 'admin', '商品分类', '修改分类', 40206, '{\"id\":\"40206\",\"name\":\"卫衣帽衫\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40206\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790042415431686, 1, 'admin', '商品分类', '修改分类', 40204, '{\"id\":\"40204\",\"name\":\"休闲裤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40204\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790043585642497, 1, 'admin', '商品分类', '修改分类', 403, '{\"id\":\"403\",\"name\":\"内衣配饰\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"403\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790043845689345, 1, 'admin', '商品分类', '修改分类', 40401, '{\"id\":\"40401\",\"name\":\"运动鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40401\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790043845689346, 1, 'admin', '商品分类', '修改分类', 404, '{\"id\":\"404\",\"name\":\"鞋靴\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"404\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790043845689347, 1, 'admin', '商品分类', '修改分类', 40402, '{\"id\":\"40402\",\"name\":\"休闲鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40402\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790043845689348, 1, 'admin', '商品分类', '修改分类', 40404, '{\"id\":\"40404\",\"name\":\"皮鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40404\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790043845689349, 1, 'admin', '商品分类', '修改分类', 40403, '{\"id\":\"40403\",\"name\":\"高跟鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40403\",{\"status\":1}]', '2026-06-05 14:54:05');
INSERT INTO `sys_audit_log` VALUES (2062790045020094465, 1, 'admin', '商品分类', '修改分类', 40405, '{\"id\":\"40405\",\"name\":\"凉鞋拖鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40405\",{\"status\":1}]', '2026-06-05 14:54:06');
INSERT INTO `sys_audit_log` VALUES (2062790045280141314, 1, 'admin', '商品分类', '修改分类', 405, '{\"id\":\"405\",\"name\":\"箱包\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"405\",{\"status\":1}]', '2026-06-05 14:54:06');
INSERT INTO `sys_audit_log` VALUES (2062790045280141315, 1, 'admin', '商品分类', '修改分类', 40502, '{\"id\":\"40502\",\"name\":\"单肩包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40502\",{\"status\":1}]', '2026-06-05 14:54:06');
INSERT INTO `sys_audit_log` VALUES (2062790045280141316, 1, 'admin', '商品分类', '修改分类', 40503, '{\"id\":\"40503\",\"name\":\"手提包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40503\",{\"status\":1}]', '2026-06-05 14:54:06');
INSERT INTO `sys_audit_log` VALUES (2062790045280141317, 1, 'admin', '商品分类', '修改分类', 40501, '{\"id\":\"40501\",\"name\":\"双肩包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40501\",{\"status\":1}]', '2026-06-05 14:54:06');
INSERT INTO `sys_audit_log` VALUES (2062790045280141318, 1, 'admin', '商品分类', '修改分类', 40406, '{\"id\":\"40406\",\"name\":\"靴子\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40406\",{\"status\":1}]', '2026-06-05 14:54:06');
INSERT INTO `sys_audit_log` VALUES (2062790046458740737, 1, 'admin', '商品分类', '修改分类', 40504, '{\"id\":\"40504\",\"name\":\"行李箱\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40504\",{\"status\":1}]', '2026-06-05 14:54:06');
INSERT INTO `sys_audit_log` VALUES (2062790046718787586, 1, 'admin', '商品分类', '修改分类', 40505, '{\"id\":\"40505\",\"name\":\"钱包卡包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40505\",{\"status\":1}]', '2026-06-05 14:54:06');
INSERT INTO `sys_audit_log` VALUES (2062790046718787587, 1, 'admin', '商品分类', '修改分类', 406, '{\"id\":\"406\",\"name\":\"童装\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"406\",{\"status\":1}]', '2026-06-05 14:54:06');
INSERT INTO `sys_audit_log` VALUES (2062790195398475779, 1, 'admin', '商品分类', '修改分类', 4, '{\"id\":\"4\",\"name\":\"服饰鞋包\",\"parentId\":\"0\",\"icon\":\"fashion\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"4\",{\"status\":0}]', '2026-06-05 14:54:42');
INSERT INTO `sys_audit_log` VALUES (2062790196509966339, 1, 'admin', '商品分类', '修改分类', 401, '{\"id\":\"401\",\"name\":\"女装\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"401\",{\"status\":0}]', '2026-06-05 14:54:42');
INSERT INTO `sys_audit_log` VALUES (2062790197227192322, 1, 'admin', '商品分类', '修改分类', 40101, '{\"id\":\"40101\",\"name\":\"连衣裙\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40101\",{\"status\":0}]', '2026-06-05 14:54:42');
INSERT INTO `sys_audit_log` VALUES (2062790197227192323, 1, 'admin', '商品分类', '修改分类', 40103, '{\"id\":\"40103\",\"name\":\"外套大衣\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40103\",{\"status\":0}]', '2026-06-05 14:54:42');
INSERT INTO `sys_audit_log` VALUES (2062790197294301185, 1, 'admin', '商品分类', '修改分类', 40105, '{\"id\":\"40105\",\"name\":\"半身裙\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40105\",{\"status\":0}]', '2026-06-05 14:54:42');
INSERT INTO `sys_audit_log` VALUES (2062790197294301186, 1, 'admin', '商品分类', '修改分类', 40102, '{\"id\":\"40102\",\"name\":\"T恤衫\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40102\",{\"status\":0}]', '2026-06-05 14:54:42');
INSERT INTO `sys_audit_log` VALUES (2062790197294301187, 1, 'admin', '商品分类', '修改分类', 40104, '{\"id\":\"40104\",\"name\":\"裤装\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40104\",{\"status\":0}]', '2026-06-05 14:54:42');
INSERT INTO `sys_audit_log` VALUES (2062790197948612609, 1, 'admin', '商品分类', '修改分类', 40106, '{\"id\":\"40106\",\"name\":\"针织衫\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40106\",{\"status\":0}]', '2026-06-05 14:54:42');
INSERT INTO `sys_audit_log` VALUES (2062790198665838594, 1, 'admin', '商品分类', '修改分类', 40107, '{\"id\":\"40107\",\"name\":\"卫衣\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40107\",{\"status\":0}]', '2026-06-05 14:54:42');
INSERT INTO `sys_audit_log` VALUES (2062790198795862017, 1, 'admin', '商品分类', '修改分类', 40202, '{\"id\":\"40202\",\"name\":\"衬衫\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40202\",{\"status\":0}]', '2026-06-05 14:54:42');
INSERT INTO `sys_audit_log` VALUES (2062790198795862018, 1, 'admin', '商品分类', '修改分类', 40201, '{\"id\":\"40201\",\"name\":\"夹克\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40201\",{\"status\":0}]', '2026-06-05 14:54:42');
INSERT INTO `sys_audit_log` VALUES (2062790198795862019, 1, 'admin', '商品分类', '修改分类', 40108, '{\"id\":\"40108\",\"name\":\"西装\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40108\",{\"status\":0}]', '2026-06-05 14:54:42');
INSERT INTO `sys_audit_log` VALUES (2062790198795862020, 1, 'admin', '商品分类', '修改分类', 402, '{\"id\":\"402\",\"name\":\"男装\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"402\",{\"status\":0}]', '2026-06-05 14:54:42');
INSERT INTO `sys_audit_log` VALUES (2062790199383064579, 1, 'admin', '商品分类', '修改分类', 40203, '{\"id\":\"40203\",\"name\":\"T恤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40203\",{\"status\":0}]', '2026-06-05 14:54:42');
INSERT INTO `sys_audit_log` VALUES (2062790200104484866, 1, 'admin', '商品分类', '修改分类', 40204, '{\"id\":\"40204\",\"name\":\"休闲裤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40204\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790200234508293, 1, 'admin', '商品分类', '修改分类', 40208, '{\"id\":\"40208\",\"name\":\"羽绒服\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40208\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790200234508294, 1, 'admin', '商品分类', '修改分类', 40205, '{\"id\":\"40205\",\"name\":\"牛仔裤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40205\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790200234508295, 1, 'admin', '商品分类', '修改分类', 40206, '{\"id\":\"40206\",\"name\":\"卫衣帽衫\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40206\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790200234508296, 1, 'admin', '商品分类', '修改分类', 40207, '{\"id\":\"40207\",\"name\":\"西装西裤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40207\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790200821710850, 1, 'admin', '商品分类', '修改分类', 403, '{\"id\":\"403\",\"name\":\"内衣配饰\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"403\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790201530548226, 1, 'admin', '商品分类', '修改分类', 404, '{\"id\":\"404\",\"name\":\"鞋靴\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"404\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790201656377347, 1, 'admin', '商品分类', '修改分类', 40401, '{\"id\":\"40401\",\"name\":\"运动鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40401\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790201786400769, 1, 'admin', '商品分类', '修改分类', 40404, '{\"id\":\"40404\",\"name\":\"皮鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40404\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790201786400770, 1, 'admin', '商品分类', '修改分类', 40402, '{\"id\":\"40402\",\"name\":\"休闲鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40402\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790201786400771, 1, 'admin', '商品分类', '修改分类', 40403, '{\"id\":\"40403\",\"name\":\"高跟鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40403\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790202239385602, 1, 'admin', '商品分类', '修改分类', 40405, '{\"id\":\"40405\",\"name\":\"凉鞋拖鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40405\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790202944028674, 1, 'admin', '商品分类', '修改分类', 40406, '{\"id\":\"40406\",\"name\":\"靴子\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40406\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790203078246402, 1, 'admin', '商品分类', '修改分类', 405, '{\"id\":\"405\",\"name\":\"箱包\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"405\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790203271184386, 1, 'admin', '商品分类', '修改分类', 40501, '{\"id\":\"40501\",\"name\":\"双肩包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40501\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790203271184387, 1, 'admin', '商品分类', '修改分类', 40503, '{\"id\":\"40503\",\"name\":\"手提包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40503\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790203271184388, 1, 'admin', '商品分类', '修改分类', 40502, '{\"id\":\"40502\",\"name\":\"单肩包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40502\",{\"status\":0}]', '2026-06-05 14:54:43');
INSERT INTO `sys_audit_log` VALUES (2062790203661254658, 1, 'admin', '商品分类', '修改分类', 40504, '{\"id\":\"40504\",\"name\":\"行李箱\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40504\",{\"status\":0}]', '2026-06-05 14:54:44');
INSERT INTO `sys_audit_log` VALUES (2062790204378480642, 1, 'admin', '商品分类', '修改分类', 40505, '{\"id\":\"40505\",\"name\":\"钱包卡包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40505\",{\"status\":0}]', '2026-06-05 14:54:44');
INSERT INTO `sys_audit_log` VALUES (2062790204508504067, 1, 'admin', '商品分类', '修改分类', 406, '{\"id\":\"406\",\"name\":\"童装\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"406\",{\"status\":0}]', '2026-06-05 14:54:44');
INSERT INTO `sys_audit_log` VALUES (2062790451368460290, 1, 'admin', '商品分类', '修改分类', 4, '{\"id\":\"4\",\"name\":\"服饰鞋包\",\"parentId\":\"0\",\"icon\":\"fashion\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"4\",{\"status\":1}]', '2026-06-05 14:55:43');
INSERT INTO `sys_audit_log` VALUES (2062790452408647682, 1, 'admin', '商品分类', '修改分类', 401, '{\"id\":\"401\",\"name\":\"女装\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"401\",{\"status\":1}]', '2026-06-05 14:55:43');
INSERT INTO `sys_audit_log` VALUES (2062790453188788226, 1, 'admin', '商品分类', '修改分类', 40105, '{\"id\":\"40105\",\"name\":\"半身裙\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40105\",{\"status\":1}]', '2026-06-05 14:55:43');
INSERT INTO `sys_audit_log` VALUES (2062790453188788227, 1, 'admin', '商品分类', '修改分类', 40104, '{\"id\":\"40104\",\"name\":\"裤装\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40104\",{\"status\":1}]', '2026-06-05 14:55:43');
INSERT INTO `sys_audit_log` VALUES (2062790453188788228, 1, 'admin', '商品分类', '修改分类', 40101, '{\"id\":\"40101\",\"name\":\"连衣裙\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40101\",{\"status\":1}]', '2026-06-05 14:55:43');
INSERT INTO `sys_audit_log` VALUES (2062790453188788229, 1, 'admin', '商品分类', '修改分类', 40103, '{\"id\":\"40103\",\"name\":\"外套大衣\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40103\",{\"status\":1}]', '2026-06-05 14:55:43');
INSERT INTO `sys_audit_log` VALUES (2062790453188788230, 1, 'admin', '商品分类', '修改分类', 40102, '{\"id\":\"40102\",\"name\":\"T恤衫\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40102\",{\"status\":1}]', '2026-06-05 14:55:43');
INSERT INTO `sys_audit_log` VALUES (2062790453838905346, 1, 'admin', '商品分类', '修改分类', 40106, '{\"id\":\"40106\",\"name\":\"针织衫\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":6,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40106\",{\"status\":1}]', '2026-06-05 14:55:43');
INSERT INTO `sys_audit_log` VALUES (2062790454677766145, 1, 'admin', '商品分类', '修改分类', 40202, '{\"id\":\"40202\",\"name\":\"衬衫\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40202\",{\"status\":1}]', '2026-06-05 14:55:43');
INSERT INTO `sys_audit_log` VALUES (2062790454677766146, 1, 'admin', '商品分类', '修改分类', 40108, '{\"id\":\"40108\",\"name\":\"西装\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":8,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40108\",{\"status\":1}]', '2026-06-05 14:55:43');
INSERT INTO `sys_audit_log` VALUES (2062790454677766147, 1, 'admin', '商品分类', '修改分类', 40201, '{\"id\":\"40201\",\"name\":\"夹克\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40201\",{\"status\":1}]', '2026-06-05 14:55:43');
INSERT INTO `sys_audit_log` VALUES (2062790454677766148, 1, 'admin', '商品分类', '修改分类', 40107, '{\"id\":\"40107\",\"name\":\"卫衣\",\"parentId\":\"401\",\"icon\":\"\",\"sortNum\":7,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40107\",{\"status\":1}]', '2026-06-05 14:55:43');
INSERT INTO `sys_audit_log` VALUES (2062790454677766149, 1, 'admin', '商品分类', '修改分类', 402, '{\"id\":\"402\",\"name\":\"男装\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"402\",{\"status\":1}]', '2026-06-05 14:55:43');
INSERT INTO `sys_audit_log` VALUES (2062790455260774401, 1, 'admin', '商品分类', '修改分类', 40203, '{\"id\":\"40203\",\"name\":\"T恤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40203\",{\"status\":1}]', '2026-06-05 14:55:43');
INSERT INTO `sys_audit_log` VALUES (2062790456116412420, 1, 'admin', '商品分类', '修改分类', 40204, '{\"id\":\"40204\",\"name\":\"休闲裤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40204\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790456179326980, 1, 'admin', '商品分类', '修改分类', 40205, '{\"id\":\"40205\",\"name\":\"牛仔裤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40205\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790456179326981, 1, 'admin', '商品分类', '修改分类', 40207, '{\"id\":\"40207\",\"name\":\"西装西裤\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":7,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40207\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790456179326982, 1, 'admin', '商品分类', '修改分类', 40206, '{\"id\":\"40206\",\"name\":\"卫衣帽衫\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":6,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40206\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790456242241538, 1, 'admin', '商品分类', '修改分类', 40208, '{\"id\":\"40208\",\"name\":\"羽绒服\",\"parentId\":\"402\",\"icon\":\"\",\"sortNum\":8,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40208\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790456699420674, 1, 'admin', '商品分类', '修改分类', 403, '{\"id\":\"403\",\"name\":\"内衣配饰\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"403\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790457680887809, 1, 'admin', '商品分类', '修改分类', 40401, '{\"id\":\"40401\",\"name\":\"运动鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40401\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790457680887810, 1, 'admin', '商品分类', '修改分类', 40403, '{\"id\":\"40403\",\"name\":\"高跟鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40403\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790457680887811, 1, 'admin', '商品分类', '修改分类', 404, '{\"id\":\"404\",\"name\":\"鞋靴\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"404\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790457680887812, 1, 'admin', '商品分类', '修改分类', 40404, '{\"id\":\"40404\",\"name\":\"皮鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40404\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790457680887813, 1, 'admin', '商品分类', '修改分类', 40402, '{\"id\":\"40402\",\"name\":\"休闲鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40402\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790458133872642, 1, 'admin', '商品分类', '修改分类', 40405, '{\"id\":\"40405\",\"name\":\"凉鞋拖鞋\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40405\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790459115339780, 1, 'admin', '商品分类', '修改分类', 405, '{\"id\":\"405\",\"name\":\"箱包\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"405\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790459115339781, 1, 'admin', '商品分类', '修改分类', 40406, '{\"id\":\"40406\",\"name\":\"靴子\",\"parentId\":\"404\",\"icon\":\"\",\"sortNum\":6,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40406\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790459178254338, 1, 'admin', '商品分类', '修改分类', 40501, '{\"id\":\"40501\",\"name\":\"双肩包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40501\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790459178254341, 1, 'admin', '商品分类', '修改分类', 40502, '{\"id\":\"40502\",\"name\":\"单肩包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40502\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790459249557505, 1, 'admin', '商品分类', '修改分类', 40503, '{\"id\":\"40503\",\"name\":\"手提包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40503\",{\"status\":1}]', '2026-06-05 14:55:44');
INSERT INTO `sys_audit_log` VALUES (2062790459568324609, 1, 'admin', '商品分类', '修改分类', 40504, '{\"id\":\"40504\",\"name\":\"行李箱\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40504\",{\"status\":1}]', '2026-06-05 14:55:45');
INSERT INTO `sys_audit_log` VALUES (2062790460612706306, 1, 'admin', '商品分类', '修改分类', 406, '{\"id\":\"406\",\"name\":\"童装\",\"parentId\":\"4\",\"icon\":\"\",\"sortNum\":6,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"406\",{\"status\":1}]', '2026-06-05 14:55:45');
INSERT INTO `sys_audit_log` VALUES (2062790460612706307, 1, 'admin', '商品分类', '修改分类', 5, '{\"id\":\"5\",\"name\":\"美妆个护\",\"parentId\":\"0\",\"icon\":\"beauty\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"5\",{\"status\":1}]', '2026-06-05 14:55:45');
INSERT INTO `sys_audit_log` VALUES (2062790460612706308, 1, 'admin', '商品分类', '修改分类', 40505, '{\"id\":\"40505\",\"name\":\"钱包卡包\",\"parentId\":\"405\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"40505\",{\"status\":1}]', '2026-06-05 14:55:45');
INSERT INTO `sys_audit_log` VALUES (2062790462374313992, 1, 'admin', '商品分类', '修改分类', 501, '{\"id\":\"501\",\"name\":\"面部护肤\",\"parentId\":\"5\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"501\",{\"status\":1}]', '2026-06-05 14:55:45');
INSERT INTO `sys_audit_log` VALUES (2062790462437228546, 1, 'admin', '商品分类', '修改分类', 50104, '{\"id\":\"50104\",\"name\":\"爽肤水\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50104\",{\"status\":1}]', '2026-06-05 14:55:45');
INSERT INTO `sys_audit_log` VALUES (2062790462437228547, 1, 'admin', '商品分类', '修改分类', 50101, '{\"id\":\"50101\",\"name\":\"面霜\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50101\",{\"status\":1}]', '2026-06-05 14:55:45');
INSERT INTO `sys_audit_log` VALUES (2062790462437228548, 1, 'admin', '商品分类', '修改分类', 50102, '{\"id\":\"50102\",\"name\":\"精华液\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50102\",{\"status\":1}]', '2026-06-05 14:55:45');
INSERT INTO `sys_audit_log` VALUES (2062790462437228549, 1, 'admin', '商品分类', '修改分类', 50105, '{\"id\":\"50105\",\"name\":\"洁面乳\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50105\",{\"status\":1}]', '2026-06-05 14:55:45');
INSERT INTO `sys_audit_log` VALUES (2062790462437228550, 1, 'admin', '商品分类', '修改分类', 50103, '{\"id\":\"50103\",\"name\":\"面膜\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50103\",{\"status\":1}]', '2026-06-05 14:55:45');
INSERT INTO `sys_audit_log` VALUES (2062790463859097601, 1, 'admin', '商品分类', '修改分类', 50108, '{\"id\":\"50108\",\"name\":\"卸妆\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":8,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50108\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790463859097602, 1, 'admin', '商品分类', '修改分类', 50107, '{\"id\":\"50107\",\"name\":\"防晒霜\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50107\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790463859097603, 1, 'admin', '商品分类', '修改分类', 50106, '{\"id\":\"50106\",\"name\":\"眼霜\",\"parentId\":\"501\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50106\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790463859097604, 1, 'admin', '商品分类', '修改分类', 50202, '{\"id\":\"50202\",\"name\":\"粉底液\",\"parentId\":\"502\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50202\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790463859097605, 1, 'admin', '商品分类', '修改分类', 502, '{\"id\":\"502\",\"name\":\"彩妆\",\"parentId\":\"5\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"502\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790463859097606, 1, 'admin', '商品分类', '修改分类', 50201, '{\"id\":\"50201\",\"name\":\"口红唇膏\",\"parentId\":\"502\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50201\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790465289355266, 1, 'admin', '商品分类', '修改分类', 50203, '{\"id\":\"50203\",\"name\":\"眼影\",\"parentId\":\"502\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50203\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790465289355267, 1, 'admin', '商品分类', '修改分类', 50206, '{\"id\":\"50206\",\"name\":\"指甲油\",\"parentId\":\"502\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50206\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790465289355268, 1, 'admin', '商品分类', '修改分类', 504, '{\"id\":\"504\",\"name\":\"身体护理\",\"parentId\":\"5\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"504\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790465289355269, 1, 'admin', '商品分类', '修改分类', 50205, '{\"id\":\"50205\",\"name\":\"腮红\",\"parentId\":\"502\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50205\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790465289355270, 1, 'admin', '商品分类', '修改分类', 503, '{\"id\":\"503\",\"name\":\"香水\",\"parentId\":\"5\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"503\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790465289355271, 1, 'admin', '商品分类', '修改分类', 50204, '{\"id\":\"50204\",\"name\":\"眉笔眉粉\",\"parentId\":\"502\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"50204\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790466711224321, 1, 'admin', '商品分类', '修改分类', 6, '{\"id\":\"6\",\"name\":\"食品生鲜\",\"parentId\":\"0\",\"icon\":\"food\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"6\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790466711224322, 1, 'admin', '商品分类', '修改分类', 506, '{\"id\":\"506\",\"name\":\"洗发护发\",\"parentId\":\"5\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"506\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790466711224323, 1, 'admin', '商品分类', '修改分类', 505, '{\"id\":\"505\",\"name\":\"口腔护理\",\"parentId\":\"5\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"505\",{\"status\":1}]', '2026-06-05 14:55:46');
INSERT INTO `sys_audit_log` VALUES (2062790468456054785, 1, 'admin', '商品分类', '修改分类', 601, '{\"id\":\"601\",\"name\":\"新鲜水果\",\"parentId\":\"6\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"601\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790468456054786, 1, 'admin', '商品分类', '修改分类', 60102, '{\"id\":\"60102\",\"name\":\"柑橘橙柚\",\"parentId\":\"601\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60102\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790468456054787, 1, 'admin', '商品分类', '修改分类', 60104, '{\"id\":\"60104\",\"name\":\"葡萄提子\",\"parentId\":\"601\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60104\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790468456054788, 1, 'admin', '商品分类', '修改分类', 60101, '{\"id\":\"60101\",\"name\":\"苹果\",\"parentId\":\"601\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60101\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790468456054789, 1, 'admin', '商品分类', '修改分类', 60105, '{\"id\":\"60105\",\"name\":\"瓜类\",\"parentId\":\"601\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60105\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790468456054790, 1, 'admin', '商品分类', '修改分类', 60103, '{\"id\":\"60103\",\"name\":\"热带水果\",\"parentId\":\"601\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60103\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790470016335874, 1, 'admin', '商品分类', '修改分类', 60301, '{\"id\":\"60301\",\"name\":\"猪肉\",\"parentId\":\"603\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60301\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790470083444738, 1, 'admin', '商品分类', '修改分类', 60106, '{\"id\":\"60106\",\"name\":\"进口水果\",\"parentId\":\"601\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60106\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790470083444739, 1, 'admin', '商品分类', '修改分类', 603, '{\"id\":\"603\",\"name\":\"肉禽海鲜\",\"parentId\":\"6\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"603\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790470083444740, 1, 'admin', '商品分类', '修改分类', 602, '{\"id\":\"602\",\"name\":\"蔬菜蛋类\",\"parentId\":\"6\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"602\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790470083444741, 1, 'admin', '商品分类', '修改分类', 60303, '{\"id\":\"60303\",\"name\":\"羊肉\",\"parentId\":\"603\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60303\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790470083444742, 1, 'admin', '商品分类', '修改分类', 60302, '{\"id\":\"60302\",\"name\":\"牛肉\",\"parentId\":\"603\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60302\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790471576616962, 1, 'admin', '商品分类', '修改分类', 60304, '{\"id\":\"60304\",\"name\":\"鸡肉\",\"parentId\":\"603\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60304\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790471643725831, 1, 'admin', '商品分类', '修改分类', 60306, '{\"id\":\"60306\",\"name\":\"冷冻调理\",\"parentId\":\"603\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60306\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790471706640386, 1, 'admin', '商品分类', '修改分类', 60501, '{\"id\":\"60501\",\"name\":\"坚果炒货\",\"parentId\":\"605\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60501\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790471706640387, 1, 'admin', '商品分类', '修改分类', 604, '{\"id\":\"604\",\"name\":\"牛奶乳品\",\"parentId\":\"6\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"604\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790471706640388, 1, 'admin', '商品分类', '修改分类', 605, '{\"id\":\"605\",\"name\":\"零食小吃\",\"parentId\":\"6\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"605\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790471706640389, 1, 'admin', '商品分类', '修改分类', 60305, '{\"id\":\"60305\",\"name\":\"海鲜水产\",\"parentId\":\"603\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60305\",{\"status\":1}]', '2026-06-05 14:55:47');
INSERT INTO `sys_audit_log` VALUES (2062790472960737282, 1, 'admin', '商品分类', '修改分类', 60502, '{\"id\":\"60502\",\"name\":\"膨化食品\",\"parentId\":\"605\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60502\",{\"status\":1}]', '2026-06-05 14:55:48');
INSERT INTO `sys_audit_log` VALUES (2062790473023651843, 1, 'admin', '商品分类', '修改分类', 60503, '{\"id\":\"60503\",\"name\":\"饼干糕点\",\"parentId\":\"605\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60503\",{\"status\":1}]', '2026-06-05 14:55:48');
INSERT INTO `sys_audit_log` VALUES (2062790473086566401, 1, 'admin', '商品分类', '修改分类', 60504, '{\"id\":\"60504\",\"name\":\"糖果巧克力\",\"parentId\":\"605\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60504\",{\"status\":1}]', '2026-06-05 14:55:48');
INSERT INTO `sys_audit_log` VALUES (2062790473153675265, 1, 'admin', '商品分类', '修改分类', 60505, '{\"id\":\"60505\",\"name\":\"蜜饯果干\",\"parentId\":\"605\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60505\",{\"status\":1}]', '2026-06-05 14:55:48');
INSERT INTO `sys_audit_log` VALUES (2062790473153675266, 1, 'admin', '商品分类', '修改分类', 606, '{\"id\":\"606\",\"name\":\"茗茶酒饮\",\"parentId\":\"6\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"606\",{\"status\":1}]', '2026-06-05 14:55:48');
INSERT INTO `sys_audit_log` VALUES (2062790473153675267, 1, 'admin', '商品分类', '修改分类', 60506, '{\"id\":\"60506\",\"name\":\"肉干豆干\",\"parentId\":\"605\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60506\",{\"status\":1}]', '2026-06-05 14:55:48');
INSERT INTO `sys_audit_log` VALUES (2062790474323886082, 1, 'admin', '商品分类', '修改分类', 60601, '{\"id\":\"60601\",\"name\":\"绿茶\",\"parentId\":\"606\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60601\",{\"status\":1}]', '2026-06-05 14:55:48');
INSERT INTO `sys_audit_log` VALUES (2062790474449715202, 1, 'admin', '商品分类', '修改分类', 60603, '{\"id\":\"60603\",\"name\":\"白酒\",\"parentId\":\"606\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60603\",{\"status\":1}]', '2026-06-05 14:55:48');
INSERT INTO `sys_audit_log` VALUES (2062790474449715203, 1, 'admin', '商品分类', '修改分类', 60602, '{\"id\":\"60602\",\"name\":\"红茶\",\"parentId\":\"606\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60602\",{\"status\":1}]', '2026-06-05 14:55:48');
INSERT INTO `sys_audit_log` VALUES (2062790474583932930, 1, 'admin', '商品分类', '修改分类', 60604, '{\"id\":\"60604\",\"name\":\"红酒\",\"parentId\":\"606\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60604\",{\"status\":1}]', '2026-06-05 14:55:48');
INSERT INTO `sys_audit_log` VALUES (2062790474583932931, 1, 'admin', '商品分类', '修改分类', 60606, '{\"id\":\"60606\",\"name\":\"咖啡奶茶\",\"parentId\":\"606\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60606\",{\"status\":1}]', '2026-06-05 14:55:48');
INSERT INTO `sys_audit_log` VALUES (2062790474583932932, 1, 'admin', '商品分类', '修改分类', 60605, '{\"id\":\"60605\",\"name\":\"啤酒\",\"parentId\":\"606\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60605\",{\"status\":1}]', '2026-06-05 14:55:48');
INSERT INTO `sys_audit_log` VALUES (2062790475758338050, 1, 'admin', '商品分类', '修改分类', 60607, '{\"id\":\"60607\",\"name\":\"饮料果汁\",\"parentId\":\"606\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"60607\",{\"status\":1}]', '2026-06-05 14:55:48');
INSERT INTO `sys_audit_log` VALUES (2062790475821252610, 1, 'admin', '商品分类', '修改分类', 607, '{\"id\":\"607\",\"name\":\"粮油调味\",\"parentId\":\"6\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"607\",{\"status\":1}]', '2026-06-05 14:55:48');
INSERT INTO `sys_audit_log` VALUES (2062790990760140802, 1, 'admin', '商品分类', '修改分类', 15, '{\"id\":\"15\",\"name\":\"鲜花绿植\",\"parentId\":\"0\",\"icon\":\"flower\",\"sortNum\":15,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"15\",{\"status\":0}]', '2026-06-05 14:57:51');
INSERT INTO `sys_audit_log` VALUES (2062790991343149059, 1, 'admin', '商品分类', '修改分类', 150102, '{\"id\":\"150102\",\"name\":\"百合花束\",\"parentId\":\"1501\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"150102\",{\"status\":0}]', '2026-06-05 14:57:51');
INSERT INTO `sys_audit_log` VALUES (2062790991410257922, 1, 'admin', '商品分类', '修改分类', 150101, '{\"id\":\"150101\",\"name\":\"玫瑰花束\",\"parentId\":\"1501\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"150101\",{\"status\":0}]', '2026-06-05 14:57:51');
INSERT INTO `sys_audit_log` VALUES (2062790991410257923, 1, 'admin', '商品分类', '修改分类', 1501, '{\"id\":\"1501\",\"name\":\"鲜花\",\"parentId\":\"15\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1501\",{\"status\":0}]', '2026-06-05 14:57:51');
INSERT INTO `sys_audit_log` VALUES (2062790992580468741, 1, 'admin', '商品分类', '修改分类', 150105, '{\"id\":\"150105\",\"name\":\"混搭花束\",\"parentId\":\"1501\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"150105\",{\"status\":0}]', '2026-06-05 14:57:52');
INSERT INTO `sys_audit_log` VALUES (2062790992647577602, 1, 'admin', '商品分类', '修改分类', 150104, '{\"id\":\"150104\",\"name\":\"康乃馨\",\"parentId\":\"1501\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"150104\",{\"status\":0}]', '2026-06-05 14:57:52');
INSERT INTO `sys_audit_log` VALUES (2062790992647577603, 1, 'admin', '商品分类', '修改分类', 150103, '{\"id\":\"150103\",\"name\":\"向日葵\",\"parentId\":\"1501\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"150103\",{\"status\":0}]', '2026-06-05 14:57:52');
INSERT INTO `sys_audit_log` VALUES (2062790992903430146, 1, 'admin', '商品分类', '修改分类', 1502, '{\"id\":\"1502\",\"name\":\"绿植盆栽\",\"parentId\":\"15\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1502\",{\"status\":0}]', '2026-06-05 14:57:52');
INSERT INTO `sys_audit_log` VALUES (2062790992903430147, 1, 'admin', '商品分类', '修改分类', 1504, '{\"id\":\"1504\",\"name\":\"园艺工具\",\"parentId\":\"15\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1504\",{\"status\":0}]', '2026-06-05 14:57:52');
INSERT INTO `sys_audit_log` VALUES (2062790992903430148, 1, 'admin', '商品分类', '修改分类', 1503, '{\"id\":\"1503\",\"name\":\"仿真花艺\",\"parentId\":\"15\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1503\",{\"status\":0}]', '2026-06-05 14:57:52');
INSERT INTO `sys_audit_log` VALUES (2062791125393104899, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":0}]', '2026-06-05 14:58:23');
INSERT INTO `sys_audit_log` VALUES (2062791126500401155, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791127406370817, 1, 'admin', '商品分类', '修改分类', 102, '{\"id\":\"102\",\"name\":\"平板电脑\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"102\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791127406370818, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791127406370819, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791127406370820, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791127406370821, 1, 'admin', '商品分类', '修改分类', 2057445280091111426, '{\"id\":\"2057445280091111426\",\"name\":\"老人手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:55:55\",\"updateTime\":\"2026-05-21T20:55:55\",\"deleted\":0}', '[\"2057445280091111426\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791128056487937, 1, 'admin', '商品分类', '修改分类', 103, '{\"id\":\"103\",\"name\":\"智能手表\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"103\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791128970846211, 1, 'admin', '商品分类', '修改分类', 10403, '{\"id\":\"10403\",\"name\":\"数据线\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10403\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791128970846212, 1, 'admin', '商品分类', '修改分类', 10402, '{\"id\":\"10402\",\"name\":\"充电器\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10402\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791128970846213, 1, 'admin', '商品分类', '修改分类', 104, '{\"id\":\"104\",\"name\":\"手机配件\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"104\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791128970846214, 1, 'admin', '商品分类', '修改分类', 10401, '{\"id\":\"10401\",\"name\":\"手机壳\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10401\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791129033760770, 1, 'admin', '商品分类', '修改分类', 10404, '{\"id\":\"10404\",\"name\":\"手机膜\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10404\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791129490939907, 1, 'admin', '商品分类', '修改分类', 10405, '{\"id\":\"10405\",\"name\":\"手机支架\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10405\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791130405298178, 1, 'admin', '商品分类', '修改分类', 10406, '{\"id\":\"10406\",\"name\":\"充电宝\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10406\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791130535321601, 1, 'admin', '商品分类', '修改分类', 105, '{\"id\":\"105\",\"name\":\"摄影摄像\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"105\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791130535321602, 1, 'admin', '商品分类', '修改分类', 10501, '{\"id\":\"10501\",\"name\":\"微单相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10501\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791130535321603, 1, 'admin', '商品分类', '修改分类', 10502, '{\"id\":\"10502\",\"name\":\"单反相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10502\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791130535321604, 1, 'admin', '商品分类', '修改分类', 10503, '{\"id\":\"10503\",\"name\":\"运动相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10503\",{\"status\":0}]', '2026-06-05 14:58:24');
INSERT INTO `sys_audit_log` VALUES (2062791130925391874, 1, 'admin', '商品分类', '修改分类', 10504, '{\"id\":\"10504\",\"name\":\"无人机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10504\",{\"status\":0}]', '2026-06-05 14:58:25');
INSERT INTO `sys_audit_log` VALUES (2062791131902664707, 1, 'admin', '商品分类', '修改分类', 10505, '{\"id\":\"10505\",\"name\":\"镜头滤镜\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10505\",{\"status\":0}]', '2026-06-05 14:58:25');
INSERT INTO `sys_audit_log` VALUES (2062791132028493826, 1, 'admin', '商品分类', '修改分类', 10701, '{\"id\":\"10701\",\"name\":\"真无线耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10701\",{\"status\":0}]', '2026-06-05 14:58:25');
INSERT INTO `sys_audit_log` VALUES (2062791132028493827, 1, 'admin', '商品分类', '修改分类', 106, '{\"id\":\"106\",\"name\":\"智能穿戴\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"106\",{\"status\":0}]', '2026-06-05 14:58:25');
INSERT INTO `sys_audit_log` VALUES (2062791132028493828, 1, 'admin', '商品分类', '修改分类', 10702, '{\"id\":\"10702\",\"name\":\"头戴式耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10702\",{\"status\":0}]', '2026-06-05 14:58:25');
INSERT INTO `sys_audit_log` VALUES (2062791132028493829, 1, 'admin', '商品分类', '修改分类', 107, '{\"id\":\"107\",\"name\":\"耳机音箱\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"107\",{\"status\":0}]', '2026-06-05 14:58:25');
INSERT INTO `sys_audit_log` VALUES (2062791132351455234, 1, 'admin', '商品分类', '修改分类', 10703, '{\"id\":\"10703\",\"name\":\"蓝牙音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10703\",{\"status\":0}]', '2026-06-05 14:58:25');
INSERT INTO `sys_audit_log` VALUES (2062791133454557185, 1, 'admin', '商品分类', '修改分类', 10704, '{\"id\":\"10704\",\"name\":\"智能音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10704\",{\"status\":0}]', '2026-06-05 14:58:25');
INSERT INTO `sys_audit_log` VALUES (2062791133521666049, 1, 'admin', '商品分类', '修改分类', 10705, '{\"id\":\"10705\",\"name\":\"降噪耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10705\",{\"status\":0}]', '2026-06-05 14:58:25');
INSERT INTO `sys_audit_log` VALUES (2062791245090152450, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-05 14:58:52');
INSERT INTO `sys_audit_log` VALUES (2062791246130339842, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-05 14:58:52');
INSERT INTO `sys_audit_log` VALUES (2062791246910480389, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-05 14:58:52');
INSERT INTO `sys_audit_log` VALUES (2062791246910480390, 1, 'admin', '商品分类', '修改分类', 2057445280091111426, '{\"id\":\"2057445280091111426\",\"name\":\"老人手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:55:55\",\"updateTime\":\"2026-05-21T20:55:55\",\"deleted\":0}', '[\"2057445280091111426\",{\"status\":1}]', '2026-06-05 14:58:52');
INSERT INTO `sys_audit_log` VALUES (2062791246910480391, 1, 'admin', '商品分类', '修改分类', 102, '{\"id\":\"102\",\"name\":\"平板电脑\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"102\",{\"status\":1}]', '2026-06-05 14:58:52');
INSERT INTO `sys_audit_log` VALUES (2062791246910480392, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":1}]', '2026-06-05 14:58:52');
INSERT INTO `sys_audit_log` VALUES (2062791246910480393, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":1}]', '2026-06-05 14:58:52');
INSERT INTO `sys_audit_log` VALUES (2062791247564791810, 1, 'admin', '商品分类', '修改分类', 103, '{\"id\":\"103\",\"name\":\"智能手表\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"103\",{\"status\":1}]', '2026-06-05 14:58:52');
INSERT INTO `sys_audit_log` VALUES (2062791248420429826, 1, 'admin', '商品分类', '修改分类', 104, '{\"id\":\"104\",\"name\":\"手机配件\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"104\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791248420429830, 1, 'admin', '商品分类', '修改分类', 10401, '{\"id\":\"10401\",\"name\":\"手机壳\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10401\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791248487538689, 1, 'admin', '商品分类', '修改分类', 10403, '{\"id\":\"10403\",\"name\":\"数据线\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10403\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791248487538690, 1, 'admin', '商品分类', '修改分类', 10402, '{\"id\":\"10402\",\"name\":\"充电器\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10402\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791248487538691, 1, 'admin', '商品分类', '修改分类', 10404, '{\"id\":\"10404\",\"name\":\"手机膜\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10404\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791249003438083, 1, 'admin', '商品分类', '修改分类', 10405, '{\"id\":\"10405\",\"name\":\"手机支架\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10405\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791249909407745, 1, 'admin', '商品分类', '修改分类', 105, '{\"id\":\"105\",\"name\":\"摄影摄像\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"105\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791249909407748, 1, 'admin', '商品分类', '修改分类', 10406, '{\"id\":\"10406\",\"name\":\"充电宝\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":6,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10406\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791249976516609, 1, 'admin', '商品分类', '修改分类', 10502, '{\"id\":\"10502\",\"name\":\"单反相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10502\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791249976516611, 1, 'admin', '商品分类', '修改分类', 10501, '{\"id\":\"10501\",\"name\":\"微单相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10501\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791250039431169, 1, 'admin', '商品分类', '修改分类', 10503, '{\"id\":\"10503\",\"name\":\"运动相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10503\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791250433695747, 1, 'admin', '商品分类', '修改分类', 10504, '{\"id\":\"10504\",\"name\":\"无人机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10504\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791251343859715, 1, 'admin', '商品分类', '修改分类', 10505, '{\"id\":\"10505\",\"name\":\"镜头滤镜\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10505\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791251473883138, 1, 'admin', '商品分类', '修改分类', 107, '{\"id\":\"107\",\"name\":\"耳机音箱\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":7,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"107\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791251536797698, 1, 'admin', '商品分类', '修改分类', 106, '{\"id\":\"106\",\"name\":\"智能穿戴\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":6,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"106\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791251536797699, 1, 'admin', '商品分类', '修改分类', 10702, '{\"id\":\"10702\",\"name\":\"头戴式耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10702\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791251603906561, 1, 'admin', '商品分类', '修改分类', 10701, '{\"id\":\"10701\",\"name\":\"真无线耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10701\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791251863953410, 1, 'admin', '商品分类', '修改分类', 10703, '{\"id\":\"10703\",\"name\":\"蓝牙音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10703\",{\"status\":1}]', '2026-06-05 14:58:53');
INSERT INTO `sys_audit_log` VALUES (2062791252845420546, 1, 'admin', '商品分类', '修改分类', 10704, '{\"id\":\"10704\",\"name\":\"智能音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10704\",{\"status\":1}]', '2026-06-05 14:58:54');
INSERT INTO `sys_audit_log` VALUES (2062791252971249666, 1, 'admin', '商品分类', '修改分类', 10705, '{\"id\":\"10705\",\"name\":\"降噪耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10705\",{\"status\":1}]', '2026-06-05 14:58:54');
INSERT INTO `sys_audit_log` VALUES (2062791644014600195, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":0}]', '2026-06-05 15:00:27');
INSERT INTO `sys_audit_log` VALUES (2062791644861849602, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":0}]', '2026-06-05 15:00:27');
INSERT INTO `sys_audit_log` VALUES (2062791645893648386, 1, 'admin', '商品分类', '修改分类', 102, '{\"id\":\"102\",\"name\":\"平板电脑\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"102\",{\"status\":0}]', '2026-06-05 15:00:27');
INSERT INTO `sys_audit_log` VALUES (2062791645893648387, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":0}]', '2026-06-05 15:00:27');
INSERT INTO `sys_audit_log` VALUES (2062791645893648388, 1, 'admin', '商品分类', '修改分类', 2057445280091111426, '{\"id\":\"2057445280091111426\",\"name\":\"老人手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:55:55\",\"updateTime\":\"2026-05-21T20:55:55\",\"deleted\":0}', '[\"2057445280091111426\",{\"status\":0}]', '2026-06-05 15:00:27');
INSERT INTO `sys_audit_log` VALUES (2062791645893648389, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":0}]', '2026-06-05 15:00:27');
INSERT INTO `sys_audit_log` VALUES (2062791645893648390, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":0}]', '2026-06-05 15:00:27');
INSERT INTO `sys_audit_log` VALUES (2062791646296301571, 1, 'admin', '商品分类', '修改分类', 103, '{\"id\":\"103\",\"name\":\"智能手表\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"103\",{\"status\":0}]', '2026-06-05 15:00:27');
INSERT INTO `sys_audit_log` VALUES (2062791647340683267, 1, 'admin', '商品分类', '修改分类', 104, '{\"id\":\"104\",\"name\":\"手机配件\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"104\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791647470706690, 1, 'admin', '商品分类', '修改分类', 10403, '{\"id\":\"10403\",\"name\":\"数据线\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10403\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791647470706691, 1, 'admin', '商品分类', '修改分类', 10401, '{\"id\":\"10401\",\"name\":\"手机壳\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10401\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791647470706692, 1, 'admin', '商品分类', '修改分类', 10404, '{\"id\":\"10404\",\"name\":\"手机膜\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10404\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791647533621250, 1, 'admin', '商品分类', '修改分类', 10402, '{\"id\":\"10402\",\"name\":\"充电器\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10402\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791647734947843, 1, 'admin', '商品分类', '修改分类', 10405, '{\"id\":\"10405\",\"name\":\"手机支架\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10405\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791648846438402, 1, 'admin', '商品分类', '修改分类', 10406, '{\"id\":\"10406\",\"name\":\"充电宝\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10406\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791648976461829, 1, 'admin', '商品分类', '修改分类', 105, '{\"id\":\"105\",\"name\":\"摄影摄像\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"105\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791649039376385, 1, 'admin', '商品分类', '修改分类', 10503, '{\"id\":\"10503\",\"name\":\"运动相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10503\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791649039376386, 1, 'admin', '商品分类', '修改分类', 10502, '{\"id\":\"10502\",\"name\":\"单反相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10502\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791649039376387, 1, 'admin', '商品分类', '修改分类', 10501, '{\"id\":\"10501\",\"name\":\"微单相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10501\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791649169399811, 1, 'admin', '商品分类', '修改分类', 10504, '{\"id\":\"10504\",\"name\":\"无人机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10504\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791650213781506, 1, 'admin', '商品分类', '修改分类', 10505, '{\"id\":\"10505\",\"name\":\"镜头滤镜\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10505\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791650540937218, 1, 'admin', '商品分类', '修改分类', 107, '{\"id\":\"107\",\"name\":\"耳机音箱\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"107\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791650540937219, 1, 'admin', '商品分类', '修改分类', 10702, '{\"id\":\"10702\",\"name\":\"头戴式耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10702\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791650540937220, 1, 'admin', '商品分类', '修改分类', 106, '{\"id\":\"106\",\"name\":\"智能穿戴\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"106\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791650603851777, 1, 'admin', '商品分类', '修改分类', 10701, '{\"id\":\"10701\",\"name\":\"真无线耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10701\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791650666766338, 1, 'admin', '商品分类', '修改分类', 10703, '{\"id\":\"10703\",\"name\":\"蓝牙音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10703\",{\"status\":0}]', '2026-06-05 15:00:28');
INSERT INTO `sys_audit_log` VALUES (2062791651635650563, 1, 'admin', '商品分类', '修改分类', 10704, '{\"id\":\"10704\",\"name\":\"智能音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10704\",{\"status\":0}]', '2026-06-05 15:00:29');
INSERT INTO `sys_audit_log` VALUES (2062791651954417667, 1, 'admin', '商品分类', '修改分类', 10705, '{\"id\":\"10705\",\"name\":\"降噪耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10705\",{\"status\":0}]', '2026-06-05 15:00:29');
INSERT INTO `sys_audit_log` VALUES (2062794497961648130, 1, 'admin', '商品管理', '商品上下架', 2057693667856125953, '{\"id\":\"2057693667856125953\",\"name\":\"iPhone 15 Pro\",\"categoryId\":\"10101\",\"brand\":\"Apple\",\"description\":\"测试商品\",\"mainImage\":\"https://example.com/iphone15pro-main.jpg\",\"images\":\"[\\\"https://example.com/iphone15pro-1.jpg\\\",\\\"https://example.com/iphone15pro-2.jpg\\\",\\\"https://example.com/iphone15pro-3.jpg\\\"]\",\"status\":0,\"saleCount\":0,\"createTime\":\"2026-05-22T13:22:55\",\"updateTime\":\"2026-05-22T13:22:55\",\"deleted\":0}', '[\"2057693667856125953\",1]', '2026-06-05 15:11:47');
INSERT INTO `sys_audit_log` VALUES (2062795079992631297, 1, 'admin', '商品管理', '商品上下架', 2057693667856125953, '{\"id\":\"2057693667856125953\",\"name\":\"iPhone 15 Pro\",\"categoryId\":\"10101\",\"brand\":\"Apple\",\"description\":\"测试商品\",\"mainImage\":\"https://example.com/iphone15pro-main.jpg\",\"images\":\"[\\\"https://example.com/iphone15pro-1.jpg\\\",\\\"https://example.com/iphone15pro-2.jpg\\\",\\\"https://example.com/iphone15pro-3.jpg\\\"]\",\"status\":1,\"saleCount\":0,\"createTime\":\"2026-05-22T13:22:55\",\"updateTime\":\"2026-05-22T13:22:55\",\"deleted\":0}', '[\"2057693667856125953\",0]', '2026-06-05 15:14:06');
INSERT INTO `sys_audit_log` VALUES (2062795532352512003, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-05 15:15:54');
INSERT INTO `sys_audit_log` VALUES (2062795533128458243, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-05 15:15:54');
INSERT INTO `sys_audit_log` VALUES (2062795534235754497, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":1}]', '2026-06-05 15:15:54');
INSERT INTO `sys_audit_log` VALUES (2062795534235754498, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":1}]', '2026-06-05 15:15:54');
INSERT INTO `sys_audit_log` VALUES (2062795534235754499, 1, 'admin', '商品分类', '修改分类', 102, '{\"id\":\"102\",\"name\":\"平板电脑\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"102\",{\"status\":1}]', '2026-06-05 15:15:54');
INSERT INTO `sys_audit_log` VALUES (2062795534235754500, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-05 15:15:54');
INSERT INTO `sys_audit_log` VALUES (2062795534298669058, 1, 'admin', '商品分类', '修改分类', 2057445280091111426, '{\"id\":\"2057445280091111426\",\"name\":\"老人手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:55:55\",\"updateTime\":\"2026-05-21T20:55:55\",\"deleted\":0}', '[\"2057445280091111426\",{\"status\":1}]', '2026-06-05 15:15:54');
INSERT INTO `sys_audit_log` VALUES (2062795534554521603, 1, 'admin', '商品分类', '修改分类', 103, '{\"id\":\"103\",\"name\":\"智能手表\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"103\",{\"status\":1}]', '2026-06-05 15:15:54');
INSERT INTO `sys_audit_log` VALUES (2062795535783452677, 1, 'admin', '商品分类', '修改分类', 10402, '{\"id\":\"10402\",\"name\":\"充电器\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10402\",{\"status\":1}]', '2026-06-05 15:15:55');
INSERT INTO `sys_audit_log` VALUES (2062795535783452678, 1, 'admin', '商品分类', '修改分类', 10403, '{\"id\":\"10403\",\"name\":\"数据线\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10403\",{\"status\":1}]', '2026-06-05 15:15:55');
INSERT INTO `sys_audit_log` VALUES (2062795535783452679, 1, 'admin', '商品分类', '修改分类', 10401, '{\"id\":\"10401\",\"name\":\"手机壳\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10401\",{\"status\":1}]', '2026-06-05 15:15:55');
INSERT INTO `sys_audit_log` VALUES (2062795535783452680, 1, 'admin', '商品分类', '修改分类', 104, '{\"id\":\"104\",\"name\":\"手机配件\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"104\",{\"status\":1}]', '2026-06-05 15:15:55');
INSERT INTO `sys_audit_log` VALUES (2062795535783452681, 1, 'admin', '商品分类', '修改分类', 10404, '{\"id\":\"10404\",\"name\":\"手机膜\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10404\",{\"status\":1}]', '2026-06-05 15:15:55');
INSERT INTO `sys_audit_log` VALUES (2062795535976390659, 1, 'admin', '商品分类', '修改分类', 10405, '{\"id\":\"10405\",\"name\":\"手机支架\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10405\",{\"status\":1}]', '2026-06-05 15:15:55');
INSERT INTO `sys_audit_log` VALUES (2062795537285013506, 1, 'admin', '商品分类', '修改分类', 10406, '{\"id\":\"10406\",\"name\":\"充电宝\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":6,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10406\",{\"status\":1}]', '2026-06-05 15:15:55');
INSERT INTO `sys_audit_log` VALUES (2062795537285013507, 1, 'admin', '商品分类', '修改分类', 10503, '{\"id\":\"10503\",\"name\":\"运动相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10503\",{\"status\":1}]', '2026-06-05 15:15:55');
INSERT INTO `sys_audit_log` VALUES (2062795537343733762, 1, 'admin', '商品分类', '修改分类', 10501, '{\"id\":\"10501\",\"name\":\"微单相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10501\",{\"status\":1}]', '2026-06-05 15:15:55');
INSERT INTO `sys_audit_log` VALUES (2062795537343733763, 1, 'admin', '商品分类', '修改分类', 10502, '{\"id\":\"10502\",\"name\":\"单反相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10502\",{\"status\":1}]', '2026-06-05 15:15:55');
INSERT INTO `sys_audit_log` VALUES (2062795537343733764, 1, 'admin', '商品分类', '修改分类', 105, '{\"id\":\"105\",\"name\":\"摄影摄像\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"105\",{\"status\":1}]', '2026-06-05 15:15:55');
INSERT INTO `sys_audit_log` VALUES (2062795537410842626, 1, 'admin', '商品分类', '修改分类', 10504, '{\"id\":\"10504\",\"name\":\"无人机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10504\",{\"status\":1}]', '2026-06-05 15:15:55');
INSERT INTO `sys_audit_log` VALUES (2062795538715271172, 1, 'admin', '商品分类', '修改分类', 10505, '{\"id\":\"10505\",\"name\":\"镜头滤镜\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10505\",{\"status\":1}]', '2026-06-05 15:15:55');
INSERT INTO `sys_audit_log` VALUES (2062795538782380034, 1, 'admin', '商品分类', '修改分类', 106, '{\"id\":\"106\",\"name\":\"智能穿戴\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":6,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"106\",{\"status\":1}]', '2026-06-05 15:15:55');
INSERT INTO `sys_audit_log` VALUES (2062795538849488898, 1, 'admin', '商品分类', '修改分类', 10701, '{\"id\":\"10701\",\"name\":\"真无线耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10701\",{\"status\":1}]', '2026-06-05 15:15:56');
INSERT INTO `sys_audit_log` VALUES (2062795538849488899, 1, 'admin', '商品分类', '修改分类', 107, '{\"id\":\"107\",\"name\":\"耳机音箱\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":7,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"107\",{\"status\":1}]', '2026-06-05 15:15:56');
INSERT INTO `sys_audit_log` VALUES (2062795538849488901, 1, 'admin', '商品分类', '修改分类', 10702, '{\"id\":\"10702\",\"name\":\"头戴式耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10702\",{\"status\":1}]', '2026-06-05 15:15:56');
INSERT INTO `sys_audit_log` VALUES (2062795538849488902, 1, 'admin', '商品分类', '修改分类', 10703, '{\"id\":\"10703\",\"name\":\"蓝牙音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10703\",{\"status\":1}]', '2026-06-05 15:15:56');
INSERT INTO `sys_audit_log` VALUES (2062795540283940866, 1, 'admin', '商品分类', '修改分类', 10705, '{\"id\":\"10705\",\"name\":\"降噪耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10705\",{\"status\":1}]', '2026-06-05 15:15:56');
INSERT INTO `sys_audit_log` VALUES (2062795540283940867, 1, 'admin', '商品分类', '修改分类', 10704, '{\"id\":\"10704\",\"name\":\"智能音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10704\",{\"status\":1}]', '2026-06-05 15:15:56');
INSERT INTO `sys_audit_log` VALUES (2062796738609229826, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":0}]', '2026-06-05 15:20:42');
INSERT INTO `sys_audit_log` VALUES (2062796739192238082, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":0}]', '2026-06-05 15:20:42');
INSERT INTO `sys_audit_log` VALUES (2062796740622495747, 1, 'admin', '商品分类', '修改分类', 2057445280091111426, '{\"id\":\"2057445280091111426\",\"name\":\"老人手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:55:55\",\"updateTime\":\"2026-05-21T20:55:55\",\"deleted\":0}', '[\"2057445280091111426\",{\"status\":0}]', '2026-06-05 15:20:42');
INSERT INTO `sys_audit_log` VALUES (2062796740622495749, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":0}]', '2026-06-05 15:20:42');
INSERT INTO `sys_audit_log` VALUES (2062796740622495750, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":0}]', '2026-06-05 15:20:42');
INSERT INTO `sys_audit_log` VALUES (2062796740702187521, 1, 'admin', '商品分类', '修改分类', 102, '{\"id\":\"102\",\"name\":\"平板电脑\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"102\",{\"status\":0}]', '2026-06-05 15:20:42');
INSERT INTO `sys_audit_log` VALUES (2062796740702187522, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":0}]', '2026-06-05 15:20:42');
INSERT INTO `sys_audit_log` VALUES (2062796740752519170, 1, 'admin', '商品分类', '修改分类', 103, '{\"id\":\"103\",\"name\":\"智能手表\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"103\",{\"status\":0}]', '2026-06-05 15:20:42');
INSERT INTO `sys_audit_log` VALUES (2062796742128250883, 1, 'admin', '商品分类', '修改分类', 10402, '{\"id\":\"10402\",\"name\":\"充电器\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10402\",{\"status\":0}]', '2026-06-05 15:20:42');
INSERT INTO `sys_audit_log` VALUES (2062796742128250886, 1, 'admin', '商品分类', '修改分类', 104, '{\"id\":\"104\",\"name\":\"手机配件\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"104\",{\"status\":0}]', '2026-06-05 15:20:42');
INSERT INTO `sys_audit_log` VALUES (2062796742128250887, 1, 'admin', '商品分类', '修改分类', 10401, '{\"id\":\"10401\",\"name\":\"手机壳\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10401\",{\"status\":0}]', '2026-06-05 15:20:42');
INSERT INTO `sys_audit_log` VALUES (2062796742191165442, 1, 'admin', '商品分类', '修改分类', 10403, '{\"id\":\"10403\",\"name\":\"数据线\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10403\",{\"status\":0}]', '2026-06-05 15:20:42');
INSERT INTO `sys_audit_log` VALUES (2062796742191165443, 1, 'admin', '商品分类', '修改分类', 10404, '{\"id\":\"10404\",\"name\":\"手机膜\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10404\",{\"status\":0}]', '2026-06-05 15:20:42');
INSERT INTO `sys_audit_log` VALUES (2062796742321188866, 1, 'admin', '商品分类', '修改分类', 10405, '{\"id\":\"10405\",\"name\":\"手机支架\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10405\",{\"status\":0}]', '2026-06-05 15:20:42');
INSERT INTO `sys_audit_log` VALUES (2062796743558508546, 1, 'admin', '商品分类', '修改分类', 10406, '{\"id\":\"10406\",\"name\":\"充电宝\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10406\",{\"status\":0}]', '2026-06-05 15:20:43');
INSERT INTO `sys_audit_log` VALUES (2062796743692726274, 1, 'admin', '商品分类', '修改分类', 10501, '{\"id\":\"10501\",\"name\":\"微单相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10501\",{\"status\":0}]', '2026-06-05 15:20:43');
INSERT INTO `sys_audit_log` VALUES (2062796743692726275, 1, 'admin', '商品分类', '修改分类', 105, '{\"id\":\"105\",\"name\":\"摄影摄像\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"105\",{\"status\":0}]', '2026-06-05 15:20:43');
INSERT INTO `sys_audit_log` VALUES (2062796743822749698, 1, 'admin', '商品分类', '修改分类', 10502, '{\"id\":\"10502\",\"name\":\"单反相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10502\",{\"status\":0}]', '2026-06-05 15:20:43');
INSERT INTO `sys_audit_log` VALUES (2062796743822749699, 1, 'admin', '商品分类', '修改分类', 10504, '{\"id\":\"10504\",\"name\":\"无人机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10504\",{\"status\":0}]', '2026-06-05 15:20:43');
INSERT INTO `sys_audit_log` VALUES (2062796743822749700, 1, 'admin', '商品分类', '修改分类', 10503, '{\"id\":\"10503\",\"name\":\"运动相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10503\",{\"status\":0}]', '2026-06-05 15:20:43');
INSERT INTO `sys_audit_log` VALUES (2062796745001349122, 1, 'admin', '商品分类', '修改分类', 10505, '{\"id\":\"10505\",\"name\":\"镜头滤镜\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10505\",{\"status\":0}]', '2026-06-05 15:20:43');
INSERT INTO `sys_audit_log` VALUES (2062796745198481409, 1, 'admin', '商品分类', '修改分类', 107, '{\"id\":\"107\",\"name\":\"耳机音箱\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":7,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"107\",{\"status\":0}]', '2026-06-05 15:20:43');
INSERT INTO `sys_audit_log` VALUES (2062796745198481410, 1, 'admin', '商品分类', '修改分类', 106, '{\"id\":\"106\",\"name\":\"智能穿戴\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":6,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"106\",{\"status\":0}]', '2026-06-05 15:20:43');
INSERT INTO `sys_audit_log` VALUES (2062796745328504835, 1, 'admin', '商品分类', '修改分类', 10701, '{\"id\":\"10701\",\"name\":\"真无线耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":1,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10701\",{\"status\":0}]', '2026-06-05 15:20:43');
INSERT INTO `sys_audit_log` VALUES (2062796745328504836, 1, 'admin', '商品分类', '修改分类', 10702, '{\"id\":\"10702\",\"name\":\"头戴式耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":2,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10702\",{\"status\":0}]', '2026-06-05 15:20:43');
INSERT INTO `sys_audit_log` VALUES (2062796745391419394, 1, 'admin', '商品分类', '修改分类', 10703, '{\"id\":\"10703\",\"name\":\"蓝牙音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":3,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10703\",{\"status\":0}]', '2026-06-05 15:20:43');
INSERT INTO `sys_audit_log` VALUES (2062796746498715651, 1, 'admin', '商品分类', '修改分类', 10704, '{\"id\":\"10704\",\"name\":\"智能音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":4,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10704\",{\"status\":0}]', '2026-06-05 15:20:43');
INSERT INTO `sys_audit_log` VALUES (2062796746628739075, 1, 'admin', '商品分类', '修改分类', 10705, '{\"id\":\"10705\",\"name\":\"降噪耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":5,\"status\":1,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10705\",{\"status\":0}]', '2026-06-05 15:20:43');
INSERT INTO `sys_audit_log` VALUES (2062796781873475586, 1, 'admin', '商品分类', '修改分类', 1, '{\"id\":\"1\",\"name\":\"手机数码\",\"parentId\":\"0\",\"icon\":\"mobile\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"1\",{\"status\":1}]', '2026-06-05 15:20:52');
INSERT INTO `sys_audit_log` VALUES (2062796782401957892, 1, 'admin', '商品分类', '修改分类', 10102, '{\"id\":\"10102\",\"name\":\"折叠屏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10102\",{\"status\":1}]', '2026-06-05 15:20:52');
INSERT INTO `sys_audit_log` VALUES (2062796782401957893, 1, 'admin', '商品分类', '修改分类', 101, '{\"id\":\"101\",\"name\":\"智能手机\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"101\",{\"status\":1}]', '2026-06-05 15:20:52');
INSERT INTO `sys_audit_log` VALUES (2062796782464872449, 1, 'admin', '商品分类', '修改分类', 10101, '{\"id\":\"10101\",\"name\":\"5G手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10101\",{\"status\":1}]', '2026-06-05 15:20:52');
INSERT INTO `sys_audit_log` VALUES (2062796783702192129, 1, 'admin', '商品分类', '修改分类', 10103, '{\"id\":\"10103\",\"name\":\"游戏手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10103\",{\"status\":1}]', '2026-06-05 15:20:52');
INSERT INTO `sys_audit_log` VALUES (2062796783702192130, 1, 'admin', '商品分类', '修改分类', 102, '{\"id\":\"102\",\"name\":\"平板电脑\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"102\",{\"status\":1}]', '2026-06-05 15:20:52');
INSERT INTO `sys_audit_log` VALUES (2062796783702192131, 1, 'admin', '商品分类', '修改分类', 2057445280091111426, '{\"id\":\"2057445280091111426\",\"name\":\"老人手机\",\"parentId\":\"101\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:55:55\",\"updateTime\":\"2026-05-21T20:55:55\",\"deleted\":0}', '[\"2057445280091111426\",{\"status\":1}]', '2026-06-05 15:20:52');
INSERT INTO `sys_audit_log` VALUES (2062796783899324417, 1, 'admin', '商品分类', '修改分类', 103, '{\"id\":\"103\",\"name\":\"智能手表\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"103\",{\"status\":1}]', '2026-06-05 15:20:52');
INSERT INTO `sys_audit_log` VALUES (2062796783899324419, 1, 'admin', '商品分类', '修改分类', 10401, '{\"id\":\"10401\",\"name\":\"手机壳\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10401\",{\"status\":1}]', '2026-06-05 15:20:52');
INSERT INTO `sys_audit_log` VALUES (2062796783899324420, 1, 'admin', '商品分类', '修改分类', 104, '{\"id\":\"104\",\"name\":\"手机配件\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"104\",{\"status\":1}]', '2026-06-05 15:20:52');
INSERT INTO `sys_audit_log` VALUES (2062796785203752962, 1, 'admin', '商品分类', '修改分类', 10404, '{\"id\":\"10404\",\"name\":\"手机膜\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10404\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796785203752963, 1, 'admin', '商品分类', '修改分类', 10402, '{\"id\":\"10402\",\"name\":\"充电器\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10402\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796785203752964, 1, 'admin', '商品分类', '修改分类', 10403, '{\"id\":\"10403\",\"name\":\"数据线\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10403\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796785400885249, 1, 'admin', '商品分类', '修改分类', 10405, '{\"id\":\"10405\",\"name\":\"手机支架\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10405\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796785400885251, 1, 'admin', '商品分类', '修改分类', 10406, '{\"id\":\"10406\",\"name\":\"充电宝\",\"parentId\":\"104\",\"icon\":\"\",\"sortNum\":6,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10406\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796785400885252, 1, 'admin', '商品分类', '修改分类', 105, '{\"id\":\"105\",\"name\":\"摄影摄像\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"105\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796786696925185, 1, 'admin', '商品分类', '修改分类', 10501, '{\"id\":\"10501\",\"name\":\"微单相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10501\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796786696925186, 1, 'admin', '商品分类', '修改分类', 10502, '{\"id\":\"10502\",\"name\":\"单反相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10502\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796786759839745, 1, 'admin', '商品分类', '修改分类', 10503, '{\"id\":\"10503\",\"name\":\"运动相机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10503\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796786826948613, 1, 'admin', '商品分类', '修改分类', 10505, '{\"id\":\"10505\",\"name\":\"镜头滤镜\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10505\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796786889863169, 1, 'admin', '商品分类', '修改分类', 106, '{\"id\":\"106\",\"name\":\"智能穿戴\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":6,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"106\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796786889863170, 1, 'admin', '商品分类', '修改分类', 10504, '{\"id\":\"10504\",\"name\":\"无人机\",\"parentId\":\"105\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10504\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796788198486018, 1, 'admin', '商品分类', '修改分类', 107, '{\"id\":\"107\",\"name\":\"耳机音箱\",\"parentId\":\"1\",\"icon\":\"\",\"sortNum\":7,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"107\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796788198486020, 1, 'admin', '商品分类', '修改分类', 10701, '{\"id\":\"10701\",\"name\":\"真无线耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":1,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10701\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796788261400578, 1, 'admin', '商品分类', '修改分类', 10702, '{\"id\":\"10702\",\"name\":\"头戴式耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":2,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10702\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796788391424001, 1, 'admin', '商品分类', '修改分类', 10705, '{\"id\":\"10705\",\"name\":\"降噪耳机\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":5,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10705\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796788391424002, 1, 'admin', '商品分类', '修改分类', 10704, '{\"id\":\"10704\",\"name\":\"智能音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":4,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10704\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062796788458532866, 1, 'admin', '商品分类', '修改分类', 10703, '{\"id\":\"10703\",\"name\":\"蓝牙音箱\",\"parentId\":\"107\",\"icon\":\"\",\"sortNum\":3,\"status\":0,\"createTime\":\"2026-05-21T20:41:54\",\"updateTime\":\"2026-05-21T20:41:54\",\"deleted\":0}', '[\"10703\",{\"status\":1}]', '2026-06-05 15:20:53');
INSERT INTO `sys_audit_log` VALUES (2062915182532943874, 1, 'admin', '会员管理', '启用/禁用会员', 2062847231003889666, '{\"id\":\"2062847231003889666\",\"username\":\"test\",\"password\":\"$2a$10$Tj0irQNy3.ok2v3inuCnKusqJrio4qVCvVJJZXvuxbcs8j0IA2wvG\",\"nickname\":\"TEST_MEMBER\",\"gender\":0,\"memberLevel\":1,\"status\":1,\"createTime\":\"2026-06-05T18:41:20\",\"updateTime\":\"2026-06-05T18:41:20\",\"deleted\":0}', '[\"2062847231003889666\",0]', '2026-06-05 23:11:21');
INSERT INTO `sys_audit_log` VALUES (2062915211423309825, 1, 'admin', '会员管理', '启用/禁用会员', 2062847231003889666, '{\"id\":\"2062847231003889666\",\"username\":\"test\",\"password\":\"$2a$10$Tj0irQNy3.ok2v3inuCnKusqJrio4qVCvVJJZXvuxbcs8j0IA2wvG\",\"nickname\":\"TEST_MEMBER\",\"gender\":0,\"memberLevel\":1,\"status\":0,\"createTime\":\"2026-06-05T18:41:20\",\"updateTime\":\"2026-06-05T18:41:20\",\"deleted\":0}', '[\"2062847231003889666\",1]', '2026-06-05 23:11:28');
INSERT INTO `sys_audit_log` VALUES (2064353027143421953, 1, 'admin', '订单管理', '订单发货', 2063497202405371906, '{\"id\":\"2063497202405371906\",\"orderNo\":\"202606070811045632\",\"memberId\":\"2062847231003889666\",\"totalAmount\":8999.00,\"payAmount\":8999.00,\"freightAmount\":0.00,\"status\":1,\"createTime\":\"2026-06-07T13:44:06\",\"updateTime\":\"2026-06-07T13:44:06\",\"deleted\":0}', '[\"2063497202405371906\"]', '2026-06-09 22:24:50');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT 1,
  `sort_num` int NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', '/system', '', NULL, 0, 1, '2026-05-20 15:10:18');
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', '/users', 'user/UserView', 'user:list', 1, 1, '2026-05-20 15:10:18');
INSERT INTO `sys_menu` VALUES (3, 1, '日志管理', '/log', 'system/log/index', 'log:list', 1, 3, '2026-05-20 15:10:18');
INSERT INTO `sys_menu` VALUES (4, 1, '商品管理', '/product', NULL, NULL, 1, 4, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (5, 1, '订单管理', '/order', NULL, NULL, 1, 5, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (6, 1, '会员管理', '/member', 'member/MemberList', NULL, 1, 6, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (7, 4, '分类管理', '/product/category', 'product/CategoryList', 'product:category:list', 2, 1, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (8, 4, '商品列表', '/product/list', 'product/SpuList', 'product:spu:list', 2, 2, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (9, 5, '订单列表', '/order/list', 'order/OrderList', 'order:list', 2, 1, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (10, 6, '会员列表', '/admin/member', 'member/MemberList', 'member:list', 2, 1, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (11, 7, '新增分类', NULL, NULL, 'product:category:add', 3, 1, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (12, 7, '修改分类', NULL, NULL, 'product:category:edit', 3, 2, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (13, 7, '删除分类', NULL, NULL, 'product:category:delete', 3, 3, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (14, 8, '新增商品', NULL, NULL, 'product:spu:add', 3, 1, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (15, 8, '修改商品', NULL, NULL, 'product:spu:edit', 3, 2, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (16, 8, '删除商品', NULL, NULL, 'product:spu:delete', 3, 3, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (17, 8, '上下架', NULL, NULL, 'product:spu:status', 3, 4, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (18, 9, '订单详情', NULL, NULL, 'order:detail', 3, 1, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (19, 9, '发货', NULL, NULL, 'order:ship', 3, 2, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (20, 9, '取消订单', NULL, NULL, 'order:cancel', 3, 3, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (21, 10, '会员详情', NULL, NULL, 'member:detail', 3, 1, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (22, 10, '启用禁用', NULL, NULL, 'member:status', 3, 2, '2026-05-21 16:24:35');
INSERT INTO `sys_menu` VALUES (23, 1, '售后管理', '/after-sale', '', NULL, 0, 8, '2026-06-01 20:14:28');
INSERT INTO `sys_menu` VALUES (24, 23, '纠纷列表', '/after-sale/dispute', 'after-sale/DisputeList', 'after-sale:dispute:list', 2, 1, '2026-06-01 20:14:28');
INSERT INTO `sys_menu` VALUES (25, 24, '处理纠纷', NULL, NULL, 'after-sale:dispute:handle', 3, 1, '2026-06-01 20:14:28');
INSERT INTO `sys_menu` VALUES (26, 24, '退款操作', NULL, NULL, 'after-sale:refund', 3, 2, '2026-06-01 20:14:28');
INSERT INTO `sys_menu` VALUES (27, 0, '店铺管理', '/shop', '', NULL, 0, 9, '2026-06-01 20:14:28');
INSERT INTO `sys_menu` VALUES (28, 27, '我的商品', '/shop/products', 'product/SpuList', 'shop:product:list', 2, 1, '2026-06-01 20:14:28');
INSERT INTO `sys_menu` VALUES (29, 27, '我的订单', '/shop/orders', 'order/OrderList', 'shop:order:list', 2, 2, '2026-06-01 20:14:28');
INSERT INTO `sys_menu` VALUES (30, 29, '发货', NULL, NULL, 'shop:order:ship', 3, 1, '2026-06-01 20:14:28');
INSERT INTO `sys_menu` VALUES (31, 0, '系统配置', '/system-config', '', NULL, 0, 10, '2026-06-01 20:14:28');
INSERT INTO `sys_menu` VALUES (32, 31, '配置管理', '/system-config/manage', 'system/ConfigManage', 'system:config:manage', 2, 1, '2026-06-01 20:14:28');
INSERT INTO `sys_menu` VALUES (33, 27, '店铺列表', '/shop/list', 'merchant/ShopList', 'merchant:shop:list', 2, 3, '2026-06-09 22:22:17');

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `operation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2064354769046261763 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES (2059967938980610050, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-05-28 20:00:03');
INSERT INTO `sys_operation_log` VALUES (2059968118182248449, 1, 'admin', '更新用户', 'PUT', '/users/1', '127.0.0.1', '2026-05-28 20:00:46');
INSERT INTO `sys_operation_log` VALUES (2059968133701173249, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-05-28 20:00:50');
INSERT INTO `sys_operation_log` VALUES (2059977111566942210, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-05-28 20:36:30');
INSERT INTO `sys_operation_log` VALUES (2061431137160585218, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-01 20:54:17');
INSERT INTO `sys_operation_log` VALUES (2061444579653246977, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:47:42');
INSERT INTO `sys_operation_log` VALUES (2061444640554541058, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:47:56');
INSERT INTO `sys_operation_log` VALUES (2061444956259803138, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 21:49:12');
INSERT INTO `sys_operation_log` VALUES (2061444962756780034, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-01 21:49:13');
INSERT INTO `sys_operation_log` VALUES (2061444967970299905, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:49:14');
INSERT INTO `sys_operation_log` VALUES (2061445078985138178, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:49:41');
INSERT INTO `sys_operation_log` VALUES (2061445106977923074, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:49:47');
INSERT INTO `sys_operation_log` VALUES (2061445135188811777, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:49:54');
INSERT INTO `sys_operation_log` VALUES (2061445144143650817, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 21:49:56');
INSERT INTO `sys_operation_log` VALUES (2061445150871314434, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-01 21:49:58');
INSERT INTO `sys_operation_log` VALUES (2061445170605514753, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 21:50:03');
INSERT INTO `sys_operation_log` VALUES (2061445176792113154, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:50:04');
INSERT INTO `sys_operation_log` VALUES (2061445182022410242, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-01 21:50:05');
INSERT INTO `sys_operation_log` VALUES (2061445183150678017, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-01 21:50:06');
INSERT INTO `sys_operation_log` VALUES (2061445185755340801, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-01 21:50:06');
INSERT INTO `sys_operation_log` VALUES (2061445206777192450, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-01 21:50:11');
INSERT INTO `sys_operation_log` VALUES (2061445214540849154, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-01 21:50:13');
INSERT INTO `sys_operation_log` VALUES (2061445225311821826, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:50:16');
INSERT INTO `sys_operation_log` VALUES (2061445229283827713, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 21:50:17');
INSERT INTO `sys_operation_log` VALUES (2061445232928677890, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-01 21:50:17');
INSERT INTO `sys_operation_log` VALUES (2061445236380590081, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-01 21:50:18');
INSERT INTO `sys_operation_log` VALUES (2061445241921265665, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-01 21:50:20');
INSERT INTO `sys_operation_log` VALUES (2061445249752031233, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:50:22');
INSERT INTO `sys_operation_log` VALUES (2061445257482133506, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 21:50:23');
INSERT INTO `sys_operation_log` VALUES (2061445262326554626, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-01 21:50:25');
INSERT INTO `sys_operation_log` VALUES (2061445264406929409, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-01 21:50:25');
INSERT INTO `sys_operation_log` VALUES (2061445741953605634, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:52:19');
INSERT INTO `sys_operation_log` VALUES (2061445748207312897, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 21:52:20');
INSERT INTO `sys_operation_log` VALUES (2061445771343093762, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:52:26');
INSERT INTO `sys_operation_log` VALUES (2061445776632111106, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 21:52:27');
INSERT INTO `sys_operation_log` VALUES (2061445836757458946, 1, 'admin', '修改分类', 'PUT', '/admin/category/2057445280091111426', '127.0.0.1', '2026-06-01 21:52:41');
INSERT INTO `sys_operation_log` VALUES (2061445844722442242, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-01 21:52:43');
INSERT INTO `sys_operation_log` VALUES (2061445862107832322, 1, 'admin', '修改分类', 'PUT', '/admin/category/2057445280091111426', '127.0.0.1', '2026-06-01 21:52:48');
INSERT INTO `sys_operation_log` VALUES (2061445868978102274, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-01 21:52:49');
INSERT INTO `sys_operation_log` VALUES (2061446004814831618, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:53:22');
INSERT INTO `sys_operation_log` VALUES (2061446028021915650, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:53:27');
INSERT INTO `sys_operation_log` VALUES (2061446729921912834, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:56:14');
INSERT INTO `sys_operation_log` VALUES (2061446753716199425, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:56:20');
INSERT INTO `sys_operation_log` VALUES (2061446757331689474, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 21:56:21');
INSERT INTO `sys_operation_log` VALUES (2061446765468639233, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-01 21:56:23');
INSERT INTO `sys_operation_log` VALUES (2061446767498682369, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-01 21:56:23');
INSERT INTO `sys_operation_log` VALUES (2061446771097395201, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-01 21:56:24');
INSERT INTO `sys_operation_log` VALUES (2061446772078862338, 1, 'admin', '修改分类', 'PUT', '/admin/category/2057445280091111426', '127.0.0.1', '2026-06-01 21:56:24');
INSERT INTO `sys_operation_log` VALUES (2061446773840470017, 1, 'admin', '修改分类', 'PUT', '/admin/category/102', '127.0.0.1', '2026-06-01 21:56:25');
INSERT INTO `sys_operation_log` VALUES (2061446777313353729, 1, 'admin', '修改分类', 'PUT', '/admin/category/103', '127.0.0.1', '2026-06-01 21:56:26');
INSERT INTO `sys_operation_log` VALUES (2061446778869440514, 1, 'admin', '修改分类', 'PUT', '/admin/category/104', '127.0.0.1', '2026-06-01 21:56:26');
INSERT INTO `sys_operation_log` VALUES (2061446782535262210, 1, 'admin', '修改分类', 'PUT', '/admin/category/10401', '127.0.0.1', '2026-06-01 21:56:27');
INSERT INTO `sys_operation_log` VALUES (2061446788088520706, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 21:56:28');
INSERT INTO `sys_operation_log` VALUES (2061446791225860097, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-01 21:56:29');
INSERT INTO `sys_operation_log` VALUES (2061446792328962050, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-01 21:56:29');
INSERT INTO `sys_operation_log` VALUES (2061446793633390594, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-01 21:56:30');
INSERT INTO `sys_operation_log` VALUES (2061446796678455297, 1, 'admin', '修改分类', 'PUT', '/admin/category/2057445280091111426', '127.0.0.1', '2026-06-01 21:56:30');
INSERT INTO `sys_operation_log` VALUES (2061446797794140162, 1, 'admin', '修改分类', 'PUT', '/admin/category/102', '127.0.0.1', '2026-06-01 21:56:31');
INSERT INTO `sys_operation_log` VALUES (2061446802487566338, 1, 'admin', '修改分类', 'PUT', '/admin/category/104', '127.0.0.1', '2026-06-01 21:56:32');
INSERT INTO `sys_operation_log` VALUES (2061446805595545601, 1, 'admin', '修改分类', 'PUT', '/admin/category/10401', '127.0.0.1', '2026-06-01 21:56:32');
INSERT INTO `sys_operation_log` VALUES (2061446811203330049, 1, 'admin', '修改分类', 'PUT', '/admin/category/103', '127.0.0.1', '2026-06-01 21:56:34');
INSERT INTO `sys_operation_log` VALUES (2061446819231227906, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:56:36');
INSERT INTO `sys_operation_log` VALUES (2061446828823601153, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 21:56:38');
INSERT INTO `sys_operation_log` VALUES (2061446832422313986, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-01 21:56:39');
INSERT INTO `sys_operation_log` VALUES (2061446833999372289, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-01 21:56:39');
INSERT INTO `sys_operation_log` VALUES (2061446837149294594, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-01 21:56:40');
INSERT INTO `sys_operation_log` VALUES (2061446841616228354, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:56:41');
INSERT INTO `sys_operation_log` VALUES (2061446852441726978, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 21:56:44');
INSERT INTO `sys_operation_log` VALUES (2061446858510884865, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-01 21:56:45');
INSERT INTO `sys_operation_log` VALUES (2061446860729671682, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-01 21:56:46');
INSERT INTO `sys_operation_log` VALUES (2061446865158856706, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-01 21:56:47');
INSERT INTO `sys_operation_log` VALUES (2061446899958996993, 1, 'admin', '修改分类', 'PUT', '/admin/category/2057445280091111426', '127.0.0.1', '2026-06-01 21:56:55');
INSERT INTO `sys_operation_log` VALUES (2061446922411106305, 1, 'admin', '修改分类', 'PUT', '/admin/category/2057445280091111426', '127.0.0.1', '2026-06-01 21:57:00');
INSERT INTO `sys_operation_log` VALUES (2061446931214950402, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:57:02');
INSERT INTO `sys_operation_log` VALUES (2061446952865947649, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:57:08');
INSERT INTO `sys_operation_log` VALUES (2061447360220946434, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 21:58:45');
INSERT INTO `sys_operation_log` VALUES (2061447366726311938, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 21:58:46');
INSERT INTO `sys_operation_log` VALUES (2061447762039463938, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-01 22:00:20');
INSERT INTO `sys_operation_log` VALUES (2061447777789075458, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 22:00:24');
INSERT INTO `sys_operation_log` VALUES (2061447787486306305, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-01 22:00:27');
INSERT INTO `sys_operation_log` VALUES (2061447799213580289, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 22:00:29');
INSERT INTO `sys_operation_log` VALUES (2061448460982476802, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-01 22:03:07');
INSERT INTO `sys_operation_log` VALUES (2061448463645859842, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-01 22:03:08');
INSERT INTO `sys_operation_log` VALUES (2061448466250522626, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-01 22:03:08');
INSERT INTO `sys_operation_log` VALUES (2061450551369064450, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-01 22:11:26');
INSERT INTO `sys_operation_log` VALUES (2061451524325957633, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-01 22:15:17');
INSERT INTO `sys_operation_log` VALUES (2062391982103355394, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-04 12:32:20');
INSERT INTO `sys_operation_log` VALUES (2062434378530897922, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-04 15:20:48');
INSERT INTO `sys_operation_log` VALUES (2062435544887148546, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-04 15:25:26');
INSERT INTO `sys_operation_log` VALUES (2062439562585792513, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-04 15:41:24');
INSERT INTO `sys_operation_log` VALUES (2062441501423788033, 1, 'admin', '创建用户', 'POST', '/users/create', '127.0.0.1', '2026-06-04 15:49:06');
INSERT INTO `sys_operation_log` VALUES (2062441518926618625, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-04 15:49:11');
INSERT INTO `sys_operation_log` VALUES (2062442678219608065, 2062441501356679170, 'merchant', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-04 15:53:47');
INSERT INTO `sys_operation_log` VALUES (2062443483484033026, 2062441501356679170, 'merchant', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-04 15:56:59');
INSERT INTO `sys_operation_log` VALUES (2062443954818945026, 2062441501356679170, 'merchant', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-04 15:58:51');
INSERT INTO `sys_operation_log` VALUES (2062444977016967170, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-04 16:02:55');
INSERT INTO `sys_operation_log` VALUES (2062445231896432641, 2062441501356679170, 'merchant', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-04 16:03:56');
INSERT INTO `sys_operation_log` VALUES (2062446308830121986, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-04 16:08:13');
INSERT INTO `sys_operation_log` VALUES (2062449131420553217, 2062441501356679170, 'merchant', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-04 16:19:26');
INSERT INTO `sys_operation_log` VALUES (2062786559029211138, 2062441501356679170, 'merchant', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-05 14:40:15');
INSERT INTO `sys_operation_log` VALUES (2062786632265953282, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 14:40:32');
INSERT INTO `sys_operation_log` VALUES (2062787231468417026, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 14:42:55');
INSERT INTO `sys_operation_log` VALUES (2062787253371072513, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 14:43:00');
INSERT INTO `sys_operation_log` VALUES (2062787273134632962, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-05 14:43:05');
INSERT INTO `sys_operation_log` VALUES (2062788172120780802, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 14:46:39');
INSERT INTO `sys_operation_log` VALUES (2062788267042074626, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 14:47:02');
INSERT INTO `sys_operation_log` VALUES (2062788343877529602, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-05 14:47:20');
INSERT INTO `sys_operation_log` VALUES (2062788678742372353, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-05 14:48:40');
INSERT INTO `sys_operation_log` VALUES (2062788692516466689, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-05 14:48:43');
INSERT INTO `sys_operation_log` VALUES (2062788699571286018, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-05 14:48:45');
INSERT INTO `sys_operation_log` VALUES (2062788722476380162, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-05 14:48:50');
INSERT INTO `sys_operation_log` VALUES (2062788861207150593, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-05 14:49:23');
INSERT INTO `sys_operation_log` VALUES (2062788883571179521, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-05 14:49:29');
INSERT INTO `sys_operation_log` VALUES (2062788896250560513, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-05 14:49:32');
INSERT INTO `sys_operation_log` VALUES (2062788921353469953, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-05 14:49:38');
INSERT INTO `sys_operation_log` VALUES (2062788937866444802, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 14:49:42');
INSERT INTO `sys_operation_log` VALUES (2062788972830162946, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 14:49:50');
INSERT INTO `sys_operation_log` VALUES (2062788988827238401, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-05 14:49:54');
INSERT INTO `sys_operation_log` VALUES (2062789362774605825, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 14:51:23');
INSERT INTO `sys_operation_log` VALUES (2062789363810598914, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-05 14:51:23');
INSERT INTO `sys_operation_log` VALUES (2062789364590739458, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-05 14:51:23');
INSERT INTO `sys_operation_log` VALUES (2062789364590739459, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-05 14:51:23');
INSERT INTO `sys_operation_log` VALUES (2062789364653654017, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-05 14:51:23');
INSERT INTO `sys_operation_log` VALUES (2062789364653654019, 1, 'admin', '修改分类', 'PUT', '/admin/category/102', '127.0.0.1', '2026-06-05 14:51:23');
INSERT INTO `sys_operation_log` VALUES (2062789364653654020, 1, 'admin', '修改分类', 'PUT', '/admin/category/2057445280091111426', '127.0.0.1', '2026-06-05 14:51:23');
INSERT INTO `sys_operation_log` VALUES (2062789365299576834, 1, 'admin', '修改分类', 'PUT', '/admin/category/103', '127.0.0.1', '2026-06-05 14:51:24');
INSERT INTO `sys_operation_log` VALUES (2062789366079717377, 1, 'admin', '修改分类', 'PUT', '/admin/category/10404', '127.0.0.1', '2026-06-05 14:51:24');
INSERT INTO `sys_operation_log` VALUES (2062789366079717378, 1, 'admin', '修改分类', 'PUT', '/admin/category/104', '127.0.0.1', '2026-06-05 14:51:24');
INSERT INTO `sys_operation_log` VALUES (2062789366079717379, 1, 'admin', '修改分类', 'PUT', '/admin/category/10403', '127.0.0.1', '2026-06-05 14:51:24');
INSERT INTO `sys_operation_log` VALUES (2062789366079717380, 1, 'admin', '修改分类', 'PUT', '/admin/category/10402', '127.0.0.1', '2026-06-05 14:51:24');
INSERT INTO `sys_operation_log` VALUES (2062789366079717381, 1, 'admin', '修改分类', 'PUT', '/admin/category/10401', '127.0.0.1', '2026-06-05 14:51:24');
INSERT INTO `sys_operation_log` VALUES (2062789366729834498, 1, 'admin', '修改分类', 'PUT', '/admin/category/10405', '127.0.0.1', '2026-06-05 14:51:24');
INSERT INTO `sys_operation_log` VALUES (2062789367509975042, 1, 'admin', '修改分类', 'PUT', '/admin/category/10406', '127.0.0.1', '2026-06-05 14:51:24');
INSERT INTO `sys_operation_log` VALUES (2062789367572889602, 1, 'admin', '修改分类', 'PUT', '/admin/category/10501', '127.0.0.1', '2026-06-05 14:51:24');
INSERT INTO `sys_operation_log` VALUES (2062789367572889603, 1, 'admin', '修改分类', 'PUT', '/admin/category/10502', '127.0.0.1', '2026-06-05 14:51:24');
INSERT INTO `sys_operation_log` VALUES (2062789367572889604, 1, 'admin', '修改分类', 'PUT', '/admin/category/10503', '127.0.0.1', '2026-06-05 14:51:24');
INSERT INTO `sys_operation_log` VALUES (2062789367572889605, 1, 'admin', '修改分类', 'PUT', '/admin/category/105', '127.0.0.1', '2026-06-05 14:51:24');
INSERT INTO `sys_operation_log` VALUES (2062789368160092162, 1, 'admin', '修改分类', 'PUT', '/admin/category/10504', '127.0.0.1', '2026-06-05 14:51:24');
INSERT INTO `sys_operation_log` VALUES (2062789368936038401, 1, 'admin', '修改分类', 'PUT', '/admin/category/10505', '127.0.0.1', '2026-06-05 14:51:24');
INSERT INTO `sys_operation_log` VALUES (2062789368998952962, 1, 'admin', '修改分类', 'PUT', '/admin/category/106', '127.0.0.1', '2026-06-05 14:51:25');
INSERT INTO `sys_operation_log` VALUES (2062789369066061826, 1, 'admin', '修改分类', 'PUT', '/admin/category/10701', '127.0.0.1', '2026-06-05 14:51:25');
INSERT INTO `sys_operation_log` VALUES (2062789369066061827, 1, 'admin', '修改分类', 'PUT', '/admin/category/107', '127.0.0.1', '2026-06-05 14:51:25');
INSERT INTO `sys_operation_log` VALUES (2062789369066061828, 1, 'admin', '修改分类', 'PUT', '/admin/category/10702', '127.0.0.1', '2026-06-05 14:51:25');
INSERT INTO `sys_operation_log` VALUES (2062789369590349825, 1, 'admin', '修改分类', 'PUT', '/admin/category/10703', '127.0.0.1', '2026-06-05 14:51:25');
INSERT INTO `sys_operation_log` VALUES (2062789370378878977, 1, 'admin', '修改分类', 'PUT', '/admin/category/10704', '127.0.0.1', '2026-06-05 14:51:25');
INSERT INTO `sys_operation_log` VALUES (2062789370445987843, 1, 'admin', '修改分类', 'PUT', '/admin/category/10705', '127.0.0.1', '2026-06-05 14:51:25');
INSERT INTO `sys_operation_log` VALUES (2062789391497199617, 1, 'admin', '修改分类', 'PUT', '/admin/category/2', '127.0.0.1', '2026-06-05 14:51:30');
INSERT INTO `sys_operation_log` VALUES (2062789392541581314, 1, 'admin', '修改分类', 'PUT', '/admin/category/201', '127.0.0.1', '2026-06-05 14:51:30');
INSERT INTO `sys_operation_log` VALUES (2062789393263001602, 1, 'admin', '修改分类', 'PUT', '/admin/category/20104', '127.0.0.1', '2026-06-05 14:51:30');
INSERT INTO `sys_operation_log` VALUES (2062789393263001603, 1, 'admin', '修改分类', 'PUT', '/admin/category/20101', '127.0.0.1', '2026-06-05 14:51:30');
INSERT INTO `sys_operation_log` VALUES (2062789393263001604, 1, 'admin', '修改分类', 'PUT', '/admin/category/20103', '127.0.0.1', '2026-06-05 14:51:30');
INSERT INTO `sys_operation_log` VALUES (2062789393263001605, 1, 'admin', '修改分类', 'PUT', '/admin/category/20102', '127.0.0.1', '2026-06-05 14:51:30');
INSERT INTO `sys_operation_log` VALUES (2062789393263001606, 1, 'admin', '修改分类', 'PUT', '/admin/category/202', '127.0.0.1', '2026-06-05 14:51:30');
INSERT INTO `sys_operation_log` VALUES (2062789393980227586, 1, 'admin', '修改分类', 'PUT', '/admin/category/203', '127.0.0.1', '2026-06-05 14:51:30');
INSERT INTO `sys_operation_log` VALUES (2062789394697453569, 1, 'admin', '修改分类', 'PUT', '/admin/category/20403', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789394697453570, 1, 'admin', '修改分类', 'PUT', '/admin/category/20402', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789394697453571, 1, 'admin', '修改分类', 'PUT', '/admin/category/20401', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789394697453572, 1, 'admin', '修改分类', 'PUT', '/admin/category/204', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789394768756738, 1, 'admin', '修改分类', 'PUT', '/admin/category/20404', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789395410485250, 1, 'admin', '修改分类', 'PUT', '/admin/category/20405', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789396123516930, 1, 'admin', '修改分类', 'PUT', '/admin/category/20406', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789396249346050, 1, 'admin', '修改分类', 'PUT', '/admin/category/205', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789396249346051, 1, 'admin', '修改分类', 'PUT', '/admin/category/20407', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789396249346052, 1, 'admin', '修改分类', 'PUT', '/admin/category/20408', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789396249346053, 1, 'admin', '修改分类', 'PUT', '/admin/category/20501', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789396823965697, 1, 'admin', '修改分类', 'PUT', '/admin/category/20502', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789397599911937, 1, 'admin', '修改分类', 'PUT', '/admin/category/20503', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789397667020802, 1, 'admin', '修改分类', 'PUT', '/admin/category/20506', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789397667020803, 1, 'admin', '修改分类', 'PUT', '/admin/category/20504', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789397734129666, 1, 'admin', '修改分类', 'PUT', '/admin/category/20505', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789397734129667, 1, 'admin', '修改分类', 'PUT', '/admin/category/206', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789398254223361, 1, 'admin', '修改分类', 'PUT', '/admin/category/207', '127.0.0.1', '2026-06-05 14:51:31');
INSERT INTO `sys_operation_log` VALUES (2062789399038558210, 1, 'admin', '修改分类', 'PUT', '/admin/category/208', '127.0.0.1', '2026-06-05 14:51:32');
INSERT INTO `sys_operation_log` VALUES (2062789408161169410, 1, 'admin', '修改分类', 'PUT', '/admin/category/3', '127.0.0.1', '2026-06-05 14:51:34');
INSERT INTO `sys_operation_log` VALUES (2062789409268465666, 1, 'admin', '修改分类', 'PUT', '/admin/category/301', '127.0.0.1', '2026-06-05 14:51:34');
INSERT INTO `sys_operation_log` VALUES (2062789409918582785, 1, 'admin', '修改分类', 'PUT', '/admin/category/30103', '127.0.0.1', '2026-06-05 14:51:34');
INSERT INTO `sys_operation_log` VALUES (2062789409918582786, 1, 'admin', '修改分类', 'PUT', '/admin/category/302', '127.0.0.1', '2026-06-05 14:51:34');
INSERT INTO `sys_operation_log` VALUES (2062789409918582787, 1, 'admin', '修改分类', 'PUT', '/admin/category/30101', '127.0.0.1', '2026-06-05 14:51:34');
INSERT INTO `sys_operation_log` VALUES (2062789409918582788, 1, 'admin', '修改分类', 'PUT', '/admin/category/30104', '127.0.0.1', '2026-06-05 14:51:34');
INSERT INTO `sys_operation_log` VALUES (2062789409918582789, 1, 'admin', '修改分类', 'PUT', '/admin/category/30102', '127.0.0.1', '2026-06-05 14:51:34');
INSERT INTO `sys_operation_log` VALUES (2062789410698723330, 1, 'admin', '修改分类', 'PUT', '/admin/category/303', '127.0.0.1', '2026-06-05 14:51:34');
INSERT INTO `sys_operation_log` VALUES (2062789411474669570, 1, 'admin', '修改分类', 'PUT', '/admin/category/304', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789411474669571, 1, 'admin', '修改分类', 'PUT', '/admin/category/30402', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789411474669572, 1, 'admin', '修改分类', 'PUT', '/admin/category/30403', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789411474669573, 1, 'admin', '修改分类', 'PUT', '/admin/category/30404', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789411474669574, 1, 'admin', '修改分类', 'PUT', '/admin/category/30401', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789412133175297, 1, 'admin', '修改分类', 'PUT', '/admin/category/30405', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789412972036097, 1, 'admin', '修改分类', 'PUT', '/admin/category/30409', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789412972036098, 1, 'admin', '修改分类', 'PUT', '/admin/category/30408', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789412972036099, 1, 'admin', '修改分类', 'PUT', '/admin/category/30407', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789412972036100, 1, 'admin', '修改分类', 'PUT', '/admin/category/30406', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789412972036101, 1, 'admin', '修改分类', 'PUT', '/admin/category/305', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789413559238658, 1, 'admin', '修改分类', 'PUT', '/admin/category/30501', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789414339379202, 1, 'admin', '修改分类', 'PUT', '/admin/category/30502', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789414402293763, 1, 'admin', '修改分类', 'PUT', '/admin/category/30505', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789414402293764, 1, 'admin', '修改分类', 'PUT', '/admin/category/30504', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789414402293765, 1, 'admin', '修改分类', 'PUT', '/admin/category/30503', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789414402293766, 1, 'admin', '修改分类', 'PUT', '/admin/category/306', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789414989496321, 1, 'admin', '修改分类', 'PUT', '/admin/category/307', '127.0.0.1', '2026-06-05 14:51:35');
INSERT INTO `sys_operation_log` VALUES (2062789415845134338, 1, 'admin', '修改分类', 'PUT', '/admin/category/30701', '127.0.0.1', '2026-06-05 14:51:36');
INSERT INTO `sys_operation_log` VALUES (2062789415845134339, 1, 'admin', '修改分类', 'PUT', '/admin/category/30702', '127.0.0.1', '2026-06-05 14:51:36');
INSERT INTO `sys_operation_log` VALUES (2062789415899660291, 1, 'admin', '修改分类', 'PUT', '/admin/category/30704', '127.0.0.1', '2026-06-05 14:51:36');
INSERT INTO `sys_operation_log` VALUES (2062789415899660292, 1, 'admin', '修改分类', 'PUT', '/admin/category/30703', '127.0.0.1', '2026-06-05 14:51:36');
INSERT INTO `sys_operation_log` VALUES (2062789425412341761, 1, 'admin', '修改分类', 'PUT', '/admin/category/4', '127.0.0.1', '2026-06-05 14:51:38');
INSERT INTO `sys_operation_log` VALUES (2062789426515443713, 1, 'admin', '修改分类', 'PUT', '/admin/category/401', '127.0.0.1', '2026-06-05 14:51:38');
INSERT INTO `sys_operation_log` VALUES (2062789427228475394, 1, 'admin', '修改分类', 'PUT', '/admin/category/40102', '127.0.0.1', '2026-06-05 14:51:38');
INSERT INTO `sys_operation_log` VALUES (2062789427228475395, 1, 'admin', '修改分类', 'PUT', '/admin/category/40101', '127.0.0.1', '2026-06-05 14:51:38');
INSERT INTO `sys_operation_log` VALUES (2062789427228475396, 1, 'admin', '修改分类', 'PUT', '/admin/category/40105', '127.0.0.1', '2026-06-05 14:51:38');
INSERT INTO `sys_operation_log` VALUES (2062789427228475397, 1, 'admin', '修改分类', 'PUT', '/admin/category/40103', '127.0.0.1', '2026-06-05 14:51:38');
INSERT INTO `sys_operation_log` VALUES (2062789427228475398, 1, 'admin', '修改分类', 'PUT', '/admin/category/40104', '127.0.0.1', '2026-06-05 14:51:38');
INSERT INTO `sys_operation_log` VALUES (2062789427937312770, 1, 'admin', '修改分类', 'PUT', '/admin/category/40106', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789428709064705, 1, 'admin', '修改分类', 'PUT', '/admin/category/40107', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789428709064706, 1, 'admin', '修改分类', 'PUT', '/admin/category/40201', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789428709064707, 1, 'admin', '修改分类', 'PUT', '/admin/category/402', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789428776173570, 1, 'admin', '修改分类', 'PUT', '/admin/category/40108', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789428776173571, 1, 'admin', '修改分类', 'PUT', '/admin/category/40202', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789429363376130, 1, 'admin', '修改分类', 'PUT', '/admin/category/40203', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789430139322369, 1, 'admin', '修改分类', 'PUT', '/admin/category/40204', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789430206431235, 1, 'admin', '修改分类', 'PUT', '/admin/category/40208', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789430206431236, 1, 'admin', '修改分类', 'PUT', '/admin/category/40207', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789430206431237, 1, 'admin', '修改分类', 'PUT', '/admin/category/40205', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789430206431238, 1, 'admin', '修改分类', 'PUT', '/admin/category/40206', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789430793633793, 1, 'admin', '修改分类', 'PUT', '/admin/category/403', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789431573774337, 1, 'admin', '修改分类', 'PUT', '/admin/category/404', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789431636688898, 1, 'admin', '修改分类', 'PUT', '/admin/category/40403', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789431636688899, 1, 'admin', '修改分类', 'PUT', '/admin/category/40404', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789431636688900, 1, 'admin', '修改分类', 'PUT', '/admin/category/40401', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789431636688901, 1, 'admin', '修改分类', 'PUT', '/admin/category/40402', '127.0.0.1', '2026-06-05 14:51:39');
INSERT INTO `sys_operation_log` VALUES (2062789432219697153, 1, 'admin', '修改分类', 'PUT', '/admin/category/40405', '127.0.0.1', '2026-06-05 14:51:40');
INSERT INTO `sys_operation_log` VALUES (2062789433004032002, 1, 'admin', '修改分类', 'PUT', '/admin/category/40406', '127.0.0.1', '2026-06-05 14:51:40');
INSERT INTO `sys_operation_log` VALUES (2062789433071140866, 1, 'admin', '修改分类', 'PUT', '/admin/category/40502', '127.0.0.1', '2026-06-05 14:51:40');
INSERT INTO `sys_operation_log` VALUES (2062789433071140867, 1, 'admin', '修改分类', 'PUT', '/admin/category/405', '127.0.0.1', '2026-06-05 14:51:40');
INSERT INTO `sys_operation_log` VALUES (2062789433071140868, 1, 'admin', '修改分类', 'PUT', '/admin/category/40503', '127.0.0.1', '2026-06-05 14:51:40');
INSERT INTO `sys_operation_log` VALUES (2062789433071140869, 1, 'admin', '修改分类', 'PUT', '/admin/category/40501', '127.0.0.1', '2026-06-05 14:51:40');
INSERT INTO `sys_operation_log` VALUES (2062789433662537729, 1, 'admin', '修改分类', 'PUT', '/admin/category/40504', '127.0.0.1', '2026-06-05 14:51:40');
INSERT INTO `sys_operation_log` VALUES (2062789434442678273, 1, 'admin', '修改分类', 'PUT', '/admin/category/40505', '127.0.0.1', '2026-06-05 14:51:40');
INSERT INTO `sys_operation_log` VALUES (2062789434505592834, 1, 'admin', '修改分类', 'PUT', '/admin/category/406', '127.0.0.1', '2026-06-05 14:51:40');
INSERT INTO `sys_operation_log` VALUES (2062789434505592835, 1, 'admin', '修改分类', 'PUT', '/admin/category/5', '127.0.0.1', '2026-06-05 14:51:40');
INSERT INTO `sys_operation_log` VALUES (2062789436258811905, 1, 'admin', '修改分类', 'PUT', '/admin/category/50101', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789436258811906, 1, 'admin', '修改分类', 'PUT', '/admin/category/50103', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789436258811907, 1, 'admin', '修改分类', 'PUT', '/admin/category/501', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789436258811908, 1, 'admin', '修改分类', 'PUT', '/admin/category/50102', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789436258811909, 1, 'admin', '修改分类', 'PUT', '/admin/category/50105', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789436258811910, 1, 'admin', '修改分类', 'PUT', '/admin/category/50104', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789437626155010, 1, 'admin', '修改分类', 'PUT', '/admin/category/50106', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789437693263874, 1, 'admin', '修改分类', 'PUT', '/admin/category/502', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789437693263875, 1, 'admin', '修改分类', 'PUT', '/admin/category/50108', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789437693263876, 1, 'admin', '修改分类', 'PUT', '/admin/category/50107', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789437693263877, 1, 'admin', '修改分类', 'PUT', '/admin/category/50202', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789437693263878, 1, 'admin', '修改分类', 'PUT', '/admin/category/50201', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789439060606977, 1, 'admin', '修改分类', 'PUT', '/admin/category/50203', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789439127715843, 1, 'admin', '修改分类', 'PUT', '/admin/category/50204', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789439127715844, 1, 'admin', '修改分类', 'PUT', '/admin/category/50206', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789439194824705, 1, 'admin', '修改分类', 'PUT', '/admin/category/503', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789439194824706, 1, 'admin', '修改分类', 'PUT', '/admin/category/50205', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789439194824707, 1, 'admin', '修改分类', 'PUT', '/admin/category/504', '127.0.0.1', '2026-06-05 14:51:41');
INSERT INTO `sys_operation_log` VALUES (2062789440499253250, 1, 'admin', '修改分类', 'PUT', '/admin/category/505', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789440566362114, 1, 'admin', '修改分类', 'PUT', '/admin/category/506', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789440566362115, 1, 'admin', '修改分类', 'PUT', '/admin/category/6', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789442311192577, 1, 'admin', '修改分类', 'PUT', '/admin/category/601', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789442311192578, 1, 'admin', '修改分类', 'PUT', '/admin/category/60101', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789442311192579, 1, 'admin', '修改分类', 'PUT', '/admin/category/60102', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789442311192580, 1, 'admin', '修改分类', 'PUT', '/admin/category/60105', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789442311192581, 1, 'admin', '修改分类', 'PUT', '/admin/category/60103', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789442311192582, 1, 'admin', '修改分类', 'PUT', '/admin/category/60104', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789443749838850, 1, 'admin', '修改分类', 'PUT', '/admin/category/60106', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789443816947714, 1, 'admin', '修改分类', 'PUT', '/admin/category/603', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789443816947715, 1, 'admin', '修改分类', 'PUT', '/admin/category/602', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789443816947716, 1, 'admin', '修改分类', 'PUT', '/admin/category/60302', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789443816947717, 1, 'admin', '修改分类', 'PUT', '/admin/category/60303', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789443816947718, 1, 'admin', '修改分类', 'PUT', '/admin/category/60301', '127.0.0.1', '2026-06-05 14:51:42');
INSERT INTO `sys_operation_log` VALUES (2062789445184290817, 1, 'admin', '修改分类', 'PUT', '/admin/category/60304', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789445247205378, 1, 'admin', '修改分类', 'PUT', '/admin/category/605', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789445247205379, 1, 'admin', '修改分类', 'PUT', '/admin/category/604', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789445247205380, 1, 'admin', '修改分类', 'PUT', '/admin/category/60305', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789445247205381, 1, 'admin', '修改分类', 'PUT', '/admin/category/60306', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789445314314241, 1, 'admin', '修改分类', 'PUT', '/admin/category/60501', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789446618742785, 1, 'admin', '修改分类', 'PUT', '/admin/category/60502', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789446685851651, 1, 'admin', '修改分类', 'PUT', '/admin/category/60503', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789446685851652, 1, 'admin', '修改分类', 'PUT', '/admin/category/60504', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789446748766210, 1, 'admin', '修改分类', 'PUT', '/admin/category/606', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789446748766211, 1, 'admin', '修改分类', 'PUT', '/admin/category/60506', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789446748766212, 1, 'admin', '修改分类', 'PUT', '/admin/category/60505', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789448057389058, 1, 'admin', '修改分类', 'PUT', '/admin/category/60601', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789448250327042, 1, 'admin', '修改分类', 'PUT', '/admin/category/60603', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789448250327043, 1, 'admin', '修改分类', 'PUT', '/admin/category/60602', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789448250327044, 1, 'admin', '修改分类', 'PUT', '/admin/category/60604', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789448250327045, 1, 'admin', '修改分类', 'PUT', '/admin/category/60605', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789448250327046, 1, 'admin', '修改分类', 'PUT', '/admin/category/60606', '127.0.0.1', '2026-06-05 14:51:43');
INSERT INTO `sys_operation_log` VALUES (2062789449487646722, 1, 'admin', '修改分类', 'PUT', '/admin/category/60607', '127.0.0.1', '2026-06-05 14:51:44');
INSERT INTO `sys_operation_log` VALUES (2062789449621864449, 1, 'admin', '修改分类', 'PUT', '/admin/category/607', '127.0.0.1', '2026-06-05 14:51:44');
INSERT INTO `sys_operation_log` VALUES (2062789456093675522, 1, 'admin', '修改分类', 'PUT', '/admin/category/7', '127.0.0.1', '2026-06-05 14:51:45');
INSERT INTO `sys_operation_log` VALUES (2062789457200971777, 1, 'admin', '修改分类', 'PUT', '/admin/category/701', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789457846894593, 1, 'admin', '修改分类', 'PUT', '/admin/category/70101', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789457846894594, 1, 'admin', '修改分类', 'PUT', '/admin/category/70102', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789457846894595, 1, 'admin', '修改分类', 'PUT', '/admin/category/70103', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789457846894596, 1, 'admin', '修改分类', 'PUT', '/admin/category/70104', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789457846894597, 1, 'admin', '修改分类', 'PUT', '/admin/category/702', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789458631229442, 1, 'admin', '修改分类', 'PUT', '/admin/category/70201', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789459281346562, 1, 'admin', '修改分类', 'PUT', '/admin/category/70202', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789459281346563, 1, 'admin', '修改分类', 'PUT', '/admin/category/704', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789459281346564, 1, 'admin', '修改分类', 'PUT', '/admin/category/703', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789459281346565, 1, 'admin', '修改分类', 'PUT', '/admin/category/70204', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789459344261122, 1, 'admin', '修改分类', 'PUT', '/admin/category/70203', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789460061487106, 1, 'admin', '修改分类', 'PUT', '/admin/category/705', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789460715798530, 1, 'admin', '修改分类', 'PUT', '/admin/category/706', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789460715798531, 1, 'admin', '修改分类', 'PUT', '/admin/category/70601', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789460778713091, 1, 'admin', '修改分类', 'PUT', '/admin/category/70603', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789460778713092, 1, 'admin', '修改分类', 'PUT', '/admin/category/70604', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789460778713093, 1, 'admin', '修改分类', 'PUT', '/admin/category/70602', '127.0.0.1', '2026-06-05 14:51:46');
INSERT INTO `sys_operation_log` VALUES (2062789461491744769, 1, 'admin', '修改分类', 'PUT', '/admin/category/70605', '127.0.0.1', '2026-06-05 14:51:47');
INSERT INTO `sys_operation_log` VALUES (2062789467414102018, 1, 'admin', '修改分类', 'PUT', '/admin/category/8', '127.0.0.1', '2026-06-05 14:51:48');
INSERT INTO `sys_operation_log` VALUES (2062789468525592578, 1, 'admin', '修改分类', 'PUT', '/admin/category/801', '127.0.0.1', '2026-06-05 14:51:48');
INSERT INTO `sys_operation_log` VALUES (2062789469251207169, 1, 'admin', '修改分类', 'PUT', '/admin/category/80104', '127.0.0.1', '2026-06-05 14:51:48');
INSERT INTO `sys_operation_log` VALUES (2062789469251207170, 1, 'admin', '修改分类', 'PUT', '/admin/category/80102', '127.0.0.1', '2026-06-05 14:51:48');
INSERT INTO `sys_operation_log` VALUES (2062789469251207171, 1, 'admin', '修改分类', 'PUT', '/admin/category/80103', '127.0.0.1', '2026-06-05 14:51:48');
INSERT INTO `sys_operation_log` VALUES (2062789469251207172, 1, 'admin', '修改分类', 'PUT', '/admin/category/80101', '127.0.0.1', '2026-06-05 14:51:48');
INSERT INTO `sys_operation_log` VALUES (2062789469251207173, 1, 'admin', '修改分类', 'PUT', '/admin/category/80105', '127.0.0.1', '2026-06-05 14:51:48');
INSERT INTO `sys_operation_log` VALUES (2062789469964238850, 1, 'admin', '修改分类', 'PUT', '/admin/category/802', '127.0.0.1', '2026-06-05 14:51:49');
INSERT INTO `sys_operation_log` VALUES (2062789470610161666, 1, 'admin', '修改分类', 'PUT', '/admin/category/803', '127.0.0.1', '2026-06-05 14:51:49');
INSERT INTO `sys_operation_log` VALUES (2062789470677270530, 1, 'admin', '修改分类', 'PUT', '/admin/category/804', '127.0.0.1', '2026-06-05 14:51:49');
INSERT INTO `sys_operation_log` VALUES (2062789470677270531, 1, 'admin', '修改分类', 'PUT', '/admin/category/805', '127.0.0.1', '2026-06-05 14:51:49');
INSERT INTO `sys_operation_log` VALUES (2062789473294516225, 1, 'admin', '修改分类', 'PUT', '/admin/category/9', '127.0.0.1', '2026-06-05 14:51:49');
INSERT INTO `sys_operation_log` VALUES (2062789474410201089, 1, 'admin', '修改分类', 'PUT', '/admin/category/901', '127.0.0.1', '2026-06-05 14:51:50');
INSERT INTO `sys_operation_log` VALUES (2062789475001597954, 1, 'admin', '修改分类', 'PUT', '/admin/category/903', '127.0.0.1', '2026-06-05 14:51:50');
INSERT INTO `sys_operation_log` VALUES (2062789475001597955, 1, 'admin', '修改分类', 'PUT', '/admin/category/902', '127.0.0.1', '2026-06-05 14:51:50');
INSERT INTO `sys_operation_log` VALUES (2062789475001597956, 1, 'admin', '修改分类', 'PUT', '/admin/category/905', '127.0.0.1', '2026-06-05 14:51:50');
INSERT INTO `sys_operation_log` VALUES (2062789475001597957, 1, 'admin', '修改分类', 'PUT', '/admin/category/904', '127.0.0.1', '2026-06-05 14:51:50');
INSERT INTO `sys_operation_log` VALUES (2062789475064512514, 1, 'admin', '修改分类', 'PUT', '/admin/category/90501', '127.0.0.1', '2026-06-05 14:51:50');
INSERT INTO `sys_operation_log` VALUES (2062789475848847361, 1, 'admin', '修改分类', 'PUT', '/admin/category/90502', '127.0.0.1', '2026-06-05 14:51:50');
INSERT INTO `sys_operation_log` VALUES (2062789476431855618, 1, 'admin', '修改分类', 'PUT', '/admin/category/90505', '127.0.0.1', '2026-06-05 14:51:50');
INSERT INTO `sys_operation_log` VALUES (2062789476431855619, 1, 'admin', '修改分类', 'PUT', '/admin/category/906', '127.0.0.1', '2026-06-05 14:51:50');
INSERT INTO `sys_operation_log` VALUES (2062789476431855620, 1, 'admin', '修改分类', 'PUT', '/admin/category/90504', '127.0.0.1', '2026-06-05 14:51:50');
INSERT INTO `sys_operation_log` VALUES (2062789476431855621, 1, 'admin', '修改分类', 'PUT', '/admin/category/90503', '127.0.0.1', '2026-06-05 14:51:50');
INSERT INTO `sys_operation_log` VALUES (2062789478789054466, 1, 'admin', '修改分类', 'PUT', '/admin/category/10', '127.0.0.1', '2026-06-05 14:51:51');
INSERT INTO `sys_operation_log` VALUES (2062789479837630466, 1, 'admin', '修改分类', 'PUT', '/admin/category/1001', '127.0.0.1', '2026-06-05 14:51:51');
INSERT INTO `sys_operation_log` VALUES (2062789480491941889, 1, 'admin', '修改分类', 'PUT', '/admin/category/1005', '127.0.0.1', '2026-06-05 14:51:51');
INSERT INTO `sys_operation_log` VALUES (2062789480491941890, 1, 'admin', '修改分类', 'PUT', '/admin/category/1002', '127.0.0.1', '2026-06-05 14:51:51');
INSERT INTO `sys_operation_log` VALUES (2062789480491941891, 1, 'admin', '修改分类', 'PUT', '/admin/category/1004', '127.0.0.1', '2026-06-05 14:51:51');
INSERT INTO `sys_operation_log` VALUES (2062789480491941892, 1, 'admin', '修改分类', 'PUT', '/admin/category/1006', '127.0.0.1', '2026-06-05 14:51:51');
INSERT INTO `sys_operation_log` VALUES (2062789480491941893, 1, 'admin', '修改分类', 'PUT', '/admin/category/1003', '127.0.0.1', '2026-06-05 14:51:51');
INSERT INTO `sys_operation_log` VALUES (2062789483230822401, 1, 'admin', '修改分类', 'PUT', '/admin/category/11', '127.0.0.1', '2026-06-05 14:51:52');
INSERT INTO `sys_operation_log` VALUES (2062789484350701570, 1, 'admin', '修改分类', 'PUT', '/admin/category/1101', '127.0.0.1', '2026-06-05 14:51:52');
INSERT INTO `sys_operation_log` VALUES (2062789484992430082, 1, 'admin', '修改分类', 'PUT', '/admin/category/110302', '127.0.0.1', '2026-06-05 14:51:52');
INSERT INTO `sys_operation_log` VALUES (2062789484992430083, 1, 'admin', '修改分类', 'PUT', '/admin/category/110303', '127.0.0.1', '2026-06-05 14:51:52');
INSERT INTO `sys_operation_log` VALUES (2062789484992430084, 1, 'admin', '修改分类', 'PUT', '/admin/category/1103', '127.0.0.1', '2026-06-05 14:51:52');
INSERT INTO `sys_operation_log` VALUES (2062789484992430085, 1, 'admin', '修改分类', 'PUT', '/admin/category/1102', '127.0.0.1', '2026-06-05 14:51:52');
INSERT INTO `sys_operation_log` VALUES (2062789484992430086, 1, 'admin', '修改分类', 'PUT', '/admin/category/110301', '127.0.0.1', '2026-06-05 14:51:52');
INSERT INTO `sys_operation_log` VALUES (2062789485764182018, 1, 'admin', '修改分类', 'PUT', '/admin/category/110304', '127.0.0.1', '2026-06-05 14:51:52');
INSERT INTO `sys_operation_log` VALUES (2062789486351384578, 1, 'admin', '修改分类', 'PUT', '/admin/category/110305', '127.0.0.1', '2026-06-05 14:51:52');
INSERT INTO `sys_operation_log` VALUES (2062789486418493442, 1, 'admin', '修改分类', 'PUT', '/admin/category/1104', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789486418493443, 1, 'admin', '修改分类', 'PUT', '/admin/category/110402', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789486418493444, 1, 'admin', '修改分类', 'PUT', '/admin/category/110401', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789486418493445, 1, 'admin', '修改分类', 'PUT', '/admin/category/110306', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789487198633985, 1, 'admin', '修改分类', 'PUT', '/admin/category/110403', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789487790030850, 1, 'admin', '修改分类', 'PUT', '/admin/category/110404', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789487857139715, 1, 'admin', '修改分类', 'PUT', '/admin/category/110405', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789487857139716, 1, 'admin', '修改分类', 'PUT', '/admin/category/1105', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789487857139717, 1, 'admin', '修改分类', 'PUT', '/admin/category/1106', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789487920054273, 1, 'admin', '修改分类', 'PUT', '/admin/category/12', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789489677467650, 1, 'admin', '修改分类', 'PUT', '/admin/category/120104', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789489677467651, 1, 'admin', '修改分类', 'PUT', '/admin/category/120101', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789489677467652, 1, 'admin', '修改分类', 'PUT', '/admin/category/120102', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789489677467653, 1, 'admin', '修改分类', 'PUT', '/admin/category/120103', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789489677467654, 1, 'admin', '修改分类', 'PUT', '/admin/category/120105', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789489677467655, 1, 'admin', '修改分类', 'PUT', '/admin/category/1201', '127.0.0.1', '2026-06-05 14:51:53');
INSERT INTO `sys_operation_log` VALUES (2062789491170639873, 1, 'admin', '修改分类', 'PUT', '/admin/category/1202', '127.0.0.1', '2026-06-05 14:51:54');
INSERT INTO `sys_operation_log` VALUES (2062789491170639874, 1, 'admin', '修改分类', 'PUT', '/admin/category/1203', '127.0.0.1', '2026-06-05 14:51:54');
INSERT INTO `sys_operation_log` VALUES (2062789491170639875, 1, 'admin', '修改分类', 'PUT', '/admin/category/120301', '127.0.0.1', '2026-06-05 14:51:54');
INSERT INTO `sys_operation_log` VALUES (2062789491170639876, 1, 'admin', '修改分类', 'PUT', '/admin/category/120303', '127.0.0.1', '2026-06-05 14:51:54');
INSERT INTO `sys_operation_log` VALUES (2062789491170639877, 1, 'admin', '修改分类', 'PUT', '/admin/category/120304', '127.0.0.1', '2026-06-05 14:51:54');
INSERT INTO `sys_operation_log` VALUES (2062789491170639878, 1, 'admin', '修改分类', 'PUT', '/admin/category/120302', '127.0.0.1', '2026-06-05 14:51:54');
INSERT INTO `sys_operation_log` VALUES (2062789492529594370, 1, 'admin', '修改分类', 'PUT', '/admin/category/1204', '127.0.0.1', '2026-06-05 14:51:54');
INSERT INTO `sys_operation_log` VALUES (2062789492596703235, 1, 'admin', '修改分类', 'PUT', '/admin/category/1205', '127.0.0.1', '2026-06-05 14:51:54');
INSERT INTO `sys_operation_log` VALUES (2062789492852555778, 1, 'admin', '修改分类', 'PUT', '/admin/category/13', '127.0.0.1', '2026-06-05 14:51:54');
INSERT INTO `sys_operation_log` VALUES (2062789494547054594, 1, 'admin', '修改分类', 'PUT', '/admin/category/1302', '127.0.0.1', '2026-06-05 14:51:54');
INSERT INTO `sys_operation_log` VALUES (2062789494547054595, 1, 'admin', '修改分类', 'PUT', '/admin/category/1304', '127.0.0.1', '2026-06-05 14:51:54');
INSERT INTO `sys_operation_log` VALUES (2062789494547054596, 1, 'admin', '修改分类', 'PUT', '/admin/category/1303', '127.0.0.1', '2026-06-05 14:51:54');
INSERT INTO `sys_operation_log` VALUES (2062789494547054597, 1, 'admin', '修改分类', 'PUT', '/admin/category/1301', '127.0.0.1', '2026-06-05 14:51:54');
INSERT INTO `sys_operation_log` VALUES (2062789495666933762, 1, 'admin', '修改分类', 'PUT', '/admin/category/14', '127.0.0.1', '2026-06-05 14:51:55');
INSERT INTO `sys_operation_log` VALUES (2062789496447074306, 1, 'admin', '修改分类', 'PUT', '/admin/category/1401', '127.0.0.1', '2026-06-05 14:51:55');
INSERT INTO `sys_operation_log` VALUES (2062789497357238273, 1, 'admin', '修改分类', 'PUT', '/admin/category/1402', '127.0.0.1', '2026-06-05 14:51:55');
INSERT INTO `sys_operation_log` VALUES (2062789497357238274, 1, 'admin', '修改分类', 'PUT', '/admin/category/140103', '127.0.0.1', '2026-06-05 14:51:55');
INSERT INTO `sys_operation_log` VALUES (2062789497357238275, 1, 'admin', '修改分类', 'PUT', '/admin/category/140104', '127.0.0.1', '2026-06-05 14:51:55');
INSERT INTO `sys_operation_log` VALUES (2062789497357238276, 1, 'admin', '修改分类', 'PUT', '/admin/category/140102', '127.0.0.1', '2026-06-05 14:51:55');
INSERT INTO `sys_operation_log` VALUES (2062789497357238277, 1, 'admin', '修改分类', 'PUT', '/admin/category/140101', '127.0.0.1', '2026-06-05 14:51:55');
INSERT INTO `sys_operation_log` VALUES (2062789497881526274, 1, 'admin', '修改分类', 'PUT', '/admin/category/1403', '127.0.0.1', '2026-06-05 14:51:55');
INSERT INTO `sys_operation_log` VALUES (2062789498795884545, 1, 'admin', '修改分类', 'PUT', '/admin/category/1405', '127.0.0.1', '2026-06-05 14:51:55');
INSERT INTO `sys_operation_log` VALUES (2062789498795884546, 1, 'admin', '修改分类', 'PUT', '/admin/category/1404', '127.0.0.1', '2026-06-05 14:51:55');
INSERT INTO `sys_operation_log` VALUES (2062789500297445378, 1, 'admin', '修改分类', 'PUT', '/admin/category/15', '127.0.0.1', '2026-06-05 14:51:56');
INSERT INTO `sys_operation_log` VALUES (2062789501979361281, 1, 'admin', '修改分类', 'PUT', '/admin/category/150101', '127.0.0.1', '2026-06-05 14:51:56');
INSERT INTO `sys_operation_log` VALUES (2062789501979361282, 1, 'admin', '修改分类', 'PUT', '/admin/category/150103', '127.0.0.1', '2026-06-05 14:51:56');
INSERT INTO `sys_operation_log` VALUES (2062789501979361283, 1, 'admin', '修改分类', 'PUT', '/admin/category/1501', '127.0.0.1', '2026-06-05 14:51:56');
INSERT INTO `sys_operation_log` VALUES (2062789501979361284, 1, 'admin', '修改分类', 'PUT', '/admin/category/150102', '127.0.0.1', '2026-06-05 14:51:56');
INSERT INTO `sys_operation_log` VALUES (2062789501979361285, 1, 'admin', '修改分类', 'PUT', '/admin/category/150104', '127.0.0.1', '2026-06-05 14:51:56');
INSERT INTO `sys_operation_log` VALUES (2062789501979361286, 1, 'admin', '修改分类', 'PUT', '/admin/category/150105', '127.0.0.1', '2026-06-05 14:51:56');
INSERT INTO `sys_operation_log` VALUES (2062789503409618946, 1, 'admin', '修改分类', 'PUT', '/admin/category/1502', '127.0.0.1', '2026-06-05 14:51:57');
INSERT INTO `sys_operation_log` VALUES (2062789503409618947, 1, 'admin', '修改分类', 'PUT', '/admin/category/1503', '127.0.0.1', '2026-06-05 14:51:57');
INSERT INTO `sys_operation_log` VALUES (2062789503409618948, 1, 'admin', '修改分类', 'PUT', '/admin/category/1504', '127.0.0.1', '2026-06-05 14:51:57');
INSERT INTO `sys_operation_log` VALUES (2062789837121028098, 1, 'admin', '商品上下架', 'PUT', '/admin/spu/2057693667856125953/status', '127.0.0.1', '2026-06-05 14:53:16');
INSERT INTO `sys_operation_log` VALUES (2062790014850465793, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 14:53:58');
INSERT INTO `sys_operation_log` VALUES (2062790015949373441, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-05 14:53:59');
INSERT INTO `sys_operation_log` VALUES (2062790016729513985, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-05 14:53:59');
INSERT INTO `sys_operation_log` VALUES (2062790016729513986, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-05 14:53:59');
INSERT INTO `sys_operation_log` VALUES (2062790016729513987, 1, 'admin', '修改分类', 'PUT', '/admin/category/2057445280091111426', '127.0.0.1', '2026-06-05 14:53:59');
INSERT INTO `sys_operation_log` VALUES (2062790016729513988, 1, 'admin', '修改分类', 'PUT', '/admin/category/102', '127.0.0.1', '2026-06-05 14:53:59');
INSERT INTO `sys_operation_log` VALUES (2062790016729513989, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-05 14:53:59');
INSERT INTO `sys_operation_log` VALUES (2062790017383825410, 1, 'admin', '修改分类', 'PUT', '/admin/category/103', '127.0.0.1', '2026-06-05 14:53:59');
INSERT INTO `sys_operation_log` VALUES (2062790018096857089, 1, 'admin', '修改分类', 'PUT', '/admin/category/104', '127.0.0.1', '2026-06-05 14:53:59');
INSERT INTO `sys_operation_log` VALUES (2062790018163965955, 1, 'admin', '修改分类', 'PUT', '/admin/category/10404', '127.0.0.1', '2026-06-05 14:53:59');
INSERT INTO `sys_operation_log` VALUES (2062790018163965956, 1, 'admin', '修改分类', 'PUT', '/admin/category/10402', '127.0.0.1', '2026-06-05 14:53:59');
INSERT INTO `sys_operation_log` VALUES (2062790018163965957, 1, 'admin', '修改分类', 'PUT', '/admin/category/10403', '127.0.0.1', '2026-06-05 14:53:59');
INSERT INTO `sys_operation_log` VALUES (2062790018163965958, 1, 'admin', '修改分类', 'PUT', '/admin/category/10401', '127.0.0.1', '2026-06-05 14:53:59');
INSERT INTO `sys_operation_log` VALUES (2062790018818277378, 1, 'admin', '修改分类', 'PUT', '/admin/category/10405', '127.0.0.1', '2026-06-05 14:53:59');
INSERT INTO `sys_operation_log` VALUES (2062790019472588802, 1, 'admin', '修改分类', 'PUT', '/admin/category/10406', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790019602612225, 1, 'admin', '修改分类', 'PUT', '/admin/category/10502', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790019602612226, 1, 'admin', '修改分类', 'PUT', '/admin/category/10503', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790019602612227, 1, 'admin', '修改分类', 'PUT', '/admin/category/105', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790019602612228, 1, 'admin', '修改分类', 'PUT', '/admin/category/10501', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790020244340737, 1, 'admin', '修改分类', 'PUT', '/admin/category/10504', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790020898652162, 1, 'admin', '修改分类', 'PUT', '/admin/category/10505', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790021028675586, 1, 'admin', '修改分类', 'PUT', '/admin/category/10701', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790021028675587, 1, 'admin', '修改分类', 'PUT', '/admin/category/10702', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790021028675588, 1, 'admin', '修改分类', 'PUT', '/admin/category/107', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790021028675589, 1, 'admin', '修改分类', 'PUT', '/admin/category/106', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790021670404097, 1, 'admin', '修改分类', 'PUT', '/admin/category/10703', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790022328909826, 1, 'admin', '修改分类', 'PUT', '/admin/category/10704', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790022458933250, 1, 'admin', '修改分类', 'PUT', '/admin/category/2', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790022458933251, 1, 'admin', '修改分类', 'PUT', '/admin/category/10705', '127.0.0.1', '2026-06-05 14:54:00');
INSERT INTO `sys_operation_log` VALUES (2062790024212152321, 1, 'admin', '修改分类', 'PUT', '/admin/category/20104', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790024212152322, 1, 'admin', '修改分类', 'PUT', '/admin/category/20101', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790024212152323, 1, 'admin', '修改分类', 'PUT', '/admin/category/201', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790024212152324, 1, 'admin', '修改分类', 'PUT', '/admin/category/202', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790024212152325, 1, 'admin', '修改分类', 'PUT', '/admin/category/20102', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790024212152326, 1, 'admin', '修改分类', 'PUT', '/admin/category/20103', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790025654992897, 1, 'admin', '修改分类', 'PUT', '/admin/category/203', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790025654992898, 1, 'admin', '修改分类', 'PUT', '/admin/category/204', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790025717907458, 1, 'admin', '修改分类', 'PUT', '/admin/category/20401', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790025717907460, 1, 'admin', '修改分类', 'PUT', '/admin/category/20402', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790025717907461, 1, 'admin', '修改分类', 'PUT', '/admin/category/20403', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790025717907462, 1, 'admin', '修改分类', 'PUT', '/admin/category/20404', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790027068473346, 1, 'admin', '修改分类', 'PUT', '/admin/category/20406', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790027068473347, 1, 'admin', '修改分类', 'PUT', '/admin/category/20405', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790027135582212, 1, 'admin', '修改分类', 'PUT', '/admin/category/20407', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790027135582213, 1, 'admin', '修改分类', 'PUT', '/admin/category/205', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790027135582214, 1, 'admin', '修改分类', 'PUT', '/admin/category/20408', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790027135582215, 1, 'admin', '修改分类', 'PUT', '/admin/category/20501', '127.0.0.1', '2026-06-05 14:54:01');
INSERT INTO `sys_operation_log` VALUES (2062790028507119618, 1, 'admin', '修改分类', 'PUT', '/admin/category/20502', '127.0.0.1', '2026-06-05 14:54:02');
INSERT INTO `sys_operation_log` VALUES (2062790028507119619, 1, 'admin', '修改分类', 'PUT', '/admin/category/20503', '127.0.0.1', '2026-06-05 14:54:02');
INSERT INTO `sys_operation_log` VALUES (2062790028574228484, 1, 'admin', '修改分类', 'PUT', '/admin/category/20505', '127.0.0.1', '2026-06-05 14:54:02');
INSERT INTO `sys_operation_log` VALUES (2062790028574228485, 1, 'admin', '修改分类', 'PUT', '/admin/category/20506', '127.0.0.1', '2026-06-05 14:54:02');
INSERT INTO `sys_operation_log` VALUES (2062790028574228486, 1, 'admin', '修改分类', 'PUT', '/admin/category/206', '127.0.0.1', '2026-06-05 14:54:02');
INSERT INTO `sys_operation_log` VALUES (2062790028574228487, 1, 'admin', '修改分类', 'PUT', '/admin/category/20504', '127.0.0.1', '2026-06-05 14:54:02');
INSERT INTO `sys_operation_log` VALUES (2062790029941571586, 1, 'admin', '修改分类', 'PUT', '/admin/category/208', '127.0.0.1', '2026-06-05 14:54:02');
INSERT INTO `sys_operation_log` VALUES (2062790029941571587, 1, 'admin', '修改分类', 'PUT', '/admin/category/207', '127.0.0.1', '2026-06-05 14:54:02');
INSERT INTO `sys_operation_log` VALUES (2062790030004486147, 1, 'admin', '修改分类', 'PUT', '/admin/category/3', '127.0.0.1', '2026-06-05 14:54:02');
INSERT INTO `sys_operation_log` VALUES (2062790031694790657, 1, 'admin', '修改分类', 'PUT', '/admin/category/30102', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790031694790658, 1, 'admin', '修改分类', 'PUT', '/admin/category/302', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790031694790659, 1, 'admin', '修改分类', 'PUT', '/admin/category/30101', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790031694790660, 1, 'admin', '修改分类', 'PUT', '/admin/category/301', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790031694790661, 1, 'admin', '修改分类', 'PUT', '/admin/category/30103', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790031694790662, 1, 'admin', '修改分类', 'PUT', '/admin/category/30104', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790033116659714, 1, 'admin', '修改分类', 'PUT', '/admin/category/30403', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790033116659715, 1, 'admin', '修改分类', 'PUT', '/admin/category/30404', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790033116659716, 1, 'admin', '修改分类', 'PUT', '/admin/category/304', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790033116659717, 1, 'admin', '修改分类', 'PUT', '/admin/category/30402', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790033116659718, 1, 'admin', '修改分类', 'PUT', '/admin/category/30401', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790033116659719, 1, 'admin', '修改分类', 'PUT', '/admin/category/303', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790034538528770, 1, 'admin', '修改分类', 'PUT', '/admin/category/30405', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790034538528771, 1, 'admin', '修改分类', 'PUT', '/admin/category/305', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790034538528772, 1, 'admin', '修改分类', 'PUT', '/admin/category/30406', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790034538528773, 1, 'admin', '修改分类', 'PUT', '/admin/category/30407', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790034538528774, 1, 'admin', '修改分类', 'PUT', '/admin/category/30409', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790034538528775, 1, 'admin', '修改分类', 'PUT', '/admin/category/30408', '127.0.0.1', '2026-06-05 14:54:03');
INSERT INTO `sys_operation_log` VALUES (2062790035977175042, 1, 'admin', '修改分类', 'PUT', '/admin/category/306', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790035977175043, 1, 'admin', '修改分类', 'PUT', '/admin/category/30503', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790035977175044, 1, 'admin', '修改分类', 'PUT', '/admin/category/30505', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790035977175045, 1, 'admin', '修改分类', 'PUT', '/admin/category/30502', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790035977175046, 1, 'admin', '修改分类', 'PUT', '/admin/category/30501', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790035977175047, 1, 'admin', '修改分类', 'PUT', '/admin/category/30504', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790037399044097, 1, 'admin', '修改分类', 'PUT', '/admin/category/307', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790037461958658, 1, 'admin', '修改分类', 'PUT', '/admin/category/30702', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790037461958659, 1, 'admin', '修改分类', 'PUT', '/admin/category/30701', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790037461958660, 1, 'admin', '修改分类', 'PUT', '/admin/category/4', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790037461958661, 1, 'admin', '修改分类', 'PUT', '/admin/category/30704', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790037461958662, 1, 'admin', '修改分类', 'PUT', '/admin/category/30703', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790039286480898, 1, 'admin', '修改分类', 'PUT', '/admin/category/40101', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790039286480899, 1, 'admin', '修改分类', 'PUT', '/admin/category/401', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790039353589761, 1, 'admin', '修改分类', 'PUT', '/admin/category/40102', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790039353589762, 1, 'admin', '修改分类', 'PUT', '/admin/category/40105', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790039353589763, 1, 'admin', '修改分类', 'PUT', '/admin/category/40103', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790039353589764, 1, 'admin', '修改分类', 'PUT', '/admin/category/40104', '127.0.0.1', '2026-06-05 14:54:04');
INSERT INTO `sys_operation_log` VALUES (2062790040712544258, 1, 'admin', '修改分类', 'PUT', '/admin/category/40106', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790040909676545, 1, 'admin', '修改分类', 'PUT', '/admin/category/40108', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790040909676546, 1, 'admin', '修改分类', 'PUT', '/admin/category/40107', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790040909676547, 1, 'admin', '修改分类', 'PUT', '/admin/category/402', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790040909676548, 1, 'admin', '修改分类', 'PUT', '/admin/category/40201', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790040909676549, 1, 'admin', '修改分类', 'PUT', '/admin/category/40202', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790042088275969, 1, 'admin', '修改分类', 'PUT', '/admin/category/40203', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790042352517122, 1, 'admin', '修改分类', 'PUT', '/admin/category/40204', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790042352517123, 1, 'admin', '修改分类', 'PUT', '/admin/category/40205', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790042352517124, 1, 'admin', '修改分类', 'PUT', '/admin/category/40206', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790042352517125, 1, 'admin', '修改分类', 'PUT', '/admin/category/40207', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790042352517126, 1, 'admin', '修改分类', 'PUT', '/admin/category/40208', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790043522727937, 1, 'admin', '修改分类', 'PUT', '/admin/category/403', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790043778580481, 1, 'admin', '修改分类', 'PUT', '/admin/category/40402', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790043778580482, 1, 'admin', '修改分类', 'PUT', '/admin/category/40404', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790043778580483, 1, 'admin', '修改分类', 'PUT', '/admin/category/40401', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790043778580484, 1, 'admin', '修改分类', 'PUT', '/admin/category/40403', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790043778580485, 1, 'admin', '修改分类', 'PUT', '/admin/category/404', '127.0.0.1', '2026-06-05 14:54:05');
INSERT INTO `sys_operation_log` VALUES (2062790044957179905, 1, 'admin', '修改分类', 'PUT', '/admin/category/40405', '127.0.0.1', '2026-06-05 14:54:06');
INSERT INTO `sys_operation_log` VALUES (2062790045217226753, 1, 'admin', '修改分类', 'PUT', '/admin/category/40406', '127.0.0.1', '2026-06-05 14:54:06');
INSERT INTO `sys_operation_log` VALUES (2062790045217226754, 1, 'admin', '修改分类', 'PUT', '/admin/category/405', '127.0.0.1', '2026-06-05 14:54:06');
INSERT INTO `sys_operation_log` VALUES (2062790045217226755, 1, 'admin', '修改分类', 'PUT', '/admin/category/40502', '127.0.0.1', '2026-06-05 14:54:06');
INSERT INTO `sys_operation_log` VALUES (2062790045217226756, 1, 'admin', '修改分类', 'PUT', '/admin/category/40503', '127.0.0.1', '2026-06-05 14:54:06');
INSERT INTO `sys_operation_log` VALUES (2062790045217226757, 1, 'admin', '修改分类', 'PUT', '/admin/category/40501', '127.0.0.1', '2026-06-05 14:54:06');
INSERT INTO `sys_operation_log` VALUES (2062790046391631873, 1, 'admin', '修改分类', 'PUT', '/admin/category/40504', '127.0.0.1', '2026-06-05 14:54:06');
INSERT INTO `sys_operation_log` VALUES (2062790046651678722, 1, 'admin', '修改分类', 'PUT', '/admin/category/406', '127.0.0.1', '2026-06-05 14:54:06');
INSERT INTO `sys_operation_log` VALUES (2062790046651678723, 1, 'admin', '修改分类', 'PUT', '/admin/category/40505', '127.0.0.1', '2026-06-05 14:54:06');
INSERT INTO `sys_operation_log` VALUES (2062790195398475778, 1, 'admin', '修改分类', 'PUT', '/admin/category/4', '127.0.0.1', '2026-06-05 14:54:42');
INSERT INTO `sys_operation_log` VALUES (2062790196509966338, 1, 'admin', '修改分类', 'PUT', '/admin/category/401', '127.0.0.1', '2026-06-05 14:54:42');
INSERT INTO `sys_operation_log` VALUES (2062790197164277761, 1, 'admin', '修改分类', 'PUT', '/admin/category/40101', '127.0.0.1', '2026-06-05 14:54:42');
INSERT INTO `sys_operation_log` VALUES (2062790197164277762, 1, 'admin', '修改分类', 'PUT', '/admin/category/40105', '127.0.0.1', '2026-06-05 14:54:42');
INSERT INTO `sys_operation_log` VALUES (2062790197164277763, 1, 'admin', '修改分类', 'PUT', '/admin/category/40102', '127.0.0.1', '2026-06-05 14:54:42');
INSERT INTO `sys_operation_log` VALUES (2062790197164277764, 1, 'admin', '修改分类', 'PUT', '/admin/category/40103', '127.0.0.1', '2026-06-05 14:54:42');
INSERT INTO `sys_operation_log` VALUES (2062790197164277765, 1, 'admin', '修改分类', 'PUT', '/admin/category/40104', '127.0.0.1', '2026-06-05 14:54:42');
INSERT INTO `sys_operation_log` VALUES (2062790197881503746, 1, 'admin', '修改分类', 'PUT', '/admin/category/40106', '127.0.0.1', '2026-06-05 14:54:42');
INSERT INTO `sys_operation_log` VALUES (2062790198665838593, 1, 'admin', '修改分类', 'PUT', '/admin/category/40107', '127.0.0.1', '2026-06-05 14:54:42');
INSERT INTO `sys_operation_log` VALUES (2062790198728753153, 1, 'admin', '修改分类', 'PUT', '/admin/category/40201', '127.0.0.1', '2026-06-05 14:54:42');
INSERT INTO `sys_operation_log` VALUES (2062790198728753154, 1, 'admin', '修改分类', 'PUT', '/admin/category/402', '127.0.0.1', '2026-06-05 14:54:42');
INSERT INTO `sys_operation_log` VALUES (2062790198728753155, 1, 'admin', '修改分类', 'PUT', '/admin/category/40202', '127.0.0.1', '2026-06-05 14:54:42');
INSERT INTO `sys_operation_log` VALUES (2062790198728753156, 1, 'admin', '修改分类', 'PUT', '/admin/category/40108', '127.0.0.1', '2026-06-05 14:54:42');
INSERT INTO `sys_operation_log` VALUES (2062790199383064578, 1, 'admin', '修改分类', 'PUT', '/admin/category/40203', '127.0.0.1', '2026-06-05 14:54:42');
INSERT INTO `sys_operation_log` VALUES (2062790200037376002, 1, 'admin', '修改分类', 'PUT', '/admin/category/40204', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790200234508289, 1, 'admin', '修改分类', 'PUT', '/admin/category/40208', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790200234508290, 1, 'admin', '修改分类', 'PUT', '/admin/category/40205', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790200234508291, 1, 'admin', '修改分类', 'PUT', '/admin/category/40206', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790200234508292, 1, 'admin', '修改分类', 'PUT', '/admin/category/40207', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790200821710849, 1, 'admin', '修改分类', 'PUT', '/admin/category/403', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790201530548225, 1, 'admin', '修改分类', 'PUT', '/admin/category/404', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790201656377346, 1, 'admin', '修改分类', 'PUT', '/admin/category/40401', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790201723486210, 1, 'admin', '修改分类', 'PUT', '/admin/category/40404', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790201723486211, 1, 'admin', '修改分类', 'PUT', '/admin/category/40402', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790201723486212, 1, 'admin', '修改分类', 'PUT', '/admin/category/40403', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790202239385601, 1, 'admin', '修改分类', 'PUT', '/admin/category/40405', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790202944028673, 1, 'admin', '修改分类', 'PUT', '/admin/category/40406', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790203078246401, 1, 'admin', '修改分类', 'PUT', '/admin/category/405', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790203208269826, 1, 'admin', '修改分类', 'PUT', '/admin/category/40501', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790203208269827, 1, 'admin', '修改分类', 'PUT', '/admin/category/40503', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790203208269828, 1, 'admin', '修改分类', 'PUT', '/admin/category/40502', '127.0.0.1', '2026-06-05 14:54:43');
INSERT INTO `sys_operation_log` VALUES (2062790203661254657, 1, 'admin', '修改分类', 'PUT', '/admin/category/40504', '127.0.0.1', '2026-06-05 14:54:44');
INSERT INTO `sys_operation_log` VALUES (2062790204378480641, 1, 'admin', '修改分类', 'PUT', '/admin/category/40505', '127.0.0.1', '2026-06-05 14:54:44');
INSERT INTO `sys_operation_log` VALUES (2062790204508504066, 1, 'admin', '修改分类', 'PUT', '/admin/category/406', '127.0.0.1', '2026-06-05 14:54:44');
INSERT INTO `sys_operation_log` VALUES (2062790451301351426, 1, 'admin', '修改分类', 'PUT', '/admin/category/4', '127.0.0.1', '2026-06-05 14:55:43');
INSERT INTO `sys_operation_log` VALUES (2062790452408647681, 1, 'admin', '修改分类', 'PUT', '/admin/category/401', '127.0.0.1', '2026-06-05 14:55:43');
INSERT INTO `sys_operation_log` VALUES (2062790453121679362, 1, 'admin', '修改分类', 'PUT', '/admin/category/40105', '127.0.0.1', '2026-06-05 14:55:43');
INSERT INTO `sys_operation_log` VALUES (2062790453121679363, 1, 'admin', '修改分类', 'PUT', '/admin/category/40104', '127.0.0.1', '2026-06-05 14:55:43');
INSERT INTO `sys_operation_log` VALUES (2062790453121679364, 1, 'admin', '修改分类', 'PUT', '/admin/category/40102', '127.0.0.1', '2026-06-05 14:55:43');
INSERT INTO `sys_operation_log` VALUES (2062790453121679365, 1, 'admin', '修改分类', 'PUT', '/admin/category/40103', '127.0.0.1', '2026-06-05 14:55:43');
INSERT INTO `sys_operation_log` VALUES (2062790453121679366, 1, 'admin', '修改分类', 'PUT', '/admin/category/40101', '127.0.0.1', '2026-06-05 14:55:43');
INSERT INTO `sys_operation_log` VALUES (2062790453838905345, 1, 'admin', '修改分类', 'PUT', '/admin/category/40106', '127.0.0.1', '2026-06-05 14:55:43');
INSERT INTO `sys_operation_log` VALUES (2062790454614851586, 1, 'admin', '修改分类', 'PUT', '/admin/category/40202', '127.0.0.1', '2026-06-05 14:55:43');
INSERT INTO `sys_operation_log` VALUES (2062790454614851587, 1, 'admin', '修改分类', 'PUT', '/admin/category/40108', '127.0.0.1', '2026-06-05 14:55:43');
INSERT INTO `sys_operation_log` VALUES (2062790454614851588, 1, 'admin', '修改分类', 'PUT', '/admin/category/40201', '127.0.0.1', '2026-06-05 14:55:43');
INSERT INTO `sys_operation_log` VALUES (2062790454614851589, 1, 'admin', '修改分类', 'PUT', '/admin/category/40107', '127.0.0.1', '2026-06-05 14:55:43');
INSERT INTO `sys_operation_log` VALUES (2062790454614851590, 1, 'admin', '修改分类', 'PUT', '/admin/category/402', '127.0.0.1', '2026-06-05 14:55:43');
INSERT INTO `sys_operation_log` VALUES (2062790455193665537, 1, 'admin', '修改分类', 'PUT', '/admin/category/40203', '127.0.0.1', '2026-06-05 14:55:43');
INSERT INTO `sys_operation_log` VALUES (2062790456116412418, 1, 'admin', '修改分类', 'PUT', '/admin/category/40204', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790456116412419, 1, 'admin', '修改分类', 'PUT', '/admin/category/40205', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790456179326977, 1, 'admin', '修改分类', 'PUT', '/admin/category/40206', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790456179326978, 1, 'admin', '修改分类', 'PUT', '/admin/category/40207', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790456179326979, 1, 'admin', '修改分类', 'PUT', '/admin/category/40208', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790456699420673, 1, 'admin', '修改分类', 'PUT', '/admin/category/403', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790457617973250, 1, 'admin', '修改分类', 'PUT', '/admin/category/40401', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790457617973251, 1, 'admin', '修改分类', 'PUT', '/admin/category/40403', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790457617973252, 1, 'admin', '修改分类', 'PUT', '/admin/category/404', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790457617973253, 1, 'admin', '修改分类', 'PUT', '/admin/category/40404', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790457617973254, 1, 'admin', '修改分类', 'PUT', '/admin/category/40402', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790458133872641, 1, 'admin', '修改分类', 'PUT', '/admin/category/40405', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790459115339777, 1, 'admin', '修改分类', 'PUT', '/admin/category/405', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790459115339778, 1, 'admin', '修改分类', 'PUT', '/admin/category/40501', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790459115339779, 1, 'admin', '修改分类', 'PUT', '/admin/category/40406', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790459178254339, 1, 'admin', '修改分类', 'PUT', '/admin/category/40502', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790459178254340, 1, 'admin', '修改分类', 'PUT', '/admin/category/40503', '127.0.0.1', '2026-06-05 14:55:44');
INSERT INTO `sys_operation_log` VALUES (2062790459505410050, 1, 'admin', '修改分类', 'PUT', '/admin/category/40504', '127.0.0.1', '2026-06-05 14:55:45');
INSERT INTO `sys_operation_log` VALUES (2062790460549791745, 1, 'admin', '修改分类', 'PUT', '/admin/category/406', '127.0.0.1', '2026-06-05 14:55:45');
INSERT INTO `sys_operation_log` VALUES (2062790460549791746, 1, 'admin', '修改分类', 'PUT', '/admin/category/5', '127.0.0.1', '2026-06-05 14:55:45');
INSERT INTO `sys_operation_log` VALUES (2062790460549791747, 1, 'admin', '修改分类', 'PUT', '/admin/category/40505', '127.0.0.1', '2026-06-05 14:55:45');
INSERT INTO `sys_operation_log` VALUES (2062790462374313986, 1, 'admin', '修改分类', 'PUT', '/admin/category/501', '127.0.0.1', '2026-06-05 14:55:45');
INSERT INTO `sys_operation_log` VALUES (2062790462374313987, 1, 'admin', '修改分类', 'PUT', '/admin/category/50102', '127.0.0.1', '2026-06-05 14:55:45');
INSERT INTO `sys_operation_log` VALUES (2062790462374313988, 1, 'admin', '修改分类', 'PUT', '/admin/category/50101', '127.0.0.1', '2026-06-05 14:55:45');
INSERT INTO `sys_operation_log` VALUES (2062790462374313989, 1, 'admin', '修改分类', 'PUT', '/admin/category/50103', '127.0.0.1', '2026-06-05 14:55:45');
INSERT INTO `sys_operation_log` VALUES (2062790462374313990, 1, 'admin', '修改分类', 'PUT', '/admin/category/50104', '127.0.0.1', '2026-06-05 14:55:45');
INSERT INTO `sys_operation_log` VALUES (2062790462374313991, 1, 'admin', '修改分类', 'PUT', '/admin/category/50105', '127.0.0.1', '2026-06-05 14:55:45');
INSERT INTO `sys_operation_log` VALUES (2062790463796183042, 1, 'admin', '修改分类', 'PUT', '/admin/category/50108', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790463796183043, 1, 'admin', '修改分类', 'PUT', '/admin/category/50106', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790463796183044, 1, 'admin', '修改分类', 'PUT', '/admin/category/502', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790463796183045, 1, 'admin', '修改分类', 'PUT', '/admin/category/50107', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790463796183046, 1, 'admin', '修改分类', 'PUT', '/admin/category/50202', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790463796183047, 1, 'admin', '修改分类', 'PUT', '/admin/category/50201', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790465226440706, 1, 'admin', '修改分类', 'PUT', '/admin/category/50203', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790465226440707, 1, 'admin', '修改分类', 'PUT', '/admin/category/50205', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790465226440708, 1, 'admin', '修改分类', 'PUT', '/admin/category/50204', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790465226440709, 1, 'admin', '修改分类', 'PUT', '/admin/category/503', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790465226440710, 1, 'admin', '修改分类', 'PUT', '/admin/category/504', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790465226440711, 1, 'admin', '修改分类', 'PUT', '/admin/category/50206', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790466644115458, 1, 'admin', '修改分类', 'PUT', '/admin/category/6', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790466644115459, 1, 'admin', '修改分类', 'PUT', '/admin/category/505', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790466644115460, 1, 'admin', '修改分类', 'PUT', '/admin/category/506', '127.0.0.1', '2026-06-05 14:55:46');
INSERT INTO `sys_operation_log` VALUES (2062790468393140226, 1, 'admin', '修改分类', 'PUT', '/admin/category/60101', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790468393140227, 1, 'admin', '修改分类', 'PUT', '/admin/category/601', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790468393140228, 1, 'admin', '修改分类', 'PUT', '/admin/category/60104', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790468393140229, 1, 'admin', '修改分类', 'PUT', '/admin/category/60102', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790468393140230, 1, 'admin', '修改分类', 'PUT', '/admin/category/60103', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790468393140231, 1, 'admin', '修改分类', 'PUT', '/admin/category/60105', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790469823397890, 1, 'admin', '修改分类', 'PUT', '/admin/category/60106', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790469823397891, 1, 'admin', '修改分类', 'PUT', '/admin/category/60301', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790469823397892, 1, 'admin', '修改分类', 'PUT', '/admin/category/603', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790469823397893, 1, 'admin', '修改分类', 'PUT', '/admin/category/60302', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790469823397894, 1, 'admin', '修改分类', 'PUT', '/admin/category/602', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790469823397895, 1, 'admin', '修改分类', 'PUT', '/admin/category/60303', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790471513702401, 1, 'admin', '修改分类', 'PUT', '/admin/category/60304', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790471643725826, 1, 'admin', '修改分类', 'PUT', '/admin/category/60306', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790471643725827, 1, 'admin', '修改分类', 'PUT', '/admin/category/605', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790471643725828, 1, 'admin', '修改分类', 'PUT', '/admin/category/60501', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790471643725829, 1, 'admin', '修改分类', 'PUT', '/admin/category/604', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790471643725830, 1, 'admin', '修改分类', 'PUT', '/admin/category/60305', '127.0.0.1', '2026-06-05 14:55:47');
INSERT INTO `sys_operation_log` VALUES (2062790472893628418, 1, 'admin', '修改分类', 'PUT', '/admin/category/60502', '127.0.0.1', '2026-06-05 14:55:48');
INSERT INTO `sys_operation_log` VALUES (2062790473023651841, 1, 'admin', '修改分类', 'PUT', '/admin/category/60503', '127.0.0.1', '2026-06-05 14:55:48');
INSERT INTO `sys_operation_log` VALUES (2062790473023651842, 1, 'admin', '修改分类', 'PUT', '/admin/category/60504', '127.0.0.1', '2026-06-05 14:55:48');
INSERT INTO `sys_operation_log` VALUES (2062790473086566402, 1, 'admin', '修改分类', 'PUT', '/admin/category/60505', '127.0.0.1', '2026-06-05 14:55:48');
INSERT INTO `sys_operation_log` VALUES (2062790473086566403, 1, 'admin', '修改分类', 'PUT', '/admin/category/60506', '127.0.0.1', '2026-06-05 14:55:48');
INSERT INTO `sys_operation_log` VALUES (2062790473086566404, 1, 'admin', '修改分类', 'PUT', '/admin/category/606', '127.0.0.1', '2026-06-05 14:55:48');
INSERT INTO `sys_operation_log` VALUES (2062790474260971522, 1, 'admin', '修改分类', 'PUT', '/admin/category/60601', '127.0.0.1', '2026-06-05 14:55:48');
INSERT INTO `sys_operation_log` VALUES (2062790474386800642, 1, 'admin', '修改分类', 'PUT', '/admin/category/60603', '127.0.0.1', '2026-06-05 14:55:48');
INSERT INTO `sys_operation_log` VALUES (2062790474386800643, 1, 'admin', '修改分类', 'PUT', '/admin/category/60602', '127.0.0.1', '2026-06-05 14:55:48');
INSERT INTO `sys_operation_log` VALUES (2062790474516824066, 1, 'admin', '修改分类', 'PUT', '/admin/category/60604', '127.0.0.1', '2026-06-05 14:55:48');
INSERT INTO `sys_operation_log` VALUES (2062790474516824067, 1, 'admin', '修改分类', 'PUT', '/admin/category/60605', '127.0.0.1', '2026-06-05 14:55:48');
INSERT INTO `sys_operation_log` VALUES (2062790474516824068, 1, 'admin', '修改分类', 'PUT', '/admin/category/60606', '127.0.0.1', '2026-06-05 14:55:48');
INSERT INTO `sys_operation_log` VALUES (2062790475691229186, 1, 'admin', '修改分类', 'PUT', '/admin/category/60607', '127.0.0.1', '2026-06-05 14:55:48');
INSERT INTO `sys_operation_log` VALUES (2062790475821252609, 1, 'admin', '修改分类', 'PUT', '/admin/category/607', '127.0.0.1', '2026-06-05 14:55:48');
INSERT INTO `sys_operation_log` VALUES (2062790990739169282, 1, 'admin', '修改分类', 'PUT', '/admin/category/15', '127.0.0.1', '2026-06-05 14:57:51');
INSERT INTO `sys_operation_log` VALUES (2062790991280234497, 1, 'admin', '修改分类', 'PUT', '/admin/category/150102', '127.0.0.1', '2026-06-05 14:57:51');
INSERT INTO `sys_operation_log` VALUES (2062790991343149057, 1, 'admin', '修改分类', 'PUT', '/admin/category/1501', '127.0.0.1', '2026-06-05 14:57:51');
INSERT INTO `sys_operation_log` VALUES (2062790991343149058, 1, 'admin', '修改分类', 'PUT', '/admin/category/150101', '127.0.0.1', '2026-06-05 14:57:51');
INSERT INTO `sys_operation_log` VALUES (2062790992580468738, 1, 'admin', '修改分类', 'PUT', '/admin/category/150105', '127.0.0.1', '2026-06-05 14:57:52');
INSERT INTO `sys_operation_log` VALUES (2062790992580468739, 1, 'admin', '修改分类', 'PUT', '/admin/category/150104', '127.0.0.1', '2026-06-05 14:57:52');
INSERT INTO `sys_operation_log` VALUES (2062790992580468740, 1, 'admin', '修改分类', 'PUT', '/admin/category/150103', '127.0.0.1', '2026-06-05 14:57:52');
INSERT INTO `sys_operation_log` VALUES (2062790992836321282, 1, 'admin', '修改分类', 'PUT', '/admin/category/1502', '127.0.0.1', '2026-06-05 14:57:52');
INSERT INTO `sys_operation_log` VALUES (2062790992836321283, 1, 'admin', '修改分类', 'PUT', '/admin/category/1503', '127.0.0.1', '2026-06-05 14:57:52');
INSERT INTO `sys_operation_log` VALUES (2062790992836321284, 1, 'admin', '修改分类', 'PUT', '/admin/category/1504', '127.0.0.1', '2026-06-05 14:57:52');
INSERT INTO `sys_operation_log` VALUES (2062791125393104898, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 14:58:23');
INSERT INTO `sys_operation_log` VALUES (2062791126500401154, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791127276347393, 1, 'admin', '修改分类', 'PUT', '/admin/category/102', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791127339261954, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791127339261955, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791127339261956, 1, 'admin', '修改分类', 'PUT', '/admin/category/2057445280091111426', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791127339261957, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791127993573377, 1, 'admin', '修改分类', 'PUT', '/admin/category/103', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791128836628481, 1, 'admin', '修改分类', 'PUT', '/admin/category/10403', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791128903737345, 1, 'admin', '修改分类', 'PUT', '/admin/category/10401', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791128903737346, 1, 'admin', '修改分类', 'PUT', '/admin/category/10402', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791128903737347, 1, 'admin', '修改分类', 'PUT', '/admin/category/104', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791128970846210, 1, 'admin', '修改分类', 'PUT', '/admin/category/10404', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791129490939906, 1, 'admin', '修改分类', 'PUT', '/admin/category/10405', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791130405298177, 1, 'admin', '修改分类', 'PUT', '/admin/category/10406', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791130472407042, 1, 'admin', '修改分类', 'PUT', '/admin/category/10502', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791130472407043, 1, 'admin', '修改分类', 'PUT', '/admin/category/105', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791130472407044, 1, 'admin', '修改分类', 'PUT', '/admin/category/10501', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791130472407045, 1, 'admin', '修改分类', 'PUT', '/admin/category/10503', '127.0.0.1', '2026-06-05 14:58:24');
INSERT INTO `sys_operation_log` VALUES (2062791130925391873, 1, 'admin', '修改分类', 'PUT', '/admin/category/10504', '127.0.0.1', '2026-06-05 14:58:25');
INSERT INTO `sys_operation_log` VALUES (2062791131902664706, 1, 'admin', '修改分类', 'PUT', '/admin/category/10505', '127.0.0.1', '2026-06-05 14:58:25');
INSERT INTO `sys_operation_log` VALUES (2062791131965579265, 1, 'admin', '修改分类', 'PUT', '/admin/category/107', '127.0.0.1', '2026-06-05 14:58:25');
INSERT INTO `sys_operation_log` VALUES (2062791131965579266, 1, 'admin', '修改分类', 'PUT', '/admin/category/106', '127.0.0.1', '2026-06-05 14:58:25');
INSERT INTO `sys_operation_log` VALUES (2062791131965579267, 1, 'admin', '修改分类', 'PUT', '/admin/category/10701', '127.0.0.1', '2026-06-05 14:58:25');
INSERT INTO `sys_operation_log` VALUES (2062791131965579268, 1, 'admin', '修改分类', 'PUT', '/admin/category/10702', '127.0.0.1', '2026-06-05 14:58:25');
INSERT INTO `sys_operation_log` VALUES (2062791132351455233, 1, 'admin', '修改分类', 'PUT', '/admin/category/10703', '127.0.0.1', '2026-06-05 14:58:25');
INSERT INTO `sys_operation_log` VALUES (2062791133391642625, 1, 'admin', '修改分类', 'PUT', '/admin/category/10704', '127.0.0.1', '2026-06-05 14:58:25');
INSERT INTO `sys_operation_log` VALUES (2062791133454557186, 1, 'admin', '修改分类', 'PUT', '/admin/category/10705', '127.0.0.1', '2026-06-05 14:58:25');
INSERT INTO `sys_operation_log` VALUES (2062791245090152449, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 14:58:52');
INSERT INTO `sys_operation_log` VALUES (2062791246067425282, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-05 14:58:52');
INSERT INTO `sys_operation_log` VALUES (2062791246843371521, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-05 14:58:52');
INSERT INTO `sys_operation_log` VALUES (2062791246910480385, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-05 14:58:52');
INSERT INTO `sys_operation_log` VALUES (2062791246910480386, 1, 'admin', '修改分类', 'PUT', '/admin/category/2057445280091111426', '127.0.0.1', '2026-06-05 14:58:52');
INSERT INTO `sys_operation_log` VALUES (2062791246910480387, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-05 14:58:52');
INSERT INTO `sys_operation_log` VALUES (2062791246910480388, 1, 'admin', '修改分类', 'PUT', '/admin/category/102', '127.0.0.1', '2026-06-05 14:58:52');
INSERT INTO `sys_operation_log` VALUES (2062791247564791809, 1, 'admin', '修改分类', 'PUT', '/admin/category/103', '127.0.0.1', '2026-06-05 14:58:52');
INSERT INTO `sys_operation_log` VALUES (2062791248361709570, 1, 'admin', '修改分类', 'PUT', '/admin/category/104', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791248361709571, 1, 'admin', '修改分类', 'PUT', '/admin/category/10401', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791248420429827, 1, 'admin', '修改分类', 'PUT', '/admin/category/10402', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791248420429828, 1, 'admin', '修改分类', 'PUT', '/admin/category/10404', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791248420429829, 1, 'admin', '修改分类', 'PUT', '/admin/category/10403', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791249003438082, 1, 'admin', '修改分类', 'PUT', '/admin/category/10405', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791249846493185, 1, 'admin', '修改分类', 'PUT', '/admin/category/105', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791249846493186, 1, 'admin', '修改分类', 'PUT', '/admin/category/10406', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791249909407746, 1, 'admin', '修改分类', 'PUT', '/admin/category/10501', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791249909407747, 1, 'admin', '修改分类', 'PUT', '/admin/category/10502', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791249976516610, 1, 'admin', '修改分类', 'PUT', '/admin/category/10503', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791250433695746, 1, 'admin', '修改分类', 'PUT', '/admin/category/10504', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791251343859714, 1, 'admin', '修改分类', 'PUT', '/admin/category/10505', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791251406774273, 1, 'admin', '修改分类', 'PUT', '/admin/category/107', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791251406774274, 1, 'admin', '修改分类', 'PUT', '/admin/category/106', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791251473883137, 1, 'admin', '修改分类', 'PUT', '/admin/category/10702', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791251536797700, 1, 'admin', '修改分类', 'PUT', '/admin/category/10701', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791251863953409, 1, 'admin', '修改分类', 'PUT', '/admin/category/10703', '127.0.0.1', '2026-06-05 14:58:53');
INSERT INTO `sys_operation_log` VALUES (2062791252845420545, 1, 'admin', '修改分类', 'PUT', '/admin/category/10704', '127.0.0.1', '2026-06-05 14:58:54');
INSERT INTO `sys_operation_log` VALUES (2062791252971249665, 1, 'admin', '修改分类', 'PUT', '/admin/category/10705', '127.0.0.1', '2026-06-05 14:58:54');
INSERT INTO `sys_operation_log` VALUES (2062791644014600194, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 15:00:27');
INSERT INTO `sys_operation_log` VALUES (2062791644861849601, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-05 15:00:27');
INSERT INTO `sys_operation_log` VALUES (2062791645826539522, 1, 'admin', '修改分类', 'PUT', '/admin/category/102', '127.0.0.1', '2026-06-05 15:00:27');
INSERT INTO `sys_operation_log` VALUES (2062791645826539523, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-05 15:00:27');
INSERT INTO `sys_operation_log` VALUES (2062791645826539524, 1, 'admin', '修改分类', 'PUT', '/admin/category/2057445280091111426', '127.0.0.1', '2026-06-05 15:00:27');
INSERT INTO `sys_operation_log` VALUES (2062791645826539525, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-05 15:00:27');
INSERT INTO `sys_operation_log` VALUES (2062791645826539526, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-05 15:00:27');
INSERT INTO `sys_operation_log` VALUES (2062791646296301570, 1, 'admin', '修改分类', 'PUT', '/admin/category/103', '127.0.0.1', '2026-06-05 15:00:27');
INSERT INTO `sys_operation_log` VALUES (2062791647340683266, 1, 'admin', '修改分类', 'PUT', '/admin/category/104', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791647403597825, 1, 'admin', '修改分类', 'PUT', '/admin/category/10403', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791647403597826, 1, 'admin', '修改分类', 'PUT', '/admin/category/10404', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791647403597827, 1, 'admin', '修改分类', 'PUT', '/admin/category/10401', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791647403597828, 1, 'admin', '修改分类', 'PUT', '/admin/category/10402', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791647734947842, 1, 'admin', '修改分类', 'PUT', '/admin/category/10405', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791648779329537, 1, 'admin', '修改分类', 'PUT', '/admin/category/10406', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791648976461825, 1, 'admin', '修改分类', 'PUT', '/admin/category/105', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791648976461826, 1, 'admin', '修改分类', 'PUT', '/admin/category/10503', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791648976461827, 1, 'admin', '修改分类', 'PUT', '/admin/category/10501', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791648976461828, 1, 'admin', '修改分类', 'PUT', '/admin/category/10502', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791649169399810, 1, 'admin', '修改分类', 'PUT', '/admin/category/10504', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791650213781505, 1, 'admin', '修改分类', 'PUT', '/admin/category/10505', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791650473828354, 1, 'admin', '修改分类', 'PUT', '/admin/category/107', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791650473828355, 1, 'admin', '修改分类', 'PUT', '/admin/category/10701', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791650473828356, 1, 'admin', '修改分类', 'PUT', '/admin/category/10702', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791650473828357, 1, 'admin', '修改分类', 'PUT', '/admin/category/106', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791650603851778, 1, 'admin', '修改分类', 'PUT', '/admin/category/10703', '127.0.0.1', '2026-06-05 15:00:28');
INSERT INTO `sys_operation_log` VALUES (2062791651635650562, 1, 'admin', '修改分类', 'PUT', '/admin/category/10704', '127.0.0.1', '2026-06-05 15:00:29');
INSERT INTO `sys_operation_log` VALUES (2062791651954417666, 1, 'admin', '修改分类', 'PUT', '/admin/category/10705', '127.0.0.1', '2026-06-05 15:00:29');
INSERT INTO `sys_operation_log` VALUES (2062794376402329601, NULL, 'admin', '登录失败: 用户名或密码错误', 'POST', '/auth/login', '0:0:0:0:0:0:0:1', '2026-06-05 15:11:18');
INSERT INTO `sys_operation_log` VALUES (2062794497894539266, 1, 'admin', '商品上下架', 'PUT', '/admin/spu/2057693667856125953/status', '0:0:0:0:0:0:0:1', '2026-06-05 15:11:47');
INSERT INTO `sys_operation_log` VALUES (2062795079929716738, 1, 'admin', '商品上下架', 'PUT', '/admin/spu/2057693667856125953/status', '0:0:0:0:0:0:0:1', '2026-06-05 15:14:06');
INSERT INTO `sys_operation_log` VALUES (2062795532352512002, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 15:15:54');
INSERT INTO `sys_operation_log` VALUES (2062795533128458242, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-05 15:15:54');
INSERT INTO `sys_operation_log` VALUES (2062795534168645633, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-05 15:15:54');
INSERT INTO `sys_operation_log` VALUES (2062795534168645634, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-05 15:15:54');
INSERT INTO `sys_operation_log` VALUES (2062795534168645635, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-05 15:15:54');
INSERT INTO `sys_operation_log` VALUES (2062795534168645636, 1, 'admin', '修改分类', 'PUT', '/admin/category/102', '127.0.0.1', '2026-06-05 15:15:54');
INSERT INTO `sys_operation_log` VALUES (2062795534168645637, 1, 'admin', '修改分类', 'PUT', '/admin/category/2057445280091111426', '127.0.0.1', '2026-06-05 15:15:54');
INSERT INTO `sys_operation_log` VALUES (2062795534554521602, 1, 'admin', '修改分类', 'PUT', '/admin/category/103', '127.0.0.1', '2026-06-05 15:15:54');
INSERT INTO `sys_operation_log` VALUES (2062795535720538114, 1, 'admin', '修改分类', 'PUT', '/admin/category/10402', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795535783452673, 1, 'admin', '修改分类', 'PUT', '/admin/category/10401', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795535783452674, 1, 'admin', '修改分类', 'PUT', '/admin/category/10404', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795535783452675, 1, 'admin', '修改分类', 'PUT', '/admin/category/10403', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795535783452676, 1, 'admin', '修改分类', 'PUT', '/admin/category/104', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795535976390658, 1, 'admin', '修改分类', 'PUT', '/admin/category/10405', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795537217904642, 1, 'admin', '修改分类', 'PUT', '/admin/category/10406', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795537217904643, 1, 'admin', '修改分类', 'PUT', '/admin/category/105', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795537217904644, 1, 'admin', '修改分类', 'PUT', '/admin/category/10503', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795537217904645, 1, 'admin', '修改分类', 'PUT', '/admin/category/10502', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795537217904646, 1, 'admin', '修改分类', 'PUT', '/admin/category/10501', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795537410842625, 1, 'admin', '修改分类', 'PUT', '/admin/category/10504', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795538715271170, 1, 'admin', '修改分类', 'PUT', '/admin/category/10505', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795538715271171, 1, 'admin', '修改分类', 'PUT', '/admin/category/106', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795538782380035, 1, 'admin', '修改分类', 'PUT', '/admin/category/107', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795538782380036, 1, 'admin', '修改分类', 'PUT', '/admin/category/10701', '127.0.0.1', '2026-06-05 15:15:55');
INSERT INTO `sys_operation_log` VALUES (2062795538782380037, 1, 'admin', '修改分类', 'PUT', '/admin/category/10702', '127.0.0.1', '2026-06-05 15:15:56');
INSERT INTO `sys_operation_log` VALUES (2062795538849488900, 1, 'admin', '修改分类', 'PUT', '/admin/category/10703', '127.0.0.1', '2026-06-05 15:15:56');
INSERT INTO `sys_operation_log` VALUES (2062795540216832002, 1, 'admin', '修改分类', 'PUT', '/admin/category/10705', '127.0.0.1', '2026-06-05 15:15:56');
INSERT INTO `sys_operation_log` VALUES (2062795540283940865, 1, 'admin', '修改分类', 'PUT', '/admin/category/10704', '127.0.0.1', '2026-06-05 15:15:56');
INSERT INTO `sys_operation_log` VALUES (2062796738521149442, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 15:20:42');
INSERT INTO `sys_operation_log` VALUES (2062796739192238081, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-05 15:20:42');
INSERT INTO `sys_operation_log` VALUES (2062796740492472321, 1, 'admin', '修改分类', 'PUT', '/admin/category/2057445280091111426', '127.0.0.1', '2026-06-05 15:20:42');
INSERT INTO `sys_operation_log` VALUES (2062796740555386882, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-05 15:20:42');
INSERT INTO `sys_operation_log` VALUES (2062796740555386883, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-05 15:20:42');
INSERT INTO `sys_operation_log` VALUES (2062796740622495746, 1, 'admin', '修改分类', 'PUT', '/admin/category/102', '127.0.0.1', '2026-06-05 15:20:42');
INSERT INTO `sys_operation_log` VALUES (2062796740622495748, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-05 15:20:42');
INSERT INTO `sys_operation_log` VALUES (2062796740752519169, 1, 'admin', '修改分类', 'PUT', '/admin/category/103', '127.0.0.1', '2026-06-05 15:20:42');
INSERT INTO `sys_operation_log` VALUES (2062796742065336321, 1, 'admin', '修改分类', 'PUT', '/admin/category/10402', '127.0.0.1', '2026-06-05 15:20:42');
INSERT INTO `sys_operation_log` VALUES (2062796742065336322, 1, 'admin', '修改分类', 'PUT', '/admin/category/10401', '127.0.0.1', '2026-06-05 15:20:42');
INSERT INTO `sys_operation_log` VALUES (2062796742128250882, 1, 'admin', '修改分类', 'PUT', '/admin/category/104', '127.0.0.1', '2026-06-05 15:20:42');
INSERT INTO `sys_operation_log` VALUES (2062796742128250884, 1, 'admin', '修改分类', 'PUT', '/admin/category/10403', '127.0.0.1', '2026-06-05 15:20:42');
INSERT INTO `sys_operation_log` VALUES (2062796742128250885, 1, 'admin', '修改分类', 'PUT', '/admin/category/10404', '127.0.0.1', '2026-06-05 15:20:42');
INSERT INTO `sys_operation_log` VALUES (2062796742191165444, 1, 'admin', '修改分类', 'PUT', '/admin/category/10405', '127.0.0.1', '2026-06-05 15:20:42');
INSERT INTO `sys_operation_log` VALUES (2062796743558508545, 1, 'admin', '修改分类', 'PUT', '/admin/category/10406', '127.0.0.1', '2026-06-05 15:20:43');
INSERT INTO `sys_operation_log` VALUES (2062796743625617409, 1, 'admin', '修改分类', 'PUT', '/admin/category/105', '127.0.0.1', '2026-06-05 15:20:43');
INSERT INTO `sys_operation_log` VALUES (2062796743625617410, 1, 'admin', '修改分类', 'PUT', '/admin/category/10501', '127.0.0.1', '2026-06-05 15:20:43');
INSERT INTO `sys_operation_log` VALUES (2062796743755640834, 1, 'admin', '修改分类', 'PUT', '/admin/category/10502', '127.0.0.1', '2026-06-05 15:20:43');
INSERT INTO `sys_operation_log` VALUES (2062796743755640835, 1, 'admin', '修改分类', 'PUT', '/admin/category/10503', '127.0.0.1', '2026-06-05 15:20:43');
INSERT INTO `sys_operation_log` VALUES (2062796743755640836, 1, 'admin', '修改分类', 'PUT', '/admin/category/10504', '127.0.0.1', '2026-06-05 15:20:43');
INSERT INTO `sys_operation_log` VALUES (2062796745001349121, 1, 'admin', '修改分类', 'PUT', '/admin/category/10505', '127.0.0.1', '2026-06-05 15:20:43');
INSERT INTO `sys_operation_log` VALUES (2062796745135566850, 1, 'admin', '修改分类', 'PUT', '/admin/category/107', '127.0.0.1', '2026-06-05 15:20:43');
INSERT INTO `sys_operation_log` VALUES (2062796745135566851, 1, 'admin', '修改分类', 'PUT', '/admin/category/106', '127.0.0.1', '2026-06-05 15:20:43');
INSERT INTO `sys_operation_log` VALUES (2062796745261395969, 1, 'admin', '修改分类', 'PUT', '/admin/category/10701', '127.0.0.1', '2026-06-05 15:20:43');
INSERT INTO `sys_operation_log` VALUES (2062796745328504833, 1, 'admin', '修改分类', 'PUT', '/admin/category/10703', '127.0.0.1', '2026-06-05 15:20:43');
INSERT INTO `sys_operation_log` VALUES (2062796745328504834, 1, 'admin', '修改分类', 'PUT', '/admin/category/10702', '127.0.0.1', '2026-06-05 15:20:43');
INSERT INTO `sys_operation_log` VALUES (2062796746498715650, 1, 'admin', '修改分类', 'PUT', '/admin/category/10704', '127.0.0.1', '2026-06-05 15:20:43');
INSERT INTO `sys_operation_log` VALUES (2062796746628739074, 1, 'admin', '修改分类', 'PUT', '/admin/category/10705', '127.0.0.1', '2026-06-05 15:20:43');
INSERT INTO `sys_operation_log` VALUES (2062796781873475585, 1, 'admin', '修改分类', 'PUT', '/admin/category/1', '127.0.0.1', '2026-06-05 15:20:52');
INSERT INTO `sys_operation_log` VALUES (2062796782334849025, 1, 'admin', '修改分类', 'PUT', '/admin/category/10102', '127.0.0.1', '2026-06-05 15:20:52');
INSERT INTO `sys_operation_log` VALUES (2062796782401957890, 1, 'admin', '修改分类', 'PUT', '/admin/category/101', '127.0.0.1', '2026-06-05 15:20:52');
INSERT INTO `sys_operation_log` VALUES (2062796782401957891, 1, 'admin', '修改分类', 'PUT', '/admin/category/10101', '127.0.0.1', '2026-06-05 15:20:52');
INSERT INTO `sys_operation_log` VALUES (2062796783635083266, 1, 'admin', '修改分类', 'PUT', '/admin/category/10103', '127.0.0.1', '2026-06-05 15:20:52');
INSERT INTO `sys_operation_log` VALUES (2062796783635083267, 1, 'admin', '修改分类', 'PUT', '/admin/category/2057445280091111426', '127.0.0.1', '2026-06-05 15:20:52');
INSERT INTO `sys_operation_log` VALUES (2062796783635083268, 1, 'admin', '修改分类', 'PUT', '/admin/category/102', '127.0.0.1', '2026-06-05 15:20:52');
INSERT INTO `sys_operation_log` VALUES (2062796783832215553, 1, 'admin', '修改分类', 'PUT', '/admin/category/103', '127.0.0.1', '2026-06-05 15:20:52');
INSERT INTO `sys_operation_log` VALUES (2062796783832215554, 1, 'admin', '修改分类', 'PUT', '/admin/category/10401', '127.0.0.1', '2026-06-05 15:20:52');
INSERT INTO `sys_operation_log` VALUES (2062796783899324418, 1, 'admin', '修改分类', 'PUT', '/admin/category/104', '127.0.0.1', '2026-06-05 15:20:52');
INSERT INTO `sys_operation_log` VALUES (2062796785136644098, 1, 'admin', '修改分类', 'PUT', '/admin/category/10404', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796785136644099, 1, 'admin', '修改分类', 'PUT', '/admin/category/10402', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796785136644100, 1, 'admin', '修改分类', 'PUT', '/admin/category/10403', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796785333776385, 1, 'admin', '修改分类', 'PUT', '/admin/category/10405', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796785333776386, 1, 'admin', '修改分类', 'PUT', '/admin/category/10406', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796785400885250, 1, 'admin', '修改分类', 'PUT', '/admin/category/105', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796786629816322, 1, 'admin', '修改分类', 'PUT', '/admin/category/10501', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796786629816323, 1, 'admin', '修改分类', 'PUT', '/admin/category/10502', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796786696925187, 1, 'admin', '修改分类', 'PUT', '/admin/category/10503', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796786826948610, 1, 'admin', '修改分类', 'PUT', '/admin/category/10504', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796786826948611, 1, 'admin', '修改分类', 'PUT', '/admin/category/106', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796786826948612, 1, 'admin', '修改分类', 'PUT', '/admin/category/10505', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796788135571457, 1, 'admin', '修改分类', 'PUT', '/admin/category/107', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796788135571458, 1, 'admin', '修改分类', 'PUT', '/admin/category/10701', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796788198486019, 1, 'admin', '修改分类', 'PUT', '/admin/category/10702', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796788324315138, 1, 'admin', '修改分类', 'PUT', '/admin/category/10705', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796788324315139, 1, 'admin', '修改分类', 'PUT', '/admin/category/10704', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062796788324315140, 1, 'admin', '修改分类', 'PUT', '/admin/category/10703', '127.0.0.1', '2026-06-05 15:20:53');
INSERT INTO `sys_operation_log` VALUES (2062915182465835010, 1, 'admin', '启用/禁用会员', 'PUT', '/admin/member/2062847231003889666/status', '127.0.0.1', '2026-06-05 23:11:21');
INSERT INTO `sys_operation_log` VALUES (2062915211360395266, 1, 'admin', '启用/禁用会员', 'PUT', '/admin/member/2062847231003889666/status', '127.0.0.1', '2026-06-05 23:11:28');
INSERT INTO `sys_operation_log` VALUES (2063497011711340546, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-07 13:43:20');
INSERT INTO `sys_operation_log` VALUES (2063531132680564737, 2062441501356679170, 'merchant', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-07 15:58:55');
INSERT INTO `sys_operation_log` VALUES (2064353027084701698, 1, 'admin', '订单发货', 'PUT', '/admin/order/2063497202405371906/ship', '127.0.0.1', '2026-06-09 22:24:50');
INSERT INTO `sys_operation_log` VALUES (2064354769046261762, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-06-09 22:31:45');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `menu_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 'SUPER_ADMIN', 1);
INSERT INTO `sys_role_menu` VALUES (2, 'SUPER_ADMIN', 2);
INSERT INTO `sys_role_menu` VALUES (3, 'SUPER_ADMIN', 3);
INSERT INTO `sys_role_menu` VALUES (4, 'BUYER', 1);
INSERT INTO `sys_role_menu` VALUES (5, 'BUYER', 2);
INSERT INTO `sys_role_menu` VALUES (6, 'SUPER_ADMIN', 4);
INSERT INTO `sys_role_menu` VALUES (7, 'SUPER_ADMIN', 5);
INSERT INTO `sys_role_menu` VALUES (8, 'SUPER_ADMIN', 6);
INSERT INTO `sys_role_menu` VALUES (9, 'SUPER_ADMIN', 7);
INSERT INTO `sys_role_menu` VALUES (10, 'SUPER_ADMIN', 8);
INSERT INTO `sys_role_menu` VALUES (11, 'SUPER_ADMIN', 9);
INSERT INTO `sys_role_menu` VALUES (12, 'SUPER_ADMIN', 10);
INSERT INTO `sys_role_menu` VALUES (13, 'SUPER_ADMIN', 11);
INSERT INTO `sys_role_menu` VALUES (14, 'SUPER_ADMIN', 12);
INSERT INTO `sys_role_menu` VALUES (15, 'SUPER_ADMIN', 13);
INSERT INTO `sys_role_menu` VALUES (16, 'SUPER_ADMIN', 14);
INSERT INTO `sys_role_menu` VALUES (17, 'SUPER_ADMIN', 15);
INSERT INTO `sys_role_menu` VALUES (18, 'SUPER_ADMIN', 16);
INSERT INTO `sys_role_menu` VALUES (19, 'SUPER_ADMIN', 17);
INSERT INTO `sys_role_menu` VALUES (20, 'SUPER_ADMIN', 18);
INSERT INTO `sys_role_menu` VALUES (21, 'SUPER_ADMIN', 19);
INSERT INTO `sys_role_menu` VALUES (22, 'SUPER_ADMIN', 20);
INSERT INTO `sys_role_menu` VALUES (23, 'SUPER_ADMIN', 21);
INSERT INTO `sys_role_menu` VALUES (24, 'SUPER_ADMIN', 22);
INSERT INTO `sys_role_menu` VALUES (25, 'SUPER_ADMIN', 23);
INSERT INTO `sys_role_menu` VALUES (26, 'SUPER_ADMIN', 24);
INSERT INTO `sys_role_menu` VALUES (27, 'SUPER_ADMIN', 25);
INSERT INTO `sys_role_menu` VALUES (28, 'SUPER_ADMIN', 26);
INSERT INTO `sys_role_menu` VALUES (33, 'SUPER_ADMIN', 31);
INSERT INTO `sys_role_menu` VALUES (34, 'SUPER_ADMIN', 32);
INSERT INTO `sys_role_menu` VALUES (35, 'OPERATOR', 1);
INSERT INTO `sys_role_menu` VALUES (36, 'OPERATOR', 2);
INSERT INTO `sys_role_menu` VALUES (37, 'OPERATOR', 3);
INSERT INTO `sys_role_menu` VALUES (38, 'OPERATOR', 4);
INSERT INTO `sys_role_menu` VALUES (39, 'OPERATOR', 5);
INSERT INTO `sys_role_menu` VALUES (40, 'OPERATOR', 6);
INSERT INTO `sys_role_menu` VALUES (41, 'OPERATOR', 7);
INSERT INTO `sys_role_menu` VALUES (42, 'OPERATOR', 8);
INSERT INTO `sys_role_menu` VALUES (43, 'OPERATOR', 9);
INSERT INTO `sys_role_menu` VALUES (44, 'OPERATOR', 10);
INSERT INTO `sys_role_menu` VALUES (45, 'OPERATOR', 11);
INSERT INTO `sys_role_menu` VALUES (46, 'OPERATOR', 12);
INSERT INTO `sys_role_menu` VALUES (47, 'OPERATOR', 13);
INSERT INTO `sys_role_menu` VALUES (48, 'OPERATOR', 14);
INSERT INTO `sys_role_menu` VALUES (49, 'OPERATOR', 15);
INSERT INTO `sys_role_menu` VALUES (50, 'OPERATOR', 16);
INSERT INTO `sys_role_menu` VALUES (51, 'OPERATOR', 17);
INSERT INTO `sys_role_menu` VALUES (52, 'OPERATOR', 18);
INSERT INTO `sys_role_menu` VALUES (53, 'OPERATOR', 19);
INSERT INTO `sys_role_menu` VALUES (54, 'OPERATOR', 20);
INSERT INTO `sys_role_menu` VALUES (55, 'OPERATOR', 21);
INSERT INTO `sys_role_menu` VALUES (56, 'OPERATOR', 22);
INSERT INTO `sys_role_menu` VALUES (57, 'MERCHANT', 27);
INSERT INTO `sys_role_menu` VALUES (58, 'MERCHANT', 28);
INSERT INTO `sys_role_menu` VALUES (59, 'MERCHANT', 29);
INSERT INTO `sys_role_menu` VALUES (60, 'MERCHANT', 30);
INSERT INTO `sys_role_menu` VALUES (61, 'CS', 5);
INSERT INTO `sys_role_menu` VALUES (62, 'CS', 9);
INSERT INTO `sys_role_menu` VALUES (63, 'CS', 18);
INSERT INTO `sys_role_menu` VALUES (64, 'CS', 23);
INSERT INTO `sys_role_menu` VALUES (65, 'CS', 24);
INSERT INTO `sys_role_menu` VALUES (66, 'CS', 25);
INSERT INTO `sys_role_menu` VALUES (67, 'CS', 26);
INSERT INTO `sys_role_menu` VALUES (68, 'BUYER', 1);
INSERT INTO `sys_role_menu` VALUES (69, 'SUPER_ADMIN', 33);
INSERT INTO `sys_role_menu` VALUES (70, 'OPERATOR', 33);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 1,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'BUYER',
  `deleted` tinyint NULL DEFAULT 0,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像URL',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username_deleted`(`username` ASC, `deleted` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2062441501356679171 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$oECl8Or8FORPTpmFARHexOm0DdA8z5gSpqyC96qD.wmCM2SADILnW', '管理员', NULL, NULL, 1, '2026-05-16 16:10:04', 'SUPER_ADMIN', 0, '2026-06-01 20:14:28', NULL);
INSERT INTO `sys_user` VALUES (2055674343352107010, 'zhangsan', '$2a$10$Dmy60CNBtsNGNFL16jPL4.p9fjcgboTN2MIrw.Hdb92kps6jXDRFi', '张三', NULL, NULL, 1, '2026-05-16 23:38:50', 'BUYER', 0, '2026-06-01 20:14:28', NULL);
INSERT INTO `sys_user` VALUES (2056639752335159297, 'tom', '$2a$10$vFXwzQk7oQBJHAF5wwIxR.Xfz57qTM8imqPJYAczZSw1pQC3/QAui', '汤姆', NULL, NULL, 1, '2026-05-19 15:35:02', 'BUYER', 1, '2026-06-01 20:14:28', NULL);
INSERT INTO `sys_user` VALUES (2056651952303071233, 'peter', '$2a$10$GjZDtwq7.39jKG2UyyzbbuXk6IlDVbV/D9FpNaBgo1I2umu4F3n.y', '皮特', NULL, NULL, 1, '2026-05-19 16:23:31', 'BUYER', 0, '2026-06-01 20:14:28', NULL);
INSERT INTO `sys_user` VALUES (2056695331091046402, 'guangtouqiang', '$2a$10$7KaonMunQQbNmoaKSPiuy.j.Je4JO93yolWsycfn9FB35DjVdDqm6', '光头强', '', '', 1, '2026-05-19 19:15:53', 'BUYER', 0, '2026-06-01 20:14:28', '/uploads/5a2af21e-1b8a-4060-bcfb-08bbcf6700b4.jpg');
INSERT INTO `sys_user` VALUES (2056695331942490113, 'lisi', '$2a$10$CMVCJ9IW1zKQOGzZjk4ZWOCGjOAxRAuKiJiq08thhOQTqomIz2X/O', '李四', NULL, NULL, 1, '2026-05-19 19:15:53', 'BUYER', 0, '2026-06-01 20:14:28', NULL);
INSERT INTO `sys_user` VALUES (2056695332198342658, 'wangwu', '$2a$10$RRwNucBYPP5ZKusfPuxtL.QgIqxpqVesKqqtj9PKfx6aN.u1L.4BW', '王五', NULL, NULL, 1, '2026-05-19 19:15:53', 'BUYER', 1, '2026-06-01 20:14:28', NULL);
INSERT INTO `sys_user` VALUES (2059163359330369538, 'laoliu', '$2a$10$iTX3gyweTEJyZvy46s1iM.QBcDWVaiofaGJjXvSU.hV/viMV0YWTK', '老六', NULL, NULL, 1, '2026-05-26 14:42:57', 'BUYER', 1, '2026-06-01 20:14:28', NULL);
INSERT INTO `sys_user` VALUES (2059165763320872962, 'laoliu_del_1779781258247_2059165763320872962', '$2a$10$5lMzGCZNUdxM74iPgX/0cezXmFKLf0bbaGJaACz2Cw/kWvl.BgtbC', '老六', NULL, NULL, 1, '2026-05-26 14:52:30', 'BUYER', 1, '2026-06-01 20:14:28', NULL);
INSERT INTO `sys_user` VALUES (2059174805271400449, 'zjq_del_1779781255966_2059174805271400449', '$2a$10$F0kcciNCfOAgvyHaAPUApedtGnxjEtwkv9FDbr/FXfHJwgUsEr41q', '张达猪', NULL, NULL, 1, '2026-05-26 15:28:26', 'BUYER', 1, '2026-06-01 20:14:28', NULL);
INSERT INTO `sys_user` VALUES (2059178041382477826, 'laoliu', '$2a$10$iUW8V.U/nc.MpHMJOPJhJeQtD6SLIXpyIHc3bee/5DFa/.4Ir2xZG', '老六', NULL, NULL, 1, '2026-05-26 15:41:17', 'BUYER', 0, '2026-06-01 20:14:28', NULL);
INSERT INTO `sys_user` VALUES (2059226432355373058, 'xionger', '$2a$10$g25sljv.H5Xn2WqxHfKAguWRQbVrInWKApzj16Mh2YthnwTP2l0oW', '熊二', NULL, NULL, 1, '2026-05-26 18:53:35', 'BUYER', 0, '2026-06-01 20:14:28', '/uploads/a7836e21-7ba3-456d-8a4e-3c3195308722.jpg');
INSERT INTO `sys_user` VALUES (2062441501356679170, 'merchant', '$2a$10$XjM5XFf2O2h5RDWHcyEm..HAMj8oEi.vWRj5vmVjQcio0TlQTz8wy', '商家', NULL, NULL, 1, '2026-06-04 15:49:07', 'MERCHANT', 0, '2026-06-04 15:49:07', '');

-- ----------------------------
-- Table structure for ums_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_address`;
CREATE TABLE `ums_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `member_id` bigint NOT NULL COMMENT '会员ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货人姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收货人手机号',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市',
  `district` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `is_default` tinyint NULL DEFAULT 0 COMMENT '是否默认地址',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '收货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_address
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` tinyint NULL DEFAULT 0 COMMENT '0-未知 1-男 2-女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `member_level` tinyint NULL DEFAULT 1 COMMENT '会员等级',
  `status` tinyint NULL DEFAULT 1 COMMENT '0-禁用 1-启用',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2062847746051817475 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member
-- ----------------------------
INSERT INTO `ums_member` VALUES (1, 'zhangsan', '$2a$10$dummy', '张三', '13800001111', 'zhangsan@qq.com', NULL, 1, NULL, 1, 1, '2026-05-22 23:36:52', '2026-05-22 23:43:00', 0);
INSERT INTO `ums_member` VALUES (2, 'lisi', '$2a$10$dummy', '李四', '13900002222', 'lisi@qq.com', NULL, 2, NULL, 2, 1, '2026-05-22 23:36:52', '2026-05-22 23:43:04', 0);
INSERT INTO `ums_member` VALUES (3, 'wangwu', '$2a$10$dummy', '王五', '13700003333', 'wangwu@qq.com', NULL, 1, NULL, 1, 1, '2026-05-22 23:36:52', '2026-05-23 01:47:19', 0);
INSERT INTO `ums_member` VALUES (2062847231003889666, 'test', '$2a$10$Tj0irQNy3.ok2v3inuCnKusqJrio4qVCvVJJZXvuxbcs8j0IA2wvG', 'TEST_MEMBER', NULL, NULL, NULL, 0, NULL, 1, 1, '2026-06-05 18:41:20', '2026-06-05 18:41:20', 0);
INSERT INTO `ums_member` VALUES (2062847746051817474, 'test1', '$2a$10$0CDdg3WxbpRjDf5p93522uLjmHULNmurbPJ3SOhxukUvFV0cJnYK.', 'TEST1', NULL, NULL, NULL, 0, NULL, 1, 1, '2026-06-05 18:43:23', '2026-06-05 18:43:23', 0);

SET FOREIGN_KEY_CHECKS = 1;

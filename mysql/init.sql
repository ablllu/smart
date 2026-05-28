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

 Date: 28/05/2026 20:01:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_no`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES (1, '20260522000000001', 1, 12999.00, 12999.00, 0.00, NULL, NULL, 4, '张三', '13800001111', '广东省深圳市南山区科技园路1号', '请尽快发货', '2026-05-22 09:30:00', '2026-05-22 23:37:51', 0);
INSERT INTO `oms_order` VALUES (2, '20260522000000002', 2, 16998.00, 16998.00, 0.00, 1, '2026-05-22 10:00:00', 2, '李四', '13900002222', '北京市朝阳区望京SOHO T1 10F', '送礼用，请包装好', '2026-05-22 09:45:00', '2026-05-22 23:37:51', 0);
INSERT INTO `oms_order` VALUES (3, '20260522000000003', 3, 5699.00, 5699.00, 10.00, 2, '2026-05-21 15:30:00', 2, '王五', '13700003333', '上海市浦东新区张江高科技园区', '', '2026-05-21 15:20:00', '2026-05-22 23:37:51', 0);
INSERT INTO `oms_order` VALUES (4, '20260521000000004', 1, 6999.00, 6999.00, 0.00, 1, '2026-05-21 08:00:00', 3, '张三', '13800001111', '广东省深圳市南山区科技园路1号', '', '2026-05-21 07:50:00', '2026-05-22 23:37:51', 0);
INSERT INTO `oms_order` VALUES (5, '20260520000000005', 2, 14248.00, 14248.00, 0.00, 3, NULL, 4, '李四', '13900002222', '北京市朝阳区望京SOHO T1 10F', '不想要了', '2026-05-20 12:00:00', '2026-05-22 23:37:51', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

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
INSERT INTO `pms_category` VALUES (15, '鲜花绿植', 0, 'flower', 15, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
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
INSERT INTO `pms_category` VALUES (1501, '鲜花', 15, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1502, '绿植盆栽', 15, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1503, '仿真花艺', 15, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (1504, '园艺工具', 15, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
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
INSERT INTO `pms_category` VALUES (150101, '玫瑰花束', 1501, '', 1, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (150102, '百合花束', 1501, '', 2, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (150103, '向日葵', 1501, '', 3, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (150104, '康乃馨', 1501, '', 4, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
INSERT INTO `pms_category` VALUES (150105, '混搭花束', 1501, '', 5, 1, '2026-05-21 20:41:54', '2026-05-21 20:41:54', 0);
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2057693667856125954 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品SPU表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_spu
-- ----------------------------
INSERT INTO `pms_spu` VALUES (1, 'iPhone 16 Pro Max', 10101, 'Apple', '<p>A18 Pro芯片 | 6.9英寸OLED屏 | 钛金属边框 | 4800万三摄</p>', '/uploads/product/iphone16pm.jpg', '[\"/uploads/product/iphone16pm_1.jpg\",\"/uploads/product/iphone16pm_2.jpg\",\"/uploads/product/iphone16pm_3.jpg\"]', 1, 12890, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (2, '华为 Mate 70 Pro', 10101, '华为', '<p>麒麟9100芯片 | 6.8英寸OLED曲面屏 | 卫星通信 | 5000万XMAGE影像</p>', '/uploads/product/mate70pro.jpg', '[\"/uploads/product/mate70pro_1.jpg\",\"/uploads/product/mate70pro_2.jpg\"]', 1, 9870, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (3, '小米 15 Pro', 10101, '小米', '<p>骁龙8 Gen4 | 6.73英寸2K屏 | 徕卡光学镜头 | 120W快充</p>', '/uploads/product/mi15pro.jpg', '[\"/uploads/product/mi15pro_1.jpg\",\"/uploads/product/mi15pro_2.jpg\"]', 1, 7650, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (4, 'OPPO Find X7 Ultra', 10101, 'OPPO', '<p>骁龙8 Gen4 | 6.82英寸曲面屏 | 哈苏影像 | 100W超级闪充</p>', '/uploads/product/findx7u.jpg', '[\"/uploads/product/findx7u_1.jpg\",\"/uploads/product/findx7u_2.jpg\"]', 1, 5420, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (5, 'vivo X200 Pro', 10101, 'vivo', '<p>天玑9400 | 6.78英寸AMOLED | 蔡司超级长焦 | 蓝海超充</p>', '/uploads/product/vivox200p.jpg', '[\"/uploads/product/vivox200p_1.jpg\",\"/uploads/product/vivox200p_2.jpg\"]', 1, 4890, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (6, '三星 Galaxy S25 Ultra', 10101, 'Samsung', '<p>骁龙8 Gen4 | 6.9英寸Dynamic AMOLED | S Pen | 2亿像素主摄</p>', '/uploads/product/s25u.jpg', '[\"/uploads/product/s25u_1.jpg\",\"/uploads/product/s25u_2.jpg\"]', 1, 3120, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (7, '荣耀 Magic7 Pro', 10101, '荣耀', '<p>骁龙8 Gen4 | 6.8英寸绿洲护眼屏 | 青海湖电池 | 卫星通信</p>', '/uploads/product/magic7pro.jpg', '[\"/uploads/product/magic7pro_1.jpg\",\"/uploads/product/magic7pro_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (8, '一加 13', 10101, '一加', '<p>骁龙8 Gen4 | 6.82英寸东方屏 | 哈苏影像 | 100W快充</p>', '/uploads/product/oneplus13.jpg', '[\"/uploads/product/oneplus13_1.jpg\",\"/uploads/product/oneplus13_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (9, '华为 Mate X6 典藏版', 10102, '华为', '<p>麒麟9100 | 7.93英寸折叠大屏 | 玄武钢化玻璃 | 卫星通话</p>', '/uploads/product/matex6.jpg', '[\"/uploads/product/matex6_1.jpg\",\"/uploads/product/matex6_2.jpg\"]', 1, 2850, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (10, '荣耀 Magic V3', 10102, '荣耀', '<p>骁龙8 Gen4 | 7.92英寸内屏 | 钛合金铰链 | 青海湖双电池</p>', '/uploads/product/magicv3.jpg', '[\"/uploads/product/magicv3_1.jpg\",\"/uploads/product/magicv3_2.jpg\"]', 1, 1930, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (11, '小米 MIX Fold 4', 10102, '小米', '<p>骁龙8 Gen4 | 8.03英寸内屏 | 徕卡全焦段四摄 | 龙骨转轴</p>', '/uploads/product/mixfold4.jpg', '[\"/uploads/product/mixfold4_1.jpg\",\"/uploads/product/mixfold4_2.jpg\"]', 1, 1560, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (12, 'OPPO Find N4', 10102, 'OPPO', '<p>骁龙8 Gen4 | 7.8英寸内屏 | 精工铰链 | 哈苏影像</p>', '/uploads/product/findn4.jpg', '[\"/uploads/product/findn4_1.jpg\",\"/uploads/product/findn4_2.jpg\"]', 1, 1120, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (13, 'Apple Watch Series 10', 103, 'Apple', '<p>S10芯片 | 全天候视网膜显示屏 | 体温感应 | 水深计</p>', '/uploads/product/aw10.jpg', '[\"/uploads/product/aw10_1.jpg\",\"/uploads/product/aw10_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (14, '华为 Watch GT 5 Pro', 103, '华为', '<p>蓝宝石表镜 | 14天长续航 | ECG心电分析 | 高尔夫模式</p>', '/uploads/product/hwgt5.jpg', '[\"/uploads/product/hwgt5_1.jpg\",\"/uploads/product/hwgt5_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (15, '小米 Watch S4 Sport', 103, '小米', '<p>钛合金表体 | 1.43英寸AMOLED | eSIM独立通话 | 150+运动模式</p>', '/uploads/product/mis4.jpg', '[\"/uploads/product/mis4_1.jpg\",\"/uploads/product/mis4_2.jpg\"]', 1, 3450, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (16, 'OPPO Watch X', 103, 'OPPO', '<p>骁龙W5 Gen2 | 1.5英寸AMOLED | 全智能模式 | 85+运动模式</p>', '/uploads/product/oppowx.jpg', '[\"/uploads/product/oppowx_1.jpg\",\"/uploads/product/oppowx_2.jpg\"]', 1, 2100, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (17, 'AirPods Pro 3', 10701, 'Apple', '<p>H3芯片 | 自适应降噪 | 空间音频 | USB-C接口 | 6小时续航</p>', '/uploads/product/app3.jpg', '[\"/uploads/product/app3_1.jpg\",\"/uploads/product/app3_2.jpg\"]', 1, 9870, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (18, '华为 FreeBuds Pro 4', 10701, '华为', '<p>智慧动态降噪 | 超感知原声双单元 | 星闪连接 | 36h续航</p>', '/uploads/product/hwfb4.jpg', '[\"/uploads/product/hwfb4_1.jpg\",\"/uploads/product/hwfb4_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (19, '小米 Buds 5 Pro', 10701, '小米', '<p>圈铁同轴三单元 | Hi-Res Audio | 独立空间音频 | LHDC 5.0</p>', '/uploads/product/mibuds5.jpg', '[\"/uploads/product/mibuds5_1.jpg\",\"/uploads/product/mibuds5_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (20, 'OPPO Enco X3', 10701, 'OPPO', '<p>同轴双单元 | 丹拿联合调音 | LDAC高清传输 | 49dB降噪</p>', '/uploads/product/encox3.jpg', '[\"/uploads/product/encox3_1.jpg\",\"/uploads/product/encox3_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (21, '索尼 WF-1000XM6', 10701, 'Sony', '<p>全新集成处理器V3 | Hi-Res Audio | 骨传导通话 | 8h续航</p>', '/uploads/product/sonyxm6.jpg', '[\"/uploads/product/sonyxm6_1.jpg\",\"/uploads/product/sonyxm6_2.jpg\"]', 1, 2870, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (22, 'AirPods Max 2', 10702, 'Apple', '<p>H2芯片 | 自适应降噪 | 空间音频 | 数码旋钮 | 20h续航</p>', '/uploads/product/apm2.jpg', '[\"/uploads/product/apm2_1.jpg\",\"/uploads/product/apm2_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (23, '索尼 WH-1000XM6', 10702, 'Sony', '<p>双芯降噪系统 | 碳纤维振膜 | Hi-Res Audio | 30h续航</p>', '/uploads/product/whxm6.jpg', '[\"/uploads/product/whxm6_1.jpg\",\"/uploads/product/whxm6_2.jpg\"]', 1, 4560, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (24, 'Bose QC Ultra', 10702, 'Bose', '<p>空间音频 | CustomTune智能调音 | 沉浸式音效 | 24h续航</p>', '/uploads/product/boseqc.jpg', '[\"/uploads/product/boseqc_1.jpg\",\"/uploads/product/boseqc_2.jpg\"]', 1, 3120, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (25, 'JBL Flip 7', 10703, 'JBL', '<p>赛道扬声器 | IP68防水 | 12h续航 | PartyBoost串联</p>', '/uploads/product/jblflip7.jpg', '[\"/uploads/product/jblflip7_1.jpg\",\"/uploads/product/jblflip7_2.jpg\"]', 1, 5670, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (26, 'Marshall Emberton III', 10703, 'Marshall', '<p>经典复古造型 | 360°环绕音 | IP67防水 | 32h超长续航</p>', '/uploads/product/marshalle3.jpg', '[\"/uploads/product/marshalle3_1.jpg\",\"/uploads/product/marshalle3_2.jpg\"]', 1, 3450, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (27, '华为 Sound Joy 2', 10703, '华为', '<p>帝瓦雷联合调音 | IP67防水 | NFC一碰传 | 26h续航</p>', '/uploads/product/hwsj2.jpg', '[\"/uploads/product/hwsj2_1.jpg\",\"/uploads/product/hwsj2_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (28, '氮化镓充电器 100W', 10402, 'Anker', '<p>三口快充 | GaN氮化镓 | 100W大功率 | 折叠插脚</p>', '/uploads/product/anker100w.jpg', '[\"/uploads/product/anker100w_1.jpg\",\"/uploads/product/anker100w_2.jpg\"]', 1, 8760, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (29, '氮化镓充电器 65W', 10402, '倍思', '<p>双C口+U口 | 65W快充 | 可折叠插脚 | 支持笔记本</p>', '/uploads/product/baseus65w.jpg', '[\"/uploads/product/baseus65w_1.jpg\",\"/uploads/product/baseus65w_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (30, '无线充电板 15W', 10402, '小米', '<p>Qi认证 | 15W快充 | 双线圈 | LED指示灯 | 异物检测</p>', '/uploads/product/miwireless.jpg', '[\"/uploads/product/miwireless_1.jpg\",\"/uploads/product/miwireless_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (31, '小米磁吸充电宝 10000mAh', 10406, '小米', '<p>MagSafe磁吸 | 10000mAh | 15W无线+有线快充 | 轻薄机身</p>', '/uploads/product/mimagsafe.jpg', '[\"/uploads/product/mimagsafe_1.jpg\",\"/uploads/product/mimagsafe_2.jpg\"]', 1, 7650, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (32, '罗马仕 20000mAh快充', 10406, '罗马仕', '<p>20000mAh大容量 | 22.5W快充 | 三输入四输出 | LED电量显示</p>', '/uploads/product/romoss20000.jpg', '[\"/uploads/product/romoss20000_1.jpg\",\"/uploads/product/romoss20000_2.jpg\"]', 1, 9870, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (33, 'Anker PowerCore+ 26800mAh', 10406, 'Anker', '<p>26800mAh | 60W PD快充 | 双USB-C | 可充笔记本</p>', '/uploads/product/anker26800.jpg', '[\"/uploads/product/anker26800_1.jpg\",\"/uploads/product/anker26800_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (34, 'MacBook Air 15英寸 M4', 20101, 'Apple', '<p>M4芯片 | 15.3英寸Liquid Retina | 18h续航 | 1.51kg</p>', '/uploads/product/mba15m4.jpg', '[\"/uploads/product/mba15m4_1.jpg\",\"/uploads/product/mba15m4_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (35, 'MateBook X Pro 2025', 20101, '华为', '<p>Ultra9 285H | 14.2英寸OLED | 触控屏 | 980g超轻机身</p>', '/uploads/product/matebookxp.jpg', '[\"/uploads/product/matebookxp_1.jpg\",\"/uploads/product/matebookxp_2.jpg\"]', 1, 3670, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (36, 'ThinkBook 14+ 2025', 20101, '联想', '<p>Ultra7 265H | 14英寸2.8K | 120Hz高刷 | 全接口</p>', '/uploads/product/thinkbook14.jpg', '[\"/uploads/product/thinkbook14_1.jpg\",\"/uploads/product/thinkbook14_2.jpg\"]', 1, 4560, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (37, '小米笔记本 Pro 16', 20101, '小米', '<p>Ultra9 285H | 16英寸3.1K OLED | 触控屏 | CNC一体机身</p>', '/uploads/product/mibookpro16.jpg', '[\"/uploads/product/mibookpro16_1.jpg\",\"/uploads/product/mibookpro16_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (38, 'ROG 枪神9 Plus', 20102, 'ROG', '<p>i9-14900HX | RTX 5070 | 18英寸2.5K 240Hz | 星云屏</p>', '/uploads/product/rog9p.jpg', '[\"/uploads/product/rog9p_1.jpg\",\"/uploads/product/rog9p_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (39, '联想拯救者 Y9000P 2025', 20102, '联想', '<p>i9-14900HX | RTX 5070 | 16英寸2.5K 240Hz | 140W满血</p>', '/uploads/product/y9000p.jpg', '[\"/uploads/product/y9000p_1.jpg\",\"/uploads/product/y9000p_2.jpg\"]', 1, 4560, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (40, '暗影精灵 10', 20102, '惠普', '<p>i7-14700HX | RTX 5070 | 16.1英寸QHD 240Hz | 四区RGB键盘</p>', '/uploads/product/omen10.jpg', '[\"/uploads/product/omen10_1.jpg\",\"/uploads/product/omen10_2.jpg\"]', 1, 2870, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (41, 'Dell U3224KB 32英寸 6K', 203, 'Dell', '<p>32英寸IPS Black | 6K分辨率 | Thunderbolt 4 | 内置摄像头</p>', '/uploads/product/dellu3224.jpg', '[\"/uploads/product/dellu3224_1.jpg\",\"/uploads/product/dellu3224_2.jpg\"]', 1, 1230, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (42, 'LG 27GP950 27英寸 4K 160Hz', 203, 'LG', '<p>27英寸Nano IPS | 4K 160Hz | HDMI 2.1 | G-Sync Compatible</p>', '/uploads/product/lg27gp950.jpg', '[\"/uploads/product/lg27gp950_1.jpg\",\"/uploads/product/lg27gp950_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (43, '红魔 5088 电竞显示器', 203, '红魔', '<p>27英寸MiniLED | 4K 160Hz / FHD 320Hz双模 | 1152分区</p>', '/uploads/product/redmagic5088.jpg', '[\"/uploads/product/redmagic5088_1.jpg\",\"/uploads/product/redmagic5088_2.jpg\"]', 1, 1890, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (44, 'MX Keys S 无线键盘', 20501, 'Logitech', '<p>Perfect Stroke按键 | 多设备切换 | 智能背光 | USB-C充电</p>', '/uploads/product/mxkeyss.jpg', '[\"/uploads/product/mxkeyss_1.jpg\",\"/uploads/product/mxkeyss_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (45, 'Apex Pro TKL 磁轴键盘', 20501, 'SteelSeries', '<p>OmniPoint 2.0磁轴 | 快速触发 | 87键紧凑布局 | OLED屏幕</p>', '/uploads/product/apexpro.jpg', '[\"/uploads/product/apexpro_1.jpg\",\"/uploads/product/apexpro_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (46, 'Keychron Q6 Max 机械键盘', 20501, 'Keychron', '<p>Gasket结构 | 佳达隆木星轴 | 双色注塑PBT键帽 | QMK/VIA</p>', '/uploads/product/keychronq6.jpg', '[\"/uploads/product/keychronq6_1.jpg\",\"/uploads/product/keychronq6_2.jpg\"]', 1, 1870, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (47, 'MX Master 4S 无线鼠标', 20502, 'Logitech', '<p>8000DPI | 电磁滚轮 | 多设备跨屏 | USB-C快充 | 人体工学</p>', '/uploads/product/mxmaster4s.jpg', '[\"/uploads/product/mxmaster4s_1.jpg\",\"/uploads/product/mxmaster4s_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (48, 'GPW 3 狗屁王三代', 20502, 'Logitech', '<p>HERO 3传感器 | 32000DPI | 60g轻量化 | LIGHTSPEED无线</p>', '/uploads/product/gpw3.jpg', '[\"/uploads/product/gpw3_1.jpg\",\"/uploads/product/gpw3_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (49, '毒蝰 V4 Pro', 20502, 'Razer', '<p>Focus Pro 35K传感器 | 58g轻量 | 8000Hz轮询 | 第三代光微动</p>', '/uploads/product/viperv4.jpg', '[\"/uploads/product/viperv4_1.jpg\",\"/uploads/product/viperv4_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (50, '格力 冷静王+ 1.5匹 新一级', 30101, '格力', '<p>1.5匹变频 | 新一级能效 | 56℃净菌自洁 | 18分贝低噪</p>', '/uploads/product/gree15.jpg', '[\"/uploads/product/gree15_1.jpg\",\"/uploads/product/gree15_2.jpg\"]', 1, 7650, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (51, '美的 风尊 大1.5匹 新一级', 30101, '美的', '<p>大1.5匹变频 | 180°旋转风 | 新一级能效 | 第四代智清洁</p>', '/uploads/product/midea15.jpg', '[\"/uploads/product/midea15_1.jpg\",\"/uploads/product/midea15_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (52, '海尔 劲爽 1.5匹 新一级', 30101, '海尔', '<p>1.5匹变频 | 56℃高温自清洁 | PMV舒适模式 | 17分贝</p>', '/uploads/product/haier15.jpg', '[\"/uploads/product/haier15_1.jpg\",\"/uploads/product/haier15_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (53, '小天鹅 水魔方 10kg洗烘一体', 302, '小天鹅', '<p>10kg洗+7kg烘 | 水魔方冷水洗 | U.2紫外线除菌 | 超薄嵌入</p>', '/uploads/product/littleswan10.jpg', '[\"/uploads/product/littleswan10_1.jpg\",\"/uploads/product/littleswan10_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (54, '海尔 精华洗 10kg', 302, '海尔', '<p>10kg变频 | 精华湿洗科技 | 双喷淋 | 智能投放 | 超薄525mm</p>', '/uploads/product/haier10.jpg', '[\"/uploads/product/haier10_1.jpg\",\"/uploads/product/haier10_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (55, '西门子 iQ500 10kg洗烘一体', 302, '西门子', '<p>10kg洗+6kg烘 | i-Dos智能投放 | 热风清新 | BLDC变频</p>', '/uploads/product/siemens10.jpg', '[\"/uploads/product/siemens10_1.jpg\",\"/uploads/product/siemens10_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (56, '容声 513L 双系统十字对开', 303, '容声', '<p>513L大容量 | 双系统循环 | 全空间净化 | -34℃深冷锁鲜</p>', '/uploads/product/ronshen513.jpg', '[\"/uploads/product/ronshen513_1.jpg\",\"/uploads/product/ronshen513_2.jpg\"]', 1, 3450, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (57, '卡萨帝 555L 法式多门', 303, '卡萨帝', '<p>555L | MSA控氧保鲜 | 双重杀菌净化 | 自由嵌入安装</p>', '/uploads/product/casarte555.jpg', '[\"/uploads/product/casarte555_1.jpg\",\"/uploads/product/casarte555_2.jpg\"]', 1, 2100, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (58, '美的 508L 微晶一周鲜', 303, '美的', '<p>508L | PST智能净化 | 微晶一周鲜 | -32℃深冷锁鲜</p>', '/uploads/product/midea508.jpg', '[\"/uploads/product/midea508_1.jpg\",\"/uploads/product/midea508_2.jpg\"]', 1, 2870, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (59, '苏泊尔 IH球釜电饭煲 4L', 30401, '苏泊尔', '<p>IH电磁加热 | 球釜内胆 | 24h预约 | 4L容量 | 触控面板</p>', '/uploads/product/suporih.jpg', '[\"/uploads/product/suporih_1.jpg\",\"/uploads/product/suporih_2.jpg\"]', 1, 8760, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (60, '美的 纤V 电饭煲 3L', 30401, '美的', '<p>IH加热 | 备长炭铜釜 | 智能感温系统 | 3L容量 | 超薄机身</p>', '/uploads/product/mideaih.jpg', '[\"/uploads/product/mideaih_1.jpg\",\"/uploads/product/mideaih_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (61, '飞利浦 空气炸锅 6.2L', 30405, '飞利浦', '<p>Rapid Air高速热风 | 少油健康 | 6.2L大容量 | 触控面板</p>', '/uploads/product/philipsaf.jpg', '[\"/uploads/product/philipsaf_1.jpg\",\"/uploads/product/philipsaf_2.jpg\"]', 1, 7650, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (62, '九阳 可视空气炸锅 5L', 30405, '九阳', '<p>可视窗口 | 360°热风循环 | 5L容量 | 12大菜单 | 不粘内胆</p>', '/uploads/product/joyoungaf.jpg', '[\"/uploads/product/joyoungaf_1.jpg\",\"/uploads/product/joyoungaf_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (63, '石头 G30 自清洁扫拖机器人', 30501, '石头', '<p>7000Pa吸力 | 热水洗拖布 | 全能基站 | 避障系统4.0</p>', '/uploads/product/roborockg30.jpg', '[\"/uploads/product/roborockg30_1.jpg\",\"/uploads/product/roborockg30_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (64, '科沃斯 X5 PRO', 30501, '科沃斯', '<p>12800Pa吸力 | 全能基站 | 方圆形机身 | AIVI 3D避障</p>', '/uploads/product/ecovacsx5.jpg', '[\"/uploads/product/ecovacsx5_1.jpg\",\"/uploads/product/ecovacsx5_2.jpg\"]', 1, 3450, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (65, '追觅 X50 Ultra', 30501, '追觅', '<p>19500Pa吸力 | 仿生机械臂 | 热水洗拖布 | 全能基站</p>', '/uploads/product/dreamex50.jpg', '[\"/uploads/product/dreamex50_1.jpg\",\"/uploads/product/dreamex50_2.jpg\"]', 1, 2870, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (66, '小米电视 S Pro 85英寸', 30701, '小米', '<p>85英寸MiniLED | 4K 144Hz | 2400nits | 240分区 | HyperOS</p>', '/uploads/product/mitv85.jpg', '[\"/uploads/product/mitv85_1.jpg\",\"/uploads/product/mitv85_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (67, 'TCL Q10K Pro 75英寸', 30701, 'TCL', '<p>75英寸QD-MiniLED | 4K 144Hz | 5000nits | 5000+分区</p>', '/uploads/product/tcl75q10k.jpg', '[\"/uploads/product/tcl75q10k_1.jpg\",\"/uploads/product/tcl75q10k_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (68, '海信 U8N 65英寸', 30701, '海信', '<p>65英寸ULED X | 5000nits | 2000+分区 | 信芯AI画质芯片</p>', '/uploads/product/hisense65u8n.jpg', '[\"/uploads/product/hisense65u8n_1.jpg\",\"/uploads/product/hisense65u8n_2.jpg\"]', 1, 1870, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (69, '法式复古碎花连衣裙', 40101, '伊芙丽', '<p>100%桑蚕丝 | 法式V领 | 收腰A字版型 | 中长款 | 优雅碎花</p>', '/uploads/product/floraldress.jpg', '[\"/uploads/product/floraldress_1.jpg\",\"/uploads/product/floraldress_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (70, '通勤垂感直筒连衣裙', 40101, '太平鸟', '<p>醋酸混纺面料 | 直筒版型 | 简约纯色 | 职场通勤 | 中长款</p>', '/uploads/product/office_dress.jpg', '[\"/uploads/product/office_dress_1.jpg\",\"/uploads/product/office_dress_2.jpg\"]', 1, 3450, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (71, '纯棉宽松印花T恤', 40102, '优衣库', '<p>100%新疆长绒棉 | 210g重磅 | 宽松落肩 | 原创印花</p>', '/uploads/product/cottontee.jpg', '[\"/uploads/product/cottontee_1.jpg\",\"/uploads/product/cottontee_2.jpg\"]', 1, 8760, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (72, '冰氧吧凉感T恤', 40102, '森马', '<p>冰氧吧面料 | 接触凉感 | UPF50+防晒 | 宽松版型 | 多色可选</p>', '/uploads/product/icete.jpg', '[\"/uploads/product/icete_1.jpg\",\"/uploads/product/icete_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (73, '商务休闲轻奢夹克', 40201, '海澜之家', '<p>高支棉面料 | 立领设计 | 商务休闲两穿 | 防风保暖</p>', '/uploads/product/bizjacket.jpg', '[\"/uploads/product/bizjacket_1.jpg\",\"/uploads/product/bizjacket_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (74, '防泼水户外机能夹克', 40201, '探路者', '<p>防泼水面料 | 多口袋设计 | 连帽可收纳 | 轻薄透气</p>', '/uploads/product/outdoorjacket.jpg', '[\"/uploads/product/outdoorjacket_1.jpg\",\"/uploads/product/outdoorjacket_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (75, '免烫抗皱修身衬衫', 40202, '报喜鸟', '<p>100%长绒棉 | 免烫抗皱科技 | 修身版型 | 八字领 | 商务正装</p>', '/uploads/product/nonironshirt.jpg', '[\"/uploads/product/nonironshirt_1.jpg\",\"/uploads/product/nonironshirt_2.jpg\"]', 1, 4560, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (76, '弹力牛津纺衬衫', 40202, '凡客诚品', '<p>弹力牛津纺 | 经典领尖扣 | 加厚密织 | 不缩水不变形</p>', '/uploads/product/oxfordshirt.jpg', '[\"/uploads/product/oxfordshirt_1.jpg\",\"/uploads/product/oxfordshirt_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (77, 'Air Zoom Pegasus 42', 40401, 'Nike', '<p>ZoomX泡棉 | Flyknit鞋面 | 前后掌Zoom Air | 公路跑鞋</p>', '/uploads/product/pegasus42.jpg', '[\"/uploads/product/pegasus42_1.jpg\",\"/uploads/product/pegasus42_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (78, 'Ultraboost 5.0 DNA', 40401, 'Adidas', '<p>BOOST中底 | Primeknit+编织鞋面 | LEP推进系统 | 城市跑鞋</p>', '/uploads/product/ub5.jpg', '[\"/uploads/product/ub5_1.jpg\",\"/uploads/product/ub5_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (79, '飞影PB 5.0 碳板跑鞋', 40401, '乔丹', '<p>全掌碳板 | 超临界物理发泡 | 轻量化 | 竞赛级马拉松鞋</p>', '/uploads/product/feiyingpb5.jpg', '[\"/uploads/product/feiyingpb5_1.jpg\",\"/uploads/product/feiyingpb5_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (80, 'Explorer 探索者双肩包', 40501, 'TUMI', '<p>弹道尼龙 | FXT保护层 | 15英寸笔记本仓 | RFID防盗</p>', '/uploads/product/tumiexplorer.jpg', '[\"/uploads/product/tumiexplorer_1.jpg\",\"/uploads/product/tumiexplorer_2.jpg\"]', 1, 2100, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (81, '休闲简约双肩包', 40501, '小米', '<p>防泼水面料 | 15.6英寸笔记本仓 | YKK拉链 | 透气背板</p>', '/uploads/product/mibackpack.jpg', '[\"/uploads/product/mibackpack_1.jpg\",\"/uploads/product/mibackpack_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (82, '户外徒步登山背包 40L', 40501, '探路者', '<p>40L大容量 | 背负系统 | 防雨罩 | 多点外挂 | 水袋仓</p>', '/uploads/product/trekking40.jpg', '[\"/uploads/product/trekking40_1.jpg\",\"/uploads/product/trekking40_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (83, '黑绷带活颜修护面霜 50ml', 50101, '赫莲娜', '<p>30%玻色因 | 夜间修护抗老 | 舒缓修复 | 贵妇面霜</p>', '/uploads/product/hrblackband.jpg', '[\"/uploads/product/hrblackband_1.jpg\",\"/uploads/product/hrblackband_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (84, '红宝石面霜 3.0 50g', 50101, '珀莱雅', '<p>超分子维A醇 | 胜肽组合 | 淡纹紧致 | 温和不刺激</p>', '/uploads/product/proyaruby.jpg', '[\"/uploads/product/proyaruby_1.jpg\",\"/uploads/product/proyaruby_2.jpg\"]', 1, 8760, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (85, '玻尿酸水光面膜 5片装', 50103, '敷尔佳', '<p>医用重组胶原蛋白 | 补水修复 | 械字号 | 敏感肌可用</p>', '/uploads/product/fuerjia.jpg', '[\"/uploads/product/fuerjia_1.jpg\",\"/uploads/product/fuerjia_2.jpg\"]', 1, 9870, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (86, '安瓶鲜注精华面膜 5片', 50103, '自然堂', '<p>烟酰胺+传明酸 | 膜液分离 | 新鲜激活 | 提亮肤色</p>', '/uploads/product/zrtmask.jpg', '[\"/uploads/product/zrtmask_1.jpg\",\"/uploads/product/zrtmask_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (87, '小羊皮高定唇膏 #306', 50201, '纪梵希', '<p>真皮压纹管身 | 丝缎质地 | 高定色调 | 滋润不拔干</p>', '/uploads/product/givenchy306.jpg', '[\"/uploads/product/givenchy306_1.jpg\",\"/uploads/product/givenchy306_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (88, '绝色精华唇膏 #196', 50201, '兰蔻', '<p>玫瑰精华 | 奶油哑光 | 显白不挑皮 | 持色8小时</p>', '/uploads/product/lancome196.jpg', '[\"/uploads/product/lancome196_1.jpg\",\"/uploads/product/lancome196_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (89, '琉璃唇釉镜面水光', 50201, '完美日记', '<p>水光镜面 | 不沾杯 | 8h持妆 | 高饱和显色</p>', '/uploads/product/perfectliptint.jpg', '[\"/uploads/product/perfectliptint_1.jpg\",\"/uploads/product/perfectliptint_2.jpg\"]', 1, 7650, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (90, '新疆阿克苏冰糖心苹果 5kg装', 60101, '产地直发', '<p>新疆阿克苏核心产区 | 果径80-85mm | 冰糖心 | 脆甜多汁</p>', '/uploads/product/aksu_apple.jpg', '[\"/uploads/product/aksu_apple_1.jpg\",\"/uploads/product/aksu_apple_2.jpg\"]', 1, 8760, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (91, '山东烟台红富士苹果 3kg', 60101, '产地直发', '<p>烟台栖霞核心产区 | 果径80mm+ | 皮薄肉脆 | 汁多味甜</p>', '/uploads/product/yantai_apple.jpg', '[\"/uploads/product/yantai_apple_1.jpg\",\"/uploads/product/yantai_apple_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (92, '每日坚果 混合装 750g/30袋', 60501, '三只松鼠', '<p>6种坚果果干 | 科学配比 | 独立小袋 | 每日一袋</p>', '/uploads/product/dailynuts.jpg', '[\"/uploads/product/dailynuts_1.jpg\",\"/uploads/product/dailynuts_2.jpg\"]', 1, 9870, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (93, '开心果 盐焗味 500g', 60501, '良品铺子', '<p>美国加州开心果 | 自然开口 | 盐焗轻调味 | 大颗粒</p>', '/uploads/product/pistachio.jpg', '[\"/uploads/product/pistachio_1.jpg\",\"/uploads/product/pistachio_2.jpg\"]', 1, 7650, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (94, '夏威夷果 奶油味 500g', 60501, '百草味', '<p>澳洲夏威夷果 | 奶油轻甜 | 开口器赠送 | 大颗粒直径20mm+</p>', '/uploads/product/macadamia.jpg', '[\"/uploads/product/macadamia_1.jpg\",\"/uploads/product/macadamia_2.jpg\"]', 1, 6540, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (96, '飞天茅台 53度 500ml', 60603, '贵州茅台', '<p>酱香型 | 12987古法工艺 | 五年窖藏 | 53%vol</p>', '/uploads/product/moutai.jpg', '[\"/uploads/product/moutai_1.jpg\",\"/uploads/product/moutai_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (97, '三顿半 精品速溶咖啡 64颗', 60606, '三顿半', '<p>冷萃超即溶 | 64颗混合装 | 1-6号烘焙度 | 3秒溶于冰水</p>', '/uploads/product/saturnbird.jpg', '[\"/uploads/product/saturnbird_1.jpg\",\"/uploads/product/saturnbird_2.jpg\"]', 1, 8760, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (98, '云朵沙发 三人位 2.8m', 70101, '源氏木语', '<p>北美FAS级白橡木 | 科技布面料 | 高回弹海绵 | 实木框架</p>', '/uploads/product/cloudsofa.jpg', '[\"/uploads/product/cloudsofa_1.jpg\",\"/uploads/product/cloudsofa_2.jpg\"]', 1, 2100, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (99, '头层牛皮电动功能沙发 三人位', 70101, '顾家家居', '<p>意大利头层牛皮 | 电动伸缩 | 零重力躺位 | USB充电口</p>', '/uploads/product/kuka_sofa.jpg', '[\"/uploads/product/kuka_sofa_1.jpg\",\"/uploads/product/kuka_sofa_2.jpg\"]', 1, 1560, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (100, '实木软包床 1.8m×2m', 70201, '源氏木语', '<p>北美黑胡桃木 | 高密度海绵软包 | 静音龙骨 | 气压储物</p>', '/uploads/product/woodbed.jpg', '[\"/uploads/product/woodbed_1.jpg\",\"/uploads/product/woodbed_2.jpg\"]', 1, 1890, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (101, '真皮轻奢大床 1.8m×2m', 70201, '慕思', '<p>头层牛皮靠背 | 齐边设计 | 金属高脚 | 实木排骨架</p>', '/uploads/product/leatherbed.jpg', '[\"/uploads/product/leatherbed_1.jpg\",\"/uploads/product/leatherbed_2.jpg\"]', 1, 1230, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (102, '舒华 E9 智能折叠跑步机', 110301, '舒华', '<p>3.0HP无刷电机 | 18km/h | 电动18段坡度 | 可折叠 | 智能APP</p>', '/uploads/product/shuhua_e9.jpg', '[\"/uploads/product/shuhua_e9_1.jpg\",\"/uploads/product/shuhua_e9_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (103, 'Keep C2 Lite 家用跑步机', 110301, 'Keep', '<p>2.0HP马达 | 15km/h | 全折叠 | Keep APP联动 | 静音马达</p>', '/uploads/product/keepc2.jpg', '[\"/uploads/product/keepc2_1.jpg\",\"/uploads/product/keepc2_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (104, '云尚 3 四季双人帐篷', 110401, 'NatureHike', '<p>20D尼龙面料 | PU2000+防水 | 双开门 | 2.1kg超轻 | 3-4季通用</p>', '/uploads/product/nhcloud3.jpg', '[\"/uploads/product/nhcloud3_1.jpg\",\"/uploads/product/nhcloud3_2.jpg\"]', 1, 2340, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (105, '繁星 3 家庭帐篷 4-6人', 110401, '牧高笛', '<p>150D牛津布 | PU3000+防水 | 一室一厅结构 | 防暴雨</p>', '/uploads/product/mobigarden_star3.jpg', '[\"/uploads/product/mobigarden_star3_1.jpg\",\"/uploads/product/mobigarden_star3_2.jpg\"]', 1, 1230, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (106, '全价全阶段猫粮 5.4kg', 140101, '网易严选', '<p>70%鲜肉含量 | 无谷配方 | 冻干生骨肉包裹 | 全阶段通用</p>', '/uploads/product/yanxuan_cat.jpg', '[\"/uploads/product/yanxuan_cat_1.jpg\",\"/uploads/product/yanxuan_cat_2.jpg\"]', 1, 7650, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (107, '无谷天然猫粮 鸡肉味 5.4kg', 140101, '皇家', '<p>精准营养配方 | 理想体重控制 | 毛球排出 | 泌尿健康</p>', '/uploads/product/royalcanin_cat.jpg', '[\"/uploads/product/royalcanin_cat_1.jpg\",\"/uploads/product/royalcanin_cat_2.jpg\"]', 1, 5430, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (108, '小型犬全价狗粮 10kg', 140102, '伯纳天纯', '<p>鲜肉酶解技术 | 无谷低敏 | 添加益生菌 | 小型犬专属颗粒</p>', '/uploads/product/purena_dog.jpg', '[\"/uploads/product/purena_dog_1.jpg\",\"/uploads/product/purena_dog_2.jpg\"]', 1, 4320, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (109, '全价狗粮 鸡肉米饭 15kg', 140102, '皇家', '<p>精准营养 | 理想体态 | 高消化蛋白 | 牙齿健康支持</p>', '/uploads/product/royalcanin_dog.jpg', '[\"/uploads/product/royalcanin_dog_1.jpg\",\"/uploads/product/royalcanin_dog_2.jpg\"]', 1, 3210, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (110, '足金古法传承手镯 30g', 120101, '周大福', '<p>足金999 | 古法花丝錾刻 | 哑光质感 | 30g±0.5g</p>', '/uploads/product/chowtaifook_bangle.jpg', '[\"/uploads/product/chowtaifook_bangle_1.jpg\",\"/uploads/product/chowtaifook_bangle_2.jpg\"]', 1, 1230, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (111, '足金如意锁项链 8g', 120101, '老凤祥', '<p>足金999 | 3D硬金工艺 | 如意锁吊坠 | 链长45cm</p>', '/uploads/product/laofengxiang_necklace.jpg', '[\"/uploads/product/laofengxiang_necklace_1.jpg\",\"/uploads/product/laofengxiang_necklace_2.jpg\"]', 1, 2100, '2026-05-22 12:50:13', '2026-05-22 12:50:13', 0);
INSERT INTO `pms_spu` VALUES (2057691866230591489, 'iPhone 15 Pro', 10101, 'Apple', '最新款 iPhone，搭载 A17 Pro 芯片', 'https://example.com/iphone15pro-main.jpg', '[\"https://example.com/iphone15pro-1.jpg\",\"https://example.com/iphone15pro-2.jpg\",\"https://example.com/iphone15pro-3.jpg\"]', 2, 0, '2026-05-22 13:15:46', '2026-05-22 13:22:12', 1);
INSERT INTO `pms_spu` VALUES (2057693667856125953, 'iPhone 15 Pro', 10101, 'Apple', '测试商品', 'https://example.com/iphone15pro-main.jpg', '[\"https://example.com/iphone15pro-1.jpg\",\"https://example.com/iphone15pro-2.jpg\",\"https://example.com/iphone15pro-3.jpg\"]', 1, 0, '2026-05-22 13:22:55', '2026-05-22 13:22:55', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2059968118308077570 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', '/system', '', NULL, 0, 1, '2026-05-20 15:10:18');
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', '/users', 'user/UserView', 'user:list', 1, 1, '2026-05-20 15:10:18');
INSERT INTO `sys_menu` VALUES (3, 1, '日志管理', '/log', 'system/log/index', 'log:list', 1, 7, '2026-05-20 15:10:18');
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
) ENGINE = InnoDB AUTO_INCREMENT = 2059968133701173250 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES (2059967938980610050, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-05-28 20:00:03');
INSERT INTO `sys_operation_log` VALUES (2059968118182248449, 1, 'admin', '更新用户', 'PUT', '/users/1', '127.0.0.1', '2026-05-28 20:00:46');
INSERT INTO `sys_operation_log` VALUES (2059968133701173249, 1, 'admin', '用户登出', 'POST', '/auth/logout', '127.0.0.1', '2026-05-28 20:00:50');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `menu_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 'ADMIN', 1);
INSERT INTO `sys_role_menu` VALUES (2, 'ADMIN', 2);
INSERT INTO `sys_role_menu` VALUES (3, 'ADMIN', 3);
INSERT INTO `sys_role_menu` VALUES (4, 'USER', 1);
INSERT INTO `sys_role_menu` VALUES (5, 'USER', 2);
INSERT INTO `sys_role_menu` VALUES (6, 'ADMIN', 4);
INSERT INTO `sys_role_menu` VALUES (7, 'ADMIN', 5);
INSERT INTO `sys_role_menu` VALUES (8, 'ADMIN', 6);
INSERT INTO `sys_role_menu` VALUES (9, 'ADMIN', 7);
INSERT INTO `sys_role_menu` VALUES (10, 'ADMIN', 8);
INSERT INTO `sys_role_menu` VALUES (11, 'ADMIN', 9);
INSERT INTO `sys_role_menu` VALUES (12, 'ADMIN', 10);
INSERT INTO `sys_role_menu` VALUES (13, 'ADMIN', 11);
INSERT INTO `sys_role_menu` VALUES (14, 'ADMIN', 12);
INSERT INTO `sys_role_menu` VALUES (15, 'ADMIN', 13);
INSERT INTO `sys_role_menu` VALUES (16, 'ADMIN', 14);
INSERT INTO `sys_role_menu` VALUES (17, 'ADMIN', 15);
INSERT INTO `sys_role_menu` VALUES (18, 'ADMIN', 16);
INSERT INTO `sys_role_menu` VALUES (19, 'ADMIN', 17);
INSERT INTO `sys_role_menu` VALUES (20, 'ADMIN', 18);
INSERT INTO `sys_role_menu` VALUES (21, 'ADMIN', 19);
INSERT INTO `sys_role_menu` VALUES (22, 'ADMIN', 20);
INSERT INTO `sys_role_menu` VALUES (23, 'ADMIN', 21);
INSERT INTO `sys_role_menu` VALUES (24, 'ADMIN', 22);

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
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'USER',
  `deleted` tinyint NULL DEFAULT 0,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像URL',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username_deleted`(`username` ASC, `deleted` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2059226432355373059 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$oECl8Or8FORPTpmFARHexOm0DdA8z5gSpqyC96qD.wmCM2SADILnW', '管理员', NULL, NULL, 1, '2026-05-16 16:10:04', 'ADMIN', 0, '2026-05-19 15:18:53', NULL);
INSERT INTO `sys_user` VALUES (2055674343352107010, 'zhangsan', '$2a$10$Dmy60CNBtsNGNFL16jPL4.p9fjcgboTN2MIrw.Hdb92kps6jXDRFi', '张三', NULL, NULL, 1, '2026-05-16 23:38:50', 'USER', 0, '2026-05-19 15:18:53', NULL);
INSERT INTO `sys_user` VALUES (2056639752335159297, 'tom', '$2a$10$vFXwzQk7oQBJHAF5wwIxR.Xfz57qTM8imqPJYAczZSw1pQC3/QAui', '汤姆', NULL, NULL, 1, '2026-05-19 15:35:02', 'USER', 1, '2026-05-19 15:35:23', NULL);
INSERT INTO `sys_user` VALUES (2056651952303071233, 'peter', '$2a$10$GjZDtwq7.39jKG2UyyzbbuXk6IlDVbV/D9FpNaBgo1I2umu4F3n.y', '皮特', NULL, NULL, 1, '2026-05-19 16:23:31', 'USER', 0, '2026-05-19 16:23:31', NULL);
INSERT INTO `sys_user` VALUES (2056695331091046402, 'guangtouqiang', '$2a$10$7KaonMunQQbNmoaKSPiuy.j.Je4JO93yolWsycfn9FB35DjVdDqm6', '光头强', '', '', 1, '2026-05-19 19:15:53', 'USER', 0, '2026-05-27 12:38:01', '/uploads/5a2af21e-1b8a-4060-bcfb-08bbcf6700b4.jpg');
INSERT INTO `sys_user` VALUES (2056695331942490113, 'lisi', '$2a$10$CMVCJ9IW1zKQOGzZjk4ZWOCGjOAxRAuKiJiq08thhOQTqomIz2X/O', '李四', NULL, NULL, 1, '2026-05-19 19:15:53', 'USER', 0, '2026-05-19 19:15:53', NULL);
INSERT INTO `sys_user` VALUES (2056695332198342658, 'wangwu', '$2a$10$RRwNucBYPP5ZKusfPuxtL.QgIqxpqVesKqqtj9PKfx6aN.u1L.4BW', '王五', NULL, NULL, 1, '2026-05-19 19:15:53', 'USER', 1, '2026-05-21 15:56:49', NULL);
INSERT INTO `sys_user` VALUES (2059163359330369538, 'laoliu', '$2a$10$iTX3gyweTEJyZvy46s1iM.QBcDWVaiofaGJjXvSU.hV/viMV0YWTK', '老六', NULL, NULL, 1, '2026-05-26 14:42:57', 'USER', 1, '2026-05-26 14:46:43', NULL);
INSERT INTO `sys_user` VALUES (2059165763320872962, 'laoliu_del_1779781258247_2059165763320872962', '$2a$10$5lMzGCZNUdxM74iPgX/0cezXmFKLf0bbaGJaACz2Cw/kWvl.BgtbC', '老六', NULL, NULL, 1, '2026-05-26 14:52:30', 'USER', 1, '2026-05-26 15:40:58', NULL);
INSERT INTO `sys_user` VALUES (2059174805271400449, 'zjq_del_1779781255966_2059174805271400449', '$2a$10$F0kcciNCfOAgvyHaAPUApedtGnxjEtwkv9FDbr/FXfHJwgUsEr41q', '张达猪', NULL, NULL, 1, '2026-05-26 15:28:26', 'USER', 1, '2026-05-26 15:40:55', NULL);
INSERT INTO `sys_user` VALUES (2059178041382477826, 'laoliu', '$2a$10$iUW8V.U/nc.MpHMJOPJhJeQtD6SLIXpyIHc3bee/5DFa/.4Ir2xZG', '老六', NULL, NULL, 1, '2026-05-26 15:41:17', 'USER', 0, '2026-05-26 15:41:17', NULL);
INSERT INTO `sys_user` VALUES (2059226432355373058, 'xionger', '$2a$10$g25sljv.H5Xn2WqxHfKAguWRQbVrInWKApzj16Mh2YthnwTP2l0oW', '熊二', NULL, NULL, 1, '2026-05-26 18:53:35', 'USER', 0, '2026-05-26 18:53:35', '/uploads/a7836e21-7ba3-456d-8a4e-3c3195308722.jpg');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '收货地址表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member
-- ----------------------------
INSERT INTO `ums_member` VALUES (1, 'zhangsan', '$2a$10$dummy', '张三', '13800001111', 'zhangsan@qq.com', NULL, 1, NULL, 1, 1, '2026-05-22 23:36:52', '2026-05-22 23:43:00', 0);
INSERT INTO `ums_member` VALUES (2, 'lisi', '$2a$10$dummy', '李四', '13900002222', 'lisi@qq.com', NULL, 2, NULL, 2, 1, '2026-05-22 23:36:52', '2026-05-22 23:43:04', 0);
INSERT INTO `ums_member` VALUES (3, 'wangwu', '$2a$10$dummy', '王五', '13700003333', 'wangwu@qq.com', NULL, 1, NULL, 1, 1, '2026-05-22 23:36:52', '2026-05-23 01:47:19', 0);

SET FOREIGN_KEY_CHECKS = 1;

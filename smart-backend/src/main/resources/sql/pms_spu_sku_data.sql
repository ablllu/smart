-- ============================================
-- pms_spu + pms_sku 测试数据
-- ============================================

-- ============================================
-- 手机数码 - 5G手机 (category_id = 10101)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(1, 'iPhone 16 Pro Max', 10101, 'Apple', '<p>A18 Pro芯片 | 6.9英寸OLED屏 | 钛金属边框 | 4800万三摄</p>', '/uploads/product/iphone16pm.jpg', '["/uploads/product/iphone16pm_1.jpg","/uploads/product/iphone16pm_2.jpg","/uploads/product/iphone16pm_3.jpg"]', 1, 12890),
(2, '华为 Mate 70 Pro', 10101, '华为', '<p>麒麟9100芯片 | 6.8英寸OLED曲面屏 | 卫星通信 | 5000万XMAGE影像</p>', '/uploads/product/mate70pro.jpg', '["/uploads/product/mate70pro_1.jpg","/uploads/product/mate70pro_2.jpg"]', 1, 9870),
(3, '小米 15 Pro', 10101, '小米', '<p>骁龙8 Gen4 | 6.73英寸2K屏 | 徕卡光学镜头 | 120W快充</p>', '/uploads/product/mi15pro.jpg', '["/uploads/product/mi15pro_1.jpg","/uploads/product/mi15pro_2.jpg"]', 1, 7650),
(4, 'OPPO Find X7 Ultra', 10101, 'OPPO', '<p>骁龙8 Gen4 | 6.82英寸曲面屏 | 哈苏影像 | 100W超级闪充</p>', '/uploads/product/findx7u.jpg', '["/uploads/product/findx7u_1.jpg","/uploads/product/findx7u_2.jpg"]', 1, 5420),
(5, 'vivo X200 Pro', 10101, 'vivo', '<p>天玑9400 | 6.78英寸AMOLED | 蔡司超级长焦 | 蓝海超充</p>', '/uploads/product/vivox200p.jpg', '["/uploads/product/vivox200p_1.jpg","/uploads/product/vivox200p_2.jpg"]', 1, 4890),
(6, '三星 Galaxy S25 Ultra', 10101, 'Samsung', '<p>骁龙8 Gen4 | 6.9英寸Dynamic AMOLED | S Pen | 2亿像素主摄</p>', '/uploads/product/s25u.jpg', '["/uploads/product/s25u_1.jpg","/uploads/product/s25u_2.jpg"]', 1, 3120),
(7, '荣耀 Magic7 Pro', 10101, '荣耀', '<p>骁龙8 Gen4 | 6.8英寸绿洲护眼屏 | 青海湖电池 | 卫星通信</p>', '/uploads/product/magic7pro.jpg', '["/uploads/product/magic7pro_1.jpg","/uploads/product/magic7pro_2.jpg"]', 1, 3210),
(8, '一加 13', 10101, '一加', '<p>骁龙8 Gen4 | 6.82英寸东方屏 | 哈苏影像 | 100W快充</p>', '/uploads/product/oneplus13.jpg', '["/uploads/product/oneplus13_1.jpg","/uploads/product/oneplus13_2.jpg"]', 1, 2340);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(1, 1, '黑色/256GB', '{"颜色":"黑色","存储":"256GB"}', 8999.00, 9999.00, 7200.00, 500, 23, 1),
(2, 1, '黑色/512GB', '{"颜色":"黑色","存储":"512GB"}', 10499.00, 10999.00, 8400.00, 320, 15, 1),
(3, 1, '原色/256GB', '{"颜色":"原色钛金属","存储":"256GB"}', 8999.00, 9999.00, 7200.00, 450, 18, 1),
(4, 1, '原色/1TB', '{"颜色":"原色钛金属","存储":"1TB"}', 12999.00, 13999.00, 10400.00, 120, 5, 1),
(5, 2, '雅丹黑/512GB', '{"颜色":"雅丹黑","存储":"512GB"}', 6999.00, 6999.00, 5600.00, 600, 30, 1),
(6, 2, '雅丹黑/1TB', '{"颜色":"雅丹黑","存储":"1TB"}', 7999.00, 7999.00, 6400.00, 250, 8, 1),
(7, 2, '羽砂白/512GB', '{"颜色":"羽砂白","存储":"512GB"}', 6999.00, 6999.00, 5600.00, 380, 12, 1),
(8, 3, '白色/256GB', '{"颜色":"白色","存储":"256GB"}', 4999.00, 5299.00, 3900.00, 700, 45, 1),
(9, 3, '白色/512GB', '{"颜色":"白色","存储":"512GB"}', 5699.00, 5999.00, 4500.00, 420, 20, 1),
(10, 3, '黑色/512GB', '{"颜色":"黑色","存储":"512GB"}', 5699.00, 5999.00, 4500.00, 380, 15, 1),
(11, 4, '黑色/256GB', '{"颜色":"黑色","存储":"256GB"}', 5999.00, 6299.00, 4700.00, 330, 10, 1),
(12, 4, '黑色/512GB', '{"颜色":"黑色","存储":"512GB"}', 6699.00, 6999.00, 5300.00, 200, 8, 1),
(13, 4, '棕色/512GB', '{"颜色":"棕色","存储":"512GB"}', 6699.00, 6999.00, 5300.00, 180, 5, 1),
(14, 5, '星耀黑/256GB', '{"颜色":"星耀黑","存储":"256GB"}', 4999.00, 4999.00, 3900.00, 410, 22, 1),
(15, 5, '星耀黑/512GB', '{"颜色":"星耀黑","存储":"512GB"}', 5699.00, 5699.00, 4500.00, 250, 10, 1),
(16, 5, '月光白/512GB', '{"颜色":"月光白","存储":"512GB"}', 5699.00, 5699.00, 4500.00, 200, 7, 1),
(17, 6, '钛灰/256GB', '{"颜色":"钛灰","存储":"256GB"}', 8999.00, 9699.00, 7200.00, 150, 5, 1),
(18, 6, '钛灰/512GB', '{"颜色":"钛灰","存储":"512GB"}', 10199.00, 10899.00, 8200.00, 100, 3, 1),
(19, 6, '钛蓝/1TB', '{"颜色":"钛蓝","存储":"1TB"}', 13199.00, 13899.00, 10600.00, 50, 2, 1),
(20, 7, '黑色/256GB', '{"颜色":"黑色","存储":"256GB"}', 4499.00, 4799.00, 3500.00, 380, 16, 1),
(21, 7, '黑色/512GB', '{"颜色":"黑色","存储":"512GB"}', 5299.00, 5599.00, 4200.00, 220, 9, 1),
(22, 7, '绿色/512GB', '{"颜色":"绿色","存储":"512GB"}', 5299.00, 5599.00, 4200.00, 180, 6, 1),
(23, 8, '砂岩黑/256GB', '{"颜色":"砂岩黑","存储":"256GB"}', 4299.00, 4599.00, 3400.00, 350, 14, 1),
(24, 8, '砂岩黑/512GB', '{"颜色":"砂岩黑","存储":"512GB"}', 4999.00, 5299.00, 4000.00, 200, 8, 1),
(25, 8, '薄荷绿/512GB', '{"颜色":"薄荷绿","存储":"512GB"}', 4999.00, 5299.00, 4000.00, 160, 5, 1);

-- ============================================
-- 手机数码 - 折叠屏手机 (category_id = 10102)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(9, '华为 Mate X6 典藏版', 10102, '华为', '<p>麒麟9100 | 7.93英寸折叠大屏 | 玄武钢化玻璃 | 卫星通话</p>', '/uploads/product/matex6.jpg', '["/uploads/product/matex6_1.jpg","/uploads/product/matex6_2.jpg"]', 1, 2850),
(10, '荣耀 Magic V3', 10102, '荣耀', '<p>骁龙8 Gen4 | 7.92英寸内屏 | 钛合金铰链 | 青海湖双电池</p>', '/uploads/product/magicv3.jpg', '["/uploads/product/magicv3_1.jpg","/uploads/product/magicv3_2.jpg"]', 1, 1930),
(11, '小米 MIX Fold 4', 10102, '小米', '<p>骁龙8 Gen4 | 8.03英寸内屏 | 徕卡全焦段四摄 | 龙骨转轴</p>', '/uploads/product/mixfold4.jpg', '["/uploads/product/mixfold4_1.jpg","/uploads/product/mixfold4_2.jpg"]', 1, 1560),
(12, 'OPPO Find N4', 10102, 'OPPO', '<p>骁龙8 Gen4 | 7.8英寸内屏 | 精工铰链 | 哈苏影像</p>', '/uploads/product/findn4.jpg', '["/uploads/product/findn4_1.jpg","/uploads/product/findn4_2.jpg"]', 1, 1120);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(26, 9, '曜石黑/512GB', '{"颜色":"曜石黑","存储":"512GB"}', 13999.00, 14999.00, 11200.00, 200, 8, 1),
(27, 9, '曜石黑/1TB', '{"颜色":"曜石黑","存储":"1TB"}', 15999.00, 16999.00, 12800.00, 100, 3, 1),
(28, 9, '羽砂金/1TB', '{"颜色":"羽砂金","存储":"1TB"}', 15999.00, 16999.00, 12800.00, 80, 2, 1),
(29, 10, '黑色/512GB', '{"颜色":"黑色","存储":"512GB"}', 8999.00, 9999.00, 7200.00, 180, 7, 1),
(30, 10, '黑色/1TB', '{"颜色":"黑色","存储":"1TB"}', 10999.00, 11999.00, 8800.00, 90, 4, 1),
(31, 10, '紫色/1TB', '{"颜色":"紫色","存储":"1TB"}', 10999.00, 11999.00, 8800.00, 70, 2, 1),
(32, 11, '黑色/512GB', '{"颜色":"黑色","存储":"512GB"}', 7999.00, 8999.00, 6400.00, 160, 6, 1),
(33, 11, '黑色/1TB', '{"颜色":"黑色","存储":"1TB"}', 9999.00, 10999.00, 8000.00, 80, 3, 1),
(34, 11, '金色/1TB', '{"颜色":"金色","存储":"1TB"}', 9999.00, 10999.00, 8000.00, 60, 1, 1),
(35, 12, '黑色/512GB', '{"颜色":"黑色","存储":"512GB"}', 7499.00, 8299.00, 6000.00, 140, 5, 1),
(36, 12, '黑色/1TB', '{"颜色":"黑色","存储":"1TB"}', 9299.00, 10299.00, 7400.00, 70, 2, 1),
(37, 12, '绿色/1TB', '{"颜色":"绿色","存储":"1TB"}', 9299.00, 10299.00, 7400.00, 50, 1, 1);

-- ============================================
-- 手机数码 - 智能手表 (category_id = 103)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(13, 'Apple Watch Series 10', 103, 'Apple', '<p>S10芯片 | 全天候视网膜显示屏 | 体温感应 | 水深计</p>', '/uploads/product/aw10.jpg', '["/uploads/product/aw10_1.jpg","/uploads/product/aw10_2.jpg"]', 1, 6540),
(14, '华为 Watch GT 5 Pro', 103, '华为', '<p>蓝宝石表镜 | 14天长续航 | ECG心电分析 | 高尔夫模式</p>', '/uploads/product/hwgt5.jpg', '["/uploads/product/hwgt5_1.jpg","/uploads/product/hwgt5_2.jpg"]', 1, 4320),
(15, '小米 Watch S4 Sport', 103, '小米', '<p>钛合金表体 | 1.43英寸AMOLED | eSIM独立通话 | 150+运动模式</p>', '/uploads/product/mis4.jpg', '["/uploads/product/mis4_1.jpg","/uploads/product/mis4_2.jpg"]', 1, 3450),
(16, 'OPPO Watch X', 103, 'OPPO', '<p>骁龙W5 Gen2 | 1.5英寸AMOLED | 全智能模式 | 85+运动模式</p>', '/uploads/product/oppowx.jpg', '["/uploads/product/oppowx_1.jpg","/uploads/product/oppowx_2.jpg"]', 1, 2100);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(38, 13, '午夜色/46mm GPS', '{"颜色":"午夜色","尺寸":"46mm","版本":"GPS"}', 3299.00, 3499.00, 2600.00, 400, 18, 1),
(39, 13, '午夜色/46mm 蜂窝', '{"颜色":"午夜色","尺寸":"46mm","版本":"蜂窝"}', 3999.00, 4199.00, 3200.00, 280, 10, 1),
(40, 13, '星光色/42mm GPS', '{"颜色":"星光色","尺寸":"42mm","版本":"GPS"}', 2999.00, 3199.00, 2400.00, 350, 15, 1),
(41, 13, '星光色/42mm 蜂窝', '{"颜色":"星光色","尺寸":"42mm","版本":"蜂窝"}', 3699.00, 3899.00, 2900.00, 220, 8, 1),
(42, 14, '幻夜黑/48mm', '{"颜色":"幻夜黑","尺寸":"48mm"}', 2488.00, 2688.00, 1900.00, 500, 25, 1),
(43, 14, '星云灰/48mm', '{"颜色":"星云灰","尺寸":"48mm"}', 2488.00, 2688.00, 1900.00, 380, 15, 1),
(44, 14, '钛金属/48mm', '{"颜色":"钛金属","尺寸":"48mm"}', 3288.00, 3488.00, 2600.00, 150, 5, 1),
(45, 15, '黑色', '{"颜色":"黑色"}', 1299.00, 1499.00, 1000.00, 600, 30, 1),
(46, 15, '银色', '{"颜色":"银色"}', 1299.00, 1499.00, 1000.00, 450, 22, 1),
(47, 15, '橙色', '{"颜色":"橙色"}', 1399.00, 1599.00, 1080.00, 320, 12, 1),
(48, 16, '曜石黑', '{"颜色":"曜石黑"}', 1999.00, 2199.00, 1550.00, 280, 10, 1),
(49, 16, '浮光金', '{"颜色":"浮光金"}', 1999.00, 2199.00, 1550.00, 200, 6, 1),
(50, 16, '星云灰', '{"颜色":"星云灰"}', 1999.00, 2199.00, 1550.00, 180, 5, 1);

-- ============================================
-- 手机数码 - 真无线耳机 (category_id = 10701)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(17, 'AirPods Pro 3', 10701, 'Apple', '<p>H3芯片 | 自适应降噪 | 空间音频 | USB-C接口 | 6小时续航</p>', '/uploads/product/app3.jpg', '["/uploads/product/app3_1.jpg","/uploads/product/app3_2.jpg"]', 1, 9870),
(18, '华为 FreeBuds Pro 4', 10701, '华为', '<p>智慧动态降噪 | 超感知原声双单元 | 星闪连接 | 36h续航</p>', '/uploads/product/hwfb4.jpg', '["/uploads/product/hwfb4_1.jpg","/uploads/product/hwfb4_2.jpg"]', 1, 6540),
(19, '小米 Buds 5 Pro', 10701, '小米', '<p>圈铁同轴三单元 | Hi-Res Audio | 独立空间音频 | LHDC 5.0</p>', '/uploads/product/mibuds5.jpg', '["/uploads/product/mibuds5_1.jpg","/uploads/product/mibuds5_2.jpg"]', 1, 4320),
(20, 'OPPO Enco X3', 10701, 'OPPO', '<p>同轴双单元 | 丹拿联合调音 | LDAC高清传输 | 49dB降噪</p>', '/uploads/product/encox3.jpg', '["/uploads/product/encox3_1.jpg","/uploads/product/encox3_2.jpg"]', 1, 3210),
(21, '索尼 WF-1000XM6', 10701, 'Sony', '<p>全新集成处理器V3 | Hi-Res Audio | 骨传导通话 | 8h续航</p>', '/uploads/product/sonyxm6.jpg', '["/uploads/product/sonyxm6_1.jpg","/uploads/product/sonyxm6_2.jpg"]', 1, 2870);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(51, 17, '白色', '{"颜色":"白色"}', 1899.00, 1999.00, 1450.00, 800, 50, 1),
(52, 17, '黑色', '{"颜色":"黑色"}', 1899.00, 1999.00, 1450.00, 650, 35, 1),
(53, 18, '陶瓷白', '{"颜色":"陶瓷白"}', 1199.00, 1299.00, 900.00, 700, 40, 1),
(54, 18, '冰霜银', '{"颜色":"冰霜银"}', 1199.00, 1299.00, 900.00, 550, 28, 1),
(55, 18, '星河蓝', '{"颜色":"星河蓝"}', 1199.00, 1299.00, 900.00, 420, 20, 1),
(56, 19, '星耀黑', '{"颜色":"星耀黑"}', 699.00, 799.00, 520.00, 900, 55, 1),
(57, 19, '薄荷绿', '{"颜色":"薄荷绿"}', 699.00, 799.00, 520.00, 700, 40, 1),
(58, 19, '晴雪白', '{"颜色":"晴雪白"}', 699.00, 799.00, 520.00, 600, 30, 1),
(59, 20, '黑色', '{"颜色":"黑色"}', 899.00, 999.00, 680.00, 450, 22, 1),
(60, 20, '白色', '{"颜色":"白色"}', 899.00, 999.00, 680.00, 380, 18, 1),
(61, 21, '黑色', '{"颜色":"黑色"}', 1599.00, 1799.00, 1250.00, 320, 15, 1),
(62, 21, '铂金银', '{"颜色":"铂金银"}', 1599.00, 1799.00, 1250.00, 250, 10, 1);

-- ============================================
-- 手机数码 - 头戴式耳机 (category_id = 10702)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(22, 'AirPods Max 2', 10702, 'Apple', '<p>H2芯片 | 自适应降噪 | 空间音频 | 数码旋钮 | 20h续航</p>', '/uploads/product/apm2.jpg', '["/uploads/product/apm2_1.jpg","/uploads/product/apm2_2.jpg"]', 1, 2340),
(23, '索尼 WH-1000XM6', 10702, 'Sony', '<p>双芯降噪系统 | 碳纤维振膜 | Hi-Res Audio | 30h续航</p>', '/uploads/product/whxm6.jpg', '["/uploads/product/whxm6_1.jpg","/uploads/product/whxm6_2.jpg"]', 1, 4560),
(24, 'Bose QC Ultra', 10702, 'Bose', '<p>空间音频 | CustomTune智能调音 | 沉浸式音效 | 24h续航</p>', '/uploads/product/boseqc.jpg', '["/uploads/product/boseqc_1.jpg","/uploads/product/boseqc_2.jpg"]', 1, 3120);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(63, 22, '午夜色', '{"颜色":"午夜色"}', 4399.00, 4399.00, 3500.00, 200, 8, 1),
(64, 22, '星光色', '{"颜色":"星光色"}', 4399.00, 4399.00, 3500.00, 180, 6, 1),
(65, 22, '橙色', '{"颜色":"橙色"}', 4399.00, 4399.00, 3500.00, 120, 3, 1),
(66, 23, '黑色', '{"颜色":"黑色"}', 2299.00, 2499.00, 1800.00, 380, 18, 1),
(67, 23, '铂金银', '{"颜色":"铂金银"}', 2299.00, 2499.00, 1800.00, 280, 12, 1),
(68, 23, '午夜蓝', '{"颜色":"午夜蓝"}', 2399.00, 2599.00, 1900.00, 200, 7, 1),
(69, 24, '黑色', '{"颜色":"黑色"}', 2999.00, 3299.00, 2400.00, 250, 10, 1),
(70, 24, '白色', '{"颜色":"白色"}', 2999.00, 3299.00, 2400.00, 200, 8, 1),
(71, 24, '砂岩白', '{"颜色":"砂岩白"}', 2999.00, 3299.00, 2400.00, 150, 5, 1);

-- ============================================
-- 手机数码 - 蓝牙音箱 (category_id = 10703)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(25, 'JBL Flip 7', 10703, 'JBL', '<p>赛道扬声器 | IP68防水 | 12h续航 | PartyBoost串联</p>', '/uploads/product/jblflip7.jpg', '["/uploads/product/jblflip7_1.jpg","/uploads/product/jblflip7_2.jpg"]', 1, 5670),
(26, 'Marshall Emberton III', 10703, 'Marshall', '<p>经典复古造型 | 360°环绕音 | IP67防水 | 32h超长续航</p>', '/uploads/product/marshalle3.jpg', '["/uploads/product/marshalle3_1.jpg","/uploads/product/marshalle3_2.jpg"]', 1, 3450),
(27, '华为 Sound Joy 2', 10703, '华为', '<p>帝瓦雷联合调音 | IP67防水 | NFC一碰传 | 26h续航</p>', '/uploads/product/hwsj2.jpg', '["/uploads/product/hwsj2_1.jpg","/uploads/product/hwsj2_2.jpg"]', 1, 2340);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(72, 25, '黑色', '{"颜色":"黑色"}', 599.00, 699.00, 450.00, 500, 30, 1),
(73, 25, '蓝色', '{"颜色":"蓝色"}', 599.00, 699.00, 450.00, 420, 22, 1),
(74, 25, '红色', '{"颜色":"红色"}', 599.00, 699.00, 450.00, 350, 15, 1),
(75, 25, '迷彩绿', '{"颜色":"迷彩绿"}', 649.00, 749.00, 490.00, 280, 10, 1),
(76, 26, '经典黑金', '{"颜色":"经典黑金"}', 999.00, 1099.00, 780.00, 320, 15, 1),
(77, 26, '奶油白', '{"颜色":"奶油白"}', 999.00, 1099.00, 780.00, 280, 12, 1),
(78, 27, '曜石黑', '{"颜色":"曜石黑"}', 499.00, 599.00, 380.00, 450, 25, 1),
(79, 27, '云杉绿', '{"颜色":"云杉绿"}', 499.00, 599.00, 380.00, 350, 18, 1);

-- ============================================
-- 手机数码 - 充电器 (category_id = 10402)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(28, '氮化镓充电器 100W', 10402, 'Anker', '<p>三口快充 | GaN氮化镓 | 100W大功率 | 折叠插脚</p>', '/uploads/product/anker100w.jpg', '["/uploads/product/anker100w_1.jpg","/uploads/product/anker100w_2.jpg"]', 1, 8760),
(29, '氮化镓充电器 65W', 10402, '倍思', '<p>双C口+U口 | 65W快充 | 可折叠插脚 | 支持笔记本</p>', '/uploads/product/baseus65w.jpg', '["/uploads/product/baseus65w_1.jpg","/uploads/product/baseus65w_2.jpg"]', 1, 6540),
(30, '无线充电板 15W', 10402, '小米', '<p>Qi认证 | 15W快充 | 双线圈 | LED指示灯 | 异物检测</p>', '/uploads/product/miwireless.jpg', '["/uploads/product/miwireless_1.jpg","/uploads/product/miwireless_2.jpg"]', 1, 4320);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(80, 28, '黑色/单口', '{"颜色":"黑色","型号":"单口"}', 199.00, 249.00, 150.00, 600, 35, 1),
(81, 28, '黑色/三口', '{"颜色":"黑色","型号":"三口"}', 279.00, 329.00, 210.00, 450, 25, 1),
(82, 28, '白色/三口', '{"颜色":"白色","型号":"三口"}', 279.00, 329.00, 210.00, 400, 20, 1),
(83, 29, '黑色', '{"颜色":"黑色"}', 129.00, 149.00, 95.00, 800, 45, 1),
(84, 29, '白色', '{"颜色":"白色"}', 129.00, 149.00, 95.00, 650, 35, 1),
(85, 30, '黑色', '{"颜色":"黑色"}', 79.00, 99.00, 55.00, 500, 28, 1),
(86, 30, '白色', '{"颜色":"白色"}', 79.00, 99.00, 55.00, 420, 20, 1);

-- ============================================
-- 手机数码 - 充电宝 (category_id = 10406)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(31, '小米磁吸充电宝 10000mAh', 10406, '小米', '<p>MagSafe磁吸 | 10000mAh | 15W无线+有线快充 | 轻薄机身</p>', '/uploads/product/mimagsafe.jpg', '["/uploads/product/mimagsafe_1.jpg","/uploads/product/mimagsafe_2.jpg"]', 1, 7650),
(32, '罗马仕 20000mAh快充', 10406, '罗马仕', '<p>20000mAh大容量 | 22.5W快充 | 三输入四输出 | LED电量显示</p>', '/uploads/product/romoss20000.jpg', '["/uploads/product/romoss20000_1.jpg","/uploads/product/romoss20000_2.jpg"]', 1, 9870),
(33, 'Anker PowerCore+ 26800mAh', 10406, 'Anker', '<p>26800mAh | 60W PD快充 | 双USB-C | 可充笔记本</p>', '/uploads/product/anker26800.jpg', '["/uploads/product/anker26800_1.jpg","/uploads/product/anker26800_2.jpg"]', 1, 3210);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(87, 31, '黑色', '{"颜色":"黑色"}', 129.00, 149.00, 95.00, 700, 45, 1),
(88, 31, '白色', '{"颜色":"白色"}', 129.00, 149.00, 95.00, 550, 30, 1),
(89, 31, '蓝色', '{"颜色":"蓝色"}', 129.00, 149.00, 95.00, 380, 18, 1),
(90, 32, '曜石黑', '{"颜色":"曜石黑"}', 89.00, 109.00, 65.00, 900, 60, 1),
(91, 32, '象牙白', '{"颜色":"象牙白"}', 89.00, 109.00, 65.00, 750, 45, 1),
(92, 33, '黑色', '{"颜色":"黑色"}', 399.00, 459.00, 310.00, 280, 12, 1),
(93, 33, '白色', '{"颜色":"白色"}', 399.00, 459.00, 310.00, 200, 8, 1);

-- ============================================
-- 电脑办公 - 轻薄本 (category_id = 20101)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(34, 'MacBook Air 15英寸 M4', 20101, 'Apple', '<p>M4芯片 | 15.3英寸Liquid Retina | 18h续航 | 1.51kg</p>', '/uploads/product/mba15m4.jpg', '["/uploads/product/mba15m4_1.jpg","/uploads/product/mba15m4_2.jpg"]', 1, 5430),
(35, 'MateBook X Pro 2025', 20101, '华为', '<p>Ultra9 285H | 14.2英寸OLED | 触控屏 | 980g超轻机身</p>', '/uploads/product/matebookxp.jpg', '["/uploads/product/matebookxp_1.jpg","/uploads/product/matebookxp_2.jpg"]', 1, 3670),
(36, 'ThinkBook 14+ 2025', 20101, '联想', '<p>Ultra7 265H | 14英寸2.8K | 120Hz高刷 | 全接口</p>', '/uploads/product/thinkbook14.jpg', '["/uploads/product/thinkbook14_1.jpg","/uploads/product/thinkbook14_2.jpg"]', 1, 4560),
(37, '小米笔记本 Pro 16', 20101, '小米', '<p>Ultra9 285H | 16英寸3.1K OLED | 触控屏 | CNC一体机身</p>', '/uploads/product/mibookpro16.jpg', '["/uploads/product/mibookpro16_1.jpg","/uploads/product/mibookpro16_2.jpg"]', 1, 2340);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(94, 34, '午夜色/16GB/512GB', '{"颜色":"午夜色","内存":"16GB","存储":"512GB"}', 8999.00, 9499.00, 7200.00, 300, 12, 1),
(95, 34, '午夜色/24GB/1TB', '{"颜色":"午夜色","内存":"24GB","存储":"1TB"}', 11499.00, 11999.00, 9200.00, 150, 5, 1),
(96, 34, '星光色/16GB/512GB', '{"颜色":"星光色","内存":"16GB","存储":"512GB"}', 8999.00, 9499.00, 7200.00, 250, 10, 1),
(97, 34, '星光色/24GB/1TB', '{"颜色":"星光色","内存":"24GB","存储":"1TB"}', 11499.00, 11999.00, 9200.00, 120, 4, 1),
(98, 35, '砚黑/16GB/1TB', '{"颜色":"砚黑","内存":"16GB","存储":"1TB"}', 8999.00, 9999.00, 7200.00, 200, 8, 1),
(99, 35, '砚黑/32GB/1TB', '{"颜色":"砚黑","内存":"32GB","存储":"1TB"}', 10999.00, 11999.00, 8800.00, 100, 3, 1),
(100, 35, '皓月银/32GB/1TB', '{"颜色":"皓月银","内存":"32GB","存储":"1TB"}', 10999.00, 11999.00, 8800.00, 80, 2, 1),
(101, 36, '深灰/16GB/1TB', '{"颜色":"深空灰","内存":"16GB","存储":"1TB"}', 6999.00, 7499.00, 5500.00, 280, 15, 1),
(102, 36, '深灰/32GB/1TB', '{"颜色":"深空灰","内存":"32GB","存储":"1TB"}', 7999.00, 8499.00, 6400.00, 150, 6, 1),
(103, 36, '银灰/32GB/2TB', '{"颜色":"银灰色","内存":"32GB","存储":"2TB"}', 8999.00, 9499.00, 7200.00, 80, 3, 1),
(104, 37, '深空灰/16GB/1TB', '{"颜色":"深空灰","内存":"16GB","存储":"1TB"}', 5999.00, 6499.00, 4700.00, 250, 10, 1),
(105, 37, '深空灰/32GB/1TB', '{"颜色":"深空灰","内存":"32GB","存储":"1TB"}', 6999.00, 7499.00, 5500.00, 130, 5, 1),
(106, 37, '银色/32GB/2TB', '{"颜色":"银色","内存":"32GB","存储":"2TB"}', 7999.00, 8499.00, 6400.00, 70, 2, 1);

-- ============================================
-- 电脑办公 - 游戏本 (category_id = 20102)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(38, 'ROG 枪神9 Plus', 20102, 'ROG', '<p>i9-14900HX | RTX 5070 | 18英寸2.5K 240Hz | 星云屏</p>', '/uploads/product/rog9p.jpg', '["/uploads/product/rog9p_1.jpg","/uploads/product/rog9p_2.jpg"]', 1, 3210),
(39, '联想拯救者 Y9000P 2025', 20102, '联想', '<p>i9-14900HX | RTX 5070 | 16英寸2.5K 240Hz | 140W满血</p>', '/uploads/product/y9000p.jpg', '["/uploads/product/y9000p_1.jpg","/uploads/product/y9000p_2.jpg"]', 1, 4560),
(40, '暗影精灵 10', 20102, '惠普', '<p>i7-14700HX | RTX 5070 | 16.1英寸QHD 240Hz | 四区RGB键盘</p>', '/uploads/product/omen10.jpg', '["/uploads/product/omen10_1.jpg","/uploads/product/omen10_2.jpg"]', 1, 2870);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(107, 38, '黑色/16GB/1TB', '{"颜色":"黑色","内存":"16GB","存储":"1TB"}', 12999.00, 13999.00, 10500.00, 120, 5, 1),
(108, 38, '黑色/32GB/2TB', '{"颜色":"黑色","内存":"32GB","存储":"2TB"}', 15999.00, 16999.00, 12900.00, 60, 2, 1),
(109, 38, '月耀白/32GB/2TB', '{"颜色":"月耀白","内存":"32GB","存储":"2TB"}', 15999.00, 16999.00, 12900.00, 40, 1, 1),
(110, 39, '钛晶灰/16GB/1TB', '{"颜色":"钛晶灰","内存":"16GB","存储":"1TB"}', 9999.00, 10999.00, 8000.00, 180, 8, 1),
(111, 39, '钛晶灰/32GB/2TB', '{"颜色":"钛晶灰","内存":"32GB","存储":"2TB"}', 12499.00, 13499.00, 10000.00, 90, 3, 1),
(112, 39, '冰魄白/32GB/2TB', '{"颜色":"冰魄白","内存":"32GB","存储":"2TB"}', 12499.00, 13499.00, 10000.00, 70, 2, 1),
(113, 40, '暗影黑/16GB/1TB', '{"颜色":"暗影黑","内存":"16GB","存储":"1TB"}', 8999.00, 9499.00, 7200.00, 150, 7, 1),
(114, 40, '暗影黑/32GB/2TB', '{"颜色":"暗影黑","内存":"32GB","存储":"2TB"}', 10999.00, 11499.00, 8800.00, 80, 3, 1),
(115, 40, '魅影白/32GB/2TB', '{"颜色":"魅影白","内存":"32GB","存储":"2TB"}', 10999.00, 11499.00, 8800.00, 60, 2, 1);

-- ============================================
-- 电脑办公 - 显示器 (category_id = 203)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(41, 'Dell U3224KB 32英寸 6K', 203, 'Dell', '<p>32英寸IPS Black | 6K分辨率 | Thunderbolt 4 | 内置摄像头</p>', '/uploads/product/dellu3224.jpg', '["/uploads/product/dellu3224_1.jpg","/uploads/product/dellu3224_2.jpg"]', 1, 1230),
(42, 'LG 27GP950 27英寸 4K 160Hz', 203, 'LG', '<p>27英寸Nano IPS | 4K 160Hz | HDMI 2.1 | G-Sync Compatible</p>', '/uploads/product/lg27gp950.jpg', '["/uploads/product/lg27gp950_1.jpg","/uploads/product/lg27gp950_2.jpg"]', 1, 2340),
(43, '红魔 5088 电竞显示器', 203, '红魔', '<p>27英寸MiniLED | 4K 160Hz / FHD 320Hz双模 | 1152分区</p>', '/uploads/product/redmagic5088.jpg', '["/uploads/product/redmagic5088_1.jpg","/uploads/product/redmagic5088_2.jpg"]', 1, 1890);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(116, 41, '银色', '{"颜色":"银色"}', 23999.00, 24999.00, 19200.00, 30, 1, 1),
(117, 41, '黑色', '{"颜色":"黑色"}', 23999.00, 24999.00, 19200.00, 25, 0, 1),
(118, 42, '黑色', '{"颜色":"黑色"}', 3999.00, 4499.00, 3200.00, 150, 8, 1),
(119, 42, '白色', '{"颜色":"白色"}', 3999.00, 4499.00, 3200.00, 120, 5, 1),
(120, 43, '暗夜黑', '{"颜色":"暗夜黑"}', 3199.00, 3699.00, 2500.00, 180, 10, 1),
(121, 43, '银翼灰', '{"颜色":"银翼灰"}', 3199.00, 3699.00, 2500.00, 140, 6, 1);

-- ============================================
-- 电脑办公 - 键盘 (category_id = 20501)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(44, 'MX Keys S 无线键盘', 20501, 'Logitech', '<p>Perfect Stroke按键 | 多设备切换 | 智能背光 | USB-C充电</p>', '/uploads/product/mxkeyss.jpg', '["/uploads/product/mxkeyss_1.jpg","/uploads/product/mxkeyss_2.jpg"]', 1, 5430),
(45, 'Apex Pro TKL 磁轴键盘', 20501, 'SteelSeries', '<p>OmniPoint 2.0磁轴 | 快速触发 | 87键紧凑布局 | OLED屏幕</p>', '/uploads/product/apexpro.jpg', '["/uploads/product/apexpro_1.jpg","/uploads/product/apexpro_2.jpg"]', 1, 2340),
(46, 'Keychron Q6 Max 机械键盘', 20501, 'Keychron', '<p>Gasket结构 | 佳达隆木星轴 | 双色注塑PBT键帽 | QMK/VIA</p>', '/uploads/product/keychronq6.jpg', '["/uploads/product/keychronq6_1.jpg","/uploads/product/keychronq6_2.jpg"]', 1, 1870);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(122, 44, '石墨黑/全尺寸', '{"颜色":"石墨黑","尺寸":"全尺寸"}', 699.00, 799.00, 520.00, 400, 20, 1),
(123, 44, '珍珠白/全尺寸', '{"颜色":"珍珠白","尺寸":"全尺寸"}', 699.00, 799.00, 520.00, 350, 18, 1),
(124, 44, '石墨黑/Mini', '{"颜色":"石墨黑","尺寸":"Mini"}', 499.00, 599.00, 380.00, 300, 15, 1),
(125, 45, '黑色/英语', '{"颜色":"黑色","配列":"英语"}', 1599.00, 1799.00, 1250.00, 200, 8, 1),
(126, 45, '黑色/中文', '{"颜色":"黑色","配列":"中文"}', 1699.00, 1899.00, 1350.00, 150, 5, 1),
(127, 46, '碳黑/RGB/红轴', '{"颜色":"碳黑","背光":"RGB","轴体":"红轴"}', 829.00, 929.00, 650.00, 180, 9, 1),
(128, 46, '碳黑/RGB/茶轴', '{"颜色":"碳黑","背光":"RGB","轴体":"茶轴"}', 829.00, 929.00, 650.00, 160, 7, 1),
(129, 46, '银白/RGB/红轴', '{"颜色":"银白","背光":"RGB","轴体":"红轴"}', 829.00, 929.00, 650.00, 140, 5, 1),
(130, 46, '银白/RGB/茶轴', '{"颜色":"银白","背光":"RGB","轴体":"茶轴"}', 829.00, 929.00, 650.00, 120, 4, 1);

-- ============================================
-- 电脑办公 - 鼠标 (category_id = 20502)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(47, 'MX Master 4S 无线鼠标', 20502, 'Logitech', '<p>8000DPI | 电磁滚轮 | 多设备跨屏 | USB-C快充 | 人体工学</p>', '/uploads/product/mxmaster4s.jpg', '["/uploads/product/mxmaster4s_1.jpg","/uploads/product/mxmaster4s_2.jpg"]', 1, 6540),
(48, 'GPW 3 狗屁王三代', 20502, 'Logitech', '<p>HERO 3传感器 | 32000DPI | 60g轻量化 | LIGHTSPEED无线</p>', '/uploads/product/gpw3.jpg', '["/uploads/product/gpw3_1.jpg","/uploads/product/gpw3_2.jpg"]', 1, 4320),
(49, '毒蝰 V4 Pro', 20502, 'Razer', '<p>Focus Pro 35K传感器 | 58g轻量 | 8000Hz轮询 | 第三代光微动</p>', '/uploads/product/viperv4.jpg', '["/uploads/product/viperv4_1.jpg","/uploads/product/viperv4_2.jpg"]', 1, 3210);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(131, 47, '石墨黑', '{"颜色":"石墨黑"}', 799.00, 899.00, 600.00, 450, 22, 1),
(132, 47, '珍珠白', '{"颜色":"珍珠白"}', 799.00, 899.00, 600.00, 350, 15, 1),
(133, 48, '黑色', '{"颜色":"黑色"}', 999.00, 1099.00, 780.00, 350, 18, 1),
(134, 48, '白色', '{"颜色":"白色"}', 999.00, 1099.00, 780.00, 280, 12, 1),
(135, 48, '品红', '{"颜色":"品红"}', 1099.00, 1199.00, 860.00, 180, 6, 1),
(136, 49, '黑色', '{"颜色":"黑色"}', 999.00, 1099.00, 780.00, 300, 15, 1),
(137, 49, '白色', '{"颜色":"白色"}', 999.00, 1099.00, 780.00, 240, 10, 1);

-- ============================================
-- 家用电器 - 空调 (category_id = 30101)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(50, '格力 冷静王+ 1.5匹 新一级', 30101, '格力', '<p>1.5匹变频 | 新一级能效 | 56℃净菌自洁 | 18分贝低噪</p>', '/uploads/product/gree15.jpg', '["/uploads/product/gree15_1.jpg","/uploads/product/gree15_2.jpg"]', 1, 7650),
(51, '美的 风尊 大1.5匹 新一级', 30101, '美的', '<p>大1.5匹变频 | 180°旋转风 | 新一级能效 | 第四代智清洁</p>', '/uploads/product/midea15.jpg', '["/uploads/product/midea15_1.jpg","/uploads/product/midea15_2.jpg"]', 1, 6540),
(52, '海尔 劲爽 1.5匹 新一级', 30101, '海尔', '<p>1.5匹变频 | 56℃高温自清洁 | PMV舒适模式 | 17分贝</p>', '/uploads/product/haier15.jpg', '["/uploads/product/haier15_1.jpg","/uploads/product/haier15_2.jpg"]', 1, 4320);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(138, 50, '皓雪白/1.5匹', '{"颜色":"皓雪白","匹数":"1.5匹"}', 3299.00, 3699.00, 2600.00, 280, 12, 1),
(139, 50, '奢华金/1.5匹', '{"颜色":"奢华金","匹数":"1.5匹"}', 3499.00, 3899.00, 2800.00, 180, 6, 1),
(140, 50, '皓雪白/大1.5匹', '{"颜色":"皓雪白","匹数":"大1.5匹"}', 3699.00, 4099.00, 2900.00, 200, 8, 1),
(141, 51, '冰莹白/1.5匹', '{"颜色":"冰莹白","匹数":"1.5匹"}', 2999.00, 3399.00, 2400.00, 320, 15, 1),
(142, 51, '冰莹白/大1.5匹', '{"颜色":"冰莹白","匹数":"大1.5匹"}', 3399.00, 3799.00, 2700.00, 220, 10, 1),
(143, 51, '鎏金咖/大1.5匹', '{"颜色":"鎏金咖","匹数":"大1.5匹"}', 3599.00, 3999.00, 2850.00, 150, 5, 1),
(144, 52, '白色/1.5匹', '{"颜色":"白色","匹数":"1.5匹"}', 2799.00, 3099.00, 2200.00, 350, 18, 1),
(145, 52, '白色/大1.5匹', '{"颜色":"白色","匹数":"大1.5匹"}', 3199.00, 3499.00, 2500.00, 250, 12, 1);

-- ============================================
-- 家用电器 - 洗衣机 (category_id = 302)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(53, '小天鹅 水魔方 10kg洗烘一体', 302, '小天鹅', '<p>10kg洗+7kg烘 | 水魔方冷水洗 | U.2紫外线除菌 | 超薄嵌入</p>', '/uploads/product/littleswan10.jpg', '["/uploads/product/littleswan10_1.jpg","/uploads/product/littleswan10_2.jpg"]', 1, 5430),
(54, '海尔 精华洗 10kg', 302, '海尔', '<p>10kg变频 | 精华湿洗科技 | 双喷淋 | 智能投放 | 超薄525mm</p>', '/uploads/product/haier10.jpg', '["/uploads/product/haier10_1.jpg","/uploads/product/haier10_2.jpg"]', 1, 4320),
(55, '西门子 iQ500 10kg洗烘一体', 302, '西门子', '<p>10kg洗+6kg烘 | i-Dos智能投放 | 热风清新 | BLDC变频</p>', '/uploads/product/siemens10.jpg', '["/uploads/product/siemens10_1.jpg","/uploads/product/siemens10_2.jpg"]', 1, 3210);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(146, 53, '巴赫银', '{"颜色":"巴赫银"}', 3999.00, 4599.00, 3200.00, 220, 10, 1),
(147, 53, '深空灰', '{"颜色":"深空灰"}', 3999.00, 4599.00, 3200.00, 180, 8, 1),
(148, 54, '星蕴银', '{"颜色":"星蕴银"}', 3299.00, 3799.00, 2600.00, 280, 15, 1),
(149, 54, '玉墨银', '{"颜色":"玉墨银"}', 3499.00, 3999.00, 2800.00, 200, 10, 1),
(150, 55, '白色', '{"颜色":"白色"}', 5999.00, 6499.00, 4800.00, 150, 6, 1),
(151, 55, '银色', '{"颜色":"银色"}', 5999.00, 6499.00, 4800.00, 120, 4, 1);

-- ============================================
-- 家用电器 - 冰箱 (category_id = 303)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(56, '容声 513L 双系统十字对开', 303, '容声', '<p>513L大容量 | 双系统循环 | 全空间净化 | -34℃深冷锁鲜</p>', '/uploads/product/ronshen513.jpg', '["/uploads/product/ronshen513_1.jpg","/uploads/product/ronshen513_2.jpg"]', 1, 3450),
(57, '卡萨帝 555L 法式多门', 303, '卡萨帝', '<p>555L | MSA控氧保鲜 | 双重杀菌净化 | 自由嵌入安装</p>', '/uploads/product/casarte555.jpg', '["/uploads/product/casarte555_1.jpg","/uploads/product/casarte555_2.jpg"]', 1, 2100),
(58, '美的 508L 微晶一周鲜', 303, '美的', '<p>508L | PST智能净化 | 微晶一周鲜 | -32℃深冷锁鲜</p>', '/uploads/product/midea508.jpg', '["/uploads/product/midea508_1.jpg","/uploads/product/midea508_2.jpg"]', 1, 2870);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(152, 56, '星蕴银/513L', '{"颜色":"星蕴银","容量":"513L"}', 4299.00, 4999.00, 3500.00, 200, 10, 1),
(153, 56, '星河银/513L', '{"颜色":"星河银","容量":"513L"}', 4499.00, 5199.00, 3700.00, 150, 6, 1),
(154, 57, '原石冰极/555L', '{"颜色":"原石冰极","容量":"555L"}', 10999.00, 12999.00, 8800.00, 80, 3, 1),
(155, 57, '晶钻紫/555L', '{"颜色":"晶钻紫","容量":"555L"}', 10999.00, 12999.00, 8800.00, 60, 2, 1),
(156, 58, '莫兰迪灰/508L', '{"颜色":"莫兰迪灰","容量":"508L"}', 5999.00, 6999.00, 4800.00, 160, 8, 1),
(157, 58, '锦绣金/508L', '{"颜色":"锦绣金","容量":"508L"}', 6299.00, 7299.00, 5000.00, 120, 5, 1);

-- ============================================
-- 家用电器 - 厨房电器 (category_id = 30401, 30405)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(59, '苏泊尔 IH球釜电饭煲 4L', 30401, '苏泊尔', '<p>IH电磁加热 | 球釜内胆 | 24h预约 | 4L容量 | 触控面板</p>', '/uploads/product/suporih.jpg', '["/uploads/product/suporih_1.jpg","/uploads/product/suporih_2.jpg"]', 1, 8760),
(60, '美的 纤V 电饭煲 3L', 30401, '美的', '<p>IH加热 | 备长炭铜釜 | 智能感温系统 | 3L容量 | 超薄机身</p>', '/uploads/product/mideaih.jpg', '["/uploads/product/mideaih_1.jpg","/uploads/product/mideaih_2.jpg"]', 1, 6540),
(61, '飞利浦 空气炸锅 6.2L', 30405, '飞利浦', '<p>Rapid Air高速热风 | 少油健康 | 6.2L大容量 | 触控面板</p>', '/uploads/product/philipsaf.jpg', '["/uploads/product/philipsaf_1.jpg","/uploads/product/philipsaf_2.jpg"]', 1, 7650),
(62, '九阳 可视空气炸锅 5L', 30405, '九阳', '<p>可视窗口 | 360°热风循环 | 5L容量 | 12大菜单 | 不粘内胆</p>', '/uploads/product/joyoungaf.jpg', '["/uploads/product/joyoungaf_1.jpg","/uploads/product/joyoungaf_2.jpg"]', 1, 5430);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(158, 59, '深棕色/4L', '{"颜色":"深棕色","容量":"4L"}', 499.00, 599.00, 380.00, 500, 30, 1),
(159, 59, '香槟金/4L', '{"颜色":"香槟金","容量":"4L"}', 499.00, 599.00, 380.00, 400, 22, 1),
(160, 60, '星耀黑/3L', '{"颜色":"星耀黑","容量":"3L"}', 699.00, 799.00, 540.00, 380, 20, 1),
(161, 60, '珍珠白/3L', '{"颜色":"珍珠白","容量":"3L"}', 699.00, 799.00, 540.00, 300, 15, 1),
(162, 61, '黑色/6.2L', '{"颜色":"黑色","容量":"6.2L"}', 899.00, 1099.00, 700.00, 350, 18, 1),
(163, 61, '白色/6.2L', '{"颜色":"白色","容量":"6.2L"}', 899.00, 1099.00, 700.00, 280, 12, 1),
(164, 62, '白色/5L', '{"颜色":"白色","容量":"5L"}', 399.00, 499.00, 300.00, 450, 25, 1),
(165, 62, '墨绿色/5L', '{"颜色":"墨绿色","容量":"5L"}', 399.00, 499.00, 300.00, 350, 18, 1);

-- ============================================
-- 家用电器 - 扫地机器人 (category_id = 30501)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(63, '石头 G30 自清洁扫拖机器人', 30501, '石头', '<p>7000Pa吸力 | 热水洗拖布 | 全能基站 | 避障系统4.0</p>', '/uploads/product/roborockg30.jpg', '["/uploads/product/roborockg30_1.jpg","/uploads/product/roborockg30_2.jpg"]', 1, 4320),
(64, '科沃斯 X5 PRO', 30501, '科沃斯', '<p>12800Pa吸力 | 全能基站 | 方圆形机身 | AIVI 3D避障</p>', '/uploads/product/ecovacsx5.jpg', '["/uploads/product/ecovacsx5_1.jpg","/uploads/product/ecovacsx5_2.jpg"]', 1, 3450),
(65, '追觅 X50 Ultra', 30501, '追觅', '<p>19500Pa吸力 | 仿生机械臂 | 热水洗拖布 | 全能基站</p>', '/uploads/product/dreamex50.jpg', '["/uploads/product/dreamex50_1.jpg","/uploads/product/dreamex50_2.jpg"]', 1, 2870);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(166, 63, '白色/水箱版', '{"颜色":"白色","版本":"水箱版"}', 3999.00, 4599.00, 3200.00, 250, 12, 1),
(167, 63, '白色/上下水版', '{"颜色":"白色","版本":"上下水版"}', 4499.00, 5099.00, 3600.00, 180, 8, 1),
(168, 63, '黑色/上下水版', '{"颜色":"黑色","版本":"上下水版"}', 4499.00, 5099.00, 3600.00, 120, 4, 1),
(169, 64, '月岩灰/水箱版', '{"颜色":"月岩灰","版本":"水箱版"}', 3799.00, 4299.00, 3000.00, 220, 10, 1),
(170, 64, '月岩灰/上下水版', '{"颜色":"月岩灰","版本":"上下水版"}', 4299.00, 4799.00, 3400.00, 150, 6, 1),
(171, 65, '深空灰/水箱版', '{"颜色":"深空灰","版本":"水箱版"}', 4599.00, 5299.00, 3700.00, 200, 9, 1),
(172, 65, '深空灰/上下水版', '{"颜色":"深空灰","版本":"上下水版"}', 5099.00, 5799.00, 4100.00, 130, 5, 1);

-- ============================================
-- 家用电器 - 智能电视 (category_id = 30701)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(66, '小米电视 S Pro 85英寸', 30701, '小米', '<p>85英寸MiniLED | 4K 144Hz | 2400nits | 240分区 | HyperOS</p>', '/uploads/product/mitv85.jpg', '["/uploads/product/mitv85_1.jpg","/uploads/product/mitv85_2.jpg"]', 1, 3210),
(67, 'TCL Q10K Pro 75英寸', 30701, 'TCL', '<p>75英寸QD-MiniLED | 4K 144Hz | 5000nits | 5000+分区</p>', '/uploads/product/tcl75q10k.jpg', '["/uploads/product/tcl75q10k_1.jpg","/uploads/product/tcl75q10k_2.jpg"]', 1, 2340),
(68, '海信 U8N 65英寸', 30701, '海信', '<p>65英寸ULED X | 5000nits | 2000+分区 | 信芯AI画质芯片</p>', '/uploads/product/hisense65u8n.jpg', '["/uploads/product/hisense65u8n_1.jpg","/uploads/product/hisense65u8n_2.jpg"]', 1, 1870);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(173, 66, '深空灰/85英寸', '{"颜色":"深空灰","尺寸":"85英寸"}', 6999.00, 7999.00, 5600.00, 150, 6, 1),
(174, 66, '深空灰/75英寸', '{"颜色":"深空灰","尺寸":"75英寸"}', 4999.00, 5999.00, 4000.00, 120, 5, 1),
(175, 67, '枪色/75英寸', '{"颜色":"枪色","尺寸":"75英寸"}', 8999.00, 9999.00, 7200.00, 100, 4, 1),
(176, 67, '枪色/85英寸', '{"颜色":"枪色","尺寸":"85英寸"}', 11999.00, 12999.00, 9600.00, 60, 2, 1),
(177, 68, '流砂锖/65英寸', '{"颜色":"流砂锖","尺寸":"65英寸"}', 6999.00, 7999.00, 5600.00, 130, 5, 1),
(178, 68, '流砂锖/75英寸', '{"颜色":"流砂锖","尺寸":"75英寸"}', 9999.00, 10999.00, 8000.00, 80, 3, 1);

-- ============================================
-- 服饰鞋包 - 女装 (category_id = 40101, 40102)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(69, '法式复古碎花连衣裙', 40101, '伊芙丽', '<p>100%桑蚕丝 | 法式V领 | 收腰A字版型 | 中长款 | 优雅碎花</p>', '/uploads/product/floraldress.jpg', '["/uploads/product/floraldress_1.jpg","/uploads/product/floraldress_2.jpg"]', 1, 4320),
(70, '通勤垂感直筒连衣裙', 40101, '太平鸟', '<p>醋酸混纺面料 | 直筒版型 | 简约纯色 | 职场通勤 | 中长款</p>', '/uploads/product/office_dress.jpg', '["/uploads/product/office_dress_1.jpg","/uploads/product/office_dress_2.jpg"]', 1, 3450),
(71, '纯棉宽松印花T恤', 40102, '优衣库', '<p>100%新疆长绒棉 | 210g重磅 | 宽松落肩 | 原创印花</p>', '/uploads/product/cottontee.jpg', '["/uploads/product/cottontee_1.jpg","/uploads/product/cottontee_2.jpg"]', 1, 8760),
(72, '冰氧吧凉感T恤', 40102, '森马', '<p>冰氧吧面料 | 接触凉感 | UPF50+防晒 | 宽松版型 | 多色可选</p>', '/uploads/product/icete.jpg', '["/uploads/product/icete_1.jpg","/uploads/product/icete_2.jpg"]', 1, 6540);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(179, 69, '碎花蓝/S', '{"颜色":"碎花蓝","尺码":"S"}', 599.00, 799.00, 420.00, 250, 12, 1),
(180, 69, '碎花蓝/M', '{"颜色":"碎花蓝","尺码":"M"}', 599.00, 799.00, 420.00, 350, 18, 1),
(181, 69, '碎花蓝/L', '{"颜色":"碎花蓝","尺码":"L"}', 599.00, 799.00, 420.00, 280, 14, 1),
(182, 69, '碎花粉/M', '{"颜色":"碎花粉","尺码":"M"}', 599.00, 799.00, 420.00, 200, 10, 1),
(183, 69, '碎花粉/L', '{"颜色":"碎花粉","尺码":"L"}', 599.00, 799.00, 420.00, 180, 8, 1),
(184, 70, '黑色/S', '{"颜色":"黑色","尺码":"S"}', 459.00, 599.00, 320.00, 300, 15, 1),
(185, 70, '黑色/M', '{"颜色":"黑色","尺码":"M"}', 459.00, 599.00, 320.00, 400, 22, 1),
(186, 70, '黑色/L', '{"颜色":"黑色","尺码":"L"}', 459.00, 599.00, 320.00, 320, 16, 1),
(187, 70, '藏青色/M', '{"颜色":"藏青色","尺码":"M"}', 459.00, 599.00, 320.00, 250, 12, 1),
(188, 70, '藏青色/L', '{"颜色":"藏青色","尺码":"L"}', 459.00, 599.00, 320.00, 200, 9, 1),
(189, 71, '白色/S', '{"颜色":"白色","尺码":"S"}', 129.00, 149.00, 85.00, 600, 35, 1),
(190, 71, '白色/M', '{"颜色":"白色","尺码":"M"}', 129.00, 149.00, 85.00, 800, 50, 1),
(191, 71, '白色/L', '{"颜色":"白色","尺码":"L"}', 129.00, 149.00, 85.00, 650, 40, 1),
(192, 71, '黑色/M', '{"颜色":"黑色","尺码":"M"}', 129.00, 149.00, 85.00, 700, 45, 1),
(193, 71, '黑色/L', '{"颜色":"黑色","尺码":"L"}', 129.00, 149.00, 85.00, 550, 30, 1),
(194, 71, '雾霾蓝/M', '{"颜色":"雾霾蓝","尺码":"M"}', 129.00, 149.00, 85.00, 380, 20, 1),
(195, 72, '雾蓝/S', '{"颜色":"雾蓝","尺码":"S"}', 89.00, 119.00, 58.00, 500, 28, 1),
(196, 72, '雾蓝/M', '{"颜色":"雾蓝","尺码":"M"}', 89.00, 119.00, 58.00, 700, 42, 1),
(197, 72, '雾蓝/L', '{"颜色":"雾蓝","尺码":"L"}', 89.00, 119.00, 58.00, 550, 30, 1),
(198, 72, '黑色/M', '{"颜色":"黑色","尺码":"M"}', 89.00, 119.00, 58.00, 600, 35, 1),
(199, 72, '白色/M', '{"颜色":"白色","尺码":"M"}', 89.00, 119.00, 58.00, 450, 25, 1);

-- ============================================
-- 服饰鞋包 - 男装 (category_id = 40201, 40202)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(73, '商务休闲轻奢夹克', 40201, '海澜之家', '<p>高支棉面料 | 立领设计 | 商务休闲两穿 | 防风保暖</p>', '/uploads/product/bizjacket.jpg', '["/uploads/product/bizjacket_1.jpg","/uploads/product/bizjacket_2.jpg"]', 1, 5430),
(74, '防泼水户外机能夹克', 40201, '探路者', '<p>防泼水面料 | 多口袋设计 | 连帽可收纳 | 轻薄透气</p>', '/uploads/product/outdoorjacket.jpg', '["/uploads/product/outdoorjacket_1.jpg","/uploads/product/outdoorjacket_2.jpg"]', 1, 3210),
(75, '免烫抗皱修身衬衫', 40202, '报喜鸟', '<p>100%长绒棉 | 免烫抗皱科技 | 修身版型 | 八字领 | 商务正装</p>', '/uploads/product/nonironshirt.jpg', '["/uploads/product/nonironshirt_1.jpg","/uploads/product/nonironshirt_2.jpg"]', 1, 4560),
(76, '弹力牛津纺衬衫', 40202, '凡客诚品', '<p>弹力牛津纺 | 经典领尖扣 | 加厚密织 | 不缩水不变形</p>', '/uploads/product/oxfordshirt.jpg', '["/uploads/product/oxfordshirt_1.jpg","/uploads/product/oxfordshirt_2.jpg"]', 1, 6540);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(200, 73, '深蓝色/M', '{"颜色":"深蓝色","尺码":"M"}', 699.00, 899.00, 480.00, 300, 15, 1),
(201, 73, '深蓝色/L', '{"颜色":"深蓝色","尺码":"L"}', 699.00, 899.00, 480.00, 420, 22, 1),
(202, 73, '深蓝色/XL', '{"颜色":"深蓝色","尺码":"XL"}', 699.00, 899.00, 480.00, 350, 18, 1),
(203, 73, '卡其色/L', '{"颜色":"卡其色","尺码":"L"}', 699.00, 899.00, 480.00, 280, 12, 1),
(204, 73, '卡其色/XL', '{"颜色":"卡其色","尺码":"XL"}', 699.00, 899.00, 480.00, 220, 10, 1),
(205, 74, '军绿色/M', '{"颜色":"军绿色","尺码":"M"}', 459.00, 599.00, 320.00, 280, 14, 1),
(206, 74, '军绿色/L', '{"颜色":"军绿色","尺码":"L"}', 459.00, 599.00, 320.00, 350, 18, 1),
(207, 74, '军绿色/XL', '{"颜色":"军绿色","尺码":"XL"}', 459.00, 599.00, 320.00, 250, 10, 1),
(208, 74, '黑色/L', '{"颜色":"黑色","尺码":"L"}', 459.00, 599.00, 320.00, 300, 15, 1),
(209, 74, '黑色/XL', '{"颜色":"黑色","尺码":"XL"}', 459.00, 599.00, 320.00, 220, 8, 1),
(210, 75, '白色/38', '{"颜色":"白色","尺码":"38"}', 459.00, 559.00, 320.00, 220, 10, 1),
(211, 75, '白色/39', '{"颜色":"白色","尺码":"39"}', 459.00, 559.00, 320.00, 350, 18, 1),
(212, 75, '白色/40', '{"颜色":"白色","尺码":"40"}', 459.00, 559.00, 320.00, 400, 22, 1),
(213, 75, '白色/41', '{"颜色":"白色","尺码":"41"}', 459.00, 559.00, 320.00, 300, 15, 1),
(214, 75, '浅蓝色/39', '{"颜色":"浅蓝色","尺码":"39"}', 459.00, 559.00, 320.00, 280, 12, 1),
(215, 75, '浅蓝色/40', '{"颜色":"浅蓝色","尺码":"40"}', 459.00, 559.00, 320.00, 350, 16, 1),
(216, 75, '浅蓝色/41', '{"颜色":"浅蓝色","尺码":"41"}', 459.00, 559.00, 320.00, 250, 10, 1),
(217, 76, '白色/M', '{"颜色":"白色","尺码":"M"}', 169.00, 199.00, 110.00, 500, 30, 1),
(218, 76, '白色/L', '{"颜色":"白色","尺码":"L"}', 169.00, 199.00, 110.00, 650, 40, 1),
(219, 76, '白色/XL', '{"颜色":"白色","尺码":"XL"}', 169.00, 199.00, 110.00, 500, 28, 1),
(220, 76, '蓝色/L', '{"颜色":"蓝色","尺码":"L"}', 169.00, 199.00, 110.00, 450, 25, 1),
(221, 76, '蓝色/XL', '{"颜色":"蓝色","尺码":"XL"}', 169.00, 199.00, 110.00, 380, 20, 1);

-- ============================================
-- 服饰鞋包 - 运动鞋 (category_id = 40401)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(77, 'Air Zoom Pegasus 42', 40401, 'Nike', '<p>ZoomX泡棉 | Flyknit鞋面 | 前后掌Zoom Air | 公路跑鞋</p>', '/uploads/product/pegasus42.jpg', '["/uploads/product/pegasus42_1.jpg","/uploads/product/pegasus42_2.jpg"]', 1, 6540),
(78, 'Ultraboost 5.0 DNA', 40401, 'Adidas', '<p>BOOST中底 | Primeknit+编织鞋面 | LEP推进系统 | 城市跑鞋</p>', '/uploads/product/ub5.jpg', '["/uploads/product/ub5_1.jpg","/uploads/product/ub5_2.jpg"]', 1, 5430),
(79, '飞影PB 5.0 碳板跑鞋', 40401, '乔丹', '<p>全掌碳板 | 超临界物理发泡 | 轻量化 | 竞赛级马拉松鞋</p>', '/uploads/product/feiyingpb5.jpg', '["/uploads/product/feiyingpb5_1.jpg","/uploads/product/feiyingpb5_2.jpg"]', 1, 3210);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(222, 77, '黑白/38', '{"颜色":"黑白","尺码":"38"}', 899.00, 999.00, 650.00, 220, 12, 1),
(223, 77, '黑白/39', '{"颜色":"黑白","尺码":"39"}', 899.00, 999.00, 650.00, 300, 18, 1),
(224, 77, '黑白/40', '{"颜色":"黑白","尺码":"40"}', 899.00, 999.00, 650.00, 400, 25, 1),
(225, 77, '黑白/41', '{"颜色":"黑白","尺码":"41"}', 899.00, 999.00, 650.00, 380, 22, 1),
(226, 77, '黑白/42', '{"颜色":"黑白","尺码":"42"}', 899.00, 999.00, 650.00, 320, 18, 1),
(227, 77, '黑白/43', '{"颜色":"黑白","尺码":"43"}', 899.00, 999.00, 650.00, 250, 12, 1),
(228, 77, '全黑/40', '{"颜色":"全黑","尺码":"40"}', 899.00, 999.00, 650.00, 280, 15, 1),
(229, 77, '全黑/41', '{"颜色":"全黑","尺码":"41"}', 899.00, 999.00, 650.00, 300, 16, 1),
(230, 77, '全黑/42', '{"颜色":"全黑","尺码":"42"}', 899.00, 999.00, 650.00, 250, 12, 1),
(231, 78, '核心黑/39', '{"颜色":"核心黑","尺码":"39"}', 799.00, 899.00, 580.00, 280, 15, 1),
(232, 78, '核心黑/40', '{"颜色":"核心黑","尺码":"40"}', 799.00, 899.00, 580.00, 380, 22, 1),
(233, 78, '核心黑/41', '{"颜色":"核心黑","尺码":"41"}', 799.00, 899.00, 580.00, 420, 25, 1),
(234, 78, '核心黑/42', '{"颜色":"核心黑","尺码":"42"}', 799.00, 899.00, 580.00, 350, 20, 1),
(235, 78, '核心黑/43', '{"颜色":"核心黑","尺码":"43"}', 799.00, 899.00, 580.00, 280, 14, 1),
(236, 78, '云白/40', '{"颜色":"云白","尺码":"40"}', 799.00, 899.00, 580.00, 300, 16, 1),
(237, 78, '云白/41', '{"颜色":"云白","尺码":"41"}', 799.00, 899.00, 580.00, 350, 18, 1),
(238, 78, '云白/42', '{"颜色":"云白","尺码":"42"}', 799.00, 899.00, 580.00, 280, 12, 1),
(239, 79, '橙红/40', '{"颜色":"橙红","尺码":"40"}', 699.00, 799.00, 500.00, 220, 10, 1),
(240, 79, '橙红/41', '{"颜色":"橙红","尺码":"41"}', 699.00, 799.00, 500.00, 300, 18, 1),
(241, 79, '橙红/42', '{"颜色":"橙红","尺码":"42"}', 699.00, 799.00, 500.00, 320, 16, 1),
(242, 79, '橙红/43', '{"颜色":"橙红","尺码":"43"}', 699.00, 799.00, 500.00, 250, 12, 1),
(243, 79, '荧光绿/41', '{"颜色":"荧光绿","尺码":"41"}', 699.00, 799.00, 500.00, 200, 8, 1),
(244, 79, '荧光绿/42', '{"颜色":"荧光绿","尺码":"42"}', 699.00, 799.00, 500.00, 220, 10, 1);

-- ============================================
-- 服饰鞋包 - 双肩包 (category_id = 40501)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(80, 'Explorer 探索者双肩包', 40501, 'TUMI', '<p>弹道尼龙 | FXT保护层 | 15英寸笔记本仓 | RFID防盗</p>', '/uploads/product/tumiexplorer.jpg', '["/uploads/product/tumiexplorer_1.jpg","/uploads/product/tumiexplorer_2.jpg"]', 1, 2100),
(81, '休闲简约双肩包', 40501, '小米', '<p>防泼水面料 | 15.6英寸笔记本仓 | YKK拉链 | 透气背板</p>', '/uploads/product/mibackpack.jpg', '["/uploads/product/mibackpack_1.jpg","/uploads/product/mibackpack_2.jpg"]', 1, 6540),
(82, '户外徒步登山背包 40L', 40501, '探路者', '<p>40L大容量 | 背负系统 | 防雨罩 | 多点外挂 | 水袋仓</p>', '/uploads/product/trekking40.jpg', '["/uploads/product/trekking40_1.jpg","/uploads/product/trekking40_2.jpg"]', 1, 2340);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(245, 80, '黑色', '{"颜色":"黑色"}', 2499.00, 2999.00, 2000.00, 120, 5, 1),
(246, 80, '海军蓝', '{"颜色":"海军蓝"}', 2499.00, 2999.00, 2000.00, 100, 3, 1),
(247, 81, '深空灰', '{"颜色":"深空灰"}', 199.00, 249.00, 140.00, 500, 30, 1),
(248, 81, '黑色', '{"颜色":"黑色"}', 199.00, 249.00, 140.00, 600, 35, 1),
(249, 81, '军绿色', '{"颜色":"军绿色"}', 199.00, 249.00, 140.00, 350, 18, 1),
(250, 82, '军绿色/40L', '{"颜色":"军绿色","容量":"40L"}', 459.00, 599.00, 350.00, 200, 10, 1),
(251, 82, '深蓝色/40L', '{"颜色":"深蓝色","容量":"40L"}', 459.00, 599.00, 350.00, 180, 8, 1);

-- ============================================
-- 美妆个护 - 面部护肤 (category_id = 50101, 50103)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(83, '黑绷带活颜修护面霜 50ml', 50101, '赫莲娜', '<p>30%玻色因 | 夜间修护抗老 | 舒缓修复 | 贵妇面霜</p>', '/uploads/product/hrblackband.jpg', '["/uploads/product/hrblackband_1.jpg","/uploads/product/hrblackband_2.jpg"]', 1, 4320),
(84, '红宝石面霜 3.0 50g', 50101, '珀莱雅', '<p>超分子维A醇 | 胜肽组合 | 淡纹紧致 | 温和不刺激</p>', '/uploads/product/proyaruby.jpg', '["/uploads/product/proyaruby_1.jpg","/uploads/product/proyaruby_2.jpg"]', 1, 8760),
(85, '玻尿酸水光面膜 5片装', 50103, '敷尔佳', '<p>医用重组胶原蛋白 | 补水修复 | 械字号 | 敏感肌可用</p>', '/uploads/product/fuerjia.jpg', '["/uploads/product/fuerjia_1.jpg","/uploads/product/fuerjia_2.jpg"]', 1, 9870),
(86, '安瓶鲜注精华面膜 5片', 50103, '自然堂', '<p>烟酰胺+传明酸 | 膜液分离 | 新鲜激活 | 提亮肤色</p>', '/uploads/product/zrtmask.jpg', '["/uploads/product/zrtmask_1.jpg","/uploads/product/zrtmask_2.jpg"]', 1, 6540);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(252, 83, '经典版/50ml', '{"规格":"50ml"}', 3880.00, 3880.00, 3100.00, 180, 8, 1),
(253, 83, '轻盈版/50ml', '{"规格":"50ml","版本":"轻盈版"}', 3880.00, 3880.00, 3100.00, 150, 6, 1),
(254, 84, '滋润型/50g', '{"类型":"滋润型","规格":"50g"}', 189.00, 239.00, 130.00, 600, 35, 1),
(255, 84, '清爽型/50g', '{"类型":"清爽型","规格":"50g"}', 189.00, 239.00, 130.00, 500, 28, 1),
(256, 85, '5片/盒', '{"规格":"5片/盒"}', 139.00, 169.00, 95.00, 700, 45, 1),
(257, 86, '5片/盒', '{"规格":"5片/盒"}', 99.00, 129.00, 68.00, 550, 30, 1);

-- ============================================
-- 美妆个护 - 彩妆 (category_id = 50201)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(87, '小羊皮高定唇膏 #306', 50201, '纪梵希', '<p>真皮压纹管身 | 丝缎质地 | 高定色调 | 滋润不拔干</p>', '/uploads/product/givenchy306.jpg', '["/uploads/product/givenchy306_1.jpg","/uploads/product/givenchy306_2.jpg"]', 1, 4320),
(88, '绝色精华唇膏 #196', 50201, '兰蔻', '<p>玫瑰精华 | 奶油哑光 | 显白不挑皮 | 持色8小时</p>', '/uploads/product/lancome196.jpg', '["/uploads/product/lancome196_1.jpg","/uploads/product/lancome196_2.jpg"]', 1, 5430),
(89, '琉璃唇釉镜面水光', 50201, '完美日记', '<p>水光镜面 | 不沾杯 | 8h持妆 | 高饱和显色</p>', '/uploads/product/perfectliptint.jpg', '["/uploads/product/perfectliptint_1.jpg","/uploads/product/perfectliptint_2.jpg"]', 1, 7650);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(258, 87, '#306 正红', '{"色号":"#306 正红"}', 340.00, 380.00, 260.00, 280, 12, 1),
(259, 87, '#307 珊瑚红', '{"色号":"#307 珊瑚红"}', 340.00, 380.00, 260.00, 220, 8, 1),
(260, 87, '#308 干枯玫瑰', '{"色号":"#308 干枯玫瑰"}', 340.00, 380.00, 260.00, 250, 10, 1),
(261, 88, '#196 胡萝卜', '{"色号":"#196 胡萝卜"}', 290.00, 310.00, 220.00, 350, 18, 1),
(262, 88, '#274 奶茶色', '{"色号":"#274 奶茶色"}', 290.00, 310.00, 220.00, 300, 15, 1),
(263, 88, '#888 野莓红', '{"色号":"#888 野莓红"}', 290.00, 310.00, 220.00, 280, 12, 1),
(264, 89, '镜面水光01', '{"色号":"镜面水光01 草莓红"}', 69.00, 89.00, 42.00, 500, 30, 1),
(265, 89, '镜面水光02', '{"色号":"镜面水光02 蜜桃粉"}', 69.00, 89.00, 42.00, 450, 25, 1),
(266, 89, '镜面水光03', '{"色号":"镜面水光03 奶茶杏"}', 69.00, 89.00, 42.00, 420, 22, 1);

-- ============================================
-- 食品生鲜 - 新鲜水果 (category_id = 60101)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(90, '新疆阿克苏冰糖心苹果 5kg装', 60101, '产地直发', '<p>新疆阿克苏核心产区 | 果径80-85mm | 冰糖心 | 脆甜多汁</p>', '/uploads/product/aksu_apple.jpg', '["/uploads/product/aksu_apple_1.jpg","/uploads/product/aksu_apple_2.jpg"]', 1, 8760),
(91, '山东烟台红富士苹果 3kg', 60101, '产地直发', '<p>烟台栖霞核心产区 | 果径80mm+ | 皮薄肉脆 | 汁多味甜</p>', '/uploads/product/yantai_apple.jpg', '["/uploads/product/yantai_apple_1.jpg","/uploads/product/yantai_apple_2.jpg"]', 1, 6540);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(267, 90, '果径80-85mm/5kg', '{"果径":"80-85mm","规格":"5kg"}', 79.90, 99.00, 48.00, 500, 35, 1),
(268, 90, '果径85-90mm/5kg', '{"果径":"85-90mm","规格":"5kg"}', 99.00, 119.00, 60.00, 300, 20, 1),
(269, 91, '果径80mm+/3kg', '{"果径":"80mm+","规格":"3kg"}', 49.90, 59.90, 30.00, 600, 40, 1),
(270, 91, '果径75-80mm/3kg', '{"果径":"75-80mm","规格":"3kg"}', 39.90, 49.90, 24.00, 450, 28, 1);

-- ============================================
-- 食品生鲜 - 坚果炒货 (category_id = 60501)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(92, '每日坚果 混合装 750g/30袋', 60501, '三只松鼠', '<p>6种坚果果干 | 科学配比 | 独立小袋 | 每日一袋</p>', '/uploads/product/dailynuts.jpg', '["/uploads/product/dailynuts_1.jpg","/uploads/product/dailynuts_2.jpg"]', 1, 9870),
(93, '开心果 盐焗味 500g', 60501, '良品铺子', '<p>美国加州开心果 | 自然开口 | 盐焗轻调味 | 大颗粒</p>', '/uploads/product/pistachio.jpg', '["/uploads/product/pistachio_1.jpg","/uploads/product/pistachio_2.jpg"]', 1, 7650),
(94, '夏威夷果 奶油味 500g', 60501, '百草味', '<p>澳洲夏威夷果 | 奶油轻甜 | 开口器赠送 | 大颗粒直径20mm+</p>', '/uploads/product/macadamia.jpg', '["/uploads/product/macadamia_1.jpg","/uploads/product/macadamia_2.jpg"]', 1, 6540);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(271, 92, '每日坚果/750g', '{"规格":"750g/30袋"}', 99.00, 139.00, 65.00, 700, 50, 1),
(272, 93, '盐焗味/500g', '{"口味":"盐焗味","规格":"500g"}', 69.90, 89.90, 45.00, 550, 35, 1),
(273, 93, '原味/500g', '{"口味":"原味","规格":"500g"}', 69.90, 89.90, 45.00, 450, 28, 1),
(274, 94, '奶油味/500g', '{"口味":"奶油味","规格":"500g"}', 59.90, 79.90, 38.00, 500, 30, 1),
(275, 94, '原味/500g', '{"口味":"原味","规格":"500g"}', 59.90, 79.90, 38.00, 400, 22, 1);

-- ============================================
-- 食品生鲜 - 茗茶酒饮 (category_id = 60603, 60606)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(96, '飞天茅台 53度 500ml', 60603, '贵州茅台', '<p>酱香型 | 12987古法工艺 | 五年窖藏 | 53%vol</p>', '/uploads/product/moutai.jpg', '["/uploads/product/moutai_1.jpg","/uploads/product/moutai_2.jpg"]', 1, 5430),
(97, '三顿半 精品速溶咖啡 64颗', 60606, '三顿半', '<p>冷萃超即溶 | 64颗混合装 | 1-6号烘焙度 | 3秒溶于冰水</p>', '/uploads/product/saturnbird.jpg', '["/uploads/product/saturnbird_1.jpg","/uploads/product/saturnbird_2.jpg"]', 1, 8760);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(276, 96, '53度/500ml', '{"度数":"53%vol","规格":"500ml"}', 1499.00, 1499.00, 969.00, 100, 5, 1),
(277, 97, '64颗混合装', '{"规格":"64颗混合装"}', 189.00, 219.00, 135.00, 450, 25, 1),
(278, 97, '36颗经典装', '{"规格":"36颗经典装"}', 119.00, 139.00, 85.00, 380, 20, 1);

-- ============================================
-- 家具家装 - 沙发 (category_id = 70101)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(98, '云朵沙发 三人位 2.8m', 70101, '源氏木语', '<p>北美FAS级白橡木 | 科技布面料 | 高回弹海绵 | 实木框架</p>', '/uploads/product/cloudsofa.jpg', '["/uploads/product/cloudsofa_1.jpg","/uploads/product/cloudsofa_2.jpg"]', 1, 2100),
(99, '头层牛皮电动功能沙发 三人位', 70101, '顾家家居', '<p>意大利头层牛皮 | 电动伸缩 | 零重力躺位 | USB充电口</p>', '/uploads/product/kuka_sofa.jpg', '["/uploads/product/kuka_sofa_1.jpg","/uploads/product/kuka_sofa_2.jpg"]', 1, 1560);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(279, 98, '燕麦色/2.8m三人位', '{"颜色":"燕麦色","规格":"2.8m三人位"}', 4999.00, 5999.00, 3800.00, 60, 2, 1),
(280, 98, '烟灰色/2.8m三人位', '{"颜色":"烟灰色","规格":"2.8m三人位"}', 4999.00, 5999.00, 3800.00, 50, 1, 1),
(281, 98, '燕麦色/3.2m带贵妃', '{"颜色":"燕麦色","规格":"3.2m带贵妃位"}', 5999.00, 6999.00, 4600.00, 40, 1, 1),
(282, 99, '深棕色/三人位电动', '{"颜色":"深棕色","规格":"三人位电动"}', 8999.00, 10999.00, 7000.00, 35, 1, 1),
(283, 99, '灰白色/三人位电动', '{"颜色":"灰白色","规格":"三人位电动"}', 8999.00, 10999.00, 7000.00, 30, 0, 1);

-- ============================================
-- 家具家装 - 床 (category_id = 70201)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(100, '实木软包床 1.8m×2m', 70201, '源氏木语', '<p>北美黑胡桃木 | 高密度海绵软包 | 静音龙骨 | 气压储物</p>', '/uploads/product/woodbed.jpg', '["/uploads/product/woodbed_1.jpg","/uploads/product/woodbed_2.jpg"]', 1, 1890),
(101, '真皮轻奢大床 1.8m×2m', 70201, '慕思', '<p>头层牛皮靠背 | 齐边设计 | 金属高脚 | 实木排骨架</p>', '/uploads/product/leatherbed.jpg', '["/uploads/product/leatherbed_1.jpg","/uploads/product/leatherbed_2.jpg"]', 1, 1230);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(284, 100, '胡桃色/1.8m*2m', '{"颜色":"胡桃色","尺寸":"1.8m*2m"}', 4499.00, 5499.00, 3500.00, 45, 2, 1),
(285, 100, '原木色/1.8m*2m', '{"颜色":"原木色","尺寸":"1.8m*2m"}', 4499.00, 5499.00, 3500.00, 40, 1, 1),
(286, 100, '胡桃色/1.5m*2m', '{"颜色":"胡桃色","尺寸":"1.5m*2m"}', 3799.00, 4599.00, 2900.00, 35, 1, 1),
(287, 101, '深灰/1.8m*2m', '{"颜色":"深灰","尺寸":"1.8m*2m"}', 7999.00, 9999.00, 6200.00, 30, 1, 1),
(288, 101, '米白/1.8m*2m', '{"颜色":"米白","尺寸":"1.8m*2m"}', 7999.00, 9999.00, 6200.00, 25, 0, 1);

-- ============================================
-- 运动户外 - 跑步机 (category_id = 110301)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(102, '舒华 E9 智能折叠跑步机', 110301, '舒华', '<p>3.0HP无刷电机 | 18km/h | 电动18段坡度 | 可折叠 | 智能APP</p>', '/uploads/product/shuhua_e9.jpg', '["/uploads/product/shuhua_e9_1.jpg","/uploads/product/shuhua_e9_2.jpg"]', 1, 3210),
(103, 'Keep C2 Lite 家用跑步机', 110301, 'Keep', '<p>2.0HP马达 | 15km/h | 全折叠 | Keep APP联动 | 静音马达</p>', '/uploads/product/keepc2.jpg', '["/uploads/product/keepc2_1.jpg","/uploads/product/keepc2_2.jpg"]', 1, 5430);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(289, 102, '深灰', '{"颜色":"深灰"}', 5299.00, 5999.00, 4200.00, 80, 3, 1),
(290, 102, '银灰', '{"颜色":"银灰"}', 5299.00, 5999.00, 4200.00, 60, 2, 1),
(291, 103, '静谧黑', '{"颜色":"静谧黑"}', 2499.00, 2999.00, 1900.00, 150, 8, 1),
(292, 103, '霜晨白', '{"颜色":"霜晨白"}', 2499.00, 2999.00, 1900.00, 120, 5, 1);

-- ============================================
-- 运动户外 - 户外装备-帐篷 (category_id = 110401)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(104, '云尚 3 四季双人帐篷', 110401, 'NatureHike', '<p>20D尼龙面料 | PU2000+防水 | 双开门 | 2.1kg超轻 | 3-4季通用</p>', '/uploads/product/nhcloud3.jpg', '["/uploads/product/nhcloud3_1.jpg","/uploads/product/nhcloud3_2.jpg"]', 1, 2340),
(105, '繁星 3 家庭帐篷 4-6人', 110401, '牧高笛', '<p>150D牛津布 | PU3000+防水 | 一室一厅结构 | 防暴雨</p>', '/uploads/product/mobigarden_star3.jpg', '["/uploads/product/mobigarden_star3_1.jpg","/uploads/product/mobigarden_star3_2.jpg"]', 1, 1230);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(293, 104, '橄榄绿/双人', '{"颜色":"橄榄绿","规格":"双人"}', 599.00, 799.00, 450.00, 200, 10, 1),
(294, 104, '暖沙色/双人', '{"颜色":"暖沙色","规格":"双人"}', 599.00, 799.00, 450.00, 180, 8, 1),
(295, 105, '卡其色/4-6人', '{"颜色":"卡其色","规格":"4-6人"}', 1299.00, 1699.00, 1000.00, 100, 4, 1),
(296, 105, '军绿色/4-6人', '{"颜色":"军绿色","规格":"4-6人"}', 1299.00, 1699.00, 1000.00, 80, 3, 1);

-- ============================================
-- 宠物生活 - 猫粮狗粮 (category_id = 140101, 140102)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(106, '全价全阶段猫粮 5.4kg', 140101, '网易严选', '<p>70%鲜肉含量 | 无谷配方 | 冻干生骨肉包裹 | 全阶段通用</p>', '/uploads/product/yanxuan_cat.jpg', '["/uploads/product/yanxuan_cat_1.jpg","/uploads/product/yanxuan_cat_2.jpg"]', 1, 7650),
(107, '无谷天然猫粮 鸡肉味 5.4kg', 140101, '皇家', '<p>精准营养配方 | 理想体重控制 | 毛球排出 | 泌尿健康</p>', '/uploads/product/royalcanin_cat.jpg', '["/uploads/product/royalcanin_cat_1.jpg","/uploads/product/royalcanin_cat_2.jpg"]', 1, 5430),
(108, '小型犬全价狗粮 10kg', 140102, '伯纳天纯', '<p>鲜肉酶解技术 | 无谷低敏 | 添加益生菌 | 小型犬专属颗粒</p>', '/uploads/product/purena_dog.jpg', '["/uploads/product/purena_dog_1.jpg","/uploads/product/purena_dog_2.jpg"]', 1, 4320),
(109, '全价狗粮 鸡肉米饭 15kg', 140102, '皇家', '<p>精准营养 | 理想体态 | 高消化蛋白 | 牙齿健康支持</p>', '/uploads/product/royalcanin_dog.jpg', '["/uploads/product/royalcanin_dog_1.jpg","/uploads/product/royalcanin_dog_2.jpg"]', 1, 3210);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(297, 106, '全阶段/5.4kg', '{"规格":"5.4kg"}', 199.00, 259.00, 140.00, 400, 25, 1),
(298, 106, '全阶段/1.8kg', '{"规格":"1.8kg"}', 89.00, 109.00, 60.00, 300, 18, 1),
(299, 107, '鸡肉味/5.4kg', '{"规格":"5.4kg"}', 309.00, 369.00, 230.00, 280, 15, 1),
(300, 107, '鸡肉味/2kg', '{"规格":"2kg"}', 139.00, 169.00, 100.00, 220, 10, 1),
(301, 108, '小型犬/10kg', '{"规格":"10kg"}', 299.00, 399.00, 220.00, 250, 12, 1),
(302, 108, '小型犬/2kg', '{"规格":"2kg"}', 79.00, 99.00, 55.00, 200, 10, 1),
(303, 109, '鸡肉米饭/15kg', '{"规格":"15kg"}', 469.00, 569.00, 350.00, 180, 8, 1),
(304, 109, '鸡肉米饭/3kg', '{"规格":"3kg"}', 119.00, 149.00, 85.00, 200, 10, 1);

-- ============================================
-- 珠宝配饰 - 黄金首饰 (category_id = 120101)
-- ============================================
INSERT INTO pms_spu (id, name, category_id, brand, description, main_image, images, status, sale_count) VALUES
(110, '足金古法传承手镯 30g', 120101, '周大福', '<p>足金999 | 古法花丝錾刻 | 哑光质感 | 30g±0.5g</p>', '/uploads/product/chowtaifook_bangle.jpg', '["/uploads/product/chowtaifook_bangle_1.jpg","/uploads/product/chowtaifook_bangle_2.jpg"]', 1, 1230),
(111, '足金如意锁项链 8g', 120101, '老凤祥', '<p>足金999 | 3D硬金工艺 | 如意锁吊坠 | 链长45cm</p>', '/uploads/product/laofengxiang_necklace.jpg', '["/uploads/product/laofengxiang_necklace_1.jpg","/uploads/product/laofengxiang_necklace_2.jpg"]', 1, 2100);

INSERT INTO pms_sku (id, spu_id, sku_name, spec_info, price, original_price, cost_price, stock, locked_stock, status) VALUES
(305, 110, '素圈/30g', '{"款式":"素圈","克重":"30g"}', 21800.00, 22800.00, 18500.00, 25, 1, 1),
(306, 110, '雕花/30g', '{"款式":"雕花","克重":"30g"}', 22800.00, 23800.00, 19300.00, 20, 1, 1),
(307, 111, '8g/链长45cm', '{"克重":"8g","链长":"45cm"}', 5880.00, 6180.00, 5000.00, 40, 2, 1);

-- Final summary
-- SPU数量: 110
-- SKU数量: 307
-- 覆盖分类: 10101,10102,103,10402,10406,10701,10702,10703,20101,20102,203,20501,20502,30101,302,303,30401,30405,30501,30701,40101,40102,40201,40202,40401,40501,50101,50103,50201,60101,60501,60603,60606,70101,70201,110301,110401,140101,140102,120101

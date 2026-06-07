-- ============================================
-- 五角色体系迁移脚本（已有数据库使用）
-- 在已有数据库上执行此脚本进行升级
-- ============================================

-- 1. 修改 role 列宽度
ALTER TABLE sys_user MODIFY COLUMN role VARCHAR(50) DEFAULT 'BUYER';

-- 2. 迁移现有用户角色
UPDATE sys_user SET role = 'SUPER_ADMIN' WHERE role = 'ADMIN';
UPDATE sys_user SET role = 'BUYER' WHERE role = 'USER';

-- 3. 迁移现有角色-菜单关系
UPDATE sys_role_menu SET role = 'SUPER_ADMIN' WHERE role = 'ADMIN';
UPDATE sys_role_menu SET role = 'BUYER' WHERE role = 'USER';

-- 4. 新增菜单 (ID 23-32)
INSERT INTO sys_menu (id, parent_id, name, path, component, permission, type, sort_num, create_time) VALUES
(23, 0,  '售后管理', '/after-sale',           '',                 NULL,                     0, 8,  NOW()),
(24, 23, '纠纷列表', '/after-sale/dispute',   'after-sale/DisputeList', 'after-sale:dispute:list',  2, 1,  NOW()),
(25, 24, '处理纠纷', NULL,                     NULL,                'after-sale:dispute:handle', 3, 1,  NOW()),
(26, 24, '退款操作', NULL,                     NULL,                'after-sale:refund',         3, 2,  NOW()),
(27, 0,  '店铺管理', '/shop',                 '',                 NULL,                     0, 9,  NOW()),
(28, 27, '我的商品', '/shop/products',         'product/SpuList',   'shop:product:list',       2, 1,  NOW()),
(29, 27, '我的订单', '/shop/orders',           'order/OrderList',   'shop:order:list',         2, 2,  NOW()),
(30, 29, '发货',     NULL,                     NULL,                'shop:order:ship',          3, 1,  NOW()),
(31, 0,  '系统配置', '/system-config',         '',                 NULL,                     0, 10, NOW()),
(32, 31, '配置管理', '/system-config/manage',  'system/ConfigManage','system:config:manage',    2, 1,  NOW());

-- 5. 为 SUPER_ADMIN 分配新增菜单 (23-32)
INSERT INTO sys_role_menu (role, menu_id) VALUES
('SUPER_ADMIN', 23), ('SUPER_ADMIN', 24), ('SUPER_ADMIN', 25), ('SUPER_ADMIN', 26),
('SUPER_ADMIN', 27), ('SUPER_ADMIN', 28), ('SUPER_ADMIN', 29), ('SUPER_ADMIN', 30),
('SUPER_ADMIN', 31), ('SUPER_ADMIN', 32);

-- 6. 新增 OPERATOR 角色-菜单 (1-22)
INSERT INTO sys_role_menu (role, menu_id) VALUES
('OPERATOR', 1),  ('OPERATOR', 2),  ('OPERATOR', 3),  ('OPERATOR', 4),
('OPERATOR', 5),  ('OPERATOR', 6),  ('OPERATOR', 7),  ('OPERATOR', 8),
('OPERATOR', 9),  ('OPERATOR', 10), ('OPERATOR', 11), ('OPERATOR', 12),
('OPERATOR', 13), ('OPERATOR', 14), ('OPERATOR', 15), ('OPERATOR', 16),
('OPERATOR', 17), ('OPERATOR', 18), ('OPERATOR', 19), ('OPERATOR', 20),
('OPERATOR', 21), ('OPERATOR', 22);

-- 7. 新增 MERCHANT 角色-菜单 (27-30)
INSERT INTO sys_role_menu (role, menu_id) VALUES
('MERCHANT', 27), ('MERCHANT', 28), ('MERCHANT', 29), ('MERCHANT', 30);

-- 8. 新增 CS 角色-菜单 (5,9,18,23-26)
INSERT INTO sys_role_menu (role, menu_id) VALUES
('CS', 5),  ('CS', 9),  ('CS', 18),
('CS', 23), ('CS', 24), ('CS', 25), ('CS', 26);

-- 9. BUYER 角色（仅空壳，实际被拦截器拒绝）
INSERT INTO sys_role_menu (role, menu_id) VALUES ('BUYER', 1);

-- 10. 商品表和订单表增加 merchant_id 列
ALTER TABLE pms_spu ADD COLUMN merchant_id BIGINT DEFAULT NULL COMMENT '商家用户ID';
ALTER TABLE oms_order ADD COLUMN merchant_id BIGINT DEFAULT NULL COMMENT '商家用户ID';

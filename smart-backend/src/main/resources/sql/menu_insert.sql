-- ============================================
-- 电商模块 - 菜单数据插入
-- 表: sys_menu, sys_role_menu
-- type: 1=目录 2=菜单 3=按钮
-- AUTO_INCREMENT 当前从4开始，id从4起
-- ============================================

SET NAMES utf8mb4;

-- --------- 一级目录 ---------

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (4, 0, '商品管理', '/product', NULL, NULL, 1, 4);

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (5, 0, '订单管理', '/order', NULL, NULL, 1, 5);

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (6, 0, '会员管理', '/member', NULL, NULL, 1, 6);

-- --------- 商品管理 - 二级菜单 ---------

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (7, 4, '分类管理', '/product/category', 'product/CategoryList', 'product:category:list', 2, 1);

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (8, 4, '商品列表', '/product/list', 'product/SpuList', 'product:spu:list', 2, 2);

-- --------- 订单管理 - 二级菜单 ---------

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (9, 5, '订单列表', '/order/list', 'order/OrderList', 'order:list', 2, 1);

-- --------- 会员管理 - 二级菜单 ---------

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (10, 6, '会员列表', '/member/list', 'member/MemberList', 'member:list', 2, 1);

-- --------- 按钮权限（商品管理） ---------

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (11, 7, '新增分类', NULL, NULL, 'product:category:add', 3, 1);

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (12, 7, '修改分类', NULL, NULL, 'product:category:edit', 3, 2);

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (13, 7, '删除分类', NULL, NULL, 'product:category:delete', 3, 3);

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (14, 8, '新增商品', NULL, NULL, 'product:spu:add', 3, 1);

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (15, 8, '修改商品', NULL, NULL, 'product:spu:edit', 3, 2);

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (16, 8, '删除商品', NULL, NULL, 'product:spu:delete', 3, 3);

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (17, 8, '上下架', NULL, NULL, 'product:spu:status', 3, 4);

-- --------- 按钮权限（订单管理） ---------

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (18, 9, '订单详情', NULL, NULL, 'order:detail', 3, 1);

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (19, 9, '发货', NULL, NULL, 'order:ship', 3, 2);

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (20, 9, '取消订单', NULL, NULL, 'order:cancel', 3, 3);

-- --------- 按钮权限（会员管理） ---------

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (21, 10, '会员详情', NULL, NULL, 'member:detail', 3, 1);

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `permission`, `type`, `sort_num`)
VALUES (22, 10, '启用禁用', NULL, NULL, 'member:status', 3, 2);

-- --------- 给ADMIN角色分配所有新菜单 ---------

INSERT INTO `sys_role_menu` (`role`, `menu_id`)
SELECT 'ADMIN', `id` FROM `sys_menu` WHERE `id` >= 4;
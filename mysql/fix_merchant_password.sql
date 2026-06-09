-- 修复所有品牌商家密码为 123456
UPDATE `sys_user` SET `password` = '$2b$10$SDbZn3Vj7Yx0nWGuYiyfPuc0z7CBh.dvdpZNG4tBwM7FSPj5loukq' WHERE `username` LIKE 'm_%';

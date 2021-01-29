/*
 Navicat Premium Data Transfer

 Source Server         : 8.129.161.138
 Source Server Type    : MySQL
 Source Server Version : 100508
 Source Host           : 8.129.161.138:3306
 Source Schema         : gas

 Target Server Type    : MySQL
 Target Server Version : 100508
 File Encoding         : 65001

 Date: 29/01/2021 20:30:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for w_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_menu`;
CREATE TABLE `w_admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of w_admin_menu
-- ----------------------------
INSERT INTO `w_admin_menu` VALUES (1, 0, 1, '首页', 'fa-dashboard', '/', NULL, NULL, '2021-01-06 19:31:11');
INSERT INTO `w_admin_menu` VALUES (2, 0, 2, '管理员管理', 'fa-tasks', NULL, NULL, NULL, '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (3, 2, 3, '用户管理', 'fa-gear', 'auth/users', NULL, NULL, '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (4, 2, 4, '角色管理', 'fa-user', 'auth/roles', NULL, NULL, '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (5, 2, 5, '权限管理', 'fa-ban', 'auth/permissions', NULL, NULL, '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (6, 2, 6, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (7, 2, 7, '操作日志管理', 'fa-history', 'auth/logs', NULL, NULL, '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (8, 10, 9, '燃气公司', 'fa-building', 'companies', NULL, '2020-12-03 06:50:37', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (9, 46, 62, '系统公告', 'fa-bell', 'notices', NULL, '2020-12-03 07:19:58', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (10, 0, 8, '基础信息', 'fa-align-justify', 'bases', NULL, '2020-12-03 07:21:17', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (11, 10, 10, '燃气场站', 'fa-institution', 'stations', NULL, '2020-12-04 02:51:54', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (12, 10, 12, '工作人员', 'fa-users', 'workers', NULL, '2020-12-04 02:52:16', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (13, 50, 70, '账号管理', 'fa-user-plus', 'admin-users', NULL, '2020-12-04 15:21:01', '2021-01-16 11:40:23');
INSERT INTO `w_admin_menu` VALUES (14, 10, 11, '设备管理', 'fa-cubes', 'devices', NULL, '2020-12-05 10:20:56', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (15, 10, 13, '供气区域管理', 'fa-globe', 'zones', NULL, '2020-12-05 14:59:48', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (16, 46, 64, '公告通知', 'fa-bullhorn', 'articles', NULL, '2020-12-05 17:04:11', '2021-01-16 11:40:23');
INSERT INTO `w_admin_menu` VALUES (17, 46, 63, '类型管理', 'fa-align-right', 'categories', NULL, '2020-12-05 17:15:09', '2021-01-16 11:40:23');
INSERT INTO `w_admin_menu` VALUES (18, 46, 65, '安全教育', 'fa-shield', 'article-secs', NULL, '2020-12-07 10:49:47', '2021-01-16 11:40:23');
INSERT INTO `w_admin_menu` VALUES (19, 46, 66, '政策法规', 'fa-list-alt', 'article-govs', NULL, '2020-12-07 10:50:34', '2021-01-16 11:40:23');
INSERT INTO `w_admin_menu` VALUES (20, 46, 67, '文件下载', 'fa-files-o', 'attachments', NULL, '2020-12-07 14:59:27', '2021-01-16 11:40:23');
INSERT INTO `w_admin_menu` VALUES (21, 46, 68, '存储空间', 'fa-stack-overflow', 'stores', NULL, '2020-12-07 16:53:56', '2021-01-16 11:40:23');
INSERT INTO `w_admin_menu` VALUES (22, 68, 40, '事件管理', 'fa-calendar', 'events', NULL, '2020-12-08 11:25:23', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (23, 68, 41, '事件时限', 'fa-clock-o', 'event-types', NULL, '2020-12-08 14:28:19', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (24, 47, 18, '事件统计', 'fa-area-chart', 'event-stats', NULL, '2020-12-08 15:53:07', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (25, 53, 25, '补贴发放标准', 'fa-flask', 'sale-stds', NULL, '2020-12-09 17:33:49', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (26, 53, 21, '企业用气量', 'fa-hourglass-1', 'gas-stats', NULL, '2020-12-09 18:15:37', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (28, 50, 71, '组织管理', 'fa-list-ul', 'organs', NULL, '2020-12-17 15:09:05', '2021-01-16 11:40:23');
INSERT INTO `w_admin_menu` VALUES (29, 0, 42, '考核考评管理', 'fa-check-circle', NULL, NULL, '2020-12-22 09:36:50', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (30, 41, 44, '考核记录管理', 'fa-calendar-check-o', 'station-exams', NULL, '2020-12-24 16:08:46', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (31, 41, 45, '考核标准', 'fa-signal', 'station-stds', NULL, '2020-12-24 17:00:41', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (33, 42, 47, '事件处理考核', 'fa-bars', 'event-exams', NULL, '2021-01-06 19:22:21', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (34, 42, 48, '考核标准', 'fa-bars', 'event-stds', NULL, '2021-01-06 19:30:54', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (35, 43, 50, '消防设施考核', 'fa-bars', 'fire-exams', NULL, '2021-01-07 09:55:20', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (36, 43, 51, '考核标准', 'fa-bars', 'fire-stds', NULL, '2021-01-07 09:55:33', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (37, 44, 54, '安全作业考核', 'fa-bars', 'sec-exams', NULL, '2021-01-07 15:26:39', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (38, 44, 55, '考核标准', 'fa-bars', 'sec-stds', NULL, '2021-01-07 15:26:52', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (39, 45, 58, '管理制度考核', 'fa-bars', 'manage-exams', NULL, '2021-01-07 16:00:34', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (40, 45, 59, '考核标准', 'fa-bars', 'manage-stds', NULL, '2021-01-07 16:00:43', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (41, 29, 43, '考核记录管理', 'fa-bars', NULL, NULL, '2021-01-07 16:38:13', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (42, 29, 46, '事件考核管理', 'fa-bars', NULL, NULL, '2021-01-07 16:38:50', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (43, 29, 49, '消防考核管理', 'fa-bars', NULL, NULL, '2021-01-07 16:38:58', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (44, 29, 53, '安全考核管理', 'fa-bars', NULL, NULL, '2021-01-07 16:39:08', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (45, 29, 57, '管理制度考核', 'fa-bars', NULL, NULL, '2021-01-07 16:39:21', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (46, 0, 61, '信息发布', 'fa-bullhorn', NULL, NULL, '2021-01-07 16:42:26', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (47, 0, 15, '数据统计', 'fa-area-chart', NULL, NULL, '2021-01-07 16:44:10', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (48, 47, 16, '换瓶站销量', 'fa-bars', 'bottle-sale-logs', NULL, '2021-01-07 16:44:25', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (49, 0, 19, '业务管理', 'fa-calendar', NULL, NULL, '2021-01-07 16:44:47', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (50, 0, 69, '系统管理', 'fa-gear', NULL, NULL, '2021-01-07 16:45:32', '2021-01-16 11:40:23');
INSERT INTO `w_admin_menu` VALUES (51, 50, 72, '平台接入管理', 'fa-bars', NULL, NULL, '2021-01-07 16:45:46', '2021-01-16 11:40:23');
INSERT INTO `w_admin_menu` VALUES (52, 10, 14, '即时通讯信息', 'fa-mobile-phone', 'chats', NULL, '2021-01-07 16:47:35', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (53, 49, 20, '瓶装液化气补贴核计', 'fa-bars', NULL, NULL, '2021-01-07 17:37:44', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (54, 53, 24, '补贴计算明细', 'fa-bars', 'sale-exams', NULL, '2021-01-07 17:38:44', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (55, 49, 27, '自采暖补贴核计', 'fa-bars', NULL, NULL, '2021-01-07 17:39:14', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (56, 55, 28, '补贴计算明细', 'fa-bars', 'warm-exams', NULL, '2021-01-07 17:41:12', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (57, 55, 29, '补贴发放标准', 'fa-bars', 'warm-stds', NULL, '2021-01-07 17:41:29', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (58, 53, 22, '用气量监控', 'fa-line-chart', 'gas-exams', NULL, '2021-01-07 19:21:57', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (59, 49, 31, '经营许可证审核', 'fa-bars', NULL, NULL, '2021-01-07 20:20:54', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (60, 59, 32, '经营许可证审核明细', 'fa-bars', 'cert-exams', NULL, '2021-01-07 20:21:09', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (61, 59, 33, '经营许可证审核标准', 'fa-bars', 'cert-stds', NULL, '2021-01-07 20:21:23', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (62, 59, 34, '审核周期', 'fa-bars', 'cert-periods/1/edit', NULL, '2021-01-07 20:35:22', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (63, 49, 35, '综合评价审核', 'fa-bars', NULL, NULL, '2021-01-08 10:10:32', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (64, 63, 36, '综合评价审核明细', 'fa-bars', 'eval-exams', NULL, '2021-01-08 10:10:58', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (65, 63, 37, '综合评价标准', 'fa-bars', 'eval-stds', NULL, '2021-01-08 10:11:18', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (66, 63, 38, '汇总排名', 'fa-bars', 'eval-stats', NULL, '2021-01-08 10:11:29', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (67, 47, 17, '钢瓶流转记录', 'fa-bars', 'bottles', NULL, '2021-01-08 16:29:28', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (68, 49, 39, '事件管理', 'fa-bars', NULL, NULL, '2021-01-13 17:07:58', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (69, 53, 26, '销量上报', 'fa-bars', 'sale-reports', NULL, '2021-01-16 10:08:28', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (70, 53, 23, '用气量上报', 'fa-bars', 'gas-reports', NULL, '2021-01-16 10:38:33', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (71, 55, 30, '自采暖上报', 'fa-bars', 'warm-reports', NULL, '2021-01-16 11:16:31', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (72, 43, 52, '消防上报', 'fa-bars', 'fire-reports', NULL, '2021-01-16 11:35:53', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (73, 44, 56, '安全上报', 'fa-bars', 'sec-reports', NULL, '2021-01-16 11:36:07', '2021-01-29 11:45:45');
INSERT INTO `w_admin_menu` VALUES (74, 45, 60, '管理上报', 'fa-bars', 'manage-reports', NULL, '2021-01-16 11:36:20', '2021-01-29 11:45:45');

-- ----------------------------
-- Table structure for w_admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_operation_log`;
CREATE TABLE `w_admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `w_admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_permissions`;
CREATE TABLE `w_admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `w_admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `w_admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_admin_permissions
-- ----------------------------
INSERT INTO `w_admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `w_admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `w_admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `w_admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `w_admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- ----------------------------
-- Table structure for w_admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_role_menu`;
CREATE TABLE `w_admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `w_admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_admin_role_menu
-- ----------------------------
INSERT INTO `w_admin_role_menu` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for w_admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_role_permissions`;
CREATE TABLE `w_admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `w_admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_admin_role_permissions
-- ----------------------------
INSERT INTO `w_admin_role_permissions` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for w_admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_role_users`;
CREATE TABLE `w_admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `w_admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_admin_role_users
-- ----------------------------
INSERT INTO `w_admin_role_users` VALUES (1, 1, NULL, NULL);
INSERT INTO `w_admin_role_users` VALUES (2, 2, NULL, NULL);
INSERT INTO `w_admin_role_users` VALUES (1, 3, NULL, NULL);
INSERT INTO `w_admin_role_users` VALUES (2, 6, NULL, NULL);
INSERT INTO `w_admin_role_users` VALUES (2, 7, NULL, NULL);
INSERT INTO `w_admin_role_users` VALUES (2, 8, NULL, NULL);
INSERT INTO `w_admin_role_users` VALUES (2, 9, NULL, NULL);
INSERT INTO `w_admin_role_users` VALUES (2, 5, NULL, NULL);
INSERT INTO `w_admin_role_users` VALUES (2, 4, NULL, NULL);
INSERT INTO `w_admin_role_users` VALUES (2, 10, NULL, NULL);
INSERT INTO `w_admin_role_users` VALUES (1, 13, NULL, NULL);
INSERT INTO `w_admin_role_users` VALUES (1, 14, NULL, NULL);

-- ----------------------------
-- Table structure for w_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_roles`;
CREATE TABLE `w_admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `w_admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `w_admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_admin_roles
-- ----------------------------
INSERT INTO `w_admin_roles` VALUES (1, '管理员', 'administrator', '2020-12-02 20:04:42', '2020-12-03 19:19:54');
INSERT INTO `w_admin_roles` VALUES (2, '配送员', 'deliver', '2020-12-05 02:38:37', '2020-12-05 02:38:37');

-- ----------------------------
-- Table structure for w_admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_user_permissions`;
CREATE TABLE `w_admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `w_admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_admin_users
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_users`;
CREATE TABLE `w_admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'images/avatar.png',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'token',
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '连接id',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `station_id` int(11) NULL DEFAULT 0 COMMENT '站点id',
  `gender` tinyint(4) NULL DEFAULT 1 COMMENT '性别 0女 1男',
  `age` tinyint(4) NULL DEFAULT 0 COMMENT '年龄',
  `mobile` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '工作内容',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `organ_id` int(11) NULL DEFAULT 0 COMMENT '组织id',
  `organ_id2` int(11) NULL DEFAULT 0 COMMENT '组织id2',
  `organ_id3` int(11) NULL DEFAULT 0 COMMENT '组织id3',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '0正常, 1禁用',
  `type` tinyint(4) NULL DEFAULT 0 COMMENT '0管理员, 1工作人员',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '外部用户id',
  `extras` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '扩展',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `w_admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_admin_users
-- ----------------------------
INSERT INTO `w_admin_users` VALUES (1, 'admin', '$2y$10$h0KFkexuKOW7PJ.xdeerG.wdKM0AF7P6cAJ.FH3.LFZ5A4i8GkFCW', 'Admin', 'images/avatar.png', 'e00cf25ad42683b3df678c61f42c6bda', '7b2f8473-d58e-42ef-bf9b-0820f1d1a713', 'C8aUEClBltZFsa84eh2Lx2DulzbX7NSRTOmtpTRlRddxylUqiSjpvGMb3sPf', '2020-12-02 20:04:42', '2021-01-26 14:16:22', 1, 1, 0, '13211111111', '配送', NULL, 1, 5, 13, 0, 0, 0, '');
INSERT INTO `w_admin_users` VALUES (2, 'sanpang', '$2y$10$7tkvHGoBAjgitsI366CjzeYplP10QVVB9GQhGQJfVBCdDp1U/GKPm', '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '78b5057f77df4493a4c71df016983367', 'efae6cdb-dfd2-4778-b266-dfd4a284ed77', NULL, '2020-12-05 02:40:31', '2021-01-26 17:32:07', 2, 1, 30, '13211111111', '配送', NULL, 0, 0, 0, 0, 1, 0, '');
INSERT INTO `w_admin_users` VALUES (3, 'wangxiaoming', '$2y$10$z8aSZK7W6uINl4f/rhpyouQs.0P2FQczU6WEqIvyCHw9x.38TFy6a', '王晓明', 'images/5daed5be97aee.jpg', 'bee42835d3f629d3d95b99a6b9ca482e', '87af8465-ca97-45f0-ba01-defe6e32aa95', NULL, '2020-12-18 15:48:14', '2020-12-23 16:02:41', 3, 1, 25, '13666666666', '分发配送', NULL, 0, 0, 0, 0, 1, 0, '');
INSERT INTO `w_admin_users` VALUES (4, 'lisi', '$2y$10$glh7g0J7PPcWTmocliqlaO3goy5Ty8KJ2ea.Byy4MjxQuq5GcGPvm', '李四', 'images/u=1569462993,172008204&fm=5.jpg', 'b038e826bd2237038241f634e5bbe5bf', '9f9c55ce-f4a3-4f72-9292-3776d9a20833', NULL, '2020-12-18 16:00:03', '2021-01-26 17:51:12', 2, 0, 30, '13632222222', 'test', NULL, 0, 0, 0, 0, 1, 0, '');
INSERT INTO `w_admin_users` VALUES (5, 'zhaolili', '$2y$10$BDqVNzYyQNr5Abut.zEnseEo75KMp9aEBl/rDWQTx04GCRky8hOjO', '赵丽丽', 'images/微信图片_20200827103038.jpg', '6a7cdae6b159b12b5fde0beab4cc8040', '673c8e28-e9c7-4311-93c6-e1906e53563f', NULL, '2020-12-18 16:00:59', '2020-12-28 14:54:50', 1, 0, 30, '13635555555', 'test', NULL, 0, 0, 0, 0, 1, 0, '');
INSERT INTO `w_admin_users` VALUES (6, 'zhangsan', '$2y$10$Hlf6SzC17WKlmWh2vHyGqOeu62ZsUClKv/tdtB5w2PGOH/KNthgZ6', '张三', 'images/avatar.png', '6e4e5c5cd18e0d44336f4d5219978ba1', '9cdbae17-750a-4472-b405-1d869791bd1f', NULL, '2020-12-24 16:22:59', '2020-12-28 17:35:40', 2, 0, 0, '13699999999', 'test', NULL, 0, 0, 0, 0, 1, 0, '');
INSERT INTO `w_admin_users` VALUES (7, 'liyi', '$2y$10$Cl102.U2EHFupiUFNK93ZOrVZrsu3IgBCWTX6DRYcHn2I/8yDS/yi', '李一', 'images/avatar.png', 'c3c8531ad410c51eec3d01aee3563b11', 'd02cfad5-6702-4150-8ccd-fa85fd6f312c', NULL, '2020-12-30 15:26:19', '2021-01-15 16:33:58', 2, 0, NULL, '13531250000', 'test', NULL, 0, 0, 0, 0, 1, 0, '');
INSERT INTO `w_admin_users` VALUES (8, 'chenxiao', '$2y$10$37ocTzZfcQhhUbqvE/K10eO5S.61pFmE4oBU3clIa5qrQxXi0GroW', '陈晓', 'http://gas.micyi.com/pics/files/5f50a25d29df3 (1)_3594.jpg', 'ed86ee6d929d2dea01065bf9a5a1f35a', '96afc5a2-b966-4a92-aad2-0dbae5b3fc84', NULL, '2020-12-30 15:27:02', '2020-12-30 15:43:28', 1, 0, 0, '15955555555', '测试', NULL, 0, 0, 0, 0, 1, 0, '');
INSERT INTO `w_admin_users` VALUES (9, 'liuxiaoer', '$2y$10$8wrPTXqb/yT8PF91d1yzs.G4/Noj.92sYHO26F0KfAaQGSKMekxXq', '刘小二', 'images/avatar.png', '9b20debd6eedd5361590eeb9b47f05a3', '0f51cbd7-1e6a-4cd8-8b38-03e1f26c3017', NULL, '2020-12-30 15:28:51', '2021-01-05 15:46:58', 3, 1, 0, '15888888888', '测试', NULL, 0, 0, 0, 0, 1, 0, '');
INSERT INTO `w_admin_users` VALUES (10, 'wangwu', '$2y$10$YxWvLZ4h1.QdTR1A7CgYX.X5Y0WH11D54b2MmKr6Xh4vhRvG8Xk76', '王武', 'images/avatar.png', '', '', NULL, '2021-01-14 10:35:18', '2021-01-14 10:35:18', 4, 1, NULL, '13755555555', '配送', NULL, 0, 0, 0, 0, 1, 0, '');
INSERT INTO `w_admin_users` VALUES (11, 'test1', '', 'test1', 'images/avatar.png', '', '', NULL, '2021-01-20 11:40:23', '2021-01-20 11:40:23', 1, 1, 0, '', '', '', 0, 0, 0, 0, 1, 53, '{\"type\":1,\"user_id\":53,\"username\":\"test1\",\"name\":\"test1\"}');
INSERT INTO `w_admin_users` VALUES (12, 'dx-01', '', 'dx-01', 'images/avatar.png', '', '', NULL, '2021-01-20 11:40:23', '2021-01-20 11:40:23', 1, 1, 0, '', '', '', 0, 0, 0, 0, 1, 47, '{\"type\":1,\"user_id\":47,\"username\":\"dx-01\",\"name\":\"dx-01\",\"extras\":\"{\\\"type\\\":1,\\\"user_id\\\":53,\\\"username\\\":\\\"test1\\\",\\\"name\\\":\\\"test1\\\"}\"}');
INSERT INTO `w_admin_users` VALUES (13, '15012345678', '$2y$10$L3HkHzgrMEVb3ZMo9U5Fa.lMSz/4j27Biw8ZNvKNSbrMaU0NJmkR.', '这是工作人员', 'images/2.png', '', '', NULL, '2021-01-20 11:54:01', '2021-01-20 11:54:01', 2, 1, 5, '18270829082', '这是工作职责', '这是备注信息', 0, 0, 0, 0, 1, 0, '');
INSERT INTO `w_admin_users` VALUES (14, '18212345678', '$2y$10$94bruYqlTKoMPxjZZSZ8sO7xcx6BQW8g3PAzv4jeLdP2LMfaF3A.W', '区总公司负责人', 'images/10.png', '', '', NULL, '2021-01-21 14:49:45', '2021-01-21 14:49:45', 0, 1, 0, '18212345678', '', '这是备注信息', 14, NULL, NULL, 0, 0, 0, '');
INSERT INTO `w_admin_users` VALUES (15, 'rqcz', '', '燃气场站', 'images/avatar.png', '2d9069e9-bc10-48dc-afbf-5ddb97bc6412', 'a3b951c6-ad9b-4a65-ba66-356c320db72c', NULL, '2021-01-21 20:03:09', '2021-01-25 11:32:30', 1, 1, 0, '', '', '', 0, 0, 0, 0, 1, 46, '{\"user_id\":46,\"username\":\"rqcz\",\"name\":\"\\u71c3\\u6c14\\u573a\\u7ad9\"}');
INSERT INTO `w_admin_users` VALUES (16, 'tc_admin', '', '平台管理员', 'images/avatar.png', 'cabcae37-19fc-492e-b7d4-118ee64ee4ac', 'd28b86c3-c548-48f4-8175-8b0171295630', NULL, '2021-01-22 10:08:11', '2021-01-29 12:35:26', 1, 1, 0, '', '', '', 0, 0, 0, 0, 1, 2, '{\"user_id\":2,\"username\":\"tc_admin\",\"name\":\"\\u5e73\\u53f0\\u7ba1\\u7406\\u5458\"}');
INSERT INTO `w_admin_users` VALUES (17, 'znyzd', '', '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '4adba9d8-dd27-49cd-a503-28f701c79693', '7bea87ed-99a7-40b4-94d1-a3a22daf8cfa', NULL, '2021-01-25 13:57:54', '2021-01-29 18:01:16', 1, 1, 0, '23635555555', '', '', 0, 0, 0, 0, 1, 33, '{\"user_id\":33,\"username\":\"znyzd\",\"name\":\"\\u667a\\u80fd\\u4e91\\u7ec8\\u7aefAPP\"}');

-- ----------------------------
-- Table structure for w_api_settings
-- ----------------------------
DROP TABLE IF EXISTS `w_api_settings`;
CREATE TABLE `w_api_settings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'client_id',
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'client secret',
  `project_id` int(11) NOT NULL DEFAULT 0 COMMENT 'project id',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'url',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token',
  `token_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token 类型',
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '刷新token',
  `create_token_time` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '获取token 时间',
  `expires_in` int(11) NOT NULL DEFAULT 0 COMMENT '过期时间',
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'scope',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '接口设置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of w_api_settings
-- ----------------------------
INSERT INTO `w_api_settings` VALUES (1, '1a3898789b80428383b709d95f33d342', 'ccad5f412de4402f930aa43414b8775e', 17, 'http://115.236.178.228:8131', 'd5b9c6a5-9d32-4c47-9e39-a2e173c1271f', 'bearer', '23489f54-58bb-4825-9198-674eb35fb78e', '1611729907', 43199, '17', '2021-01-13 15:09:17', '2021-01-27 14:45:07');

-- ----------------------------
-- Table structure for w_article_views
-- ----------------------------
DROP TABLE IF EXISTS `w_article_views`;
CREATE TABLE `w_article_views`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NULL DEFAULT 0 COMMENT '文章id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章浏览记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_article_views
-- ----------------------------
INSERT INTO `w_article_views` VALUES (1, 5, 1, '2020-12-19 16:24:01', '2020-12-19 16:24:01');
INSERT INTO `w_article_views` VALUES (2, 1, 1, '2020-12-19 16:57:07', '2020-12-19 16:57:07');
INSERT INTO `w_article_views` VALUES (3, 12, 2, '2020-12-22 10:55:34', '2020-12-22 10:55:34');
INSERT INTO `w_article_views` VALUES (4, 8, 2, '2020-12-22 10:55:47', '2020-12-22 10:55:47');
INSERT INTO `w_article_views` VALUES (5, 7, 2, '2020-12-22 11:02:47', '2020-12-22 11:02:47');
INSERT INTO `w_article_views` VALUES (6, 16, 2, '2020-12-29 17:07:12', '2020-12-29 17:07:12');
INSERT INTO `w_article_views` VALUES (7, 14, 17, '2021-01-26 14:08:15', '2021-01-26 14:08:15');
INSERT INTO `w_article_views` VALUES (8, 5, 17, '2021-01-26 14:08:20', '2021-01-26 14:08:20');

-- ----------------------------
-- Table structure for w_articles
-- ----------------------------
DROP TABLE IF EXISTS `w_articles`;
CREATE TABLE `w_articles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `article_type` tinyint(4) NULL DEFAULT 0 COMMENT '0公告 1安全 2政策',
  `cate_id` tinyint(4) NULL DEFAULT 0 COMMENT '文章类型',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `effect_type` tinyint(4) NULL DEFAULT 0 COMMENT '有效 0 永久, 1限时',
  `effect_status` tinyint(4) NULL DEFAULT 0 COMMENT '有效状态 0正常 1已过期',
  `effect_days` int(11) NULL DEFAULT 0 COMMENT '有效天数',
  `send_type` tinyint(4) NULL DEFAULT 0 COMMENT '发送 0立即, 1定时',
  `send_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送时间',
  `receive_type` tinyint(4) NULL DEFAULT 0 COMMENT '接收 0全部 1指定人',
  `receive_user_ids` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收人id',
  `post_user_id` int(11) NULL DEFAULT 0 COMMENT '发布人id',
  `post_status` tinyint(4) NULL DEFAULT 0 COMMENT '发布状态 0已发布 1草稿',
  `attaches` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_articles
-- ----------------------------
INSERT INTO `w_articles` VALUES (1, '公告', 0, 2, '<p>这是一个公告</p>', 1, 0, 100, 0, '2020-12-23 21:59:59', 1, '1,2', 1, 0, NULL, '2020-12-05 17:28:44', '2020-12-07 11:25:57');
INSERT INTO `w_articles` VALUES (2, '公告2', 0, 1, '<p>公告公告</p>\r\n\r\n<p>公告公告</p>\r\n\r\n<p>公告公告</p>', 0, 0, 0, 1, '2020-12-10 23:00:00', 0, '', 1, 0, NULL, '2020-12-07 11:20:12', '2020-12-19 15:55:29');
INSERT INTO `w_articles` VALUES (3, '公告3', 0, 3, '<p>公告3</p>\r\n\r\n<p>公告3</p>\r\n\r\n<p>公告3</p>', 0, 0, 0, 1, '2020-12-30 23:59:00', 0, '', 1, 0, NULL, '2020-12-07 11:25:33', '2021-01-11 18:15:06');
INSERT INTO `w_articles` VALUES (4, '公告告', 0, 4, '<p>公告告公告告</p>', 0, 0, 1000, 0, '2020-12-16 00:00:00', 0, '', 1, 0, NULL, '2020-12-07 11:26:22', '2020-12-15 14:43:43');
INSERT INTO `w_articles` VALUES (5, '公告', 0, 1, '<p>送到的</p>', 0, 0, 0, 0, '2020-12-30 23:59:00', 0, '', 1, 0, NULL, '2020-12-07 11:27:58', '2020-12-07 15:46:18');
INSERT INTO `w_articles` VALUES (6, '111', 0, 1, '<p>111</p>', 0, 0, 0, 0, '2020-12-15 15:19:36', 0, '', 1, 0, NULL, '2020-12-15 15:16:36', '2020-12-15 15:16:36');
INSERT INTO `w_articles` VALUES (7, '222', 0, 1, '<p>222</p>', 0, 0, 0, 0, '2020-12-15 15:19:36', 0, '', 1, 0, NULL, '2020-12-15 15:16:42', '2020-12-15 15:16:42');
INSERT INTO `w_articles` VALUES (8, '333', 0, 1, '<p>333</p>', 0, 0, 0, 0, '2020-12-15 15:19:36', 0, '', 1, 0, NULL, '2020-12-15 15:16:47', '2020-12-15 15:16:47');
INSERT INTO `w_articles` VALUES (9, '444', 0, 1, '<p>444</p>', 1, 1, 1, 0, '2020-12-15 15:19:36', 0, '', 1, 0, NULL, '2020-12-15 15:16:58', '2020-12-17 14:10:20');
INSERT INTO `w_articles` VALUES (10, '555', 0, 1, '<p>555</p>', 0, 0, 0, 0, '2020-12-15 15:19:36', 0, '', 1, 0, NULL, '2020-12-15 15:17:10', '2020-12-15 15:17:10');
INSERT INTO `w_articles` VALUES (11, '666', 0, 1, '<p>666</p>', 1, 1, 1, 1, '2020-12-15 15:19:36', 0, '', 1, 0, NULL, '2020-12-15 15:18:58', '2020-12-17 14:13:25');
INSERT INTO `w_articles` VALUES (12, '777', 0, 1, '<p>777</p>', 0, 0, 0, 1, '2020-12-17 00:00:00', 0, '', 1, 0, NULL, '2020-12-15 15:19:12', '2020-12-19 15:53:22');
INSERT INTO `w_articles` VALUES (13, '888', 0, 1, '<p>888</p>', 0, 0, 0, 0, '2020-12-15 15:19:36', 0, '', 1, 0, NULL, '2020-12-15 15:19:36', '2020-12-15 15:19:36');
INSERT INTO `w_articles` VALUES (14, '14', 0, 1, '<p>144</p>', 0, 0, 0, 0, '2020-12-15 15:31:22', 0, '', 1, 0, NULL, '2020-12-15 15:31:22', '2020-12-15 15:31:22');
INSERT INTO `w_articles` VALUES (15, '999', 2, 1, '<p>999</p>', 0, 0, 0, 0, '2020-12-15 15:31:32', 0, '', 1, 0, NULL, '2020-12-15 15:31:32', '2020-12-15 15:31:32');
INSERT INTO `w_articles` VALUES (16, '1省新增本土确诊15例在北京辽宁 12月29日国内疫情最新消息：北京新增7例本地确诊病例', 0, 2, '<p><strong>截至12月28日24时新型冠状病毒肺炎疫情最新情况</strong></p>\r\n\r\n<p>　　12月28日0&mdash;24时，31个省（自治区、直辖市）和新疆生产建设兵团报告新增确诊病例27例，其中境外输入病例12例（上海4例，四川3例，天津1例，内蒙古1例，福建1例，河南1例，广东1例），本土病例15例（辽宁8例，北京7例）；无新增死亡病例；无新增疑似病例。</p>\r\n\r\n<p>　　当日新增治愈出院病例18例，解除医学观察的密切接触者547人，重症病例与前一日持平。</p>\r\n\r\n<p>　　境外输入现有确诊病例265例（其中重症病例3例），无现有疑似病例。累计确诊病例4230例，累计治愈出院病例3965例，无死亡病例。</p>\r\n\r\n<p>　　截至12月28日24时，据31个省（自治区、直辖市）和新疆生产建设兵团报告，现有确诊病例348例（其中重症病例5例），累计治愈出院病例82021例，累计死亡病例4634例，累计报告确诊病例87003例，无现有疑似病例。累计追踪到密切接触者902187人，尚在医学观察的密切接触者11909人。</p>\r\n\r\n<p>　　31个省（自治区、直辖市）和新疆生产建设兵团报告新增无症状感染者8例（境外输入6例）；当日转为确诊病例7例（境外输入4例）；当日解除医学观察6例（均为境外输入）；尚在医学观察无症状感染者262例（境外输入215例）。</p>\r\n\r\n<p>　　累计收到港澳台地区通报确诊病例9510例。其中，香港特别行政区8671例（出院7526例，死亡141例），澳门特别行政区46例（出院46例），台湾地区793例（出院654例，死亡7例）。</p>\r\n\r\n<p>　　<strong>相关链接：</strong></p>\r\n\r\n<p>　　<strong>2020年12月28日0时至24时辽宁新型冠状病毒肺炎疫情情况</strong></p>\r\n\r\n<p>　　12月28日0时至24时，辽宁省新增8例本土新冠肺炎确诊病例，均属普通型病例，其中沈阳市报告6例（1例为无症状感染者转归病例）、大连市报告2例（1例为无症状感染者转归病例）；新增2例本土无症状感染者，其中沈阳市、大连市各报告1例。无新增治愈出院病例。</p>\r\n\r\n<p>　　截至12月28日24时，全省累计报告确诊病例337例（含境外输入67例），治愈出院287例，死亡2例，在院治疗48例。目前，尚有31例无症状感染者在定点医院隔离治疗。</p>\r\n\r\n<p>　　<strong>北京12月28日新增7例本地新冠肺炎确诊病例</strong></p>\r\n\r\n<p>　　12月28日0时至24时，新增7例本地确诊病例，无疑似病例和无症状感染者；新增1例境外输入无症状感染者，无新增确诊病例、疑似病例。</p>\r\n\r\n<p>　　<strong>本地确诊病例</strong></p>\r\n\r\n<p>　　病例一：某男，32岁，北京籍，现住顺义区北石槽镇西赵各庄村，为某贸易服务公司员工，12月27日核酸检测结果为阳性，由120负压救护车转至地坛医院。12月28日，患者出现咽部不适等症状，综合流行病学史、临床表现、实验室检测和影像学检查等结果，当日诊断为新型肺炎确诊病例，临床分型为轻型。</p>\r\n\r\n<p>　　病例二：某男，28岁，山西籍，现住顺义区高丽营镇张喜庄村，为某贸易服务公司员工。12月28日核酸检测结果为阳性，由120负压救护车转至地坛医院，患者出现发热、咳嗽等症状，综合流行病学史、临床表现、实验室检测和影像学检查等结果，当日诊断为新型肺炎确诊病例，临床分型为轻型。</p>\r\n\r\n<p>　　病例三：某男，42岁，北京籍，现住顺义区高丽营镇东马各庄村，为某贸易服务公司员工。12月28日核酸检测结果为阳性，由120负压救护车转至地坛医院，患者出现咽干症状，综合流行病学史、临床表现、实验室检测和影像学检查等结果，当日诊断为新型肺炎确诊病例，临床分型为轻型。</p>\r\n\r\n<p>　　病例四：某男，43岁，安徽籍，现住顺义区仁和镇河南村，网约车司机，12月28日核酸检测结果为阳性，由120负压救护车转至地坛医院，患者出现咽干、干咳等症状，综合流行病学史、临床表现、实验室检测和影像学检查等结果，当日诊断为新型肺炎确诊病例，临床分型为普通型。</p>', 0, 0, 0, 0, '2020-12-29 15:51:41', 0, '', 1, 0, NULL, '2020-12-29 15:51:41', '2020-12-29 15:51:41');
INSERT INTO `w_articles` VALUES (17, '新冠肺炎血清流调显示我国人群总体处于新冠病毒低感染水平', 0, 1, '<h1><span class=\"marker\">新冠肺炎血清流调显示我国人群总体处于新冠病毒低感染水平</span></h1>', 0, 0, 0, 0, '2020-12-30 16:31:47', 0, '', 1, 0, NULL, '2020-12-30 16:31:47', '2020-12-30 16:31:47');
INSERT INTO `w_articles` VALUES (18, '31省份新增确诊病例24例 其中本土病例7例', 0, 2, '<p>中新网12月30日电 据国家卫健委官网消息，12月29日0&mdash;24时，31个省(自治区、直辖市)和新疆生产建设兵团报告新增确诊病例24例，其中境外输入病例17例(上海7例，天津3例，内蒙古2例，福建2例，浙江1例，山东1例，广东1例)，本土病例7例(辽宁5例，北京1例，黑龙江1例)；无新增死亡病例；无新增疑似病例。</p>\r\n\r\n<p>当日新增治愈出院病例16例，解除医学观察的密切接触者399人，重症病例较前一日增加1例。</p>\r\n\r\n<p>境外输入现有确诊病例269例(其中重症病例3例)，无现有疑似病例。累计确诊病例4247例，累计治愈出院病例3978例，无死亡病例。</p>\r\n\r\n<p>截至12月29日24时，据31个省(自治区、直辖市)和新疆生产建设兵团报告，现有确诊病例356例(其中重症病例6例)，累计治愈出院病例82037例，累计死亡病例4634例，累计报告确诊病例87027例，无现有疑似病例。累计追踪到密切接触者903528人，尚在医学观察的密切接触者12846人。</p>', 0, 0, 0, 0, '2020-12-30 16:32:15', 0, '', 1, 0, NULL, '2020-12-30 16:32:15', '2020-12-30 16:32:15');

-- ----------------------------
-- Table structure for w_attachments
-- ----------------------------
DROP TABLE IF EXISTS `w_attachments`;
CREATE TABLE `w_attachments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NULL DEFAULT 0 COMMENT '文章id',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_attachments
-- ----------------------------
INSERT INTO `w_attachments` VALUES (6, 5, 'files/9aa5e254fc0d5fb23228a268c05a7dcb.png', '2020-12-07 15:48:32', '2020-12-07 15:48:32');
INSERT INTO `w_attachments` VALUES (7, 5, 'files/equipment_icon_d3@3x (1).png', '2020-12-07 15:49:33', '2020-12-07 15:49:33');
INSERT INTO `w_attachments` VALUES (9, 4, 'files/equipment_icon_g806@3x.png', '2020-12-07 15:58:43', '2020-12-07 15:58:43');
INSERT INTO `w_attachments` VALUES (10, 4, 'files/equipment_icon_uwat@3x.png', '2020-12-07 15:58:43', '2020-12-07 15:58:43');
INSERT INTO `w_attachments` VALUES (11, 2, 'files/x.zip', '2020-12-07 16:00:25', '2020-12-07 16:00:25');
INSERT INTO `w_attachments` VALUES (12, 2, 'files/home_slices.zip', '2020-12-07 16:00:25', '2020-12-07 16:00:25');

-- ----------------------------
-- Table structure for w_bottle_sale_logs
-- ----------------------------
DROP TABLE IF EXISTS `w_bottle_sale_logs`;
CREATE TABLE `w_bottle_sale_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(11) NULL DEFAULT 0 COMMENT '站点id',
  `company_id` int(11) NULL DEFAULT 0 COMMENT '公司id',
  `zone_id` int(11) NULL DEFAULT 0 COMMENT '区域id',
  `bottle_num` int(11) NULL DEFAULT 0 COMMENT '钢瓶数',
  `volume` int(11) NULL DEFAULT 0 COMMENT '容积(L)',
  `sale_num` int(11) NULL DEFAULT 0 COMMENT '销售总量',
  `sale_date` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '销售日期',
  `sale_time` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '销售日期',
  `year` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '年',
  `month` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '月',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换站瓶销售记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_bottles
-- ----------------------------
DROP TABLE IF EXISTS `w_bottles`;
CREATE TABLE `w_bottles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bottle_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '钢瓶编号',
  `station_id` int(11) NULL DEFAULT 0 COMMENT '站点id',
  `volume` int(11) NULL DEFAULT 0 COMMENT '容积(L)',
  `guest` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '客户',
  `flow_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '流转时间',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '0正常 1异常',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '钢瓶记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_bottles
-- ----------------------------
INSERT INTO `w_bottles` VALUES (1, '123', 5, 4111, '张扬', '2021-01-21 00:00:00', 0, '2021-01-20 14:01:51', '2021-01-20 14:01:51');

-- ----------------------------
-- Table structure for w_categories
-- ----------------------------
DROP TABLE IF EXISTS `w_categories`;
CREATE TABLE `w_categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_categories
-- ----------------------------
INSERT INTO `w_categories` VALUES (1, '通知', '2020-12-05 17:16:08', '2020-12-05 17:16:08');
INSERT INTO `w_categories` VALUES (2, '公告', '2020-12-05 17:16:49', '2020-12-05 17:16:49');
INSERT INTO `w_categories` VALUES (3, '法规', '2020-12-05 17:16:54', '2020-12-05 17:16:54');
INSERT INTO `w_categories` VALUES (4, '消防', '2020-12-05 17:16:59', '2020-12-05 17:16:59');

-- ----------------------------
-- Table structure for w_cert_periods
-- ----------------------------
DROP TABLE IF EXISTS `w_cert_periods`;
CREATE TABLE `w_cert_periods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `effect_type` int(11) NULL DEFAULT 1 COMMENT '1一年一审 2两年一审',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '许可证审核周期' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_cert_periods
-- ----------------------------
INSERT INTO `w_cert_periods` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for w_chats
-- ----------------------------
DROP TABLE IF EXISTS `w_chats`;
CREATE TABLE `w_chats`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `to` int(11) NOT NULL DEFAULT 0 COMMENT '接收方 用户id/群组id',
  `chat_type` int(11) NOT NULL DEFAULT 1 COMMENT '1 单聊, 2群聊',
  `msg_type` int(11) NOT NULL DEFAULT 0 COMMENT '消息类型 1文本 2语音 3图片 4文件',
  `msg` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息内容',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件url',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_ext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件扩展',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户会话' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_chats
-- ----------------------------
INSERT INTO `w_chats` VALUES (2, 2, 4, 2, 1, '吾问无为谓', '', '', '', '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 15:28:09', '2020-12-23 15:29:45', NULL);
INSERT INTO `w_chats` VALUES (3, 2, 5, 1, 1, '2', '', '', '', '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 15:47:39', '2020-12-31 10:32:49', NULL);
INSERT INTO `w_chats` VALUES (4, 5, 2, 1, 1, '2', '', '', '', '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 15:47:39', '2020-12-31 10:32:49', NULL);
INSERT INTO `w_chats` VALUES (7, 4, 2, 1, 1, '嗯嗯嗯呢😛😛', '', '', '', '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 16:06:45', '2021-01-15 16:03:49', NULL);
INSERT INTO `w_chats` VALUES (12, 6, 2, 1, 1, '🏈', '', '', '', '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 16:24:57', '2020-12-28 18:35:50', NULL);
INSERT INTO `w_chats` VALUES (14, 1, 9, 2, 1, '233', '', '', '', 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 17:02:27', '2021-01-18 13:55:45', NULL);
INSERT INTO `w_chats` VALUES (15, 1, 10, 2, 1, 'ksjdfoljsdlfjdlsj\n', '', '', '', 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 17:19:45', '2021-01-25 17:14:47', NULL);
INSERT INTO `w_chats` VALUES (18, 2, 2, 2, 1, 'w ', '', '', '', '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-25 18:03:56', '2020-12-28 14:26:11', NULL);
INSERT INTO `w_chats` VALUES (20, 2, 4, 1, 1, '嗯嗯嗯呢😛😛', '', '', '', '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-26 10:49:49', '2021-01-15 16:03:49', NULL);
INSERT INTO `w_chats` VALUES (22, 2, 6, 1, 1, '🏈', '', '', '', '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 10:55:51', '2020-12-28 18:35:50', NULL);
INSERT INTO `w_chats` VALUES (23, 9, 6, 2, 1, '点点点', '', '', '', '刘小二', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 11:01:25', '2021-01-05 15:47:05', NULL);
INSERT INTO `w_chats` VALUES (24, 5, 6, 1, 1, '嗯', '', '', '', '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-28 14:27:17', '2020-12-28 14:27:24', NULL);
INSERT INTO `w_chats` VALUES (25, 6, 5, 1, 1, '嗯', '', '', '', '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-28 14:27:17', '2020-12-28 14:27:24', NULL);
INSERT INTO `w_chats` VALUES (26, 2, 11, 2, 1, '1', '', '', '', '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-30 15:44:50', '2020-12-30 15:44:50', NULL);
INSERT INTO `w_chats` VALUES (27, 1, 2, 1, 1, '😄', '', '', '', 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-30 16:29:25', '2021-01-21 16:27:34', NULL);
INSERT INTO `w_chats` VALUES (28, 2, 1, 1, 1, '😄', '', '', '', 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-30 16:29:25', '2021-01-21 16:27:34', NULL);
INSERT INTO `w_chats` VALUES (29, 7, 2, 1, 1, '你黄河大街卡的看\n', '', '', '', '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-30 16:46:13', '2021-01-05 15:45:32', NULL);
INSERT INTO `w_chats` VALUES (30, 2, 7, 1, 1, '你黄河大街卡的看\n', '', '', '', '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-30 16:46:13', '2021-01-05 15:45:32', NULL);
INSERT INTO `w_chats` VALUES (31, 7, 8, 1, 1, '嗯嗯嗯讷讷呢\n', '', '', '', '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-04 10:51:13', '2021-01-04 10:51:13', NULL);
INSERT INTO `w_chats` VALUES (32, 8, 7, 1, 1, '嗯嗯嗯讷讷呢\n', '', '', '', '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-04 10:51:13', '2021-01-04 10:51:13', NULL);
INSERT INTO `w_chats` VALUES (33, 9, 2, 1, 1, '水水水水水水水水', '', '', '', '刘小二', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-05 15:46:31', '2021-01-05 15:46:41', NULL);
INSERT INTO `w_chats` VALUES (34, 2, 9, 1, 1, '水水水水水水水水', '', '', '', '刘小二', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-05 15:46:31', '2021-01-05 15:46:41', NULL);
INSERT INTO `w_chats` VALUES (35, 2, 12, 2, 1, 'eeeeeeeee', '', '', '', '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-13 18:11:45', '2021-01-13 18:11:45', NULL);
INSERT INTO `w_chats` VALUES (36, 7, 10, 1, 1, '😘', '', '', '', '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-15 16:07:15', '2021-01-15 16:07:24', NULL);
INSERT INTO `w_chats` VALUES (37, 10, 7, 1, 1, '😘', '', '', '', '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-15 16:07:15', '2021-01-15 16:07:24', NULL);
INSERT INTO `w_chats` VALUES (38, 7, 13, 2, 1, 'mzknzjzjsjs', '', '', '', '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-15 16:09:38', '2021-01-15 16:09:38', NULL);
INSERT INTO `w_chats` VALUES (39, 2, 14, 1, 3, '', 'http://gas.micyi.com/pics/files/5f28d7047458d_7487.jpg', '5f28d7047458d_7487.jpg', 'jpg', '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-21 15:22:52', '2021-01-21 15:22:52', NULL);
INSERT INTO `w_chats` VALUES (40, 14, 2, 1, 3, '', 'http://gas.micyi.com/pics/files/5f28d7047458d_7487.jpg', '5f28d7047458d_7487.jpg', 'jpg', '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-21 15:22:52', '2021-01-21 15:22:52', NULL);
INSERT INTO `w_chats` VALUES (41, 1, 1, 2, 1, '大家好\n', '', '', '', 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-22 11:29:21', '2021-01-22 11:29:21', NULL);
INSERT INTO `w_chats` VALUES (43, 2, 17, 1, 1, '////@快快快多久', '', '', '', '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-25 13:58:30', '2021-01-29 17:19:29', NULL);
INSERT INTO `w_chats` VALUES (44, 17, 3, 1, 3, '', 'http://gas.micyi.com/pics/files/IMG_CMP_222927684_1375.jpeg', 'IMG_CMP_222927684_1375.jpeg', 'jpeg', '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-25 14:49:36', '2021-01-26 17:13:31', NULL);
INSERT INTO `w_chats` VALUES (45, 3, 17, 1, 3, '', 'http://gas.micyi.com/pics/files/IMG_CMP_222927684_1375.jpeg', 'IMG_CMP_222927684_1375.jpeg', 'jpeg', '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-25 14:49:36', '2021-01-26 17:13:31', NULL);
INSERT INTO `w_chats` VALUES (46, 17, 4, 1, 1, '回来了啦啦啦', '', '', '', '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 11:33:40', '2021-01-29 09:58:42', NULL);
INSERT INTO `w_chats` VALUES (47, 4, 17, 1, 1, '回来了啦啦啦', '', '', '', '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 11:33:40', '2021-01-29 09:58:42', NULL);
INSERT INTO `w_chats` VALUES (48, 17, 2, 1, 1, '////@快快快多久', '', '', '', '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:04:47', '2021-01-29 17:19:29', NULL);
INSERT INTO `w_chats` VALUES (49, 17, 15, 2, 1, '呜呜呜呜我问问', '', '', '', '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:06:35', '2021-01-26 14:37:14', NULL);
INSERT INTO `w_chats` VALUES (51, 7, 17, 1, 1, 'wertyyyuu', '', '', '', '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:09:02', '2021-01-26 14:09:06', NULL);
INSERT INTO `w_chats` VALUES (53, 10, 17, 1, 1, 'eeeerff', '', '', '', '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:09:42', '2021-01-26 14:09:51', NULL);
INSERT INTO `w_chats` VALUES (55, 14, 17, 1, 1, 'nh', '', '', '', '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:10:02', '2021-01-26 14:10:02', NULL);
INSERT INTO `w_chats` VALUES (57, 9, 17, 1, 1, 'w', '', '', '', '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:11:08', '2021-01-26 14:11:08', NULL);
INSERT INTO `w_chats` VALUES (58, 17, 16, 2, 1, '我', '', '', '', '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:11:22', '2021-01-26 14:35:36', NULL);

-- ----------------------------
-- Table structure for w_companies
-- ----------------------------
DROP TABLE IF EXISTS `w_companies`;
CREATE TABLE `w_companies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '公司名',
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地址',
  `lng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '经度',
  `lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '纬度',
  `contact_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系人',
  `contact_user_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系人手机',
  `contact_user_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系人电话',
  `permit` tinyint(4) NULL DEFAULT 1 COMMENT '营业执照',
  `permit_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '营业执照图片',
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '网站',
  `legal_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '法人',
  `legal_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '法人手机',
  `legal_idnum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '法人身份证',
  `secure_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '安全责任人',
  `secure_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '安全责任人手机',
  `secure_idnum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '安全责任人身份证',
  `ck_status` tinyint(4) NULL DEFAULT 0 COMMENT '审核状态0未审核 1已审核',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `company_type` int(11) NULL DEFAULT 0 COMMENT '0 私企 1国企',
  `belongs` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '属地',
  `permit_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '许可证编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '燃气公司' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_companies
-- ----------------------------
INSERT INTO `w_companies` VALUES (1, '公司1', '深圳市福田区', '114.011732', '22.578207', '1', '1', NULL, 1, NULL, NULL, '2', '2', '2', '3', '3', '3', 0, '2020-12-03 09:48:13', '2020-12-04 17:03:44', 0, '', '');
INSERT INTO `w_companies` VALUES (2, '公司2', '深圳市福田区润田路13', '114.022003', '22.554098', '2', '2', NULL, 1, 'images/e550ed098e98994c2592a23980040682.png', NULL, '2', '2', '2', '2', '2', '2', 0, '2020-12-03 10:07:06', '2020-12-04 18:13:46', 0, '', '');
INSERT INTO `w_companies` VALUES (3, '大兴机场燃气', '大兴国际机场', '32.21', '24', '这是联系人', '17328700173', 'https://app.mockplus.cn/run/prototype/py2mfwqf0K/d7fe7Txp0y/6493Eb1xtN?ha=1&la=1&ps=1', 1, NULL, 'baidu.com', '这是法人', '15012345678', '110123456789012345', '这是安全负责人', '15012345678', '110123456789012345', 0, '2021-01-20 11:48:47', '2021-01-20 11:48:47', 0, '大兴区', '212312');
INSERT INTO `w_companies` VALUES (4, '123', '北京市丰台区右安门外翠林小区2里22号首都医科大学附属中学', '116.36', '39.85', '123', '123', '123', 1, NULL, NULL, '123', '123', '123', '123', '123', '123', 0, '2021-01-22 10:27:26', '2021-01-22 11:34:07', 0, '123', '11111111');

-- ----------------------------
-- Table structure for w_devices
-- ----------------------------
DROP TABLE IF EXISTS `w_devices`;
CREATE TABLE `w_devices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(11) NULL DEFAULT 0 COMMENT '站点id',
  `device_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '设备编号',
  `device_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '设备名',
  `device_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '设备型号',
  `admin_user_id` int(11) NULL DEFAULT 0 COMMENT '负责人id',
  `device_status` tinyint(4) NULL DEFAULT 0 COMMENT '0正常, 1维修中, 2已报废',
  `device_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '设备图片',
  `fix_logs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '维修记录',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '设备' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_devices
-- ----------------------------
INSERT INTO `w_devices` VALUES (1, 2, '11', '11', 'GAS', 2, 1, '', NULL, '2020-12-05 10:33:48', '2020-12-05 14:29:38');
INSERT INTO `w_devices` VALUES (2, 2, '22', '22', '22', 2, 0, '', NULL, '2020-12-05 14:29:47', '2020-12-05 14:29:47');
INSERT INTO `w_devices` VALUES (3, 5, '001', '涡轮增压', 'wolun', 3, 0, 'images/39bb18a68ccbdc8b45d932607c25500f.png', '这是维修记录', '2021-01-20 11:52:04', '2021-01-20 11:52:04');

-- ----------------------------
-- Table structure for w_event_types
-- ----------------------------
DROP TABLE IF EXISTS `w_event_types`;
CREATE TABLE `w_event_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etype_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类型名',
  `deal_time` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '处理时间 (时:分)',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '事件类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_event_types
-- ----------------------------
INSERT INTO `w_event_types` VALUES (1, '非常紧急', '00:59', NULL, '2020-12-08 14:45:13');
INSERT INTO `w_event_types` VALUES (2, '紧急', '22:00', NULL, '2020-12-08 14:35:39');
INSERT INTO `w_event_types` VALUES (3, '一般', '00:00', NULL, '2020-12-08 14:35:53');
INSERT INTO `w_event_types` VALUES (4, '不紧急', '00:00', NULL, '2020-12-08 15:42:01');

-- ----------------------------
-- Table structure for w_events
-- ----------------------------
DROP TABLE IF EXISTS `w_events`;
CREATE TABLE `w_events`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '事件名',
  `event_type_id` tinyint(4) NULL DEFAULT 0 COMMENT '事件类型',
  `station_id` int(11) NULL DEFAULT 0 COMMENT '站点id',
  `admin_user_id` int(11) NULL DEFAULT 0 COMMENT '人员分配id',
  `event_status` tinyint(4) NULL DEFAULT 0 COMMENT '0未解决, 1已解决',
  `deal_content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '处理过程',
  `solved_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '解决时间',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `solved_minutes` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '解决时长(分钟)',
  `created_year` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建年份',
  `created_month` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建月份',
  `solved_at` datetime(0) NULL DEFAULT NULL COMMENT '解决时间',
  `created_day` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建日期',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '事件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_events
-- ----------------------------
INSERT INTO `w_events` VALUES (1, '紧急', 2, 2, 2, 0, NULL, NULL, '2020-12-08 14:13:11', '2020-12-08 14:13:11', NULL, '2020', '12', NULL, '2020-12-01', '2020-12-08 14:13:11');
INSERT INTO `w_events` VALUES (2, '十万火急', 1, 2, 2, 1, '111111112222222222', '1608537091', '2020-12-08 16:13:10', '2020-12-21 15:51:31', '18699', '2020', '12', '2020-12-21 15:51:31', '2020-12-02', '2020-12-08 16:44:37');
INSERT INTO `w_events` VALUES (3, '一般般', 3, 2, 2, 1, '1. xxx\r\n2. xxx\r\n3. xxx', '1607481671', '2020-12-08 16:20:40', '2020-12-09 10:41:11', '1100', '2020', '12', NULL, '2020-12-03', '2020-12-09 10:41:11');
INSERT INTO `w_events` VALUES (4, '不紧急', 4, 1, 1, 1, NULL, '1607496591', '2020-12-08 17:07:43', '2020-12-09 14:49:51', '1302', '2020', '12', '2020-12-09 14:49:51', '2020-12-04', '2020-12-08 17:07:43');
INSERT INTO `w_events` VALUES (5, '急急急', 1, 2, 1, 1, NULL, '1607496585', '2020-12-08 17:07:54', '2020-12-09 14:49:45', '1301', '2020', '12', '2020-12-09 14:49:45', '2020-12-08', '2020-12-08 17:07:54');
INSERT INTO `w_events` VALUES (6, '急急急', 1, 3, 1, 1, NULL, '1607496579', '2020-12-09 11:14:01', '2020-12-09 14:49:39', '215', '2020', '12', '2020-12-09 14:49:39', '2020-12-08', '2020-12-09 11:14:01');
INSERT INTO `w_events` VALUES (7, '紧急', 2, 3, 1, 1, NULL, '1608072000', '2020-12-09 11:31:37', '2020-12-19 18:09:13', '9789', '2020', '12', '2020-12-16 06:40:00', '2020-12-08', '2020-12-09 11:31:28');
INSERT INTO `w_events` VALUES (8, '这是事件名称', 1, 5, 3, 0, NULL, NULL, '2021-01-20 14:43:10', '2021-01-20 14:43:10', NULL, '2021', '01', NULL, '2021-01-20', '2021-01-20 14:42:35');

-- ----------------------------
-- Table structure for w_gas_stats
-- ----------------------------
DROP TABLE IF EXISTS `w_gas_stats`;
CREATE TABLE `w_gas_stats`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '使用年份',
  `company_id` int(11) NULL DEFAULT 0 COMMENT '公司id',
  `used_gas` int(11) NULL DEFAULT 0 COMMENT '用气量(L)',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用气量统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_gas_stats
-- ----------------------------
INSERT INTO `w_gas_stats` VALUES (1, '2020', 1, 3016, '2020-12-09 18:28:17', '2021-01-19 17:20:35');
INSERT INTO `w_gas_stats` VALUES (2, '2020', 2, 2020, '2020-12-09 18:28:27', '2020-12-09 18:28:27');
INSERT INTO `w_gas_stats` VALUES (3, '2010', 1, 15, '2021-01-12 10:00:22', '2021-01-12 10:00:22');
INSERT INTO `w_gas_stats` VALUES (4, '2011', 1, 15, '2021-01-12 10:12:28', '2021-01-12 10:12:28');
INSERT INTO `w_gas_stats` VALUES (6, '20201', 3, 1000, '2021-01-20 14:29:45', '2021-01-20 14:29:45');

-- ----------------------------
-- Table structure for w_gas_used_details
-- ----------------------------
DROP TABLE IF EXISTS `w_gas_used_details`;
CREATE TABLE `w_gas_used_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NULL DEFAULT 0 COMMENT '所属公司id',
  `data_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '数据图片',
  `report_user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '上报人',
  `report_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '上报时间',
  `used_gas` decimal(10, 2) NOT NULL DEFAULT 0 COMMENT '用气量',
  `created_year` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建年份',
  `created_month` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建月份',
  `created_day` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建日期',
  `created_date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用气量明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_gas_used_details
-- ----------------------------
INSERT INTO `w_gas_used_details` VALUES (1, 1, 'images/ce8507e126abc2018e76ce0ad9991986.png', '三胖', '2020-11-01 11:00:00', 101.00, '2020', '11', '2020-11-01', '2020-11-01 12:00:00', '2020-12-11 11:07:54', '2020-11-01 12:00:00', '2020-12-11 11:09:03');
INSERT INTO `w_gas_used_details` VALUES (2, 1, 'images/901a9096d6762d03cf9a7edb0f71558a.png', '三胖', '2020-11-02 11:00:00', 22.00, '2020', '11', '2020-11-02', '2020-11-02 11:00:00', '2020-12-11 11:19:33', '2020-11-02 11:00:00', '2020-12-11 11:20:21');
INSERT INTO `w_gas_used_details` VALUES (3, 1, 'images/901a9096d6762d03cf9a7edb0f71558a.png', '三胖', '2020-11-03 11:00:00', 333.00, '2020', '11', '2020-11-03', '2020-11-03 11:00:00', '2020-12-11 11:19:33', '2020-11-03 11:00:00', '2020-12-11 11:20:21');
INSERT INTO `w_gas_used_details` VALUES (4, 1, 'images/901a9096d6762d03cf9a7edb0f71558a.png', '三胖', '2020-11-04 11:00:00', 444.00, '2020', '11', '2020-11-04', '2020-11-04 11:00:00', '2020-12-11 11:19:33', '2020-11-04 11:00:00', '2020-12-11 11:20:21');
INSERT INTO `w_gas_used_details` VALUES (5, 1, 'images/901a9096d6762d03cf9a7edb0f71558a.png', '三胖', '2020-11-05 11:00:00', 555.00, '2020', '11', '2020-11-05', '2020-11-05 11:00:00', '2020-12-11 11:19:33', '2020-11-05 11:00:00', '2020-12-11 11:20:21');
INSERT INTO `w_gas_used_details` VALUES (6, 1, 'images/901a9096d6762d03cf9a7edb0f71558a.png', '三胖', '2020-11-06 11:00:00', 66.00, '2020', '11', '2020-11-06', '2020-11-06 11:00:00', '2020-12-11 11:19:33', '2020-11-06 11:00:00', '2020-12-11 11:20:21');
INSERT INTO `w_gas_used_details` VALUES (7, 1, 'images/901a9096d6762d03cf9a7edb0f71558a.png', '三胖', '2020-12-01 11:00:00', 66.00, '2020', '12', '2020-12-01', '2020-12-01 11:00:00', '2020-12-01 11:19:33', '2020-12-01 11:00:00', '2020-12-01 11:20:21');
INSERT INTO `w_gas_used_details` VALUES (8, 1, 'images/901a9096d6762d03cf9a7edb0f71558a.png', '三胖', '2020-12-02 11:00:00', 666.00, '2020', '12', '2020-12-02', '2020-12-02 11:00:00', '2020-12-02 11:19:33', '2020-12-02 11:00:00', '2020-12-01 11:20:21');
INSERT INTO `w_gas_used_details` VALUES (9, 1, 'images/901a9096d6762d03cf9a7edb0f71558a.png', '三胖', '2020-12-03 11:00:00', 366.00, '2020', '12', '2020-12-03', '2020-12-03 11:00:00', '2020-12-03 11:19:33', '2020-12-03 11:00:00', '2020-12-01 11:20:21');

-- ----------------------------
-- Table structure for w_im_msgs
-- ----------------------------
DROP TABLE IF EXISTS `w_im_msgs`;
CREATE TABLE `w_im_msgs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息id',
  `timestamp` int(11) NOT NULL DEFAULT 0 COMMENT '时间戳',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '类型 1聊天 2公告 9登录',
  `chat_type` int(11) NOT NULL DEFAULT 1 COMMENT '1 单聊, 2群聊',
  `msg_type` int(11) NOT NULL DEFAULT 0 COMMENT '消息类型 1文本 2语音 3图片 4文件',
  `msg` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息内容',
  `token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户token',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `to` int(11) NOT NULL DEFAULT 0 COMMENT '接收方 用户id/群组id',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件url',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_ext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件扩展',
  `is_send` int(11) NOT NULL DEFAULT 0 COMMENT '是否已发送 0否 1是',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  `extras` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 687 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '历史消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_im_msgs
-- ----------------------------
INSERT INTO `w_im_msgs` VALUES (1, '233', 1608345653, 1, 1, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 10:38:25', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (2, '233', 1608345653, 1, 1, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 10:43:09', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (3, '233', 1608345653, 1, 1, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 10:46:22', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (4, '233', 1608345653, 1, 1, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 10:47:00', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (5, '233', 1608345653, 1, 1, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 10:49:07', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (6, '233', 1608345653, 1, 2, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 11:07:36', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (7, '233', 1608345653, 1, 2, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 11:15:58', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (8, '233', 1608345653, 1, 2, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 11:16:05', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (9, '233', 1608345653, 1, 1, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 11:16:20', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (10, '233', 1608345653, 1, 1, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 11:17:12', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (11, '233', 1608345653, 1, 2, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 11:17:22', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (12, '233', 1608345653, 1, 2, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 11:24:46', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (13, '233', 1608345653, 1, 2, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 11:25:02', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (14, '233', 1608345653, 1, 2, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 11:26:31', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (15, '233', 1608345653, 1, 2, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 11:27:54', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (16, '233', 1608345653, 1, 1, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-19 11:28:06', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (17, '233', 1608345653, 1, 1, 1, '233', '', 1, 3, '', '', '', 1, '', '', '2020-12-19 11:28:19', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (18, '233', 1608345653, 1, 1, 1, '233', '', 1, 3, '', '', '', 1, '', '', '2020-12-19 11:39:22', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (19, '233', 1608345653, 1, 1, 1, '233', '', 1, 3, '', '', '', 1, '', '', '2020-12-19 11:39:41', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (20, '233', 1608345653, 1, 1, 1, '233', '', 1, 3, '', '', '', 1, '', '', '2020-12-19 12:03:19', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (21, '233', 1608345653, 1, 1, 1, '233', '', 1, 3, '', '', '', 1, '', '', '2020-12-19 12:03:44', '2020-12-19 12:59:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (22, '233', 1608345653, 1, 1, 1, '233', '', 1, 3, '', '', '', 1, '', '', '2020-12-19 12:04:47', '2020-12-23 11:13:24', NULL, '');
INSERT INTO `w_im_msgs` VALUES (23, '233', 1608345653, 1, 1, 1, '233', '', 1, 3, '', '', '', 1, '', '', '2020-12-19 12:04:54', '2020-12-23 11:13:24', NULL, '');
INSERT INTO `w_im_msgs` VALUES (24, '233', 1608345653, 1, 1, 1, '234', '', 2, 1, '', '', '', 1, '', '', '2020-12-19 14:18:55', '2020-12-19 14:18:55', NULL, '');
INSERT INTO `w_im_msgs` VALUES (25, '233', 1608345653, 1, 1, 1, '233', '', 1, 2, '', '', '', 1, '', '', '2020-12-22 15:05:03', '2020-12-22 15:05:03', NULL, '');
INSERT INTO `w_im_msgs` VALUES (26, '233', 1608620703, 1, 1, 1, '2222222222222222222', '', 1, 2, '', '', '', 1, '', '', '2020-12-22 15:32:03', '2020-12-22 15:32:03', NULL, '');
INSERT INTO `w_im_msgs` VALUES (27, '', 1608623793, 1, 1, 1, '3333333333333333', '', 1, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 15:56:34', '2020-12-22 16:09:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (28, '', 1608623823, 1, 1, 1, '33333333333333333333333333', '', 1, 2, '', '', '', 1, 'Admin', '', '2020-12-22 15:57:04', '2020-12-22 15:57:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (29, '', 1608623954, 1, 1, 1, '吾问无为谓哇哇哇哇', '', 1, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 15:59:15', '2020-12-22 16:09:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (30, '', 1608623973, 1, 1, 1, 'wwwwwwwwwww', '', 1, 2, '', '', '', 1, 'Admin', '', '2020-12-22 15:59:34', '2020-12-22 15:59:34', NULL, '');
INSERT INTO `w_im_msgs` VALUES (31, '', 1608624008, 1, 1, 1, '吾问无为谓哇哇哇哇', '', 1, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:00:09', '2020-12-22 16:09:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (32, '', 1608624038, 1, 1, 1, '吾问无为谓哇哇哇哇', '', 1, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:00:39', '2020-12-22 16:09:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (33, '', 1608624268, 1, 1, 1, '吾问无为谓哇哇哇哇2', '', 1, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:04:29', '2020-12-22 16:09:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (34, '', 1608624306, 1, 1, 1, '22222222222', '', 1, 2, '', '', '', 1, 'Admin', '', '2020-12-22 16:05:07', '2020-12-22 16:05:07', NULL, '');
INSERT INTO `w_im_msgs` VALUES (35, '', 1608624312, 1, 1, 1, '吾问无为谓哇哇哇哇2', '', 1, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:05:13', '2020-12-22 16:09:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (36, '', 1608624355, 1, 1, 1, '吾问无为谓哇哇哇哇2', '', 1, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:05:56', '2020-12-22 16:09:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (37, '', 1608624387, 1, 1, 1, '吾问无为谓哇哇哇哇2', '', 1, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:06:28', '2020-12-22 16:09:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (38, '', 1608624582, 1, 1, 1, '222222222222222', '', 1, 2, '', '', '', 1, 'Admin', '', '2020-12-22 16:09:43', '2020-12-22 16:09:43', NULL, '');
INSERT INTO `w_im_msgs` VALUES (39, '', 1608624591, 1, 1, 1, '吾问无为谓哇哇哇哇', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:09:52', '2020-12-22 16:09:52', NULL, '');
INSERT INTO `w_im_msgs` VALUES (40, '', 1608625049, 1, 1, 1, 'nihsdhdsj', '', 1, 2, '', '', '', 1, 'Admin', '', '2020-12-22 16:17:30', '2020-12-22 16:17:30', NULL, '');
INSERT INTO `w_im_msgs` VALUES (41, '', 1608625099, 1, 1, 1, '11111111111', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:18:20', '2020-12-22 16:18:20', NULL, '');
INSERT INTO `w_im_msgs` VALUES (42, '', 1608625127, 1, 1, 1, 'nihsdhdsj', '', 1, 2, '', '', '', 1, 'Admin', '', '2020-12-22 16:18:48', '2020-12-22 16:18:48', NULL, '');
INSERT INTO `w_im_msgs` VALUES (43, '', 1608625142, 1, 1, 1, 'wwwwwwwwww', '', 1, 2, '', '', '', 1, 'Admin', '', '2020-12-22 16:19:03', '2020-12-22 16:19:03', NULL, '');
INSERT INTO `w_im_msgs` VALUES (44, '', 1608625195, 1, 1, 1, 'www', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:19:56', '2020-12-22 16:19:56', NULL, '');
INSERT INTO `w_im_msgs` VALUES (45, '', 1608625199, 1, 1, 1, '2', '', 1, 2, '', '', '', 1, 'Admin', '', '2020-12-22 16:20:00', '2020-12-22 16:20:00', NULL, '');
INSERT INTO `w_im_msgs` VALUES (46, '', 1608625207, 1, 1, 1, 'sss', '', 1, 2, '', '', '', 1, 'Admin', '', '2020-12-22 16:20:08', '2020-12-22 16:20:08', NULL, '');
INSERT INTO `w_im_msgs` VALUES (47, '', 1608625265, 1, 1, 1, 'www', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:21:06', '2020-12-22 16:21:06', NULL, '');
INSERT INTO `w_im_msgs` VALUES (48, '', 1608625292, 1, 1, 1, 'sss', '', 1, 2, '', '', '', 1, 'Admin', '', '2020-12-22 16:21:33', '2020-12-22 16:21:33', NULL, '');
INSERT INTO `w_im_msgs` VALUES (49, '', 1608625375, 1, 1, 1, '我我我我我我', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:22:56', '2020-12-22 16:22:56', NULL, '');
INSERT INTO `w_im_msgs` VALUES (50, '', 1608625404, 1, 1, 1, '吾问无为谓吾问无为谓', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:23:25', '2020-12-22 16:23:25', NULL, '');
INSERT INTO `w_im_msgs` VALUES (51, '', 1608625444, 1, 1, 1, '吾问无为谓吾问无为谓无', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:24:05', '2020-12-22 16:24:05', NULL, '');
INSERT INTO `w_im_msgs` VALUES (52, '', 1608625499, 1, 1, 1, '呜呜呜呜呜呜呜', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:25:00', '2020-12-22 16:25:00', NULL, '');
INSERT INTO `w_im_msgs` VALUES (53, '', 1608625518, 1, 1, 1, 'wwwwwwww', '', 1, 2, '', '', '', 1, 'Admin', '', '2020-12-22 16:25:19', '2020-12-22 16:25:19', NULL, '');
INSERT INTO `w_im_msgs` VALUES (54, '', 1608625587, 1, 1, 1, '22222222', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:26:28', '2020-12-22 16:26:28', NULL, '');
INSERT INTO `w_im_msgs` VALUES (55, '', 1608625600, 1, 1, 1, 'wwwwww呜呜呜呜', '', 1, 2, '', '', '', 1, 'Admin', '', '2020-12-22 16:26:41', '2020-12-22 16:26:41', NULL, '');
INSERT INTO `w_im_msgs` VALUES (56, '', 1608625610, 1, 1, 1, '22222222', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:26:51', '2020-12-22 16:26:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (57, '', 1608625615, 1, 1, 1, '22222222', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:26:56', '2020-12-22 16:26:56', NULL, '');
INSERT INTO `w_im_msgs` VALUES (58, '', 1608625825, 1, 1, 1, '33333333333333', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:30:26', '2020-12-22 16:30:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (59, '', 1608625962, 1, 1, 1, '可定了定了我', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:32:43', '2020-12-22 16:32:43', NULL, '');
INSERT INTO `w_im_msgs` VALUES (60, '', 1608625970, 1, 1, 1, '水水水水水水水水', '', 1, 2, '', '', '', 1, 'Admin', '', '2020-12-22 16:32:51', '2020-12-22 16:32:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (61, '', 1608626070, 1, 1, 1, '22222222222', '', 1, 2, '', '', '', 1, 'Admin', '', '2020-12-22 16:34:31', '2020-12-22 16:34:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (62, '', 1608626109, 1, 1, 1, '的说法了烽火芳菲\n嘻嘻嘻嘻嘻嘻嘻嘻寻寻', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:35:10', '2020-12-22 16:35:10', NULL, '');
INSERT INTO `w_im_msgs` VALUES (63, '', 1608626117, 1, 1, 1, '回到家地方回到家发货单', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-22 16:35:18', '2020-12-22 16:35:18', NULL, '');
INSERT INTO `w_im_msgs` VALUES (64, '', 1608692394, 1, 2, 1, 'dddddddddddddd', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 10:59:54', '2020-12-23 10:59:54', NULL, '');
INSERT INTO `w_im_msgs` VALUES (65, '', 1608692402, 1, 2, 1, 'xxxxxxxxxxxxxxx', '', 4, 2, '', '', '', 1, '李四', 'images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 11:00:02', '2020-12-23 11:00:02', NULL, '');
INSERT INTO `w_im_msgs` VALUES (66, '', 1608692426, 1, 2, 1, 'xxxxxxxxxxxxxxxx', '', 4, 2, '', '', '', 1, '李四', 'images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 11:00:26', '2020-12-23 11:00:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (67, '', 1608692430, 1, 2, 1, 'ssssss', '', 4, 2, '', '', '', 1, '李四', 'images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 11:00:31', '2020-12-23 11:00:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (68, '', 1608693177, 1, 2, 1, 'sssssssssss', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:12:57', '2020-12-23 11:12:57', NULL, '');
INSERT INTO `w_im_msgs` VALUES (69, '', 1608693193, 1, 2, 1, 'dddddddddddddddd', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:13:13', '2020-12-23 11:13:13', NULL, '');
INSERT INTO `w_im_msgs` VALUES (70, '', 1608693223, 1, 2, 1, '2222222222222222', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:13:43', '2020-12-23 11:13:43', NULL, '');
INSERT INTO `w_im_msgs` VALUES (71, '', 1608693232, 1, 2, 1, 'sss\n', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 11:13:52', '2020-12-23 11:13:52', NULL, '');
INSERT INTO `w_im_msgs` VALUES (72, '', 1608693238, 1, 2, 1, 'sadlajdledlewhkew', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 11:13:58', '2020-12-23 11:13:58', NULL, '');
INSERT INTO `w_im_msgs` VALUES (73, '', 1608693246, 1, 2, 1, 'wwwwwwwwwwww', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 11:14:06', '2020-12-23 11:14:06', NULL, '');
INSERT INTO `w_im_msgs` VALUES (74, '', 1608693306, 1, 2, 1, '一二三四五\n', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 11:15:06', '2020-12-23 11:15:06', NULL, '');
INSERT INTO `w_im_msgs` VALUES (75, '', 1608693330, 1, 2, 1, '也算是我有提示所所所所所所所所所所所所所所所少时诵诗书所所所所所所所所所所所所所所所所', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 11:15:30', '2020-12-23 11:15:30', NULL, '');
INSERT INTO `w_im_msgs` VALUES (76, '', 1608693341, 1, 2, 1, '吾问无为谓吾问无为谓吾问无为谓', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 11:15:42', '2020-12-23 11:15:42', NULL, '');
INSERT INTO `w_im_msgs` VALUES (77, '', 1608693347, 1, 2, 1, '呜呜呜呜呜呜呜呜无无无无', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 11:15:47', '2020-12-23 11:15:47', NULL, '');
INSERT INTO `w_im_msgs` VALUES (78, '', 1608693496, 1, 2, 1, '吾问无为谓吾问无为谓无', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 11:18:16', '2020-12-23 11:18:16', NULL, '');
INSERT INTO `w_im_msgs` VALUES (79, '', 1608693505, 1, 2, 1, '是是是', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:18:25', '2020-12-23 11:18:25', NULL, '');
INSERT INTO `w_im_msgs` VALUES (80, '', 1608693519, 1, 2, 1, '的', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 11:18:39', '2020-12-23 11:18:39', NULL, '');
INSERT INTO `w_im_msgs` VALUES (81, '', 1608693524, 1, 2, 1, '顶顶顶顶顶大大大', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:18:44', '2020-12-23 11:18:44', NULL, '');
INSERT INTO `w_im_msgs` VALUES (82, '', 1608693527, 1, 2, 1, '顶顶顶顶顶顶顶顶顶', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 11:18:47', '2020-12-23 11:18:47', NULL, '');
INSERT INTO `w_im_msgs` VALUES (83, '', 1608693534, 1, 2, 1, '顶顶顶顶', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 11:18:54', '2020-12-23 11:18:54', NULL, '');
INSERT INTO `w_im_msgs` VALUES (84, '', 1608693616, 1, 2, 1, '是', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:20:16', '2020-12-23 11:20:16', NULL, '');
INSERT INTO `w_im_msgs` VALUES (85, '', 1608693618, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:20:18', '2020-12-23 11:20:18', NULL, '');
INSERT INTO `w_im_msgs` VALUES (86, '', 1608693619, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:20:19', '2020-12-23 11:20:19', NULL, '');
INSERT INTO `w_im_msgs` VALUES (87, '', 1608693620, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:20:20', '2020-12-23 11:20:20', NULL, '');
INSERT INTO `w_im_msgs` VALUES (88, '', 1608693621, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:20:21', '2020-12-23 11:20:21', NULL, '');
INSERT INTO `w_im_msgs` VALUES (89, '', 1608693622, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:20:22', '2020-12-23 11:20:22', NULL, '');
INSERT INTO `w_im_msgs` VALUES (90, '', 1608693623, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:20:23', '2020-12-23 11:20:23', NULL, '');
INSERT INTO `w_im_msgs` VALUES (91, '', 1608693624, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:20:24', '2020-12-23 11:20:24', NULL, '');
INSERT INTO `w_im_msgs` VALUES (92, '', 1608693627, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:20:27', '2020-12-23 11:20:27', NULL, '');
INSERT INTO `w_im_msgs` VALUES (93, '', 1608693629, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:20:29', '2020-12-23 11:20:29', NULL, '');
INSERT INTO `w_im_msgs` VALUES (94, '', 1608693831, 1, 2, 1, '去', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:23:51', '2020-12-23 11:23:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (95, '', 1608693838, 1, 2, 1, '去', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:23:58', '2020-12-23 11:23:58', NULL, '');
INSERT INTO `w_im_msgs` VALUES (96, '', 1608693839, 1, 2, 1, '去', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:23:59', '2020-12-23 11:23:59', NULL, '');
INSERT INTO `w_im_msgs` VALUES (97, '', 1608693841, 1, 2, 1, '去', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:24:01', '2020-12-23 11:24:01', NULL, '');
INSERT INTO `w_im_msgs` VALUES (98, '', 1608694235, 1, 2, 1, '去', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:30:35', '2020-12-23 11:30:35', NULL, '');
INSERT INTO `w_im_msgs` VALUES (99, '', 1608694250, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:30:50', '2020-12-23 11:30:50', NULL, '');
INSERT INTO `w_im_msgs` VALUES (100, '', 1608694254, 1, 2, 1, '嘻嘻嘻嘻嘻嘻', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:30:55', '2020-12-23 11:30:55', NULL, '');
INSERT INTO `w_im_msgs` VALUES (101, '', 1608694284, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:31:24', '2020-12-23 11:31:24', NULL, '');
INSERT INTO `w_im_msgs` VALUES (102, '', 1608694285, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:31:25', '2020-12-23 11:31:25', NULL, '');
INSERT INTO `w_im_msgs` VALUES (103, '', 1608694286, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:31:26', '2020-12-23 11:31:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (104, '', 1608694287, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:31:27', '2020-12-23 11:31:27', NULL, '');
INSERT INTO `w_im_msgs` VALUES (105, '', 1608694289, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:31:29', '2020-12-23 11:31:29', NULL, '');
INSERT INTO `w_im_msgs` VALUES (106, '', 1608694290, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:31:30', '2020-12-23 11:31:30', NULL, '');
INSERT INTO `w_im_msgs` VALUES (107, '', 1608694291, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:31:31', '2020-12-23 11:31:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (108, '', 1608694292, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:31:32', '2020-12-23 11:31:32', NULL, '');
INSERT INTO `w_im_msgs` VALUES (109, '', 1608694295, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:31:35', '2020-12-23 11:31:35', NULL, '');
INSERT INTO `w_im_msgs` VALUES (110, '', 1608694297, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:31:37', '2020-12-23 11:31:37', NULL, '');
INSERT INTO `w_im_msgs` VALUES (111, '', 1608694298, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:31:38', '2020-12-23 11:31:38', NULL, '');
INSERT INTO `w_im_msgs` VALUES (112, '', 1608694389, 1, 2, 1, '222222', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:33:09', '2020-12-23 11:33:09', NULL, '');
INSERT INTO `w_im_msgs` VALUES (113, '', 1608694476, 1, 2, 1, '2www', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:34:36', '2020-12-23 11:34:36', NULL, '');
INSERT INTO `w_im_msgs` VALUES (114, '', 1608694507, 1, 2, 1, '我我我我我我', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:07', '2020-12-23 11:35:07', NULL, '');
INSERT INTO `w_im_msgs` VALUES (115, '', 1608694510, 1, 2, 1, '我我我我我我', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:10', '2020-12-23 11:35:10', NULL, '');
INSERT INTO `w_im_msgs` VALUES (116, '', 1608694513, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:13', '2020-12-23 11:35:13', NULL, '');
INSERT INTO `w_im_msgs` VALUES (117, '', 1608694523, 1, 2, 1, '呜呜呜呜呜呜呜呜', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:23', '2020-12-23 11:35:23', NULL, '');
INSERT INTO `w_im_msgs` VALUES (118, '', 1608694524, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:24', '2020-12-23 11:35:24', NULL, '');
INSERT INTO `w_im_msgs` VALUES (119, '', 1608694525, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:25', '2020-12-23 11:35:25', NULL, '');
INSERT INTO `w_im_msgs` VALUES (120, '', 1608694526, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:26', '2020-12-23 11:35:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (121, '', 1608694527, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:27', '2020-12-23 11:35:27', NULL, '');
INSERT INTO `w_im_msgs` VALUES (122, '', 1608694528, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:28', '2020-12-23 11:35:28', NULL, '');
INSERT INTO `w_im_msgs` VALUES (123, '', 1608694530, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:30', '2020-12-23 11:35:30', NULL, '');
INSERT INTO `w_im_msgs` VALUES (124, '', 1608694533, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:33', '2020-12-23 11:35:33', NULL, '');
INSERT INTO `w_im_msgs` VALUES (125, '', 1608694537, 1, 2, 1, '111111111111', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:37', '2020-12-23 11:35:37', NULL, '');
INSERT INTO `w_im_msgs` VALUES (126, '', 1608694540, 1, 2, 1, '222222222222222', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:40', '2020-12-23 11:35:40', NULL, '');
INSERT INTO `w_im_msgs` VALUES (127, '', 1608694542, 1, 2, 1, '222222222222222222222', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:42', '2020-12-23 11:35:42', NULL, '');
INSERT INTO `w_im_msgs` VALUES (128, '', 1608694544, 1, 2, 1, '333333333333333333', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:35:44', '2020-12-23 11:35:44', NULL, '');
INSERT INTO `w_im_msgs` VALUES (129, '', 1608694593, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:36:33', '2020-12-23 11:36:33', NULL, '');
INSERT INTO `w_im_msgs` VALUES (130, '', 1608694594, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:36:34', '2020-12-23 11:36:34', NULL, '');
INSERT INTO `w_im_msgs` VALUES (131, '', 1608694594, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:36:34', '2020-12-23 11:36:34', NULL, '');
INSERT INTO `w_im_msgs` VALUES (132, '', 1608694595, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:36:35', '2020-12-23 11:36:35', NULL, '');
INSERT INTO `w_im_msgs` VALUES (133, '', 1608694596, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:36:36', '2020-12-23 11:36:36', NULL, '');
INSERT INTO `w_im_msgs` VALUES (134, '', 1608694597, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:36:37', '2020-12-23 11:36:37', NULL, '');
INSERT INTO `w_im_msgs` VALUES (135, '', 1608694598, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:36:38', '2020-12-23 11:36:38', NULL, '');
INSERT INTO `w_im_msgs` VALUES (136, '', 1608694600, 1, 2, 1, '3', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:36:40', '2020-12-23 11:36:40', NULL, '');
INSERT INTO `w_im_msgs` VALUES (137, '', 1608694602, 1, 2, 1, '4', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:36:42', '2020-12-23 11:36:42', NULL, '');
INSERT INTO `w_im_msgs` VALUES (138, '', 1608694603, 1, 2, 1, '4', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:36:43', '2020-12-23 11:36:43', NULL, '');
INSERT INTO `w_im_msgs` VALUES (139, '', 1608694605, 1, 2, 1, '6', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:36:45', '2020-12-23 11:36:45', NULL, '');
INSERT INTO `w_im_msgs` VALUES (140, '', 1608694614, 1, 2, 1, '我', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:36:54', '2020-12-23 11:36:54', NULL, '');
INSERT INTO `w_im_msgs` VALUES (141, '', 1608694631, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:37:11', '2020-12-23 11:37:11', NULL, '');
INSERT INTO `w_im_msgs` VALUES (142, '', 1608694632, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:37:12', '2020-12-23 11:37:12', NULL, '');
INSERT INTO `w_im_msgs` VALUES (143, '', 1608694633, 1, 2, 1, '3', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:37:13', '2020-12-23 11:37:13', NULL, '');
INSERT INTO `w_im_msgs` VALUES (144, '', 1608694634, 1, 2, 1, '3', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:37:14', '2020-12-23 11:37:14', NULL, '');
INSERT INTO `w_im_msgs` VALUES (145, '', 1608694635, 1, 2, 1, '4', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:37:15', '2020-12-23 11:37:15', NULL, '');
INSERT INTO `w_im_msgs` VALUES (146, '', 1608694637, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:37:17', '2020-12-23 11:37:17', NULL, '');
INSERT INTO `w_im_msgs` VALUES (147, '', 1608694638, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:37:18', '2020-12-23 11:37:18', NULL, '');
INSERT INTO `w_im_msgs` VALUES (148, '', 1608694639, 1, 2, 1, '3', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:37:19', '2020-12-23 11:37:19', NULL, '');
INSERT INTO `w_im_msgs` VALUES (149, '', 1608694641, 1, 2, 1, '4', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:37:21', '2020-12-23 11:37:21', NULL, '');
INSERT INTO `w_im_msgs` VALUES (150, '', 1608694643, 1, 2, 1, '6', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:37:23', '2020-12-23 11:37:23', NULL, '');
INSERT INTO `w_im_msgs` VALUES (151, '', 1608694854, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:40:54', '2020-12-23 11:40:54', NULL, '');
INSERT INTO `w_im_msgs` VALUES (152, '', 1608694855, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:40:55', '2020-12-23 11:40:55', NULL, '');
INSERT INTO `w_im_msgs` VALUES (153, '', 1608694856, 1, 2, 1, '3', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:40:56', '2020-12-23 11:40:56', NULL, '');
INSERT INTO `w_im_msgs` VALUES (154, '', 1608694857, 1, 2, 1, '3', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:40:57', '2020-12-23 11:40:57', NULL, '');
INSERT INTO `w_im_msgs` VALUES (155, '', 1608694859, 1, 2, 1, '4', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:40:59', '2020-12-23 11:40:59', NULL, '');
INSERT INTO `w_im_msgs` VALUES (156, '', 1608694860, 1, 2, 1, '5', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:41:00', '2020-12-23 11:41:00', NULL, '');
INSERT INTO `w_im_msgs` VALUES (157, '', 1608694862, 1, 2, 1, '6', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:41:02', '2020-12-23 11:41:02', NULL, '');
INSERT INTO `w_im_msgs` VALUES (158, '', 1608694863, 1, 2, 1, '7', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:41:03', '2020-12-23 11:41:03', NULL, '');
INSERT INTO `w_im_msgs` VALUES (159, '', 1608694869, 1, 2, 1, '77777777777777777777', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:41:09', '2020-12-23 11:41:09', NULL, '');
INSERT INTO `w_im_msgs` VALUES (160, '', 1608694872, 1, 2, 1, '6', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:41:12', '2020-12-23 11:41:12', NULL, '');
INSERT INTO `w_im_msgs` VALUES (161, '', 1608694873, 1, 2, 1, '6', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:41:13', '2020-12-23 11:41:13', NULL, '');
INSERT INTO `w_im_msgs` VALUES (162, '', 1608694874, 1, 2, 1, '6', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:41:14', '2020-12-23 11:41:14', NULL, '');
INSERT INTO `w_im_msgs` VALUES (163, '', 1608694900, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:41:40', '2020-12-23 11:41:40', NULL, '');
INSERT INTO `w_im_msgs` VALUES (164, '', 1608694903, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:41:43', '2020-12-23 11:41:43', NULL, '');
INSERT INTO `w_im_msgs` VALUES (165, '', 1608694904, 1, 2, 1, '3', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:41:44', '2020-12-23 11:41:44', NULL, '');
INSERT INTO `w_im_msgs` VALUES (166, '', 1608694906, 1, 2, 1, '4', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:41:46', '2020-12-23 11:41:46', NULL, '');
INSERT INTO `w_im_msgs` VALUES (167, '', 1608694908, 1, 2, 1, '5', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:41:48', '2020-12-23 11:41:48', NULL, '');
INSERT INTO `w_im_msgs` VALUES (168, '', 1608695119, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:19', '2020-12-23 11:45:19', NULL, '');
INSERT INTO `w_im_msgs` VALUES (169, '', 1608695120, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:20', '2020-12-23 11:45:20', NULL, '');
INSERT INTO `w_im_msgs` VALUES (170, '', 1608695123, 1, 2, 1, '3', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:23', '2020-12-23 11:45:23', NULL, '');
INSERT INTO `w_im_msgs` VALUES (171, '', 1608695125, 1, 2, 1, '4', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:25', '2020-12-23 11:45:25', NULL, '');
INSERT INTO `w_im_msgs` VALUES (172, '', 1608695126, 1, 2, 1, '5', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:27', '2020-12-23 11:45:27', NULL, '');
INSERT INTO `w_im_msgs` VALUES (173, '', 1608695128, 1, 2, 1, '6', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:28', '2020-12-23 11:45:28', NULL, '');
INSERT INTO `w_im_msgs` VALUES (174, '', 1608695129, 1, 2, 1, '7', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:29', '2020-12-23 11:45:29', NULL, '');
INSERT INTO `w_im_msgs` VALUES (175, '', 1608695131, 1, 2, 1, '8', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:31', '2020-12-23 11:45:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (176, '', 1608695132, 1, 2, 1, '9', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:32', '2020-12-23 11:45:32', NULL, '');
INSERT INTO `w_im_msgs` VALUES (177, '', 1608695134, 1, 2, 1, '0', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:34', '2020-12-23 11:45:34', NULL, '');
INSERT INTO `w_im_msgs` VALUES (178, '', 1608695137, 1, 2, 1, '1111', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:37', '2020-12-23 11:45:37', NULL, '');
INSERT INTO `w_im_msgs` VALUES (179, '', 1608695149, 1, 2, 1, '呜呜呜呜呜呜呜呜', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:49', '2020-12-23 11:45:49', NULL, '');
INSERT INTO `w_im_msgs` VALUES (180, '', 1608695151, 1, 2, 1, '333333333', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:51', '2020-12-23 11:45:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (181, '', 1608695154, 1, 2, 1, '3333333333333333333333', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:54', '2020-12-23 11:45:54', NULL, '');
INSERT INTO `w_im_msgs` VALUES (182, '', 1608695156, 1, 2, 1, '333', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:45:56', '2020-12-23 11:45:56', NULL, '');
INSERT INTO `w_im_msgs` VALUES (183, '', 1608695215, 1, 2, 1, '吾问无为谓吾问无为谓吾问无为谓无无无无无无无无无无无无无无无无无无无无无无无无无无无无无无无无无无无无无无', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:46:56', '2020-12-23 11:46:56', NULL, '');
INSERT INTO `w_im_msgs` VALUES (184, '', 1608695219, 1, 2, 1, '问问问', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:46:59', '2020-12-23 11:46:59', NULL, '');
INSERT INTO `w_im_msgs` VALUES (185, '', 1608695240, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:47:20', '2020-12-23 11:47:20', NULL, '');
INSERT INTO `w_im_msgs` VALUES (186, '', 1608695241, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:47:21', '2020-12-23 11:47:21', NULL, '');
INSERT INTO `w_im_msgs` VALUES (187, '', 1608695242, 1, 2, 1, '3', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:47:22', '2020-12-23 11:47:22', NULL, '');
INSERT INTO `w_im_msgs` VALUES (188, '', 1608695244, 1, 2, 1, '3', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:47:24', '2020-12-23 11:47:24', NULL, '');
INSERT INTO `w_im_msgs` VALUES (189, '', 1608695245, 1, 2, 1, '4', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:47:25', '2020-12-23 11:47:25', NULL, '');
INSERT INTO `w_im_msgs` VALUES (190, '', 1608695246, 1, 2, 1, '5', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:47:26', '2020-12-23 11:47:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (191, '', 1608695247, 1, 2, 1, '5', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:47:27', '2020-12-23 11:47:27', NULL, '');
INSERT INTO `w_im_msgs` VALUES (192, '', 1608695249, 1, 2, 1, '7', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:47:29', '2020-12-23 11:47:29', NULL, '');
INSERT INTO `w_im_msgs` VALUES (193, '', 1608695251, 1, 2, 1, '8', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:47:31', '2020-12-23 11:47:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (194, '', 1608695253, 1, 2, 1, '9', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:47:33', '2020-12-23 11:47:33', NULL, '');
INSERT INTO `w_im_msgs` VALUES (195, '', 1608695255, 1, 2, 1, '0', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:47:35', '2020-12-23 11:47:35', NULL, '');
INSERT INTO `w_im_msgs` VALUES (196, '', 1608695259, 1, 2, 1, '1111111', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:47:39', '2020-12-23 11:47:39', NULL, '');
INSERT INTO `w_im_msgs` VALUES (197, '', 1608695261, 1, 2, 1, '2222', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:47:41', '2020-12-23 11:47:41', NULL, '');
INSERT INTO `w_im_msgs` VALUES (198, '', 1608695463, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:03', '2020-12-23 11:51:03', NULL, '');
INSERT INTO `w_im_msgs` VALUES (199, '', 1608695464, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:04', '2020-12-23 11:51:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (200, '', 1608695466, 1, 2, 1, '3', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:06', '2020-12-23 11:51:06', NULL, '');
INSERT INTO `w_im_msgs` VALUES (201, '', 1608695482, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:22', '2020-12-23 11:51:22', NULL, '');
INSERT INTO `w_im_msgs` VALUES (202, '', 1608695483, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:23', '2020-12-23 11:51:23', NULL, '');
INSERT INTO `w_im_msgs` VALUES (203, '', 1608695484, 1, 2, 1, '3', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:24', '2020-12-23 11:51:24', NULL, '');
INSERT INTO `w_im_msgs` VALUES (204, '', 1608695485, 1, 2, 1, '3', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:25', '2020-12-23 11:51:25', NULL, '');
INSERT INTO `w_im_msgs` VALUES (205, '', 1608695487, 1, 2, 1, '4', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:27', '2020-12-23 11:51:27', NULL, '');
INSERT INTO `w_im_msgs` VALUES (206, '', 1608695488, 1, 2, 1, '5', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:28', '2020-12-23 11:51:28', NULL, '');
INSERT INTO `w_im_msgs` VALUES (207, '', 1608695489, 1, 2, 1, '6', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:29', '2020-12-23 11:51:29', NULL, '');
INSERT INTO `w_im_msgs` VALUES (208, '', 1608695491, 1, 2, 1, '7', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:31', '2020-12-23 11:51:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (209, '', 1608695492, 1, 2, 1, '8', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:32', '2020-12-23 11:51:32', NULL, '');
INSERT INTO `w_im_msgs` VALUES (210, '', 1608695494, 1, 2, 1, '9', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:34', '2020-12-23 11:51:34', NULL, '');
INSERT INTO `w_im_msgs` VALUES (211, '', 1608695496, 1, 2, 1, '0', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:36', '2020-12-23 11:51:36', NULL, '');
INSERT INTO `w_im_msgs` VALUES (212, '', 1608695499, 1, 2, 1, '111111111111111', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:39', '2020-12-23 11:51:39', NULL, '');
INSERT INTO `w_im_msgs` VALUES (213, '', 1608695500, 1, 2, 1, '22222222222222222', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 11:51:41', '2020-12-23 11:51:41', NULL, '');
INSERT INTO `w_im_msgs` VALUES (214, '', 1608702273, 1, 2, 1, '111111111111', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 13:44:33', '2020-12-23 13:44:33', NULL, '');
INSERT INTO `w_im_msgs` VALUES (215, '', 1608702274, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 13:44:34', '2020-12-23 13:44:34', NULL, '');
INSERT INTO `w_im_msgs` VALUES (216, '', 1608702275, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 13:44:35', '2020-12-23 13:44:35', NULL, '');
INSERT INTO `w_im_msgs` VALUES (217, '', 1608702276, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 13:44:36', '2020-12-23 13:44:36', NULL, '');
INSERT INTO `w_im_msgs` VALUES (218, '', 1608702277, 1, 2, 1, '1', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 13:44:37', '2020-12-23 13:44:37', NULL, '');
INSERT INTO `w_im_msgs` VALUES (219, '', 1608702278, 1, 2, 1, '2', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 13:44:38', '2020-12-23 13:44:38', NULL, '');
INSERT INTO `w_im_msgs` VALUES (220, '', 1608702279, 1, 2, 1, '3', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 13:44:39', '2020-12-23 13:44:39', NULL, '');
INSERT INTO `w_im_msgs` VALUES (221, '', 1608702281, 1, 2, 1, '4', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 13:44:41', '2020-12-23 13:44:41', NULL, '');
INSERT INTO `w_im_msgs` VALUES (222, '', 1608702282, 1, 2, 1, '5', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 13:44:42', '2020-12-23 13:44:42', NULL, '');
INSERT INTO `w_im_msgs` VALUES (223, '', 1608702284, 1, 2, 1, '6', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 13:44:44', '2020-12-23 13:44:44', NULL, '');
INSERT INTO `w_im_msgs` VALUES (224, '', 1608702812, 1, 2, 1, '凄凄切切群群群群群', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 13:53:32', '2020-12-23 13:53:32', NULL, '');
INSERT INTO `w_im_msgs` VALUES (225, '', 1608703356, 1, 2, 1, '222222222', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 14:02:36', '2020-12-23 14:02:36', NULL, '');
INSERT INTO `w_im_msgs` VALUES (226, '', 1608703366, 1, 2, 1, '22222222222', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 14:02:46', '2020-12-23 14:02:46', NULL, '');
INSERT INTO `w_im_msgs` VALUES (227, '', 1608703393, 1, 2, 1, '22222222222的', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 14:03:13', '2020-12-23 14:03:13', NULL, '');
INSERT INTO `w_im_msgs` VALUES (228, '', 1608703405, 1, 2, 1, '211qqqqq', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 14:03:25', '2020-12-23 14:03:25', NULL, '');
INSERT INTO `w_im_msgs` VALUES (229, '', 1608703420, 1, 2, 1, '222所说的萨达', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 14:03:40', '2020-12-23 14:03:40', NULL, '');
INSERT INTO `w_im_msgs` VALUES (230, '', 1608703437, 1, 2, 1, '1', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 14:03:57', '2020-12-23 14:03:57', NULL, '');
INSERT INTO `w_im_msgs` VALUES (231, '', 1608703451, 1, 2, 1, '333333333333333333333顶顶顶顶', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 14:04:11', '2020-12-23 14:04:11', NULL, '');
INSERT INTO `w_im_msgs` VALUES (232, '', 1608703504, 1, 2, 1, '.......', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 14:05:04', '2020-12-23 14:05:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (233, '', 1608703513, 1, 2, 1, '9999999999999999999999999', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 14:05:13', '2020-12-23 14:05:13', NULL, '');
INSERT INTO `w_im_msgs` VALUES (234, '', 1608703588, 1, 2, 1, '3v', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 14:06:28', '2020-12-23 14:06:28', NULL, '');
INSERT INTO `w_im_msgs` VALUES (235, '', 1608703610, 1, 2, 1, '呜呜呜呜呜呜呜', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 14:06:50', '2020-12-23 14:06:50', NULL, '');
INSERT INTO `w_im_msgs` VALUES (236, '', 1608703644, 1, 2, 1, '你好\n', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 14:07:24', '2020-12-23 14:07:24', NULL, '');
INSERT INTO `w_im_msgs` VALUES (237, '', 1608703671, 1, 2, 1, '点点点', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 14:07:51', '2020-12-23 14:07:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (238, '', 1608703700, 1, 2, 1, '会撒娇好的好的', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 14:08:20', '2020-12-23 14:08:20', NULL, '');
INSERT INTO `w_im_msgs` VALUES (239, '', 1608703725, 1, 2, 1, '哇啊啊啊', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 14:08:45', '2020-12-23 14:08:45', NULL, '');
INSERT INTO `w_im_msgs` VALUES (240, '', 1608704551, 1, 2, 1, '我我我我我我', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 14:22:31', '2020-12-23 14:22:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (241, '', 1608704574, 1, 2, 1, '那边洒家火锅店看见就爱上', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 14:22:54', '2020-12-23 14:22:54', NULL, '');
INSERT INTO `w_im_msgs` VALUES (242, '', 1608705725, 1, 2, 1, '22222222222', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 14:42:05', '2020-12-23 14:42:05', NULL, '');
INSERT INTO `w_im_msgs` VALUES (243, '', 1608705749, 1, 2, 1, '22222222222', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 14:42:29', '2020-12-23 14:42:29', NULL, '');
INSERT INTO `w_im_msgs` VALUES (244, '', 1608706211, 1, 2, 1, '呜呜呜呜呜呜呜呜', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 14:50:11', '2020-12-23 14:50:11', NULL, '');
INSERT INTO `w_im_msgs` VALUES (245, '', 1608708489, 1, 2, 1, '是是是是是是', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 15:28:09', '2020-12-23 15:28:09', NULL, '');
INSERT INTO `w_im_msgs` VALUES (246, '', 1608708523, 1, 2, 1, '111111', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 15:28:43', '2020-12-23 15:28:43', NULL, '');
INSERT INTO `w_im_msgs` VALUES (247, '', 1608708541, 1, 2, 1, '我', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 15:29:01', '2020-12-23 15:29:01', NULL, '');
INSERT INTO `w_im_msgs` VALUES (248, '', 1608708585, 1, 2, 1, '吾问无为谓', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 15:29:45', '2020-12-23 15:29:45', NULL, '');
INSERT INTO `w_im_msgs` VALUES (249, '', 1608709637, 1, 2, 1, '嘻嘻嘻嘻嘻嘻嘻', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 15:47:17', '2020-12-23 15:47:17', NULL, '');
INSERT INTO `w_im_msgs` VALUES (250, '', 1608709644, 1, 2, 1, 'www', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 15:47:24', '2020-12-23 15:47:24', NULL, '');
INSERT INTO `w_im_msgs` VALUES (251, '', 1608709659, 1, 1, 1, '333333333333333333333333', '', 2, 5, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 15:47:39', '2020-12-24 09:48:11', NULL, '');
INSERT INTO `w_im_msgs` VALUES (252, '', 1608709673, 1, 1, 1, '气得我多无多群无多群无', '', 2, 5, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 15:47:53', '2020-12-24 09:48:11', NULL, '');
INSERT INTO `w_im_msgs` VALUES (253, '', 1608709687, 1, 2, 1, '222222222222222222222222222', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 15:48:07', '2020-12-23 15:48:07', NULL, '');
INSERT INTO `w_im_msgs` VALUES (254, '', 1608709694, 1, 2, 1, '和上帝了开发好厉害分开了如何', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 15:48:14', '2020-12-23 15:48:14', NULL, '');
INSERT INTO `w_im_msgs` VALUES (255, '', 1608709725, 1, 2, 1, '少时诵诗书所所所所所所所所', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 15:48:46', '2020-12-23 15:48:46', NULL, '');
INSERT INTO `w_im_msgs` VALUES (256, '', 1608709749, 1, 2, 1, '好的我好热无额', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 15:49:09', '2020-12-23 15:49:09', NULL, '');
INSERT INTO `w_im_msgs` VALUES (257, '', 1608709756, 1, 2, 1, '是顶顶顶顶顶的顶顶顶顶顶', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 15:49:16', '2020-12-23 15:49:16', NULL, '');
INSERT INTO `w_im_msgs` VALUES (258, '', 1608709776, 1, 2, 1, '问问荣誉和uiiureur', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 15:49:36', '2020-12-23 15:49:36', NULL, '');
INSERT INTO `w_im_msgs` VALUES (259, '', 1608709785, 1, 2, 1, '2222222222222222222222222222222222222222', '', 3, 2, '', '', '', 1, '王晓明', 'http://gas.micyi.com/pics/images/5daed5be97aee.jpg', '2020-12-23 15:49:45', '2020-12-23 15:49:45', NULL, '');
INSERT INTO `w_im_msgs` VALUES (260, '', 1608710770, 1, 1, 1, 'jfdelifhlkshfls', '', 2, 5, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 16:06:10', '2020-12-24 09:48:11', NULL, '');
INSERT INTO `w_im_msgs` VALUES (261, '', 1608710805, 1, 1, 1, 'wjhqjehgwqkegkwjgrjhewgrh', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 16:06:45', '2020-12-23 16:06:45', NULL, '');
INSERT INTO `w_im_msgs` VALUES (262, '', 1608710831, 1, 1, 1, '你好啊 的深刻领会拉黑的了华为', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 16:07:11', '2020-12-23 16:07:11', NULL, '');
INSERT INTO `w_im_msgs` VALUES (263, '', 1608710839, 1, 1, 1, '你换句话说打蜡后打开较好的', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 16:07:19', '2020-12-23 16:07:19', NULL, '');
INSERT INTO `w_im_msgs` VALUES (264, '', 1608710843, 1, 1, 1, '叫你哈克里斯我喝多了', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 16:07:23', '2020-12-23 16:07:23', NULL, '');
INSERT INTO `w_im_msgs` VALUES (265, '', 1608710850, 1, 1, 1, '我我我我我我', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 16:07:30', '2020-12-23 16:07:30', NULL, '');
INSERT INTO `w_im_msgs` VALUES (266, '', 1608710862, 1, 1, 1, '你好加快了所谓的哈未收到', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 16:07:42', '2020-12-23 16:07:42', NULL, '');
INSERT INTO `w_im_msgs` VALUES (267, '', 1608710873, 1, 1, 1, 'test', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 16:07:53', '2020-12-23 16:07:53', NULL, '');
INSERT INTO `w_im_msgs` VALUES (268, '', 1608710881, 1, 1, 1, '好哇看见饿的我开奖结果', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 16:08:02', '2020-12-23 16:08:02', NULL, '');
INSERT INTO `w_im_msgs` VALUES (269, '', 1608710931, 1, 1, 1, '少时诵诗书所所所所所', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 16:08:51', '2020-12-23 16:08:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (270, '', 1608714819, 1, 1, 1, '1', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 17:13:39', '2020-12-23 17:13:39', NULL, '');
INSERT INTO `w_im_msgs` VALUES (271, '', 1608714829, 1, 1, 1, '2', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 17:13:49', '2020-12-23 17:13:49', NULL, '');
INSERT INTO `w_im_msgs` VALUES (272, '', 1608719464, 1, 1, 1, '呜呜呜呜呜呜呜', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 18:31:04', '2020-12-23 18:31:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (273, '', 1608726689, 1, 1, 1, '少时诵诗书', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 20:31:30', '2020-12-23 20:31:30', NULL, '');
INSERT INTO `w_im_msgs` VALUES (274, '', 1608726771, 1, 1, 1, '啛啛喳喳错错错错错错', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-23 20:32:51', '2020-12-23 20:32:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (275, '', 1608726805, 1, 1, 1, '水水水水水水水水', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 20:33:25', '2020-12-23 20:33:25', NULL, '');
INSERT INTO `w_im_msgs` VALUES (276, '', 1608726809, 1, 1, 1, '嘻嘻嘻嘻嘻嘻嘻嘻', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-23 20:33:29', '2020-12-23 20:33:29', NULL, '');
INSERT INTO `w_im_msgs` VALUES (277, '233', 1608345653, 1, 2, 1, '234', '', 2, 2, '1.xls', '1', 'xls', 1, '233', '3.jpg', '2020-12-24 09:20:11', '2020-12-24 09:20:11', NULL, '');
INSERT INTO `w_im_msgs` VALUES (278, '', 1608774496, 1, 2, 1, '22222222', '', 5, 1, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 09:48:18', '2020-12-24 09:48:18', NULL, '');
INSERT INTO `w_im_msgs` VALUES (279, '', 1608774504, 1, 2, 1, '我是丽丽', '', 5, 1, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 09:48:26', '2020-12-24 09:48:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (280, '', 1608776256, 1, 1, 1, 'wwwwwwwwwwwwwwwwww', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-24 10:17:37', '2020-12-24 14:15:16', NULL, '');
INSERT INTO `w_im_msgs` VALUES (281, '1608776305422', 1608776305, 1, 1, 1, '2222222222222222222', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-24 10:18:26', '2020-12-24 14:15:16', NULL, '');
INSERT INTO `w_im_msgs` VALUES (282, '1608776316702', 1608776316, 1, 1, 1, '33333333333333333', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-24 10:18:38', '2020-12-24 14:15:16', NULL, '');
INSERT INTO `w_im_msgs` VALUES (283, '1608776371821', 1608776371, 1, 2, 1, '232222222lilili\n', '', 5, 1, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 10:19:33', '2020-12-24 10:19:33', NULL, '');
INSERT INTO `w_im_msgs` VALUES (284, '1608781536683', 1608781536, 1, 2, 1, '把科技感的热款角色那个的口味各', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-24 11:45:38', '2020-12-24 11:45:38', NULL, '');
INSERT INTO `w_im_msgs` VALUES (285, '1608790553107', 1608790553, 1, 2, 1, '娃娃吾问无为谓娃娃', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-24 14:15:54', '2020-12-24 14:15:54', NULL, '');
INSERT INTO `w_im_msgs` VALUES (286, '1608790562851', 1608790562, 1, 2, 1, '你傻了都好了开始了为', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:16:04', '2020-12-24 14:16:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (287, '1608790923273', 1608790923, 1, 2, 1, '我是李四', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:22:04', '2020-12-24 14:22:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (288, '1608791499976', 1608791499, 1, 2, 1, '我', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:31:41', '2020-12-24 14:31:41', NULL, '');
INSERT INTO `w_im_msgs` VALUES (289, '1608792076942', 1608792076, 1, 2, 1, '你好\n', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:41:18', '2020-12-24 14:41:18', NULL, '');
INSERT INTO `w_im_msgs` VALUES (290, '1608792129001', 1608792129, 1, 2, 1, '你会或或或', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:42:10', '2020-12-24 14:42:10', NULL, '');
INSERT INTO `w_im_msgs` VALUES (291, '1608792134591', 1608792134, 1, 2, 1, '爱上看见后付款的挥洒', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:42:16', '2020-12-24 14:42:16', NULL, '');
INSERT INTO `w_im_msgs` VALUES (292, '1608792141286', 1608792141, 1, 2, 1, '不能撒JKDB看见爱上部分的科技拉不动', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:42:22', '2020-12-24 14:42:22', NULL, '');
INSERT INTO `w_im_msgs` VALUES (293, '1608792235558', 1608792235, 1, 2, 1, '哇啥蝴蝶花', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:43:57', '2020-12-24 14:43:57', NULL, '');
INSERT INTO `w_im_msgs` VALUES (294, '1608792258158', 1608792258, 1, 2, 1, '嗯袜子\n', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:44:19', '2020-12-24 14:44:19', NULL, '');
INSERT INTO `w_im_msgs` VALUES (295, '1608792299265', 1608792299, 1, 2, 1, '哈不是我开具的口味', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:45:00', '2020-12-24 14:45:00', NULL, '');
INSERT INTO `w_im_msgs` VALUES (296, '1608792394551', 1608792394, 1, 2, 1, '的上海市\n', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:46:36', '2020-12-24 14:46:36', NULL, '');
INSERT INTO `w_im_msgs` VALUES (297, '1608792402190', 1608792402, 1, 2, 1, '嗯我知道了', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:46:43', '2020-12-24 14:46:43', NULL, '');
INSERT INTO `w_im_msgs` VALUES (298, '1608792506453', 1608792506, 1, 2, 1, '刚卡死我的刚打', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:48:27', '2020-12-24 14:48:27', NULL, '');
INSERT INTO `w_im_msgs` VALUES (299, '1608792512737', 1608792512, 1, 2, 1, '你傻了的挥洒的核武器', '', 5, 1, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:48:34', '2020-12-24 14:48:34', NULL, '');
INSERT INTO `w_im_msgs` VALUES (300, '1608792518017', 1608792518, 1, 2, 1, '啛啛喳喳错错错错错错错错', '', 5, 1, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:48:39', '2020-12-24 14:48:39', NULL, '');
INSERT INTO `w_im_msgs` VALUES (301, '1608792524016', 1608792524, 1, 1, 1, '嘻嘻嘻嘻嘻嘻嘻嘻寻寻寻寻寻寻寻寻', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:48:45', '2020-12-24 14:48:45', NULL, '');
INSERT INTO `w_im_msgs` VALUES (302, '1608792539064', 1608792539, 1, 1, 1, '收到货了撒嗯好的文化为', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:49:00', '2020-12-24 14:49:00', NULL, '');
INSERT INTO `w_im_msgs` VALUES (303, '1608792630062', 1608792630, 1, 2, 1, '接地发挥了文化科技非人为', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:50:31', '2020-12-24 14:50:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (304, '1608792643976', 1608792643, 1, 1, 1, '你啥都放假看论文个人防护甲骨文', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:50:45', '2020-12-24 14:50:45', NULL, '');
INSERT INTO `w_im_msgs` VALUES (305, '1608792672201', 1608792672, 1, 1, 1, '巴萨的进口方科技违法\n', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:51:13', '2020-12-24 14:51:13', NULL, '');
INSERT INTO `w_im_msgs` VALUES (306, '1608792679361', 1608792679, 1, 1, 1, '少时诵诗书所所所所', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:51:20', '2020-12-24 14:51:20', NULL, '');
INSERT INTO `w_im_msgs` VALUES (307, '1608792681136', 1608792681, 1, 1, 1, '啊', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:51:22', '2020-12-24 14:51:22', NULL, '');
INSERT INTO `w_im_msgs` VALUES (308, '1608792682999', 1608792682, 1, 1, 1, '啊啊啊啊啊', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:51:24', '2020-12-24 14:51:24', NULL, '');
INSERT INTO `w_im_msgs` VALUES (309, '1608792752191', 1608792752, 1, 1, 1, '撒旦教爱仕达\n', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:52:33', '2020-12-24 14:52:33', NULL, '');
INSERT INTO `w_im_msgs` VALUES (310, '1608792774641', 1608792774, 1, 1, 1, '凄凄切切群群', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:52:56', '2020-12-24 14:52:56', NULL, '');
INSERT INTO `w_im_msgs` VALUES (311, '1608792824024', 1608792824, 1, 1, 1, '2222222222222', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:53:45', '2020-12-24 14:53:45', NULL, '');
INSERT INTO `w_im_msgs` VALUES (312, '1608792911376', 1608792911, 1, 1, 1, '2222222222222222', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:55:12', '2020-12-24 14:55:12', NULL, '');
INSERT INTO `w_im_msgs` VALUES (313, '1608792971967', 1608792971, 1, 1, 1, '333333333333', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:56:13', '2020-12-24 14:56:13', NULL, '');
INSERT INTO `w_im_msgs` VALUES (314, '1608793043305', 1608793043, 1, 1, 1, '222 ', '', 2, 5, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-24 14:57:24', '2020-12-24 14:57:24', NULL, '');
INSERT INTO `w_im_msgs` VALUES (315, '1608793050902', 1608793050, 1, 1, 1, '333332', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:57:32', '2020-12-24 14:57:32', NULL, '');
INSERT INTO `w_im_msgs` VALUES (316, '1608793069135', 1608793069, 1, 2, 1, '吾问无为谓吾问无为谓无', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 14:57:50', '2020-12-24 14:57:50', NULL, '');
INSERT INTO `w_im_msgs` VALUES (317, '1608793189729', 1608793189, 1, 1, 1, '2222222', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 14:59:51', '2020-12-24 14:59:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (318, '1608793345513', 1608793345, 1, 1, 1, '1111111111', '', 2, 5, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-24 15:02:27', '2020-12-24 15:02:27', NULL, '');
INSERT INTO `w_im_msgs` VALUES (319, '1608794133745', 1608794133, 1, 1, 1, '哈宝石老舅丹化科技艾迪康', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 15:15:35', '2020-12-24 15:15:35', NULL, '');
INSERT INTO `w_im_msgs` VALUES (320, '1608794138566', 1608794138, 1, 1, 1, 'BWJKQGEKJQWGE ', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 15:15:40', '2020-12-24 15:15:40', NULL, '');
INSERT INTO `w_im_msgs` VALUES (321, '1608794148557', 1608794148, 1, 2, 1, 'NJSEDFKJEWRHKJVRBKJEWQR', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 15:15:50', '2020-12-24 15:15:50', NULL, '');
INSERT INTO `w_im_msgs` VALUES (322, '1608794472446', 1608794472, 1, 1, 1, '啊啊啊啊啊啊啊啊', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 15:21:13', '2020-12-24 15:21:13', NULL, '');
INSERT INTO `w_im_msgs` VALUES (323, '1608794475829', 1608794475, 1, 1, 1, '啊啊啊啊啊啊啊啊啊啊啊', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 15:21:17', '2020-12-24 15:21:17', NULL, '');
INSERT INTO `w_im_msgs` VALUES (324, '1608794631197', 1608794631, 1, 1, 1, '把加工费贷款金额为各位', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 15:23:52', '2020-12-24 15:23:52', NULL, '');
INSERT INTO `w_im_msgs` VALUES (325, '1608794637742', 1608794637, 1, 1, 1, 'VB基督教卡的空间恶化的好玩儿哈维尔和微软', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 15:23:59', '2020-12-24 15:23:59', NULL, '');
INSERT INTO `w_im_msgs` VALUES (326, '1608794645374', 1608794645, 1, 1, 1, '和我日后又热又认为', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 15:24:06', '2020-12-24 15:24:06', NULL, '');
INSERT INTO `w_im_msgs` VALUES (327, '1608794648524', 1608794648, 1, 1, 1, '少时诵诗书所所所所所所所所', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 15:24:10', '2020-12-24 15:24:10', NULL, '');
INSERT INTO `w_im_msgs` VALUES (328, '1608794658172', 1608794658, 1, 2, 1, '得好温柔和高考威尔考完', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 15:24:19', '2020-12-24 15:24:19', NULL, '');
INSERT INTO `w_im_msgs` VALUES (329, '1608794697804', 1608794697, 1, 1, 1, '吾问无为谓', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 15:24:59', '2020-12-24 15:24:59', NULL, '');
INSERT INTO `w_im_msgs` VALUES (330, '1608795935575', 1608795935, 1, 2, 1, '创建了群聊', '', 5, 8, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 15:45:37', '2020-12-24 15:45:37', NULL, '');
INSERT INTO `w_im_msgs` VALUES (331, '1608796432332', 1608796432, 1, 2, 1, '吾问无为谓吾问无为谓', '', 2, 7, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-24 15:53:53', '2020-12-24 15:53:53', NULL, '');
INSERT INTO `w_im_msgs` VALUES (332, '1608796592051', 1608796592, 1, 2, 1, '呜呜呜呜呜呜呜呜无无无无', '', 4, 5, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 15:56:33', '2020-12-24 15:56:33', NULL, '');
INSERT INTO `w_im_msgs` VALUES (333, '1608797551732', 1608797551, 1, 2, 1, '噶事大纲的价位高', '', 4, 6, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-24 16:12:33', '2020-12-24 16:12:33', NULL, '');
INSERT INTO `w_im_msgs` VALUES (334, '1608798296474', 1608798296, 1, 1, 1, '你好', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 16:24:58', '2020-12-24 16:24:58', NULL, '');
INSERT INTO `w_im_msgs` VALUES (335, '1608798551315', 1608798551, 1, 1, 1, '少时诵诗书', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 16:29:12', '2020-12-24 16:29:12', NULL, '');
INSERT INTO `w_im_msgs` VALUES (336, '1608798601210', 1608798601, 1, 1, 1, '2', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 16:30:02', '2020-12-24 16:30:02', NULL, '');
INSERT INTO `w_im_msgs` VALUES (337, '1608798686426', 1608798686, 1, 1, 1, '8888', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 16:31:27', '2020-12-24 16:31:27', NULL, '');
INSERT INTO `w_im_msgs` VALUES (338, '1608799566545', 1608799566, 1, 1, 1, '5555', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 16:46:08', '2020-12-24 16:46:08', NULL, '');
INSERT INTO `w_im_msgs` VALUES (339, '1608800504504', 1608800504, 1, 1, 1, '和我我了好看弯曲会 ', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 17:01:46', '2020-12-24 17:01:46', NULL, '');
INSERT INTO `w_im_msgs` VALUES (340, '1608800545650', 1608800545, 1, 2, 1, '3333333333333', '', 5, 9, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 17:02:27', '2020-12-24 17:02:27', NULL, '');
INSERT INTO `w_im_msgs` VALUES (341, '1608800983513', 1608800983, 1, 1, 1, '核武器和健康我和经开区我和科技趣闻', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 17:09:45', '2020-12-24 17:09:45', NULL, '');
INSERT INTO `w_im_msgs` VALUES (342, '1608801022199', 1608801022, 1, 1, 1, '毫不畏惧获得了健康请我喝了我去额', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 17:10:23', '2020-12-24 17:10:23', NULL, '');
INSERT INTO `w_im_msgs` VALUES (343, '1608801027529', 1608801027, 1, 1, 1, '少了点任何可恶了黑人问号任务和任务而科技为方便', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 17:10:29', '2020-12-24 17:10:29', NULL, '');
INSERT INTO `w_im_msgs` VALUES (344, '1608801035577', 1608801035, 1, 1, 1, '而是数据库文件我立刻让几位客人了沃尔\n', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 17:10:37', '2020-12-24 17:10:37', NULL, '');
INSERT INTO `w_im_msgs` VALUES (345, '1608801517297', 1608801517, 1, 2, 1, '我水水水水', '', 5, 9, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 17:18:38', '2020-12-24 17:18:38', NULL, '');
INSERT INTO `w_im_msgs` VALUES (346, '1608801522848', 1608801522, 1, 2, 1, '卡搜集乳房调配我忽然佛我维护揉捏我 ', '', 5, 9, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 17:18:44', '2020-12-24 17:18:44', NULL, '');
INSERT INTO `w_im_msgs` VALUES (347, '1608801529466', 1608801529, 1, 2, 1, '222222222', '', 5, 9, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 17:18:50', '2020-12-24 17:18:50', NULL, '');
INSERT INTO `w_im_msgs` VALUES (348, '1608801533886', 1608801533, 1, 1, 1, '少时诵诗书所所所所所所', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 17:18:55', '2020-12-24 17:18:55', NULL, '');
INSERT INTO `w_im_msgs` VALUES (349, '1608801536735', 1608801536, 1, 1, 1, '少时诵诗书所所', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 17:18:58', '2020-12-24 17:18:58', NULL, '');
INSERT INTO `w_im_msgs` VALUES (350, '1608801547791', 1608801547, 1, 1, 1, '女角色我我人hi问候日我我饿好热乎日哦而后IE我好热温柔我哦你让人\n', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 17:19:09', '2020-12-24 17:19:09', NULL, '');
INSERT INTO `w_im_msgs` VALUES (351, '1608801552807', 1608801552, 1, 1, 1, '吾问无为谓', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-24 17:19:14', '2020-12-24 17:19:14', NULL, '');
INSERT INTO `w_im_msgs` VALUES (352, '1608801584289', 1608801584, 1, 2, 1, '群聊有个10', '', 5, 10, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 17:19:45', '2020-12-24 17:19:45', NULL, '');
INSERT INTO `w_im_msgs` VALUES (353, '1608804224092', 1608804224, 1, 1, 1, '1', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 18:03:44', '2020-12-24 18:04:11', NULL, '');
INSERT INTO `w_im_msgs` VALUES (354, '1608804227334', 1608804227, 1, 1, 1, '2', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 18:03:47', '2020-12-24 18:04:11', NULL, '');
INSERT INTO `w_im_msgs` VALUES (355, '1608804228789', 1608804228, 1, 1, 1, '3', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 18:03:48', '2020-12-24 18:04:11', NULL, '');
INSERT INTO `w_im_msgs` VALUES (356, '1608804230276', 1608804230, 1, 1, 1, '4', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 18:03:50', '2020-12-24 18:04:11', NULL, '');
INSERT INTO `w_im_msgs` VALUES (357, '1608804231989', 1608804231, 1, 1, 1, '5', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 18:03:52', '2020-12-24 18:04:11', NULL, '');
INSERT INTO `w_im_msgs` VALUES (358, '1608804233581', 1608804233, 1, 1, 1, '6', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 18:03:53', '2020-12-24 18:04:12', NULL, '');
INSERT INTO `w_im_msgs` VALUES (359, '1608804457351', 1608804457, 1, 1, 1, '111', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 18:07:37', '2020-12-24 18:07:37', NULL, '');
INSERT INTO `w_im_msgs` VALUES (360, '1608804474788', 1608804474, 1, 1, 1, '1', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 18:07:54', '2020-12-24 18:07:54', NULL, '');
INSERT INTO `w_im_msgs` VALUES (361, '1608804477134', 1608804477, 1, 1, 1, '2', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 18:07:57', '2020-12-24 18:07:57', NULL, '');
INSERT INTO `w_im_msgs` VALUES (362, '1608805655518', 1608805655, 1, 1, 1, '2', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-24 18:27:35', '2020-12-24 18:27:35', NULL, '');
INSERT INTO `w_im_msgs` VALUES (363, '1608863306694', 1608863306, 1, 1, 1, '和武汉瑞丰问候日额外', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:28:27', '2020-12-25 10:28:27', NULL, '');
INSERT INTO `w_im_msgs` VALUES (364, '1608863334329', 1608863334, 1, 1, 1, '1111111111111111111', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:28:55', '2020-12-25 10:28:55', NULL, '');
INSERT INTO `w_im_msgs` VALUES (365, '1608863451830', 1608863451, 1, 1, 1, '22222222222222', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:30:52', '2020-12-25 10:30:52', NULL, '');
INSERT INTO `w_im_msgs` VALUES (366, '1608863468214', 1608863468, 1, 1, 1, '33333333333', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:31:09', '2020-12-25 10:31:09', NULL, '');
INSERT INTO `w_im_msgs` VALUES (367, '1608863479262', 1608863479, 1, 1, 1, '和无偶尔我和我', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:31:20', '2020-12-25 10:31:20', NULL, '');
INSERT INTO `w_im_msgs` VALUES (368, '1608863484453', 1608863484, 1, 1, 1, '您看的骊威的礼物', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:31:25', '2020-12-25 10:31:25', NULL, '');
INSERT INTO `w_im_msgs` VALUES (369, '1608863534510', 1608863534, 1, 1, 1, '2', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:32:15', '2020-12-25 10:32:15', NULL, '');
INSERT INTO `w_im_msgs` VALUES (370, '1608863539029', 1608863539, 1, 1, 1, '施蒂利克回复楼上的', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:32:20', '2020-12-25 10:32:20', NULL, '');
INSERT INTO `w_im_msgs` VALUES (371, '1608863546989', 1608863546, 1, 1, 1, '22222222222', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:32:27', '2020-12-25 10:32:27', NULL, '');
INSERT INTO `w_im_msgs` VALUES (372, '1608863652068', 1608863652, 1, 1, 1, '8888', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:34:13', '2020-12-25 10:34:13', NULL, '');
INSERT INTO `w_im_msgs` VALUES (373, '1608863984541', 1608863984, 1, 1, 1, '2', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:39:45', '2020-12-25 10:39:57', NULL, '');
INSERT INTO `w_im_msgs` VALUES (374, '1608863986102', 1608863986, 1, 1, 1, '3', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:39:47', '2020-12-25 10:39:57', NULL, '');
INSERT INTO `w_im_msgs` VALUES (375, '1608863987382', 1608863987, 1, 1, 1, '4', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:39:48', '2020-12-25 10:39:57', NULL, '');
INSERT INTO `w_im_msgs` VALUES (376, '1608863988639', 1608863988, 1, 1, 1, '4', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:39:49', '2020-12-25 10:39:57', NULL, '');
INSERT INTO `w_im_msgs` VALUES (377, '1608863991350', 1608863991, 1, 1, 1, '66u76', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:39:52', '2020-12-25 10:39:57', NULL, '');
INSERT INTO `w_im_msgs` VALUES (378, '1608864233462', 1608864233, 1, 1, 1, '2', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:43:54', '2020-12-25 10:44:03', NULL, '');
INSERT INTO `w_im_msgs` VALUES (379, '1608864234460', 1608864234, 1, 1, 1, '3', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:43:55', '2020-12-25 10:44:03', NULL, '');
INSERT INTO `w_im_msgs` VALUES (380, '1608864235774', 1608864235, 1, 1, 1, '4', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:43:56', '2020-12-25 10:44:03', NULL, '');
INSERT INTO `w_im_msgs` VALUES (381, '1608864237287', 1608864237, 1, 1, 1, '5', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:43:58', '2020-12-25 10:44:03', NULL, '');
INSERT INTO `w_im_msgs` VALUES (382, '1608864238334', 1608864238, 1, 1, 1, '6', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:43:59', '2020-12-25 10:44:03', NULL, '');
INSERT INTO `w_im_msgs` VALUES (383, '1608864696133', 1608864696, 1, 1, 1, '8', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:51:37', '2020-12-25 10:51:37', NULL, '');
INSERT INTO `w_im_msgs` VALUES (384, '1608864700693', 1608864700, 1, 1, 1, '999999', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:51:41', '2020-12-25 10:51:41', NULL, '');
INSERT INTO `w_im_msgs` VALUES (385, '1608864738338', 1608864738, 1, 1, 1, '222222222222222', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 10:52:19', '2020-12-25 10:52:19', NULL, '');
INSERT INTO `w_im_msgs` VALUES (386, '1608864753786', 1608864753, 1, 1, 1, '还是你的负荷和维护稳定', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 10:52:34', '2020-12-25 10:52:40', NULL, '');
INSERT INTO `w_im_msgs` VALUES (387, '1608864756586', 1608864756, 1, 1, 1, '生娃娃吾问无为谓', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 10:52:37', '2020-12-25 10:52:40', NULL, '');
INSERT INTO `w_im_msgs` VALUES (388, '1608865070579', 1608865070, 1, 1, 1, '2222222222', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:57:51', '2020-12-25 10:57:56', NULL, '');
INSERT INTO `w_im_msgs` VALUES (389, '1608865073036', 1608865073, 1, 1, 1, '23423434223', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:57:54', '2020-12-25 10:57:56', NULL, '');
INSERT INTO `w_im_msgs` VALUES (390, '1608865088482', 1608865088, 1, 1, 1, '少时诵诗书所所', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 10:58:09', '2020-12-25 10:58:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (391, '1608865091362', 1608865091, 1, 1, 1, '22222222222222', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 10:58:12', '2020-12-25 10:58:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (392, '1608865095716', 1608865095, 1, 1, 1, '浓厚的我空间规划看见额外国人', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:58:16', '2020-12-25 10:58:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (393, '1608865100868', 1608865100, 1, 1, 1, '十年后你的符合我立刻放寒假儿科', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:58:21', '2020-12-25 10:58:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (394, '1608865103243', 1608865103, 1, 1, 1, '1111111111111111111111', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 10:58:24', '2020-12-25 10:58:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (395, '1608865434521', 1608865434, 1, 1, 1, '1', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:03:55', '2020-12-25 11:03:55', NULL, '');
INSERT INTO `w_im_msgs` VALUES (396, '1608865437397', 1608865437, 1, 1, 1, '2', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 11:03:58', '2020-12-25 11:03:58', NULL, '');
INSERT INTO `w_im_msgs` VALUES (397, '1608865439931', 1608865439, 1, 1, 1, '333', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 11:04:00', '2020-12-25 11:04:00', NULL, '');
INSERT INTO `w_im_msgs` VALUES (398, '1608865441867', 1608865441, 1, 1, 1, '344444444444', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 11:04:02', '2020-12-25 11:04:02', NULL, '');
INSERT INTO `w_im_msgs` VALUES (399, '1608865598681', 1608865598, 1, 1, 1, '22222222222222', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:06:39', '2020-12-25 11:06:39', NULL, '');
INSERT INTO `w_im_msgs` VALUES (400, '1608865603899', 1608865603, 1, 1, 1, '2222222222222222222222', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 11:06:44', '2020-12-25 11:06:44', NULL, '');
INSERT INTO `w_im_msgs` VALUES (401, '1608865613234', 1608865613, 1, 1, 1, '委屈委屈委屈', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:06:54', '2020-12-25 11:06:54', NULL, '');
INSERT INTO `w_im_msgs` VALUES (402, '1608865776235', 1608865776, 1, 2, 1, '凄凄切切群群', '', 4, 9, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 11:09:37', '2020-12-25 11:09:37', NULL, '');
INSERT INTO `w_im_msgs` VALUES (403, '1608865837258', 1608865837, 1, 1, 1, '吾问无为谓吾问无为谓无', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:10:38', '2020-12-25 11:10:38', NULL, '');
INSERT INTO `w_im_msgs` VALUES (404, '1608865880364', 1608865880, 1, 2, 1, '8777777777', '', 4, 9, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 11:11:21', '2020-12-25 11:11:21', NULL, '');
INSERT INTO `w_im_msgs` VALUES (405, '1608865886418', 1608865886, 1, 2, 1, '99999999999999999999999999999', '', 4, 9, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 11:11:27', '2020-12-25 11:11:27', NULL, '');
INSERT INTO `w_im_msgs` VALUES (406, '1608865894506', 1608865894, 1, 1, 1, '788888888888888888', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:11:35', '2020-12-25 11:11:35', NULL, '');
INSERT INTO `w_im_msgs` VALUES (407, '1608865902314', 1608865902, 1, 1, 1, '999999999999', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:11:43', '2020-12-25 11:11:43', NULL, '');
INSERT INTO `w_im_msgs` VALUES (408, '1608867373113', 1608867373, 1, 1, 1, '呜呜呜呜呜呜呜呜', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:36:14', '2020-12-25 11:36:14', NULL, '');
INSERT INTO `w_im_msgs` VALUES (409, '1608867378953', 1608867378, 1, 1, 1, '少时诵诗书所所所所所所所所所所所所所所所所', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:36:19', '2020-12-25 11:36:19', NULL, '');
INSERT INTO `w_im_msgs` VALUES (410, '1608867549753', 1608867549, 1, 2, 1, '999999999999999999999', '', 4, 9, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 11:39:10', '2020-12-25 11:39:10', NULL, '');
INSERT INTO `w_im_msgs` VALUES (411, '1608867557954', 1608867557, 1, 1, 1, '99额额蹦蹦蹦', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 11:39:18', '2020-12-25 11:39:18', NULL, '');
INSERT INTO `w_im_msgs` VALUES (412, '1608868225887', 1608868225, 1, 1, 1, '2222222222222', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:50:26', '2020-12-25 11:50:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (413, '1608868251415', 1608868251, 1, 1, 1, '222222222222', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:50:52', '2020-12-25 11:50:52', NULL, '');
INSERT INTO `w_im_msgs` VALUES (414, '1608868268127', 1608868268, 1, 1, 1, '33333333', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:51:09', '2020-12-25 11:51:09', NULL, '');
INSERT INTO `w_im_msgs` VALUES (415, '1608868275583', 1608868275, 1, 1, 1, '3333333333333', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:51:16', '2020-12-25 11:51:16', NULL, '');
INSERT INTO `w_im_msgs` VALUES (416, '1608868362976', 1608868362, 1, 1, 1, '我', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:52:43', '2020-12-25 11:52:43', NULL, '');
INSERT INTO `w_im_msgs` VALUES (417, '1608868368473', 1608868368, 1, 1, 1, '是', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:52:49', '2020-12-25 11:52:49', NULL, '');
INSERT INTO `w_im_msgs` VALUES (418, '1608868372744', 1608868372, 1, 1, 1, '2222222', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 11:52:53', '2020-12-25 11:52:53', NULL, '');
INSERT INTO `w_im_msgs` VALUES (419, '1608878497762', 1608878497, 1, 1, 1, '好几十大客户看见sea\n', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 14:41:38', '2020-12-25 14:41:38', NULL, '');
INSERT INTO `w_im_msgs` VALUES (420, '1608878500475', 1608878500, 1, 1, 1, '我我我我我我', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 14:41:41', '2020-12-25 14:41:41', NULL, '');
INSERT INTO `w_im_msgs` VALUES (421, '1608878502914', 1608878502, 1, 1, 1, '33333333333333', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 14:41:43', '2020-12-25 14:41:43', NULL, '');
INSERT INTO `w_im_msgs` VALUES (422, '1608878506498', 1608878506, 1, 1, 1, '5凝聚力客户福建省电话费', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 14:41:47', '2020-12-25 14:41:47', NULL, '');
INSERT INTO `w_im_msgs` VALUES (423, '1608878514871', 1608878514, 1, 2, 1, '你回家撒谎的空间撒号地块', '', 5, 10, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 14:41:55', '2020-12-25 14:41:55', NULL, '');
INSERT INTO `w_im_msgs` VALUES (424, '1608878517913', 1608878517, 1, 2, 1, '南华山离的很近撒离开的卢卡斯', '', 5, 10, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 14:41:58', '2020-12-25 14:41:58', NULL, '');
INSERT INTO `w_im_msgs` VALUES (425, '1608879160738', 1608879160, 1, 1, 1, '第三位和空间的哈我看见收到货', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 14:52:41', '2020-12-25 14:52:41', NULL, '');
INSERT INTO `w_im_msgs` VALUES (426, '1608879166480', 1608879166, 1, 1, 1, '一二三四十万', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 14:52:47', '2020-12-25 14:52:47', NULL, '');
INSERT INTO `w_im_msgs` VALUES (427, '1608890577272', 1608890577, 1, 2, 1, '很嗯嗯讷讷呢', '', 5, 1, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 18:02:58', '2020-12-25 18:02:58', NULL, '{\"gName\":\"聊一会儿吧\"}');
INSERT INTO `w_im_msgs` VALUES (428, '1608890583694', 1608890583, 1, 2, 1, '和的撒间海底捞卡号的热文化人单位', '', 5, 1, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 18:03:04', '2020-12-25 18:03:04', NULL, '{\"gName\":\"聊一会儿吧\"}');
INSERT INTO `w_im_msgs` VALUES (429, '1608890603680', 1608890603, 1, 1, 1, '额外', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 18:03:24', '2020-12-25 18:03:24', NULL, '');
INSERT INTO `w_im_msgs` VALUES (430, '1608890622057', 1608890622, 1, 2, 1, '呜呜呜呜呜呜呜', '', 4, 9, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 18:03:43', '2020-12-25 18:03:43', NULL, '{\"gName\":\"聊天群9\"}');
INSERT INTO `w_im_msgs` VALUES (431, '1608890627527', 1608890627, 1, 2, 1, '我去', '', 4, 9, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 18:03:48', '2020-12-25 18:03:48', NULL, '{\"gName\":\"聊天群9\"}');
INSERT INTO `w_im_msgs` VALUES (432, '1608890635583', 1608890635, 1, 2, 1, '其味无穷二无群群', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 18:03:56', '2020-12-25 18:03:56', NULL, '{\"gName\":\"聊天群2\"}');
INSERT INTO `w_im_msgs` VALUES (433, '1608898973798', 1608898973, 1, 1, 1, '1', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 20:22:53', '2020-12-25 20:22:53', NULL, '');
INSERT INTO `w_im_msgs` VALUES (434, '1608898975149', 1608898975, 1, 1, 1, '2', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 20:22:55', '2020-12-25 20:22:55', NULL, '');
INSERT INTO `w_im_msgs` VALUES (435, '1608898976413', 1608898976, 1, 1, 1, '34', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 20:22:56', '2020-12-25 20:22:56', NULL, '');
INSERT INTO `w_im_msgs` VALUES (436, '1608898979365', 1608898979, 1, 1, 1, '5', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 20:22:59', '2020-12-25 20:22:59', NULL, '');
INSERT INTO `w_im_msgs` VALUES (437, '1608898980813', 1608898980, 1, 1, 1, '6', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 20:23:00', '2020-12-25 20:23:00', NULL, '');
INSERT INTO `w_im_msgs` VALUES (438, '1608898982125', 1608898982, 1, 1, 1, '7', '', 5, 2, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-25 20:23:02', '2020-12-25 20:23:02', NULL, '');
INSERT INTO `w_im_msgs` VALUES (439, '1608899006175', 1608899006, 1, 2, 1, '顶顶顶顶顶顶顶顶顶', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 20:23:26', '2020-12-25 20:23:26', NULL, '{\"gName\":\"聊天群2\"}');
INSERT INTO `w_im_msgs` VALUES (440, '1608899009823', 1608899009, 1, 2, 1, '阿事实上事实上的', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-25 20:23:29', '2020-12-25 20:23:29', NULL, '{\"gName\":\"聊天群2\"}');
INSERT INTO `w_im_msgs` VALUES (441, '1608949013642', 1608949013, 1, 2, 1, '规划上看见打个卡十几个贷款', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-26 10:16:54', '2020-12-26 10:16:54', NULL, '{\"gName\":\"聊天群2\"}');
INSERT INTO `w_im_msgs` VALUES (442, '1608949163643', 1608949163, 1, 2, 1, 'Do you want to know what happens every day?', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-26 10:19:24', '2020-12-26 10:19:24', NULL, '{\"gName\":\"聊天群2\"}');
INSERT INTO `w_im_msgs` VALUES (443, '1608949651720', 1608949651, 1, 2, 1, '撒旦教哈哈未收到了华为', '', 6, 9, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 10:27:32', '2020-12-26 10:27:32', NULL, '{\"gName\":\"聊天群9\"}');
INSERT INTO `w_im_msgs` VALUES (444, '1608949655534', 1608949655, 1, 2, 1, '阿萨德靠的近阿萨德', '', 6, 9, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 10:27:36', '2020-12-26 10:27:36', NULL, '{\"gName\":\"聊天群9\"}');
INSERT INTO `w_im_msgs` VALUES (445, '1608949658023', 1608949658, 1, 2, 1, '撒啊啊啊啊啊啊啊啊', '', 6, 9, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 10:27:38', '2020-12-26 10:27:38', NULL, '{\"gName\":\"聊天群9\"}');
INSERT INTO `w_im_msgs` VALUES (446, '1608949660599', 1608949660, 1, 2, 1, 'ass所所所所所所所所', '', 6, 9, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 10:27:41', '2020-12-26 10:27:41', NULL, '{\"gName\":\"聊天群9\"}');
INSERT INTO `w_im_msgs` VALUES (447, '1608949671696', 1608949671, 1, 1, 1, '哒哒哒哒哒哒', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 10:27:52', '2020-12-26 10:27:52', NULL, '');
INSERT INTO `w_im_msgs` VALUES (448, '1608949674127', 1608949674, 1, 1, 1, '顶顶顶顶顶顶顶顶顶顶大大大', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 10:27:55', '2020-12-26 10:27:55', NULL, '');
INSERT INTO `w_im_msgs` VALUES (449, '1608949676982', 1608949676, 1, 1, 1, '哒哒哒哒哒哒多多多多多多多多多多多多多多多多多多多', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 10:27:57', '2020-12-26 10:27:57', NULL, '');
INSERT INTO `w_im_msgs` VALUES (450, '1608949682575', 1608949682, 1, 1, 1, '88888888888888888888888888888888888888888888888', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 10:28:03', '2020-12-26 10:28:03', NULL, '');
INSERT INTO `w_im_msgs` VALUES (451, '1608950933069', 1608950933, 1, 1, 1, '我', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 10:48:53', '2020-12-26 10:48:53', NULL, '');
INSERT INTO `w_im_msgs` VALUES (452, '1608950988367', 1608950988, 1, 1, 1, '为额外', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-26 10:49:49', '2020-12-26 10:49:49', NULL, '');
INSERT INTO `w_im_msgs` VALUES (453, '1608951022701', 1608951022, 1, 1, 1, '我', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 10:50:23', '2020-12-26 10:50:23', NULL, '');
INSERT INTO `w_im_msgs` VALUES (454, '1608951029880', 1608951029, 1, 1, 1, '三生三世', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-26 10:50:30', '2020-12-26 10:50:30', NULL, '');
INSERT INTO `w_im_msgs` VALUES (455, '1608951235181', 1608951235, 1, 1, 1, '你还是', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 10:53:56', '2020-12-26 10:53:56', NULL, '');
INSERT INTO `w_im_msgs` VALUES (456, '1608951239893', 1608951239, 1, 1, 1, '饿呢千家万户荔湾区', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 10:54:00', '2020-12-26 10:54:00', NULL, '');
INSERT INTO `w_im_msgs` VALUES (457, '1608951350158', 1608951350, 1, 1, 1, '大多数卡较好的卡萨', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 10:55:51', '2020-12-26 10:55:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (458, '1608951684870', 1608951684, 1, 2, 1, '呜呜呜呜呜呜呜', '', 4, 6, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-26 11:01:25', '2020-12-26 11:01:25', NULL, '{\"gName\":\"聊天群6\"}');
INSERT INTO `w_im_msgs` VALUES (459, '1608951688269', 1608951688, 1, 2, 1, '少时诵诗书所所所所所所所所所', '', 4, 6, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-26 11:01:29', '2020-12-26 11:01:29', NULL, '{\"gName\":\"聊天群6\"}');
INSERT INTO `w_im_msgs` VALUES (460, '1608951691205', 1608951691, 1, 2, 1, '少时诵诗书所所所所', '', 4, 6, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-26 11:01:32', '2020-12-26 11:01:32', NULL, '{\"gName\":\"聊天群6\"}');
INSERT INTO `w_im_msgs` VALUES (461, '1608952275206', 1608952275, 1, 2, 1, '少时诵诗书所所所所', '', 4, 6, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-26 11:11:16', '2020-12-26 11:11:16', NULL, '{\"gName\":\"聊天群6\"}');
INSERT INTO `w_im_msgs` VALUES (462, '1608952277669', 1608952277, 1, 2, 1, '少时诵诗书所所所所所所所', '', 4, 6, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-26 11:11:18', '2020-12-26 11:11:18', NULL, '{\"gName\":\"聊天群6\"}');
INSERT INTO `w_im_msgs` VALUES (463, '1608952284854', 1608952284, 1, 1, 1, '呜呜呜呜呜呜呜呜无无无无', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 11:11:25', '2020-12-26 11:11:25', NULL, '');
INSERT INTO `w_im_msgs` VALUES (464, '1608952287982', 1608952287, 1, 1, 1, '吾问无为谓吾问无为谓无', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 11:11:28', '2020-12-26 11:11:28', NULL, '');
INSERT INTO `w_im_msgs` VALUES (465, '1608952317342', 1608952317, 1, 2, 1, '2222', '', 4, 6, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-26 11:11:58', '2020-12-26 11:11:58', NULL, '{\"gName\":\"聊天群6\"}');
INSERT INTO `w_im_msgs` VALUES (466, '1608952322301', 1608952322, 1, 1, 1, '吾问无为谓', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 11:12:03', '2020-12-26 11:12:03', NULL, '');
INSERT INTO `w_im_msgs` VALUES (467, '1608952341902', 1608952341, 1, 2, 1, '我', '', 4, 6, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-26 11:12:22', '2020-12-26 11:12:22', NULL, '{\"gName\":\"聊天群6\"}');
INSERT INTO `w_im_msgs` VALUES (468, '1608952345949', 1608952345, 1, 1, 1, '吾问无为谓', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-26 11:12:26', '2020-12-26 11:12:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (469, '1608956534066', 1608956534, 1, 1, 1, '', '', 2, 4, 'http://gas.micyi.com/pics/files/5f28d7047458d_1339.jpg', '5f28d7047458d_1339.jpg', 'jpg', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-26 12:22:14', '2020-12-26 12:22:14', NULL, '');
INSERT INTO `w_im_msgs` VALUES (470, '1608957006091', 1608957006, 1, 1, 1, '', '', 2, 4, 'http://gas.micyi.com/pics/files/3_5189.docx', '3_5189.docx', 'docx', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-26 12:30:07', '2020-12-26 12:30:07', NULL, '');
INSERT INTO `w_im_msgs` VALUES (471, '1608958321162', 1608958321, 1, 1, 1, '', '', 2, 4, 'http://gas.micyi.com/pics/files/msgfile_8318.png', 'msgfile_8318.png', 'png', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-26 12:52:02', '2020-12-26 12:52:02', NULL, '');
INSERT INTO `w_im_msgs` VALUES (472, '1608962117073', 1608962117, 1, 1, 1, '', '', 2, 4, 'http://gas.micyi.com/pics/files/微信图片_20200820145232_5221.jpg', '微信图片_20200820145232_5221.jpg', 'jpg', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-26 13:55:18', '2020-12-26 13:55:18', NULL, '');
INSERT INTO `w_im_msgs` VALUES (473, '1609123622051', 1609123622, 1, 1, 3, '', '', 4, 2, 'http://gas.micyi.com/pics/files/32431ba_7273.jpg', '32431ba_7273.jpg', 'jpg', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 10:47:02', '2020-12-28 10:47:02', NULL, '');
INSERT INTO `w_im_msgs` VALUES (474, '1609123901121', 1609123901, 1, 1, 1, 'wel', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 10:51:41', '2020-12-28 10:51:41', NULL, '');
INSERT INTO `w_im_msgs` VALUES (475, '1609123915482', 1609123915, 1, 1, 1, 'wel', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 10:51:55', '2020-12-28 10:51:55', NULL, '');
INSERT INTO `w_im_msgs` VALUES (476, '1609123920098', 1609123920, 1, 1, 1, '我饿啦啦啦', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 10:52:00', '2020-12-28 10:52:00', NULL, '');
INSERT INTO `w_im_msgs` VALUES (477, '1609123969747', 1609123969, 1, 1, 1, '1', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 10:52:49', '2020-12-28 10:52:49', NULL, '');
INSERT INTO `w_im_msgs` VALUES (478, '1609123971882', 1609123971, 1, 1, 1, '2', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 10:52:51', '2020-12-28 10:52:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (479, '1609123978010', 1609123978, 1, 1, 3, '', '', 4, 2, 'http://gas.micyi.com/pics/files/5f28d7047458d_6200.jpg', '5f28d7047458d_6200.jpg', 'jpg', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 10:52:58', '2020-12-28 10:52:58', NULL, '');
INSERT INTO `w_im_msgs` VALUES (480, '1609124300385', 1609124300, 1, 1, 1, '2', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 10:58:20', '2020-12-28 10:58:20', NULL, '');
INSERT INTO `w_im_msgs` VALUES (481, '1609124303002', 1609124303, 1, 1, 1, '吾问无为谓吾问无为谓无', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 10:58:23', '2020-12-28 10:58:23', NULL, '');
INSERT INTO `w_im_msgs` VALUES (482, '1609124591137', 1609124591, 1, 1, 1, '嗯', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 11:03:11', '2020-12-28 11:03:11', NULL, '');
INSERT INTO `w_im_msgs` VALUES (483, '1609124593250', 1609124593, 1, 1, 1, '1', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 11:03:13', '2020-12-28 11:03:13', NULL, '');
INSERT INTO `w_im_msgs` VALUES (484, '1609124683370', 1609124683, 1, 1, 3, '', '', 4, 2, 'http://gas.micyi.com/pics/files/5e96ac9845f19_1488.png', '5e96ac9845f19_1488.png', 'png', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 11:04:43', '2020-12-28 11:04:43', NULL, '');
INSERT INTO `w_im_msgs` VALUES (485, '1609124846769', 1609124846, 1, 1, 1, '2', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 11:07:26', '2020-12-28 11:07:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (486, '1609124850497', 1609124850, 1, 1, 1, '333333333333333', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 11:07:30', '2020-12-28 11:07:30', NULL, '');
INSERT INTO `w_im_msgs` VALUES (487, '1609124853720', 1609124853, 1, 1, 1, '少时诵诗书所所所所所', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 11:07:33', '2020-12-28 11:07:33', NULL, '');
INSERT INTO `w_im_msgs` VALUES (488, '1609124942370', 1609124942, 1, 1, 1, '1', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 11:09:02', '2020-12-28 11:09:02', NULL, '');
INSERT INTO `w_im_msgs` VALUES (489, '1609124946906', 1609124946, 1, 1, 1, '222222222', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 11:09:06', '2020-12-28 11:09:06', NULL, '');
INSERT INTO `w_im_msgs` VALUES (490, '1609124953666', 1609124953, 1, 1, 3, '', '', 4, 2, 'http://gas.micyi.com/pics/files/5ef05252aade5_7286.jpg', '5ef05252aade5_7286.jpg', 'jpg', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 11:09:13', '2020-12-28 11:09:13', NULL, '');
INSERT INTO `w_im_msgs` VALUES (491, '1609125011986', 1609125011, 1, 1, 1, '3', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 11:10:12', '2020-12-28 11:10:12', NULL, '');
INSERT INTO `w_im_msgs` VALUES (492, '1609125092666', 1609125092, 1, 1, 1, '我', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 11:11:32', '2020-12-28 11:11:32', NULL, '');
INSERT INTO `w_im_msgs` VALUES (493, '1609125097914', 1609125097, 1, 1, 3, '', '', 4, 2, 'http://gas.micyi.com/pics/files/5f2d1bef51930 (1)_3559.png', '5f2d1bef51930 (1)_3559.png', 'png', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 11:11:37', '2020-12-28 11:11:37', NULL, '');
INSERT INTO `w_im_msgs` VALUES (494, '1609125247433', 1609125247, 1, 1, 1, '我', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 11:14:07', '2020-12-28 11:14:07', NULL, '');
INSERT INTO `w_im_msgs` VALUES (495, '1609125522586', 1609125522, 1, 1, 4, '', '', 2, 4, 'http://gas.micyi.com/pics/files/配网流程切图_slices_2483.zip', '配网流程切图_slices_2483.zip', 'zip', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 11:18:42', '2020-12-28 11:18:42', NULL, '');
INSERT INTO `w_im_msgs` VALUES (496, '1609125814962', 1609125814, 1, 1, 3, '', '', 2, 4, 'http://gas.micyi.com/pics/files/5dafce8d855b4_4464.png', '5dafce8d855b4_4464.png', 'png', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 11:23:34', '2020-12-28 11:23:34', NULL, '');
INSERT INTO `w_im_msgs` VALUES (497, '1609125828448', 1609125828, 1, 1, 4, '', '', 2, 4, 'http://gas.micyi.com/pics/files/大兴智慧市政项目ui规范_2240.pdf', '大兴智慧市政项目ui规范_2240.pdf', 'pdf', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 11:23:48', '2020-12-28 11:23:48', NULL, '');
INSERT INTO `w_im_msgs` VALUES (498, '1609125914433', 1609125914, 1, 1, 3, '', '', 2, 4, 'http://gas.micyi.com/pics/files/5f22bf89b0f06_1625.jpg', '5f22bf89b0f06_1625.jpg', 'jpg', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 11:25:14', '2020-12-28 11:25:14', NULL, '');
INSERT INTO `w_im_msgs` VALUES (499, '1609135567737', 1609135567, 1, 1, 1, '我\n', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 14:06:07', '2020-12-28 14:06:07', NULL, '');
INSERT INTO `w_im_msgs` VALUES (500, '1609135627089', 1609135627, 1, 1, 1, '你好', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 14:07:07', '2020-12-28 14:07:07', NULL, '');
INSERT INTO `w_im_msgs` VALUES (501, '1609136072169', 1609136072, 1, 2, 1, '嗯', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 14:14:32', '2020-12-28 14:14:32', NULL, '{\"gName\":\"聊天群2\"}');
INSERT INTO `w_im_msgs` VALUES (502, '1609136141936', 1609136141, 1, 2, 1, '额', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-28 14:15:41', '2020-12-28 14:15:41', NULL, '{\"gName\":\"聊天群2\"}');
INSERT INTO `w_im_msgs` VALUES (503, '1609136215082', 1609136215, 1, 1, 1, '嗯', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-28 14:16:55', '2020-12-28 14:16:55', NULL, '');
INSERT INTO `w_im_msgs` VALUES (504, '1609136219098', 1609136219, 1, 1, 1, '我我我我我我', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-28 14:16:59', '2020-12-28 14:16:59', NULL, '');
INSERT INTO `w_im_msgs` VALUES (505, '1609136225088', 1609136225, 1, 1, 1, '你好', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-28 14:17:05', '2020-12-28 14:17:05', NULL, '');
INSERT INTO `w_im_msgs` VALUES (506, '1609136273441', 1609136273, 1, 2, 1, 'zhansan jinq qun\n', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 14:17:53', '2020-12-28 14:17:53', NULL, '{\"gName\":\"聊天群2\"}');
INSERT INTO `w_im_msgs` VALUES (507, '1609136760753', 1609136760, 1, 2, 1, 'en ', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 14:26:00', '2020-12-28 14:26:00', NULL, '{\"gName\":\"聊天群2\"}');
INSERT INTO `w_im_msgs` VALUES (508, '1609136766273', 1609136766, 1, 2, 3, '', '', 2, 2, 'http://gas.micyi.com/pics/files/5f28d7047458d_3614.jpg', '5f28d7047458d_3614.jpg', 'jpg', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 14:26:06', '2020-12-28 14:26:06', NULL, '{\"gName\":\"聊天群2\"}');
INSERT INTO `w_im_msgs` VALUES (509, '1609136771538', 1609136771, 1, 2, 1, 'w ', '', 2, 2, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 14:26:11', '2020-12-28 14:26:11', NULL, '{\"gName\":\"聊天群2\"}');
INSERT INTO `w_im_msgs` VALUES (510, '1609136819862', 1609136819, 1, 2, 1, '问了', '', 5, 9, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-28 14:26:59', '2020-12-28 14:26:59', NULL, '{\"gName\":\"聊天群9\"}');
INSERT INTO `w_im_msgs` VALUES (511, '1609136837439', 1609136837, 1, 1, 1, '你好呀', '', 5, 6, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-28 14:27:17', '2020-12-28 14:27:17', NULL, '');
INSERT INTO `w_im_msgs` VALUES (512, '1609136840973', 1609136840, 1, 1, 1, '我是', '', 5, 6, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-28 14:27:21', '2020-12-28 14:27:21', NULL, '');
INSERT INTO `w_im_msgs` VALUES (513, '1609136844735', 1609136844, 1, 1, 1, '嗯', '', 5, 6, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-28 14:27:24', '2020-12-28 14:27:24', NULL, '');
INSERT INTO `w_im_msgs` VALUES (514, '1609136855717', 1609136855, 1, 2, 1, '额', '', 5, 1, '', '', '', 1, '赵丽丽', 'http://gas.micyi.com/pics/images/微信图片_20200827103038.jpg', '2020-12-28 14:27:35', '2020-12-28 14:27:35', NULL, '{\"gName\":\"聊一会儿吧\"}');
INSERT INTO `w_im_msgs` VALUES (515, '1609137119840', 1609137119, 1, 1, 4, '', '', 6, 2, 'http://gas.micyi.com/pics/files/配网流程切图_slices_8317.zip', '配网流程切图_slices_8317.zip', 'zip', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-28 14:31:59', '2020-12-28 14:31:59', NULL, '');
INSERT INTO `w_im_msgs` VALUES (516, '1609137128343', 1609137128, 1, 1, 4, '', '', 6, 2, 'http://gas.micyi.com/pics/files/大兴智慧市政项目ui规范_5064.pdf', '大兴智慧市政项目ui规范_5064.pdf', 'pdf', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-28 14:32:08', '2020-12-28 14:32:08', NULL, '');
INSERT INTO `w_im_msgs` VALUES (517, '1609138199367', 1609138199, 1, 1, 1, 'eeeeeeeee', '', 2, 6, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 14:49:59', '2020-12-28 14:49:59', NULL, '');
INSERT INTO `w_im_msgs` VALUES (518, '1609145286760', 1609145286, 1, 1, 1, '😪', '', 2, 6, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 16:48:06', '2020-12-28 16:48:06', NULL, '');
INSERT INTO `w_im_msgs` VALUES (519, '1609145303730', 1609145303, 1, 1, 1, '😷nihaoaaaaa', '', 2, 6, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 16:48:23', '2020-12-28 16:48:23', NULL, '');
INSERT INTO `w_im_msgs` VALUES (520, '1609145546610', 1609145546, 1, 1, 1, '😅hhhhhh', '', 2, 6, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 16:52:26', '2020-12-28 16:52:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (521, '1609145553856', 1609145553, 1, 1, 1, '😫😤😨😥😪😓😵😲', '', 2, 6, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 16:52:33', '2020-12-28 16:52:33', NULL, '');
INSERT INTO `w_im_msgs` VALUES (522, '1609145575528', 1609145575, 1, 1, 1, '😥', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-28 16:52:55', '2020-12-28 16:52:55', NULL, '');
INSERT INTO `w_im_msgs` VALUES (523, '1609145886322', 1609145886, 1, 1, 1, '嗯饿呢', '', 2, 6, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 16:58:06', '2020-12-28 16:58:06', NULL, '');
INSERT INTO `w_im_msgs` VALUES (524, '1609145897689', 1609145897, 1, 1, 1, '嗯饿呢', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-28 16:58:17', '2020-12-28 16:58:17', NULL, '');
INSERT INTO `w_im_msgs` VALUES (525, '1609145953999', 1609145953, 1, 1, 1, '喜欢嗯呢呢你😎', '', 2, 6, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 16:59:14', '2020-12-28 16:59:14', NULL, '');
INSERT INTO `w_im_msgs` VALUES (526, '1609145984424', 1609145984, 1, 1, 1, '😪🤙😉😷', '', 2, 6, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 16:59:44', '2020-12-28 16:59:44', NULL, '');
INSERT INTO `w_im_msgs` VALUES (527, '1609146036936', 1609146036, 1, 1, 1, '🙄😥😀🕐', '', 2, 6, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 17:00:37', '2020-12-28 17:00:37', NULL, '');
INSERT INTO `w_im_msgs` VALUES (528, '1609146062303', 1609146062, 1, 1, 1, '🤕', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-28 17:01:02', '2020-12-28 17:01:02', NULL, '');
INSERT INTO `w_im_msgs` VALUES (529, '1609146064807', 1609146064, 1, 1, 1, '😵', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-28 17:01:04', '2020-12-28 17:01:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (530, '1609146066880', 1609146066, 1, 1, 1, '😕', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-28 17:01:06', '2020-12-28 17:01:06', NULL, '');
INSERT INTO `w_im_msgs` VALUES (531, '1609146069288', 1609146069, 1, 1, 1, '😉', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-28 17:01:09', '2020-12-28 17:01:09', NULL, '');
INSERT INTO `w_im_msgs` VALUES (532, '1609148213104', 1609148213, 1, 1, 1, '88888888888888888888', '', 2, 6, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 17:36:53', '2020-12-28 17:36:53', NULL, '');
INSERT INTO `w_im_msgs` VALUES (533, '1609150271293', 1609150271, 1, 1, 1, '😨', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-28 18:11:11', '2020-12-29 09:52:41', NULL, '');
INSERT INTO `w_im_msgs` VALUES (534, '1609151749925', 1609151749, 1, 1, 1, '🏈', '', 6, 2, '', '', '', 1, '张三', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-28 18:35:50', '2020-12-28 18:35:50', NULL, '');
INSERT INTO `w_im_msgs` VALUES (535, '1609228539715', 1609228539, 1, 1, 1, '222222222222222', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-29 15:55:40', '2020-12-29 15:55:40', NULL, '');
INSERT INTO `w_im_msgs` VALUES (536, '1609228547283', 1609228547, 1, 1, 1, '😍', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-29 15:55:48', '2020-12-29 15:55:48', NULL, '');
INSERT INTO `w_im_msgs` VALUES (537, '1609228563803', 1609228563, 1, 1, 3, '', '', 4, 2, 'http://gas.micyi.com/pics/files/5f28d7047458d_5363.jpg', '5f28d7047458d_5363.jpg', 'jpg', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2020-12-29 15:56:04', '2020-12-29 15:56:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (538, '1609228768890', 1609228768, 1, 1, 1, '😥', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-29 15:59:29', '2020-12-29 15:59:29', NULL, '');
INSERT INTO `w_im_msgs` VALUES (539, '1609228771458', 1609228771, 1, 1, 1, '😥', '', 2, 4, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-29 15:59:32', '2020-12-29 15:59:32', NULL, '');
INSERT INTO `w_im_msgs` VALUES (540, '1609314287909', 1609314287, 1, 2, 1, '1', '', 2, 11, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-30 15:44:50', '2020-12-30 15:44:50', NULL, '{\"gName\":\"新用户群\"}');
INSERT INTO `w_im_msgs` VALUES (541, '1609316898679', 1609316898, 1, 1, 4, '', '', 2, 5, 'http://gas.micyi.com/pics/files/Saved Pictures_8551.rar', 'Saved Pictures_8551.rar', 'rar', 0, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-30 16:28:21', '2020-12-30 16:28:21', NULL, '');
INSERT INTO `w_im_msgs` VALUES (542, '1609316962988', 1609316962, 1, 1, 4, '', '', 1, 2, 'http://gas.micyi.com/pics/files/配网流程切图_slices_6651.zip', '配网流程切图_slices_6651.zip', 'zip', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-30 16:29:25', '2020-12-30 16:29:25', NULL, '');
INSERT INTO `w_im_msgs` VALUES (543, '1609316994538', 1609316994, 1, 1, 4, '', '', 1, 2, 'http://gas.micyi.com/pics/files/Saved Pictures_7502.rar', 'Saved Pictures_7502.rar', 'rar', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-30 16:29:57', '2020-12-30 16:29:57', NULL, '');
INSERT INTO `w_im_msgs` VALUES (544, '1609317006122', 1609317006, 1, 1, 4, '', '', 1, 2, 'http://gas.micyi.com/pics/files/大兴智慧市政项目ui规范_5957.pdf', '大兴智慧市政项目ui规范_5957.pdf', 'pdf', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-30 16:30:08', '2020-12-30 16:30:08', NULL, '');
INSERT INTO `w_im_msgs` VALUES (545, '1609317970928', 1609317970, 1, 1, 4, '', '', 7, 2, 'http://gas.micyi.com/pics/files/下载_1824.zip', '下载_1824.zip', 'zip', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-30 16:46:13', '2020-12-30 16:46:13', NULL, '');
INSERT INTO `w_im_msgs` VALUES (546, '1609317976977', 1609317976, 1, 1, 4, '', '', 7, 2, 'http://gas.micyi.com/pics/files/微信图片_20201026100749_5991.zip', '微信图片_20201026100749_5991.zip', 'zip', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-30 16:46:19', '2020-12-30 16:46:19', NULL, '');
INSERT INTO `w_im_msgs` VALUES (547, '1609317983295', 1609317983, 1, 1, 3, '', '', 7, 2, 'http://gas.micyi.com/pics/files/5f28d7047458d_9601.jpg', '5f28d7047458d_9601.jpg', 'jpg', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-30 16:46:26', '2020-12-30 16:46:26', NULL, '');
INSERT INTO `w_im_msgs` VALUES (548, '1609318005816', 1609318005, 1, 1, 4, '', '', 7, 2, 'http://gas.micyi.com/pics/files/配网流程切图_slices_2888.zip', '配网流程切图_slices_2888.zip', 'zip', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-30 16:46:48', '2020-12-30 16:46:48', NULL, '');
INSERT INTO `w_im_msgs` VALUES (549, '1609318024072', 1609318024, 1, 1, 1, 'wel\n', '', 7, 2, '', '', '', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-30 16:47:06', '2020-12-30 16:47:06', NULL, '');
INSERT INTO `w_im_msgs` VALUES (550, '1609318031383', 1609318031, 1, 1, 4, '', '', 7, 2, 'http://gas.micyi.com/pics/files/Saved Pictures_9236.rar', 'Saved Pictures_9236.rar', 'rar', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-30 16:47:14', '2020-12-30 16:47:14', NULL, '');
INSERT INTO `w_im_msgs` VALUES (551, '1609318047647', 1609318047, 1, 1, 4, '', '', 7, 2, 'http://gas.micyi.com/pics/files/下载_7159.zip', '下载_7159.zip', 'zip', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-30 16:47:30', '2020-12-30 16:47:30', NULL, '');
INSERT INTO `w_im_msgs` VALUES (552, '1609318100551', 1609318100, 1, 1, 4, '', '', 7, 2, 'http://gas.micyi.com/pics/files/配网流程切图_slices_4304.zip', '配网流程切图_slices_4304.zip', 'zip', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-30 16:48:23', '2020-12-30 16:48:23', NULL, '');
INSERT INTO `w_im_msgs` VALUES (553, '1609318109857', 1609318109, 1, 1, 4, '', '', 7, 2, 'http://gas.micyi.com/pics/files/大兴智慧市政项目ui规范_8808.pdf', '大兴智慧市政项目ui规范_8808.pdf', 'pdf', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-30 16:48:32', '2020-12-30 16:48:32', NULL, '');
INSERT INTO `w_im_msgs` VALUES (554, '1609322919869', 1609322919, 1, 1, 4, '', '', 2, 5, 'http://gas.micyi.com/pics/files/ssxal-1xia6_1662.mp3', 'ssxal-1xia6_1662.mp3', 'mp3', 0, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-30 18:08:42', '2020-12-30 18:08:42', NULL, '');
INSERT INTO `w_im_msgs` VALUES (555, '1609323339618', 1609323339, 1, 1, 2, '', '', 2, 5, 'http://gas.micyi.com/pics/files/ssxal-1xia6_3379.mp3', 'ssxal-1xia6_3379.mp3', 'mp3', 0, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-30 18:15:42', '2020-12-30 18:15:42', NULL, '');
INSERT INTO `w_im_msgs` VALUES (556, '1609381405217', 1609381405, 1, 1, 2, '', '', 2, 5, 'http://gas.micyi.com/pics/files/新录音-5_1099.mp3', '新录音-5_1099.mp3', 'mp3', 0, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-31 10:23:25', '2020-12-31 10:23:25', NULL, '');
INSERT INTO `w_im_msgs` VALUES (557, '1609381967601', 1609381967, 1, 1, 1, '1', '', 2, 5, '', '', '', 0, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-31 10:32:48', '2020-12-31 10:32:48', NULL, '');
INSERT INTO `w_im_msgs` VALUES (558, '1609381969057', 1609381969, 1, 1, 1, '2', '', 2, 5, '', '', '', 0, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-31 10:32:49', '2020-12-31 10:32:49', NULL, '');
INSERT INTO `w_im_msgs` VALUES (559, '1609382950902', 1609382950, 1, 1, 2, '', '', 2, 7, 'http://gas.micyi.com/pics/files/ssxal-1xia6_4777.mp3', 'ssxal-1xia6_4777.mp3', 'mp3', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-31 10:49:11', '2020-12-31 14:25:16', NULL, '{\"gName\":\"大兴(李一)\",\"play\":false}');
INSERT INTO `w_im_msgs` VALUES (560, '1609382969171', 1609382969, 1, 1, 1, '1', '', 2, 7, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-31 10:49:29', '2020-12-31 14:25:16', NULL, '{\"gName\":\"大兴(李一)\",\"play\":false}');
INSERT INTO `w_im_msgs` VALUES (561, '1609382975129', 1609382975, 1, 1, 1, '222', '', 2, 7, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-31 10:49:35', '2020-12-31 14:25:16', NULL, '{\"gName\":\"大兴(李一)\",\"play\":false}');
INSERT INTO `w_im_msgs` VALUES (562, '1609383011704', 1609383011, 1, 1, 2, '', '', 2, 7, 'http://gas.micyi.com/pics/files/新录音-5_8358.mp3', '新录音-5_8358.mp3', 'mp3', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-31 10:50:12', '2020-12-31 14:25:16', NULL, '{\"gName\":\"大兴(李一)\",\"play\":false}');
INSERT INTO `w_im_msgs` VALUES (563, '1609386261366', 1609386261, 1, 1, 2, '', '', 1, 2, 'http://gas.micyi.com/pics/files/ssxal-1xia6_2403.mp3', 'ssxal-1xia6_2403.mp3', 'mp3', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-31 11:44:21', '2020-12-31 11:44:21', NULL, '');
INSERT INTO `w_im_msgs` VALUES (564, '1609395949255', 1609395949, 1, 2, 1, '路哥萨克孤岛惊魂撒', '', 2, 10, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2020-12-31 14:25:49', '2020-12-31 14:25:49', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (565, '1609395955700', 1609395955, 1, 2, 1, '😨', '', 7, 10, '', '', '', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-31 14:25:56', '2020-12-31 14:25:56', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (566, '1609395969878', 1609395969, 1, 2, 1, '😅😄😀', '', 7, 10, '', '', '', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-31 14:26:10', '2020-12-31 14:26:10', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (567, '1609395973661', 1609395973, 1, 2, 1, '🤙', '', 7, 10, '', '', '', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-31 14:26:14', '2020-12-31 14:26:14', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (568, '1609395976526', 1609395976, 1, 2, 1, '❄️', '', 7, 10, '', '', '', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-31 14:26:17', '2020-12-31 14:26:17', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (569, '1609395987780', 1609395987, 1, 2, 3, '', '', 7, 10, 'http://gas.micyi.com/pics/files/5f28d7047458d_6331.jpg', '5f28d7047458d_6331.jpg', 'jpg', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2020-12-31 14:26:28', '2020-12-31 14:26:28', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (570, '1609726415885', 1609726415, 1, 2, 1, 'wwwwwwwwwww', '', 2, 6, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-04 10:13:35', '2021-01-04 10:13:35', NULL, '{\"gName\":\"公司总群\"}');
INSERT INTO `w_im_msgs` VALUES (571, '1609726420556', 1609726420, 1, 2, 1, 'wwwwwwww', '', 2, 6, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-04 10:13:40', '2021-01-04 10:13:40', NULL, '{\"gName\":\"公司总群\"}');
INSERT INTO `w_im_msgs` VALUES (572, '1609727184533', 1609727184, 1, 2, 1, '1', '', 2, 6, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-04 10:26:24', '2021-01-04 10:26:24', NULL, '{\"gName\":\"公司总群\"}');
INSERT INTO `w_im_msgs` VALUES (573, '1609727190492', 1609727190, 1, 2, 1, '222222222222222222', '', 4, 6, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2021-01-04 10:26:30', '2021-01-04 10:26:30', NULL, '{\"gName\":\"公司总群\"}');
INSERT INTO `w_im_msgs` VALUES (574, '1609727226874', 1609727226, 1, 2, 1, '吾问无为谓吾问无为谓', '', 7, 6, '', '', '', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-04 10:27:06', '2021-01-04 10:27:06', NULL, '{\"gName\":\"公司总群\"}');
INSERT INTO `w_im_msgs` VALUES (575, '1609727233418', 1609727233, 1, 2, 1, '少时诵诗书', '', 7, 6, '', '', '', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-04 10:27:13', '2021-01-04 10:27:13', NULL, '{\"gName\":\"公司总群\"}');
INSERT INTO `w_im_msgs` VALUES (576, '1609727240891', 1609727240, 1, 2, 1, '顶顶顶顶顶顶顶顶顶', '', 7, 10, '', '', '', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-04 10:27:20', '2021-01-04 10:27:20', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (577, '1609727368410', 1609727368, 1, 1, 1, '要不是比拼多多还便宜100块 我特么直接就拼了要不是比拼多多还便宜100块 我特么直接就拼了要不是比拼多多还便宜100块 我特么直接就拼了', '', 7, 2, '', '', '', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-04 10:29:28', '2021-01-04 10:29:28', NULL, '');
INSERT INTO `w_im_msgs` VALUES (578, '1609727380620', 1609727380, 1, 1, 1, '要不是比拼多多还便宜100块 我特么直接就拼了要不是比拼多多还便宜100块 我特么直接就拼了', '', 2, 7, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-04 10:29:40', '2021-01-04 10:29:40', NULL, '');
INSERT INTO `w_im_msgs` VALUES (579, '1609727472005', 1609727472, 1, 1, 1, 'en', '', 2, 7, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-04 10:31:12', '2021-01-04 10:31:12', NULL, '');
INSERT INTO `w_im_msgs` VALUES (580, '1609727491228', 1609727491, 1, 1, 1, '坑你吧\n', '', 2, 7, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-04 10:31:31', '2021-01-04 10:31:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (581, '1609728673578', 1609728673, 1, 1, 1, '嗯嗯嗯讷讷呢\n', '', 7, 8, '', '', '', 0, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-04 10:51:13', '2021-01-04 10:51:13', NULL, '');
INSERT INTO `w_im_msgs` VALUES (582, '1609830506140', 1609830506, 1, 2, 1, '嗯嗯嗯嗯嗯呃', '', 2, 10, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-05 15:08:26', '2021-01-05 15:08:26', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (583, '1609830515491', 1609830515, 1, 2, 1, '22222222222', '', 2, 10, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-05 15:08:36', '2021-01-05 15:08:36', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (584, '1609830544794', 1609830544, 1, 2, 3, '', '', 2, 10, 'http://gas.micyi.com/pics/files/5dafce8d855b4_5805.png', '5dafce8d855b4_5805.png', 'png', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-05 15:09:05', '2021-01-05 15:09:05', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (585, '1609830551340', 1609830551, 1, 2, 1, '是是是是是是', '', 2, 10, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-05 15:09:12', '2021-01-05 15:09:12', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (586, '1609830587499', 1609830587, 1, 2, 1, '😁', '', 2, 10, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-05 15:09:48', '2021-01-05 15:09:48', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (587, '1609832731657', 1609832731, 1, 1, 1, '你黄河大街卡的看\n', '', 2, 7, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-05 15:45:32', '2021-01-15 16:06:19', NULL, '');
INSERT INTO `w_im_msgs` VALUES (588, '1609832791135', 1609832791, 1, 1, 1, '你好啊 我是小二', '', 9, 2, '', '', '', 1, '刘小二', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-05 15:46:31', '2021-01-05 15:46:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (589, '1609832795304', 1609832795, 1, 1, 1, '嗯', '', 9, 2, '', '', '', 1, '刘小二', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-05 15:46:35', '2021-01-05 15:46:35', NULL, '');
INSERT INTO `w_im_msgs` VALUES (590, '1609832797720', 1609832797, 1, 1, 1, '是', '', 9, 2, '', '', '', 1, '刘小二', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-05 15:46:38', '2021-01-05 15:46:38', NULL, '');
INSERT INTO `w_im_msgs` VALUES (591, '1609832800958', 1609832800, 1, 1, 1, '水水水水水水水水', '', 9, 2, '', '', '', 1, '刘小二', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-05 15:46:41', '2021-01-05 15:46:41', NULL, '');
INSERT INTO `w_im_msgs` VALUES (592, '1609832820952', 1609832820, 1, 2, 1, '呜呜呜呜呜呜呜呜无无无无', '', 9, 6, '', '', '', 1, '刘小二', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-05 15:47:01', '2021-01-05 15:47:01', NULL, '{\"gName\":\"公司总群\"}');
INSERT INTO `w_im_msgs` VALUES (593, '1609832824742', 1609832824, 1, 2, 1, '点点点', '', 9, 6, '', '', '', 1, '刘小二', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-05 15:47:05', '2021-01-05 15:47:05', NULL, '{\"gName\":\"公司总群\"}');
INSERT INTO `w_im_msgs` VALUES (594, '1610007078437', 1610007078, 1, 1, 3, '', '', 2, 1, 'http://gas.micyi.com/pics/files/5f28d7047458d_4853.jpg', '5f28d7047458d_4853.jpg', 'jpg', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-07 16:11:20', '2021-01-18 13:54:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (595, '1610073348833', 1610073348, 1, 1, 3, '', '', 2, 4, 'http://gas.micyi.com/pics/files/5f28d7047458d_8415.jpg', '5f28d7047458d_8415.jpg', 'jpg', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-08 10:35:49', '2021-01-11 11:29:08', NULL, '');
INSERT INTO `w_im_msgs` VALUES (596, '1610332940119', 1610332940, 1, 2, 1, '1', '', 2, 10, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-11 10:42:20', '2021-01-11 10:42:20', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (597, '1610332948191', 1610332948, 1, 2, 1, '2', '', 2, 10, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-11 10:42:28', '2021-01-11 10:42:28', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (598, '1610333208997', 1610333208, 1, 1, 1, '1', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-11 10:46:49', '2021-01-18 13:54:05', NULL, '');
INSERT INTO `w_im_msgs` VALUES (599, '1610333792039', 1610333792, 1, 1, 2, '', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-11 10:56:32', '2021-01-18 13:54:05', NULL, '');
INSERT INTO `w_im_msgs` VALUES (600, '1610334087160', 1610334087, 1, 1, 2, '', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-11 11:01:27', '2021-01-18 13:54:05', NULL, '');
INSERT INTO `w_im_msgs` VALUES (601, '1610334387304', 1610334387, 1, 1, 2, '', '', 2, 1, 'https://api-iott.worthcloud.net/pics/files/blob_5004.mp3', 'blob_5004.mp3', 'mp3', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-11 11:06:27', '2021-01-18 13:54:05', NULL, '');
INSERT INTO `w_im_msgs` VALUES (602, '1610334470557', 1610334470, 1, 1, 2, '', '', 2, 1, 'https://api-iott.worthcloud.net/pics/files/blob_8014.mp3', 'blob_8014.mp3', 'mp3', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-11 11:07:50', '2021-01-18 13:54:05', NULL, '');
INSERT INTO `w_im_msgs` VALUES (603, '1610335323414', 1610335323, 1, 1, 2, '', '', 2, 1, 'https://api-iott.worthcloud.net/pics/files/blob_4965.mp3', 'blob_4965.mp3', 'mp3', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-11 11:22:04', '2021-01-18 13:54:05', NULL, '');
INSERT INTO `w_im_msgs` VALUES (604, '1610335679046', 1610335679, 1, 1, 2, '', '', 2, 4, 'https://api-iott.worthcloud.net/pics/files/blob_5213.mp3', 'blob_5213.mp3', 'mp3', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-11 11:28:00', '2021-01-11 11:29:08', NULL, '');
INSERT INTO `w_im_msgs` VALUES (605, '1610335697683', 1610335697, 1, 1, 2, '', '', 2, 4, 'https://api-iott.worthcloud.net/pics/files/blob_4065.mp3', 'blob_4065.mp3', 'mp3', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-11 11:28:18', '2021-01-11 11:29:08', NULL, '');
INSERT INTO `w_im_msgs` VALUES (606, '1610335766712', 1610335766, 1, 1, 2, '', '', 4, 2, 'https://api-iott.worthcloud.net/pics/files/blob_6680.mp3', 'blob_6680.mp3', 'mp3', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2021-01-11 11:29:27', '2021-01-11 11:35:20', NULL, '');
INSERT INTO `w_im_msgs` VALUES (607, '1610335782981', 1610335782, 1, 1, 2, '', '', 4, 2, 'https://api-iott.worthcloud.net/pics/files/blob_9400.mp3', 'blob_9400.mp3', 'mp3', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2021-01-11 11:29:44', '2021-01-11 11:35:20', NULL, '');
INSERT INTO `w_im_msgs` VALUES (608, '1610335827696', 1610335827, 1, 1, 2, '😅', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2021-01-11 11:30:28', '2021-01-11 11:35:20', NULL, '');
INSERT INTO `w_im_msgs` VALUES (609, '1610530869274', 1610530869, 1, 1, 1, '嗯嗯嗯我', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2021-01-13 17:41:12', '2021-01-13 17:41:12', NULL, '');
INSERT INTO `w_im_msgs` VALUES (610, '1610530877984', 1610530877, 1, 1, 1, '吾问无为谓哇哇哇哇', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2021-01-13 17:41:20', '2021-01-13 17:41:20', NULL, '');
INSERT INTO `w_im_msgs` VALUES (611, '1610532702976', 1610532702, 1, 2, 1, 'eeeeeeeee', '', 2, 12, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-13 18:11:45', '2021-01-13 18:11:45', NULL, '{\"gName\":\"聊天群12\"}');
INSERT INTO `w_im_msgs` VALUES (612, '1610697771121', 1610697771, 1, 1, 1, '你好', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2021-01-15 16:02:51', '2021-01-15 16:02:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (613, '1610697815540', 1610697815, 1, 1, 1, '😅', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2021-01-15 16:03:35', '2021-01-15 16:03:35', NULL, '');
INSERT INTO `w_im_msgs` VALUES (614, '1610697829710', 1610697829, 1, 1, 1, '嗯嗯嗯呢😛😛', '', 4, 2, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2021-01-15 16:03:49', '2021-01-15 16:03:49', NULL, '');
INSERT INTO `w_im_msgs` VALUES (615, '1610698036982', 1610698036, 1, 1, 1, 'nhao', '', 7, 10, '', '', '', 0, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-15 16:07:15', '2021-01-15 16:07:15', NULL, '');
INSERT INTO `w_im_msgs` VALUES (616, '1610698040258', 1610698040, 1, 1, 1, '😅', '', 7, 10, '', '', '', 0, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-15 16:07:19', '2021-01-15 16:07:19', NULL, '');
INSERT INTO `w_im_msgs` VALUES (617, '1610698043221', 1610698043, 1, 1, 1, '😗', '', 7, 10, '', '', '', 0, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-15 16:07:22', '2021-01-15 16:07:22', NULL, '');
INSERT INTO `w_im_msgs` VALUES (618, '1610698045560', 1610698045, 1, 1, 1, '😘', '', 7, 10, '', '', '', 0, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-15 16:07:24', '2021-01-15 16:07:24', NULL, '');
INSERT INTO `w_im_msgs` VALUES (619, '1610698179871', 1610698179, 1, 2, 1, 'mzknzjzjsjs', '', 7, 13, '', '', '', 1, '李一', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-15 16:09:38', '2021-01-15 16:09:38', NULL, '{\"gName\":\"聊天群13\"}');
INSERT INTO `w_im_msgs` VALUES (620, '1610949329731', 1610949329, 1, 1, 1, '233', '', 1, 2, '', '', '', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-18 13:55:27', '2021-01-18 16:11:10', NULL, '');
INSERT INTO `w_im_msgs` VALUES (621, '1610949334203', 1610949334, 1, 1, 1, '233', '', 1, 2, '', '', '', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-18 13:55:30', '2021-01-18 16:11:10', NULL, '');
INSERT INTO `w_im_msgs` VALUES (622, '1610949348764', 1610949348, 1, 2, 1, '233', '', 1, 9, '', '', '', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-18 13:55:45', '2021-01-18 13:55:45', NULL, '{\"gName\":\"聊天群9\"}');
INSERT INTO `w_im_msgs` VALUES (623, '1610962982950', 1610962982, 1, 1, 1, '咩', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-18 17:43:03', '2021-01-18 17:53:28', NULL, '');
INSERT INTO `w_im_msgs` VALUES (624, '1610962988063', 1610962988, 1, 1, 1, '咩', '', 2, 1, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-18 17:43:08', '2021-01-18 17:53:28', NULL, '');
INSERT INTO `w_im_msgs` VALUES (625, '1611115124058', 1611115124, 1, 1, 1, '哈哈哈哈', '', 1, 2, '', '', '', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-20 11:58:42', '2021-01-20 11:58:42', NULL, '');
INSERT INTO `w_im_msgs` VALUES (626, '1611115130407', 1611115130, 1, 1, 1, '😊', '', 1, 2, '', '', '', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-20 11:58:48', '2021-01-20 11:58:48', NULL, '');
INSERT INTO `w_im_msgs` VALUES (627, '1611213770403', 1611213770, 1, 1, 3, '', '', 2, 14, 'http://gas.micyi.com/pics/files/5f28d7047458d_7487.jpg', '5f28d7047458d_7487.jpg', 'jpg', 0, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-21 15:22:52', '2021-01-21 15:22:52', NULL, '');
INSERT INTO `w_im_msgs` VALUES (628, '1611217578734', 1611217578, 1, 1, 2, '😅😄', '', 1, 2, '', '', '', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-21 16:26:19', '2021-01-21 16:26:19', NULL, '');
INSERT INTO `w_im_msgs` VALUES (629, '1611217610482', 1611217610, 1, 1, 2, '😅', '', 1, 2, '', '', '', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-21 16:26:51', '2021-01-21 16:26:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (630, '1611217648946', 1611217648, 1, 1, 3, '', '', 1, 2, 'http://gas.micyi.com/pics/files/Screenshot_2021-01-21-15-04-22-671_com_9193.png', 'Screenshot_2021-01-21-15-04-22-671_com_9193.png', 'png', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-21 16:27:29', '2021-01-21 16:27:29', NULL, '');
INSERT INTO `w_im_msgs` VALUES (631, '1611217653685', 1611217653, 1, 1, 1, '😄', '', 1, 2, '', '', '', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-21 16:27:34', '2021-01-21 16:27:34', NULL, '');
INSERT INTO `w_im_msgs` VALUES (632, '1611286160870', 1611286160, 1, 2, 1, '大家好\n', '', 1, 1, '', '', '', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-22 11:29:21', '2021-01-22 11:29:21', NULL, '{\"gName\":\"聊一会儿吧\"}');
INSERT INTO `w_im_msgs` VALUES (633, '1611554310633', 1611554310, 1, 1, 1, '你好', '', 17, 2, '', '', '', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-25 13:58:30', '2021-01-25 13:59:56', NULL, '');
INSERT INTO `w_im_msgs` VALUES (634, '1611554316970', 1611554316, 1, 1, 1, 'abcdefg', '', 17, 2, '', '', '', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-25 13:58:37', '2021-01-25 13:59:56', NULL, '');
INSERT INTO `w_im_msgs` VALUES (635, '1611554403494', 1611554403, 1, 1, 1, '嗯嗯嗯嗯呃', '', 2, 17, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-25 14:00:03', '2021-01-25 14:00:03', NULL, '');
INSERT INTO `w_im_msgs` VALUES (636, '1611554409388', 1611554409, 1, 1, 1, '啊啊啊啊啊啊啊', '', 2, 17, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-25 14:00:09', '2021-01-25 14:00:09', NULL, '');
INSERT INTO `w_im_msgs` VALUES (637, '1611554414166', 1611554414, 1, 1, 3, '', '', 2, 17, 'http://gas.micyi.com/pics/files/5f28d7047458d_5138.jpg', '5f28d7047458d_5138.jpg', 'jpg', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-25 14:00:14', '2021-01-25 14:00:14', NULL, '');
INSERT INTO `w_im_msgs` VALUES (638, '1611555906989', 1611555906, 1, 1, 1, '😃', '', 17, 2, '', '', '', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-25 14:25:07', '2021-01-26 14:04:35', NULL, '');
INSERT INTO `w_im_msgs` VALUES (639, '1611555911480', 1611555911, 1, 1, 1, '✋', '', 17, 2, '', '', '', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-25 14:25:11', '2021-01-26 14:04:35', NULL, '');
INSERT INTO `w_im_msgs` VALUES (640, '1611557376085', 1611557376, 1, 1, 1, 'qweertt', '', 17, 3, '', '', '', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-25 14:49:36', '2021-01-25 14:49:36', NULL, '');
INSERT INTO `w_im_msgs` VALUES (641, '1611566086817', 1611566086, 1, 2, 1, 'ksjdfoljsdlfjdlsj\n', '', 1, 10, '', '', '', 1, 'Admin', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-25 17:14:47', '2021-01-25 17:14:47', NULL, '{\"gName\":\"聊天群10\"}');
INSERT INTO `w_im_msgs` VALUES (642, '1611632020673', 1611632020, 1, 1, 1, 'well', '', 17, 4, '', '', '', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 11:33:40', '2021-01-26 14:06:09', NULL, '');
INSERT INTO `w_im_msgs` VALUES (643, '1611632027958', 1611632027, 1, 1, 3, '', '', 17, 4, 'http://gas.micyi.com/pics/files/IMG_CMP_192426758_3707.jpeg', 'IMG_CMP_192426758_3707.jpeg', 'jpeg', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 11:33:48', '2021-01-26 14:06:09', NULL, '');
INSERT INTO `w_im_msgs` VALUES (644, '1611640571640', 1611640571, 1, 1, 1, 'en', '', 17, 4, '', '', '', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 13:56:11', '2021-01-26 14:06:09', NULL, '');
INSERT INTO `w_im_msgs` VALUES (645, '1611641086217', 1611641086, 1, 1, 1, '好的', '', 2, 17, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-26 14:04:47', '2021-01-26 14:04:47', NULL, '');
INSERT INTO `w_im_msgs` VALUES (646, '1611641094817', 1611641094, 1, 1, 1, '嗯嗯嗯嗯嗯嗯呃\n', '', 2, 17, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-26 14:04:55', '2021-01-26 14:04:55', NULL, '');
INSERT INTO `w_im_msgs` VALUES (647, '1611641100209', 1611641100, 1, 1, 1, '我我我我我我\n', '', 2, 17, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-26 14:05:01', '2021-01-26 14:05:01', NULL, '');
INSERT INTO `w_im_msgs` VALUES (648, '1611641103042', 1611641103, 1, 1, 1, '😋', '', 2, 17, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-26 14:05:04', '2021-01-26 14:05:04', NULL, '');
INSERT INTO `w_im_msgs` VALUES (649, '1611641106193', 1611641106, 1, 1, 1, '😉', '', 2, 17, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-26 14:05:07', '2021-01-26 14:05:07', NULL, '');
INSERT INTO `w_im_msgs` VALUES (650, '1611641130425', 1611641130, 1, 1, 4, '', '', 2, 17, 'http://gas.micyi.com/pics/files/大兴智慧市政项目ui规范_5463.pdf', '大兴智慧市政项目ui规范_5463.pdf', 'pdf', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-26 14:05:31', '2021-01-26 14:05:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (651, '1611641194796', 1611641194, 1, 2, 1, 'wellllll', '', 4, 15, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2021-01-26 14:06:35', '2021-01-26 14:06:35', NULL, '{\"gName\":\"聊天群15\"}');
INSERT INTO `w_im_msgs` VALUES (652, '1611641199731', 1611641199, 1, 2, 1, '换个库让顾客个人口味grew', '', 4, 15, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2021-01-26 14:06:40', '2021-01-26 14:06:40', NULL, '{\"gName\":\"聊天群15\"}');
INSERT INTO `w_im_msgs` VALUES (653, '1611641205066', 1611641205, 1, 2, 1, '吾问无为谓哇哇哇哇', '', 4, 15, '', '', '', 1, '李四', 'http://gas.micyi.com/pics/images/u=1569462993,172008204&fm=5.jpg', '2021-01-26 14:06:46', '2021-01-26 14:06:46', NULL, '{\"gName\":\"聊天群15\"}');
INSERT INTO `w_im_msgs` VALUES (654, '1611641215648', 1611641215, 1, 2, 1, '静待花开就撒的韩代', '', 2, 15, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-26 14:06:56', '2021-01-26 14:06:56', NULL, '{\"gName\":\"聊天群15\"}');
INSERT INTO `w_im_msgs` VALUES (655, '1611641219561', 1611641219, 1, 2, 1, '啦啦啦啦啦啦\n', '', 2, 15, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-26 14:07:00', '2021-01-26 14:07:00', NULL, '{\"gName\":\"聊天群15\"}');
INSERT INTO `w_im_msgs` VALUES (656, '1611641225177', 1611641225, 1, 2, 1, '你ASJKDgas看见的工会撒娇给大家哈工大几哈上东国际哈市供电局哈市供电局哈工大好多话骄傲的', '', 2, 15, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-26 14:07:06', '2021-01-26 14:07:06', NULL, '{\"gName\":\"聊天群15\"}');
INSERT INTO `w_im_msgs` VALUES (657, '1611641235505', 1611641235, 1, 2, 1, '呜呜呜呜', '', 2, 15, '', '', '', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-26 14:07:16', '2021-01-26 14:07:16', NULL, '{\"gName\":\"聊天群15\"}');
INSERT INTO `w_im_msgs` VALUES (658, '1611641259228', 1611641259, 1, 2, 1, 'eneneenenenen', '', 17, 15, '', '', '', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:07:39', '2021-01-26 14:07:39', NULL, '{\"gName\":\"聊天群15\"}');
INSERT INTO `w_im_msgs` VALUES (659, '1611641265150', 1611641265, 1, 2, 1, 'QQ微微儿', '', 17, 15, '', '', '', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:07:45', '2021-01-26 14:07:45', NULL, '{\"gName\":\"聊天群15\"}');
INSERT INTO `w_im_msgs` VALUES (660, '1611641342357', 1611641342, 1, 1, 1, '你好', '', 17, 7, '', '', '', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:09:02', '2021-01-26 14:09:02', NULL, '');
INSERT INTO `w_im_msgs` VALUES (661, '1611641346720', 1611641346, 1, 1, 1, 'wertyyyuu', '', 17, 7, '', '', '', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:09:06', '2021-01-26 14:09:06', NULL, '');
INSERT INTO `w_im_msgs` VALUES (662, '1611641382447', 1611641382, 1, 1, 1, '去', '', 17, 10, '', '', '', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:09:42', '2021-01-26 14:09:42', NULL, '');
INSERT INTO `w_im_msgs` VALUES (663, '1611641391116', 1611641391, 1, 1, 1, 'eeeerff', '', 17, 10, '', '', '', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:09:51', '2021-01-26 14:09:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (664, '1611641402828', 1611641402, 1, 1, 1, 'nh', '', 17, 14, '', '', '', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:10:02', '2021-01-26 14:10:02', NULL, '');
INSERT INTO `w_im_msgs` VALUES (665, '1611641416904', 1611641416, 1, 1, 1, 'wwwwwwwww', '', 17, 3, '', '', '', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:10:16', '2021-01-26 14:10:16', NULL, '');
INSERT INTO `w_im_msgs` VALUES (666, '1611641429581', 1611641429, 1, 1, 1, '😍', '', 17, 3, '', '', '', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:10:29', '2021-01-26 14:10:29', NULL, '');
INSERT INTO `w_im_msgs` VALUES (667, '1611641436318', 1611641436, 1, 1, 1, 'uuuuuuuu', '', 17, 3, '', '', '', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:10:36', '2021-01-26 14:10:36', NULL, '');
INSERT INTO `w_im_msgs` VALUES (668, '1611641449505', 1611641449, 1, 1, 1, 'wwwww', '', 17, 3, '', '', '', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:10:49', '2021-01-26 14:10:49', NULL, '');
INSERT INTO `w_im_msgs` VALUES (669, '1611641452028', 1611641452, 1, 1, 1, '😘', '', 17, 3, '', '', '', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:10:51', '2021-01-26 14:10:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (670, '1611641468229', 1611641468, 1, 1, 1, 'w', '', 17, 9, '', '', '', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:11:08', '2021-01-26 14:11:08', NULL, '');
INSERT INTO `w_im_msgs` VALUES (671, '1611641482955', 1611641482, 1, 2, 1, 'wwwww', '', 17, 16, '', '', '', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:11:23', '2021-01-26 14:11:23', NULL, '{\"gName\":\"聊天群16\"}');
INSERT INTO `w_im_msgs` VALUES (672, '1611641683462', 1611641683, 1, 1, 3, '', '', 17, 3, 'http://gas.micyi.com/pics/files/IMG_CMP_30558810_7609.jpeg', 'IMG_CMP_30558810_7609.jpeg', 'jpeg', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:14:43', '2021-01-26 14:14:43', NULL, '');
INSERT INTO `w_im_msgs` VALUES (673, '1611641688219', 1611641688, 1, 1, 3, '', '', 17, 3, 'http://gas.micyi.com/pics/files/IMG_CMP_247497867_7072.jpeg', 'IMG_CMP_247497867_7072.jpeg', 'jpeg', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:14:48', '2021-01-26 14:14:48', NULL, '');
INSERT INTO `w_im_msgs` VALUES (674, '1611642936882', 1611642936, 1, 2, 1, '我', '', 17, 16, '', '', '', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:35:37', '2021-01-26 14:35:37', NULL, '{\"gName\":\"一二三四五上山打老虎\"}');
INSERT INTO `w_im_msgs` VALUES (675, '1611643034845', 1611643034, 1, 2, 1, '呜呜呜呜我问问', '', 17, 15, '', '', '', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:37:14', '2021-01-26 14:37:14', NULL, '{\"gName\":\"聊天群15\"}');
INSERT INTO `w_im_msgs` VALUES (676, '1611643058725', 1611643058, 1, 1, 3, '', '', 17, 2, 'http://gas.micyi.com/pics/files/IMG_CMP_108491883_2319.jpeg', 'IMG_CMP_108491883_2319.jpeg', 'jpeg', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:37:38', '2021-01-26 14:37:38', NULL, '');
INSERT INTO `w_im_msgs` VALUES (677, '1611643460562', 1611643460, 1, 1, 3, '', '', 2, 17, 'http://gas.micyi.com/pics/files/下载_1136.png', '下载_1136.png', 'png', 1, '三胖3333', 'http://gas.micyi.com/pics/files/5f28d7047458d_9841.jpg', '2021-01-26 14:44:21', '2021-01-26 14:44:27', NULL, '');
INSERT INTO `w_im_msgs` VALUES (678, '1611643773534', 1611643773, 1, 1, 1, '我问问www', '', 17, 4, '', '', '', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 14:49:33', '2021-01-26 14:49:33', NULL, '');
INSERT INTO `w_im_msgs` VALUES (679, '1611644777324', 1611644777, 1, 1, 1, '😍', '', 17, 4, '', '', '', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 15:06:17', '2021-01-26 15:06:17', NULL, '');
INSERT INTO `w_im_msgs` VALUES (680, '1611646611713', 1611646611, 1, 1, 3, '', '', 17, 3, 'http://gas.micyi.com/pics/files/IMG_CMP_215015687_9624.jpeg', 'IMG_CMP_215015687_9624.jpeg', 'jpeg', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 15:36:51', '2021-01-26 15:36:51', NULL, '');
INSERT INTO `w_im_msgs` VALUES (681, '1611647461335', 1611647461, 1, 1, 3, '', '', 17, 3, 'http://gas.micyi.com/pics/files/IMG_CMP_30558810_9416.jpeg', 'IMG_CMP_30558810_9416.jpeg', 'jpeg', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 15:51:01', '2021-01-26 15:51:01', NULL, '');
INSERT INTO `w_im_msgs` VALUES (682, '1611652411513', 1611652411, 1, 1, 3, '', '', 17, 3, 'http://gas.micyi.com/pics/files/IMG_CMP_222927684_1375.jpeg', 'IMG_CMP_222927684_1375.jpeg', 'jpeg', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 17:13:31', '2021-01-26 17:13:31', NULL, '');
INSERT INTO `w_im_msgs` VALUES (683, '1611652470060', 1611652470, 1, 1, 3, '', '', 17, 2, 'http://gas.micyi.com/pics/files/Screenshot_20201222_160451_com_3879.jpg', 'Screenshot_20201222_160451_com_3879.jpg', 'jpg', 1, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-26 17:14:29', '2021-01-26 17:14:29', NULL, '');
INSERT INTO `w_im_msgs` VALUES (684, '1611885518565', 1611885518, 1, 1, 3, '', '', 17, 4, 'http://gas.micyi.com/pics/files/IMG_CMP_90271960_7163.jpeg', 'IMG_CMP_90271960_7163.jpeg', 'jpeg', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-29 09:58:37', '2021-01-29 09:58:37', NULL, '');
INSERT INTO `w_im_msgs` VALUES (685, '1611885523719', 1611885523, 1, 1, 1, '回来了啦啦啦', '', 17, 4, '', '', '', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-29 09:58:42', '2021-01-29 09:58:42', NULL, '');
INSERT INTO `w_im_msgs` VALUES (686, '1611911970290', 1611911970, 1, 1, 1, '////@快快快多久', '', 17, 2, '', '', '', 0, '智能云终端APP', 'http://gas.micyi.com/pics/images/avatar.png', '2021-01-29 17:19:29', '2021-01-29 17:19:29', NULL, '');

-- ----------------------------
-- Table structure for w_migrations
-- ----------------------------
DROP TABLE IF EXISTS `w_migrations`;
CREATE TABLE `w_migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_migrations
-- ----------------------------
INSERT INTO `w_migrations` VALUES (1, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `w_migrations` VALUES (2, '2018_08_08_100000_create_telescope_entries_table', 2);

-- ----------------------------
-- Table structure for w_organs
-- ----------------------------
DROP TABLE IF EXISTS `w_organs`;
CREATE TABLE `w_organs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organ_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组织名',
  `sort` tinyint(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `pid` int(11) NULL DEFAULT 0 COMMENT '父级id',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_organs
-- ----------------------------
INSERT INTO `w_organs` VALUES (1, '公司1', 0, 0, '2020-12-17 16:37:57', '2020-12-17 16:37:57');
INSERT INTO `w_organs` VALUES (2, '公司2', 0, 0, '2020-12-17 16:44:17', '2020-12-17 16:44:17');
INSERT INTO `w_organs` VALUES (3, '公司3', 0, 0, '2020-12-17 16:47:59', '2020-12-17 16:47:59');
INSERT INTO `w_organs` VALUES (4, '站点1', 0, 1, '2020-12-17 16:48:06', '2020-12-17 16:48:06');
INSERT INTO `w_organs` VALUES (5, '站点2', 0, 1, '2020-12-17 16:48:12', '2020-12-17 16:50:40');
INSERT INTO `w_organs` VALUES (6, '站点3', 0, 1, '2020-12-17 17:09:04', '2020-12-17 17:15:25');
INSERT INTO `w_organs` VALUES (7, '站点4', 0, 2, '2020-12-17 17:15:38', '2020-12-17 17:15:38');
INSERT INTO `w_organs` VALUES (8, '站点5', 0, 3, '2020-12-17 17:22:00', '2020-12-17 17:22:00');
INSERT INTO `w_organs` VALUES (9, '财务部', 0, 4, '2020-12-17 17:27:02', '2020-12-17 17:27:02');
INSERT INTO `w_organs` VALUES (10, '运营部', 0, 4, '2020-12-17 17:27:09', '2020-12-17 17:27:21');
INSERT INTO `w_organs` VALUES (11, '技术部', 0, 4, '2020-12-17 17:27:14', '2020-12-17 17:27:14');
INSERT INTO `w_organs` VALUES (12, '运营部', 0, 5, '2020-12-17 17:41:51', '2020-12-17 17:41:51');
INSERT INTO `w_organs` VALUES (13, '策划部', 0, 5, '2020-12-17 17:42:00', '2020-12-17 17:42:00');
INSERT INTO `w_organs` VALUES (14, '大兴区总公司', 0, 0, '2021-01-21 14:47:55', '2021-01-21 14:47:55');

-- ----------------------------
-- Table structure for w_report_periods
-- ----------------------------
DROP TABLE IF EXISTS `w_report_periods`;
CREATE TABLE `w_report_periods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '年',
  `begin_time` datetime(0) NULL DEFAULT NULL COMMENT '周期开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '周期结束时间',
  `final_time` datetime(0) NULL DEFAULT NULL COMMENT '上报截止时间',
  `std_type` tinyint(4) NULL DEFAULT 0 COMMENT '0 液化气 1自采暖 2经营许可 3考核记录 4事件处理 5消防设施 6 安全作业 7管理制度 8用气量 9评价',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '上报周期' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_report_periods
-- ----------------------------
INSERT INTO `w_report_periods` VALUES (1, '2020', '2020-01-01 15:27:07', '2020-03-31 15:27:07', '2021-01-21 15:27:07', 8, '2021-01-19 15:28:04', '2021-01-19 15:28:04');
INSERT INTO `w_report_periods` VALUES (2, '2020', '2020-01-01 17:07:37', '2020-03-31 17:07:37', '2021-01-23 17:07:37', 1, '2021-01-19 17:08:02', '2021-01-19 17:08:02');
INSERT INTO `w_report_periods` VALUES (3, '2020', '2020-04-01 17:08:04', '2020-06-30 17:08:04', '2021-01-31 17:08:04', 1, '2021-01-19 17:08:49', '2021-01-19 17:08:49');
INSERT INTO `w_report_periods` VALUES (4, '2020', '2020-01-01 17:09:11', '2020-03-31 17:09:11', '2021-01-31 17:09:11', 5, '2021-01-19 17:09:32', '2021-01-19 17:09:32');
INSERT INTO `w_report_periods` VALUES (5, '2021', '2020-01-01 17:09:36', '2020-03-31 17:09:36', '2021-01-31 17:09:36', 6, '2021-01-19 17:09:51', '2021-01-19 17:09:51');
INSERT INTO `w_report_periods` VALUES (6, '2020', '2020-01-01 17:09:59', '2020-03-31 17:09:59', '2021-01-31 17:09:59', 7, '2021-01-19 17:10:25', '2021-01-19 17:10:25');
INSERT INTO `w_report_periods` VALUES (7, '2020', '2021-04-01 17:19:39', '2020-04-30 17:19:39', '2021-01-23 17:19:39', 8, '2021-01-19 17:19:59', '2021-01-19 17:19:59');
INSERT INTO `w_report_periods` VALUES (8, '2020', '2020-01-01 17:47:00', '2020-03-31 17:47:00', '2021-01-31 17:47:00', 0, '2021-01-19 17:47:23', '2021-01-19 17:47:23');
INSERT INTO `w_report_periods` VALUES (9, '2021', '2021-01-01 14:48:19', '2021-01-31 14:48:19', '2021-01-31 14:48:19', 5, '2021-01-20 14:48:38', '2021-01-20 14:48:38');
INSERT INTO `w_report_periods` VALUES (10, '2020', '2020-04-01 14:48:40', '2020-07-02 14:48:40', '2021-01-31 14:48:40', 5, '2021-01-20 14:49:01', '2021-01-20 14:49:01');
INSERT INTO `w_report_periods` VALUES (11, '2021', '2021-01-01 14:29:24', '2021-01-27 14:29:24', '2021-01-27 14:29:24', 1, '2021-01-27 14:29:31', '2021-01-27 14:29:31');

-- ----------------------------
-- Table structure for w_room_users
-- ----------------------------
DROP TABLE IF EXISTS `w_room_users`;
CREATE TABLE `w_room_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL DEFAULT 0 COMMENT '聊天室id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `user_type` int(11) NOT NULL DEFAULT 0 COMMENT '用户类型 0普通用户 1群主',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '聊天室用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_room_users
-- ----------------------------
INSERT INTO `w_room_users` VALUES (1, 1, 1, 1, '2020-12-16 16:55:41', '2020-12-16 16:55:41');
INSERT INTO `w_room_users` VALUES (2, 1, 2, 0, '2020-12-16 16:55:41', '2020-12-16 16:55:41');
INSERT INTO `w_room_users` VALUES (5, 2, 3, 1, '2020-12-19 11:24:36', '2020-12-30 15:20:14');
INSERT INTO `w_room_users` VALUES (10, 1, 5, 0, '2020-12-22 18:38:47', '2020-12-22 18:38:47');
INSERT INTO `w_room_users` VALUES (11, 2, 4, 0, '2020-12-23 10:41:31', '2020-12-23 10:41:31');
INSERT INTO `w_room_users` VALUES (12, 5, 1, 0, '2020-12-24 15:37:19', '2020-12-24 15:37:19');
INSERT INTO `w_room_users` VALUES (13, 5, 2, 0, '2020-12-24 15:37:19', '2020-12-24 15:37:19');
INSERT INTO `w_room_users` VALUES (14, 5, 3, 0, '2020-12-24 15:37:19', '2020-12-24 15:37:19');
INSERT INTO `w_room_users` VALUES (15, 5, 4, 0, '2020-12-24 15:37:19', '2020-12-24 15:37:19');
INSERT INTO `w_room_users` VALUES (16, 6, 1, 0, '2020-12-24 15:37:45', '2020-12-24 15:37:45');
INSERT INTO `w_room_users` VALUES (17, 6, 2, 0, '2020-12-24 15:37:45', '2020-12-24 15:37:45');
INSERT INTO `w_room_users` VALUES (18, 6, 3, 0, '2020-12-24 15:37:45', '2020-12-24 15:37:45');
INSERT INTO `w_room_users` VALUES (19, 6, 4, 0, '2020-12-24 15:37:45', '2020-12-24 15:37:45');
INSERT INTO `w_room_users` VALUES (20, 7, 3, 0, '2020-12-24 15:41:40', '2020-12-24 15:41:40');
INSERT INTO `w_room_users` VALUES (22, 7, 2, 0, '2020-12-24 15:41:40', '2020-12-24 15:41:40');
INSERT INTO `w_room_users` VALUES (23, 8, 2, 0, '2020-12-24 15:45:03', '2020-12-24 15:45:03');
INSERT INTO `w_room_users` VALUES (24, 8, 3, 0, '2020-12-24 15:45:03', '2020-12-24 15:45:03');
INSERT INTO `w_room_users` VALUES (26, 8, 1, 0, '2020-12-24 15:45:03', '2020-12-24 15:45:03');
INSERT INTO `w_room_users` VALUES (27, 9, 5, 1, '2020-12-24 16:01:35', '2020-12-24 16:01:35');
INSERT INTO `w_room_users` VALUES (28, 9, 1, 0, '2020-12-24 16:01:35', '2020-12-24 16:01:35');
INSERT INTO `w_room_users` VALUES (29, 9, 2, 0, '2020-12-24 16:01:35', '2020-12-24 16:01:35');
INSERT INTO `w_room_users` VALUES (30, 9, 3, 0, '2020-12-24 16:01:35', '2020-12-24 16:01:35');
INSERT INTO `w_room_users` VALUES (32, 10, 5, 1, '2020-12-24 17:19:29', '2020-12-24 17:19:29');
INSERT INTO `w_room_users` VALUES (33, 10, 1, 0, '2020-12-24 17:19:29', '2020-12-24 17:19:29');
INSERT INTO `w_room_users` VALUES (34, 10, 2, 0, '2020-12-24 17:19:29', '2020-12-24 17:19:29');
INSERT INTO `w_room_users` VALUES (35, 10, 3, 0, '2020-12-24 17:19:29', '2020-12-24 17:19:29');
INSERT INTO `w_room_users` VALUES (36, 2, 6, 0, '2020-12-28 14:17:34', '2020-12-28 14:17:34');
INSERT INTO `w_room_users` VALUES (37, 6, 5, 0, '2020-12-30 15:39:36', '2020-12-30 15:39:36');
INSERT INTO `w_room_users` VALUES (38, 6, 6, 0, '2020-12-30 15:39:36', '2020-12-30 15:39:36');
INSERT INTO `w_room_users` VALUES (39, 6, 7, 0, '2020-12-30 15:39:36', '2020-12-30 15:39:36');
INSERT INTO `w_room_users` VALUES (40, 6, 8, 0, '2020-12-30 15:39:36', '2020-12-30 15:39:36');
INSERT INTO `w_room_users` VALUES (41, 6, 9, 0, '2020-12-30 15:39:36', '2020-12-30 15:39:36');
INSERT INTO `w_room_users` VALUES (42, 11, 2, 1, '2020-12-30 15:44:22', '2020-12-30 15:44:22');
INSERT INTO `w_room_users` VALUES (43, 11, 6, 0, '2020-12-30 15:44:22', '2020-12-30 15:44:22');
INSERT INTO `w_room_users` VALUES (44, 11, 7, 0, '2020-12-30 15:44:22', '2020-12-30 15:44:22');
INSERT INTO `w_room_users` VALUES (45, 11, 8, 0, '2020-12-30 15:44:22', '2020-12-30 15:44:22');
INSERT INTO `w_room_users` VALUES (46, 11, 9, 0, '2020-12-30 15:44:22', '2020-12-30 15:44:22');
INSERT INTO `w_room_users` VALUES (47, 11, 4, 0, '2020-12-30 15:50:19', '2020-12-30 15:50:19');
INSERT INTO `w_room_users` VALUES (48, 10, 7, 0, '2020-12-31 14:25:37', '2020-12-31 14:25:37');
INSERT INTO `w_room_users` VALUES (49, 12, 2, 1, '2021-01-13 18:11:36', '2021-01-13 18:11:36');
INSERT INTO `w_room_users` VALUES (50, 12, 9, 0, '2021-01-13 18:11:36', '2021-01-13 18:11:36');
INSERT INTO `w_room_users` VALUES (51, 12, 7, 0, '2021-01-13 18:11:36', '2021-01-13 18:11:36');
INSERT INTO `w_room_users` VALUES (52, 12, 6, 0, '2021-01-13 18:11:36', '2021-01-13 18:11:36');
INSERT INTO `w_room_users` VALUES (53, 13, 7, 1, '2021-01-15 16:09:33', '2021-01-15 16:09:33');
INSERT INTO `w_room_users` VALUES (54, 13, 1, 0, '2021-01-15 16:09:34', '2021-01-15 16:09:34');
INSERT INTO `w_room_users` VALUES (55, 13, 3, 0, '2021-01-15 16:09:34', '2021-01-15 16:09:34');
INSERT INTO `w_room_users` VALUES (56, 14, 7, 1, '2021-01-15 16:09:34', '2021-01-15 16:09:34');
INSERT INTO `w_room_users` VALUES (57, 14, 1, 0, '2021-01-15 16:09:35', '2021-01-15 16:09:35');
INSERT INTO `w_room_users` VALUES (58, 14, 3, 0, '2021-01-15 16:09:35', '2021-01-15 16:09:35');
INSERT INTO `w_room_users` VALUES (59, 15, 4, 1, '2021-01-26 14:06:29', '2021-01-26 14:06:29');
INSERT INTO `w_room_users` VALUES (60, 15, 17, 0, '2021-01-26 14:06:29', '2021-01-26 14:06:29');
INSERT INTO `w_room_users` VALUES (61, 15, 3, 0, '2021-01-26 14:06:29', '2021-01-26 14:06:29');
INSERT INTO `w_room_users` VALUES (62, 15, 2, 0, '2021-01-26 14:06:29', '2021-01-26 14:06:29');
INSERT INTO `w_room_users` VALUES (63, 16, 17, 1, '2021-01-26 14:11:19', '2021-01-26 14:11:19');
INSERT INTO `w_room_users` VALUES (64, 16, 15, 0, '2021-01-26 14:11:19', '2021-01-26 14:11:19');
INSERT INTO `w_room_users` VALUES (65, 16, 16, 0, '2021-01-26 14:11:19', '2021-01-26 14:11:19');
INSERT INTO `w_room_users` VALUES (66, 16, 14, 0, '2021-01-26 14:11:19', '2021-01-26 14:11:19');
INSERT INTO `w_room_users` VALUES (67, 16, 3, 0, '2021-01-26 14:11:19', '2021-01-26 14:11:19');
INSERT INTO `w_room_users` VALUES (68, 10, 14, 0, '2021-01-26 14:21:21', '2021-01-26 14:21:21');
INSERT INTO `w_room_users` VALUES (69, 10, 15, 0, '2021-01-26 14:21:22', '2021-01-26 14:21:22');
INSERT INTO `w_room_users` VALUES (70, 16, 8, 0, '2021-01-26 14:30:13', '2021-01-26 14:30:13');
INSERT INTO `w_room_users` VALUES (71, 16, 5, 0, '2021-01-26 14:30:13', '2021-01-26 14:30:13');
INSERT INTO `w_room_users` VALUES (72, 16, 1, 0, '2021-01-26 14:30:13', '2021-01-26 14:30:13');

-- ----------------------------
-- Table structure for w_rooms
-- ----------------------------
DROP TABLE IF EXISTS `w_rooms`;
CREATE TABLE `w_rooms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '群组名',
  `room_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'http://gas.micyi.com/pics/images/group.png' COMMENT '群组图标',
  `user_cnt` int(11) NULL DEFAULT 0 COMMENT '用户数',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '聊天室' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_rooms
-- ----------------------------
INSERT INTO `w_rooms` VALUES (1, '聊一会儿吧', 'http://gas.micyi.com/pics/images/group.png', 3, '2020-12-16 16:55:41', '2020-12-22 18:38:47');
INSERT INTO `w_rooms` VALUES (2, '一二三四五', 'http://gas.micyi.com/pics/images/group.png', 3, '2020-12-16 16:56:02', '2020-12-30 15:20:14');
INSERT INTO `w_rooms` VALUES (5, '聊天群5', 'http://gas.micyi.com/pics/images/group.png', 4, '2020-12-24 15:37:19', '2020-12-24 15:37:19');
INSERT INTO `w_rooms` VALUES (6, '公司总群', 'http://gas.micyi.com/pics/images/group.png', 9, '2020-12-24 15:37:45', '2020-12-30 15:39:36');
INSERT INTO `w_rooms` VALUES (7, '聊天群7', 'http://gas.micyi.com/pics/images/group.png', 2, '2020-12-24 15:41:40', '2020-12-26 10:16:22');
INSERT INTO `w_rooms` VALUES (8, '聊天群8', 'http://gas.micyi.com/pics/images/group.png', 3, '2020-12-24 15:45:03', '2020-12-26 10:16:17');
INSERT INTO `w_rooms` VALUES (9, '聊天群9', 'http://gas.micyi.com/pics/images/group.png', 4, '2020-12-24 16:01:35', '2020-12-26 10:16:08');
INSERT INTO `w_rooms` VALUES (10, '聊天群10', 'http://gas.micyi.com/pics/images/group.png', 7, '2020-12-24 17:19:29', '2021-01-26 14:21:22');
INSERT INTO `w_rooms` VALUES (11, '新用户群', 'http://gas.micyi.com/pics/images/group.png', 6, '2020-12-30 15:44:22', '2020-12-30 15:50:19');
INSERT INTO `w_rooms` VALUES (12, '聊天群12', 'http://gas.micyi.com/pics/images/group.png', 4, '2021-01-13 18:11:35', '2021-01-13 18:11:36');
INSERT INTO `w_rooms` VALUES (13, '聊天群13', 'http://gas.micyi.com/pics/images/group.png', 3, '2021-01-15 16:09:33', '2021-01-15 16:09:33');
INSERT INTO `w_rooms` VALUES (14, '聊天群14', 'http://gas.micyi.com/pics/images/group.png', 3, '2021-01-15 16:09:34', '2021-01-15 16:09:34');
INSERT INTO `w_rooms` VALUES (15, '聊天群15', 'http://gas.micyi.com/pics/images/group.png', 4, '2021-01-26 14:06:29', '2021-01-26 14:06:29');
INSERT INTO `w_rooms` VALUES (16, '一二三四五上山打老虎', 'http://gas.micyi.com/pics/images/group.png', 8, '2021-01-26 14:11:19', '2021-01-26 14:30:41');

-- ----------------------------
-- Table structure for w_standards
-- ----------------------------
DROP TABLE IF EXISTS `w_standards`;
CREATE TABLE `w_standards`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '项目',
  `weight` int(11) NULL DEFAULT 0 COMMENT '权重',
  `standard` int(11) NULL DEFAULT 0 COMMENT '标准',
  `bonus` int(11) NULL DEFAULT 0 COMMENT '补贴金额',
  `real_data` int(11) NULL DEFAULT 0 COMMENT '实际数据',
  `result` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结果 0未通过 1通过',
  `std_type` tinyint(4) NULL DEFAULT 0 COMMENT '0 液化气 1自采暖 2经营许可 3考核记录 4事件处理 5消防设施 6 安全作业 7管理制度 8用气量 9评价',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标准' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_standards
-- ----------------------------
INSERT INTO `w_standards` VALUES (1, '项目1', 30, 100, 200, 0, NULL, 0, '2020-12-09 17:39:51', '2020-12-09 17:41:45');
INSERT INTO `w_standards` VALUES (2, '项目2', 30, 100, 100, 0, NULL, 0, '2020-12-11 17:13:20', '2020-12-11 17:13:20');
INSERT INTO `w_standards` VALUES (3, '项目3', 30, 300, 300, 0, NULL, 0, '2020-12-11 17:13:33', '2020-12-11 17:13:33');
INSERT INTO `w_standards` VALUES (4, '销售业绩', 20, 1000, 0, 0, NULL, 3, '2021-01-20 14:47:00', '2021-01-20 14:47:00');
INSERT INTO `w_standards` VALUES (5, '销售业绩', 20, 10000, 0, 0, NULL, 2, '2021-01-21 17:54:39', '2021-01-21 17:54:39');
INSERT INTO `w_standards` VALUES (6, '1', 1, 2, 0, 0, NULL, 2, '2021-01-22 10:08:14', '2021-01-22 10:08:14');
INSERT INTO `w_standards` VALUES (7, '处理速度', 20, 40, 0, 0, NULL, 4, '2021-01-22 11:41:08', '2021-01-28 16:28:29');
INSERT INTO `w_standards` VALUES (8, '123', 20, 40, 0, 0, NULL, 5, '2021-01-22 11:46:25', '2021-01-22 11:46:25');

-- ----------------------------
-- Table structure for w_station_exam_stds
-- ----------------------------
DROP TABLE IF EXISTS `w_station_exam_stds`;
CREATE TABLE `w_station_exam_stds`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_exam_id` int(11) NULL DEFAULT 0 COMMENT '考核id',
  `standard_id` int(11) NULL DEFAULT 0 COMMENT '标准id',
  `project` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '项目',
  `weight` int(11) NULL DEFAULT 0 COMMENT '权重',
  `standard` int(11) NULL DEFAULT 0 COMMENT '标准',
  `bonus` int(11) NULL DEFAULT 0 COMMENT '补贴金额',
  `real_data` int(11) NULL DEFAULT 0 COMMENT '实际数据',
  `real_bonus` int(11) NULL DEFAULT 0 COMMENT '实际补贴金额',
  `result` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结果 0未通过 1通过',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '考核项目结果' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_station_exam_stds
-- ----------------------------
INSERT INTO `w_station_exam_stds` VALUES (1, 31, 1, '项目1', 30, 100, 200, 0, 0, '0', '2021-01-19 17:47:23', '2021-01-19 17:47:23');
INSERT INTO `w_station_exam_stds` VALUES (2, 31, 2, '项目2', 30, 100, 100, 0, 0, '0', '2021-01-19 17:47:23', '2021-01-19 17:47:23');
INSERT INTO `w_station_exam_stds` VALUES (3, 31, 3, '项目3', 30, 300, 300, 0, 0, '0', '2021-01-19 17:47:23', '2021-01-19 17:47:23');
INSERT INTO `w_station_exam_stds` VALUES (4, 32, 1, '项目1', 30, 100, 200, 0, 0, '0', '2021-01-19 17:47:23', '2021-01-19 17:47:23');
INSERT INTO `w_station_exam_stds` VALUES (5, 32, 2, '项目2', 30, 100, 100, 0, 0, '0', '2021-01-19 17:47:23', '2021-01-19 17:47:23');
INSERT INTO `w_station_exam_stds` VALUES (6, 32, 3, '项目3', 30, 300, 300, 0, 0, '0', '2021-01-19 17:47:23', '2021-01-19 17:47:23');
INSERT INTO `w_station_exam_stds` VALUES (7, 33, 1, '项目1', 30, 100, 200, 0, 0, '0', '2021-01-19 17:47:23', '2021-01-19 17:47:23');
INSERT INTO `w_station_exam_stds` VALUES (8, 33, 2, '项目2', 30, 100, 100, 0, 0, '0', '2021-01-19 17:47:23', '2021-01-19 17:47:23');
INSERT INTO `w_station_exam_stds` VALUES (9, 33, 3, '项目3', 30, 300, 300, 0, 0, '0', '2021-01-19 17:47:23', '2021-01-19 17:47:23');
INSERT INTO `w_station_exam_stds` VALUES (10, 34, 1, '项目1', 30, 100, 200, 200, 100, '0', '2021-01-19 17:47:23', '2021-01-22 12:20:36');
INSERT INTO `w_station_exam_stds` VALUES (11, 34, 2, '项目2', 30, 100, 100, 200, 200, '0', '2021-01-19 17:47:23', '2021-01-22 12:20:36');
INSERT INTO `w_station_exam_stds` VALUES (12, 34, 3, '项目3', 30, 300, 300, 100, 0, '0', '2021-01-19 17:47:23', '2021-01-22 12:20:36');

-- ----------------------------
-- Table structure for w_station_exams
-- ----------------------------
DROP TABLE IF EXISTS `w_station_exams`;
CREATE TABLE `w_station_exams`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `period` tinyint(4) NULL DEFAULT 0 COMMENT '考核周期 0周 1月 2季 3年',
  `quarter` tinyint(4) NULL DEFAULT 0 COMMENT '季度 1,2,3,4',
  `station_id` int(11) NULL DEFAULT 0 COMMENT '站点id',
  `company_id` int(11) NULL DEFAULT 0 COMMENT '公司id',
  `score` int(11) NULL DEFAULT 0 COMMENT '评分',
  `exam_status` int(11) NULL DEFAULT 0 COMMENT '考核状态 0未考核 1已考核',
  `exam_date` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '考核时间',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `std_type` tinyint(4) NULL DEFAULT 0 COMMENT '0 液化气 1自采暖 2经营许可 3考核记录 4事件处理 5消防设施 6 安全作业 7管理制度 8用气量 9评价',
  `event_deal_cnt` int(11) NULL DEFAULT 0 COMMENT '事件处理数',
  `event_cnt` int(11) NULL DEFAULT 0 COMMENT '事件数',
  `event_per` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '事件完成率',
  `report_user_id` int(11) NULL DEFAULT 0 COMMENT '上报人id',
  `year` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '上报年',
  `report_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '上报时间',
  `manage_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理文件',
  `fire_num` int(11) NULL DEFAULT 0 COMMENT '消防设施数量',
  `fire_result` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消防合格率',
  `sec_ck_num` int(11) NULL DEFAULT 0 COMMENT '检查次数',
  `sec_ck_result` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '检查合格率',
  `sec_fix_num` int(11) NULL DEFAULT 0 COMMENT '维修次数',
  `sec_fix_result` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '维修合格率',
  `extras` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '扩展',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `consume` int(11) NULL DEFAULT 0 COMMENT '用量',
  `real_bonus` int(11) NULL DEFAULT 0 COMMENT '实际补贴金额',
  `effect_begin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '生效时间',
  `effect_end` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '失效时间',
  `begin_time` datetime(0) NULL DEFAULT NULL COMMENT '周期开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '周期结束时间',
  `final_time` datetime(0) NULL DEFAULT NULL COMMENT '上报截止时间',
  `report_status` tinyint(4) NULL DEFAULT 0 COMMENT '上报状态 0未上报 1已上报',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '场站考核' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_station_exams
-- ----------------------------
INSERT INTO `w_station_exams` VALUES (3, 0, 0, 1, 1, 0, 0, '0', NULL, 8, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 15:28:04', '2021-01-19 15:28:04', 0, 0, '', '', '2020-01-01 15:27:07', '2020-03-31 15:27:07', '2021-01-21 15:27:07', 0);
INSERT INTO `w_station_exams` VALUES (4, 0, 0, 1, 1, 0, 0, '2021-01-19', NULL, 8, 0, 0, '', 2, '2020', '2021-01-19 17:15:01', 'http://gas.micyi.com/pics/files/01_7788.jpg', 0, '', 0, '', 0, '', '', '2021-01-19 15:28:04', '2021-01-19 17:15:01', 16, 0, '', '', '2020-01-01 15:27:07', '2020-03-31 15:27:07', '2021-01-21 15:27:07', 1);
INSERT INTO `w_station_exams` VALUES (5, 0, 0, 3, 2, 0, 0, '0', NULL, 8, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 15:28:04', '2021-01-19 15:28:04', 0, 0, '', '', '2020-01-01 15:27:07', '2020-03-31 15:27:07', '2021-01-21 15:27:07', 0);
INSERT INTO `w_station_exams` VALUES (6, 0, 0, 4, 1, 0, 0, '0', NULL, 8, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 15:28:04', '2021-01-19 15:28:04', 0, 0, '', '', '2020-01-01 15:27:07', '2020-03-31 15:27:07', '2021-01-21 15:27:07', 0);
INSERT INTO `w_station_exams` VALUES (7, 0, 0, 1, 1, 0, 0, '0', NULL, 1, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:08:02', '2021-01-19 17:08:02', 0, 0, '', '', '2020-01-01 17:07:37', '2020-03-31 17:07:37', '2021-01-23 17:07:37', 0);
INSERT INTO `w_station_exams` VALUES (8, 0, 0, 2, 1, 0, 0, '2021-01-19', NULL, 1, 0, 0, '', 2, '2020', '2021-01-19 18:03:42', 'http://gas.micyi.com/pics/files/微信图片_20210119142416_5150.zip', NULL, '', NULL, '', NULL, '', '', '2021-01-19 17:08:02', '2021-01-19 18:03:42', 50, 0, '', '', '2020-01-01 17:07:37', '2020-03-31 17:07:37', '2021-01-23 17:07:37', 1);
INSERT INTO `w_station_exams` VALUES (9, 0, 0, 3, 2, 0, 0, '0', NULL, 1, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:08:02', '2021-01-19 17:08:02', 0, 0, '', '', '2020-01-01 17:07:37', '2020-03-31 17:07:37', '2021-01-23 17:07:37', 0);
INSERT INTO `w_station_exams` VALUES (10, 0, 0, 4, 1, 0, 0, '0', NULL, 1, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:08:02', '2021-01-19 17:08:02', 0, 0, '', '', '2020-01-01 17:07:37', '2020-03-31 17:07:37', '2021-01-23 17:07:37', 0);
INSERT INTO `w_station_exams` VALUES (11, 0, 0, 1, 1, 0, 0, '0', NULL, 1, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:08:49', '2021-01-19 17:08:49', 0, 0, '', '', '2020-04-01 17:08:04', '2020-06-30 17:08:04', '2021-01-31 17:08:04', 0);
INSERT INTO `w_station_exams` VALUES (12, 0, 0, 2, 1, 0, 0, '0', NULL, 1, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:08:49', '2021-01-19 17:08:49', 0, 0, '', '', '2020-04-01 17:08:04', '2020-06-30 17:08:04', '2021-01-31 17:08:04', 0);
INSERT INTO `w_station_exams` VALUES (13, 0, 0, 3, 2, 0, 0, '0', NULL, 1, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:08:49', '2021-01-19 17:08:49', 0, 0, '', '', '2020-04-01 17:08:04', '2020-06-30 17:08:04', '2021-01-31 17:08:04', 0);
INSERT INTO `w_station_exams` VALUES (14, 0, 0, 4, 1, 0, 0, '0', NULL, 1, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:08:49', '2021-01-19 17:08:49', 0, 0, '', '', '2020-04-01 17:08:04', '2020-06-30 17:08:04', '2021-01-31 17:08:04', 0);
INSERT INTO `w_station_exams` VALUES (15, 0, 0, 1, 1, 0, 0, '0', NULL, 5, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:09:32', '2021-01-19 17:09:32', 0, 0, '', '', '2020-01-01 17:09:11', '2020-03-31 17:09:11', '2021-01-31 17:09:11', 0);
INSERT INTO `w_station_exams` VALUES (16, 0, 0, 2, 1, 0, 0, '2021-01-19', NULL, 5, 0, 0, '', 2, '2020', '2021-01-19 18:02:14', 'http://gas.micyi.com/pics/files/微信图片_20210119142416_4464.zip', 20, '', NULL, '', NULL, '', '', '2021-01-19 17:09:32', '2021-01-19 18:02:14', NULL, 0, '', '', '2020-01-01 17:09:11', '2020-03-31 17:09:11', '2021-01-31 17:09:11', 1);
INSERT INTO `w_station_exams` VALUES (17, 0, 0, 3, 2, 0, 0, '0', NULL, 5, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:09:32', '2021-01-19 17:09:32', 0, 0, '', '', '2020-01-01 17:09:11', '2020-03-31 17:09:11', '2021-01-31 17:09:11', 0);
INSERT INTO `w_station_exams` VALUES (18, 0, 0, 4, 1, 0, 0, '0', NULL, 5, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:09:32', '2021-01-19 17:09:32', 0, 0, '', '', '2020-01-01 17:09:11', '2020-03-31 17:09:11', '2021-01-31 17:09:11', 0);
INSERT INTO `w_station_exams` VALUES (19, 0, 0, 1, 1, 0, 0, '0', NULL, 6, 0, 0, '', 0, '2021', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:09:51', '2021-01-19 17:09:51', 0, 0, '', '', '2020-01-01 17:09:36', '2020-03-31 17:09:36', '2021-01-31 17:09:36', 0);
INSERT INTO `w_station_exams` VALUES (20, 0, 0, 2, 1, 0, 0, '2021-01-20', NULL, 6, 0, 0, '', 2, '2021', '2021-01-01 00:00:00', 'http://gas.micyi.com/pics/files/微信图片_20210119142416_1970.zip', NULL, '', 5, '', 15, '', '', '2021-01-19 17:09:51', '2021-01-20 14:40:08', NULL, 0, '', '', '2020-01-01 17:09:36', '2020-03-31 17:09:36', '2021-01-31 17:09:36', 1);
INSERT INTO `w_station_exams` VALUES (21, 0, 0, 3, 2, 0, 0, '0', NULL, 6, 0, 0, '', 0, '2021', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:09:51', '2021-01-19 17:09:51', 0, 0, '', '', '2020-01-01 17:09:36', '2020-03-31 17:09:36', '2021-01-31 17:09:36', 0);
INSERT INTO `w_station_exams` VALUES (22, 0, 0, 4, 1, 0, 0, '0', NULL, 6, 0, 0, '', 0, '2021', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:09:51', '2021-01-19 17:09:51', 0, 0, '', '', '2020-01-01 17:09:36', '2020-03-31 17:09:36', '2021-01-31 17:09:36', 0);
INSERT INTO `w_station_exams` VALUES (23, 0, 0, 1, 1, 0, 0, '0', NULL, 7, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:10:25', '2021-01-19 17:10:25', 0, 0, '', '', '2020-01-01 17:09:59', '2020-03-31 17:09:59', '2021-01-31 17:09:59', 0);
INSERT INTO `w_station_exams` VALUES (24, 0, 0, 2, 1, 0, 0, '2021-01-20', NULL, 7, 0, 0, '', 2, '2020', '2020-01-01 00:00:00', 'http://gas.micyi.com/pics/files/微信图片_20210119142416_9769.zip', NULL, '', NULL, '', NULL, '', '', '2021-01-19 17:10:25', '2021-01-20 14:40:20', NULL, 0, '', '', '2020-01-01 17:09:59', '2020-03-31 17:09:59', '2021-01-31 17:09:59', 1);
INSERT INTO `w_station_exams` VALUES (25, 0, 0, 3, 2, 0, 0, '0', NULL, 7, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:10:25', '2021-01-19 17:10:25', 0, 0, '', '', '2020-01-01 17:09:59', '2020-03-31 17:09:59', '2021-01-31 17:09:59', 0);
INSERT INTO `w_station_exams` VALUES (26, 0, 0, 4, 1, 0, 0, '0', NULL, 7, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:10:25', '2021-01-19 17:10:25', 0, 0, '', '', '2020-01-01 17:09:59', '2020-03-31 17:09:59', '2021-01-31 17:09:59', 0);
INSERT INTO `w_station_exams` VALUES (27, 0, 0, 1, 1, 0, 0, '0', NULL, 8, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:19:59', '2021-01-19 17:19:59', 0, 0, '', '', '2021-04-01 17:19:39', '2020-04-30 17:19:39', '2021-01-23 17:19:39', 0);
INSERT INTO `w_station_exams` VALUES (28, 0, 0, 2, 1, 0, 0, '2021-01-19', NULL, 8, 0, 0, '', 2, '2020', '2021-01-19 17:20:35', 'http://gas.micyi.com/pics/files/01_5747.jpg', 0, '', 0, '', 0, '', '', '2021-01-19 17:19:59', '2021-01-19 17:20:35', 2000, 0, '', '', '2021-04-01 17:19:39', '2020-04-30 17:19:39', '2021-01-23 17:19:39', 1);
INSERT INTO `w_station_exams` VALUES (29, 0, 0, 3, 2, 0, 0, '0', NULL, 8, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:19:59', '2021-01-19 17:19:59', 0, 0, '', '', '2021-04-01 17:19:39', '2020-04-30 17:19:39', '2021-01-23 17:19:39', 0);
INSERT INTO `w_station_exams` VALUES (30, 0, 0, 4, 1, 0, 0, '0', NULL, 8, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:19:59', '2021-01-19 17:19:59', 0, 0, '', '', '2021-04-01 17:19:39', '2020-04-30 17:19:39', '2021-01-23 17:19:39', 0);
INSERT INTO `w_station_exams` VALUES (31, 0, 0, 1, 1, 0, 0, '0', NULL, 0, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:47:23', '2021-01-19 17:47:23', 0, 0, '', '', '2020-01-01 17:47:00', '2020-03-31 17:47:00', '2021-01-31 17:47:00', 0);
INSERT INTO `w_station_exams` VALUES (32, 0, 0, 2, 1, 0, 0, '0', NULL, 0, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:47:23', '2021-01-19 17:47:23', 0, 0, '', '', '2020-01-01 17:47:00', '2020-03-31 17:47:00', '2021-01-31 17:47:00', 0);
INSERT INTO `w_station_exams` VALUES (33, 0, 0, 3, 2, 0, 0, '0', NULL, 0, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:47:23', '2021-01-19 17:47:23', 0, 0, '', '', '2020-01-01 17:47:00', '2020-03-31 17:47:00', '2021-01-31 17:47:00', 0);
INSERT INTO `w_station_exams` VALUES (34, 0, 0, 4, 1, 0, 0, '2020-01-14', NULL, 0, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-19 17:47:23', '2021-01-20 14:41:23', 0, 300, '', '', '2020-01-01 17:47:00', '2020-03-31 17:47:00', '2021-01-31 17:47:00', 0);
INSERT INTO `w_station_exams` VALUES (35, 0, 0, 5, 0, 0, 0, '2021-01-20', NULL, 9, 0, 0, '', 0, '2021', '', '', 0, '', 0, '', 0, '', '', '2021-01-20 14:42:25', '2021-01-20 14:42:25', 0, 0, '', '', NULL, NULL, NULL, 0);
INSERT INTO `w_station_exams` VALUES (36, 0, 0, 1, 1, 0, 0, '0', NULL, 5, 0, 0, '', 0, '2021', '', '', 0, '', 0, '', 0, '', '', '2021-01-20 14:48:38', '2021-01-20 14:48:38', 0, 0, '', '', '2021-01-01 14:48:19', '2021-01-31 14:48:19', '2021-01-31 14:48:19', 0);
INSERT INTO `w_station_exams` VALUES (37, 0, 0, 2, 1, 0, 0, '2021-01-20', NULL, 5, 0, 0, '', 2, '2021', '2021-01-01 00:00:00', 'http://gas.micyi.com/pics/files/微信图片_20210119142416_4119.zip', 50, '', NULL, '', NULL, '', '', '2021-01-20 14:48:38', '2021-01-20 15:03:58', NULL, 0, '', '', '2021-01-01 14:48:19', '2021-01-31 14:48:19', '2021-01-31 14:48:19', 1);
INSERT INTO `w_station_exams` VALUES (38, 0, 0, 3, 2, 0, 0, '0', NULL, 5, 0, 0, '', 0, '2021', '', '', 0, '', 0, '', 0, '', '', '2021-01-20 14:48:38', '2021-01-20 14:48:38', 0, 0, '', '', '2021-01-01 14:48:19', '2021-01-31 14:48:19', '2021-01-31 14:48:19', 0);
INSERT INTO `w_station_exams` VALUES (39, 0, 0, 4, 1, 0, 0, '0', NULL, 5, 0, 0, '', 0, '2021', '', '', 0, '', 0, '', 0, '', '', '2021-01-20 14:48:38', '2021-01-20 14:48:38', 0, 0, '', '', '2021-01-01 14:48:19', '2021-01-31 14:48:19', '2021-01-31 14:48:19', 0);
INSERT INTO `w_station_exams` VALUES (40, 0, 0, 5, 3, 0, 0, '0', NULL, 5, 0, 0, '', 0, '2021', '', '', 0, '', 0, '', 0, '', '', '2021-01-20 14:48:38', '2021-01-20 14:48:38', 0, 0, '', '', '2021-01-01 14:48:19', '2021-01-31 14:48:19', '2021-01-31 14:48:19', 0);
INSERT INTO `w_station_exams` VALUES (41, 0, 0, 1, 1, 0, 0, '0', NULL, 5, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-20 14:49:01', '2021-01-20 14:49:01', 0, 0, '', '', '2020-04-01 14:48:40', '2020-07-02 14:48:40', '2021-01-31 14:48:40', 0);
INSERT INTO `w_station_exams` VALUES (42, 0, 0, 2, 1, 0, 0, '0', NULL, 5, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-20 14:49:01', '2021-01-20 14:49:01', 0, 0, '', '', '2020-04-01 14:48:40', '2020-07-02 14:48:40', '2021-01-31 14:48:40', 0);
INSERT INTO `w_station_exams` VALUES (43, 0, 0, 3, 2, 0, 0, '0', NULL, 5, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-20 14:49:01', '2021-01-20 14:49:01', 0, 0, '', '', '2020-04-01 14:48:40', '2020-07-02 14:48:40', '2021-01-31 14:48:40', 0);
INSERT INTO `w_station_exams` VALUES (44, 0, 0, 4, 1, 0, 0, '0', NULL, 5, 0, 0, '', 0, '2020', '', '', 0, '', 0, '', 0, '', '', '2021-01-20 14:49:01', '2021-01-20 14:49:01', 0, 0, '', '', '2020-04-01 14:48:40', '2020-07-02 14:48:40', '2021-01-31 14:48:40', 0);
INSERT INTO `w_station_exams` VALUES (45, 0, 0, 5, 3, 12, 0, '0000-01-01', NULL, 5, 0, 0, '', 0, '2020', '', '', 0, '20', 0, '', 0, '', '', '2021-01-20 14:49:01', '2021-01-22 11:46:03', 0, 0, '', '', '2020-04-01 14:48:40', '2020-07-02 14:48:40', '2021-01-31 14:48:40', 0);
INSERT INTO `w_station_exams` VALUES (46, 0, 0, 1, 1, 0, 0, '0', NULL, 1, 0, 0, '', 0, '2021', '', '', 0, '', 0, '', 0, '', '', '2021-01-27 14:29:31', '2021-01-27 14:29:31', 0, 0, '', '', '2021-01-01 14:29:24', '2021-01-27 14:29:24', '2021-01-27 14:29:24', 0);
INSERT INTO `w_station_exams` VALUES (47, 0, 0, 2, 1, 0, 0, '0', NULL, 1, 0, 0, '', 0, '2021', '', '', 0, '', 0, '', 0, '', '', '2021-01-27 14:29:31', '2021-01-27 14:29:31', 0, 0, '', '', '2021-01-01 14:29:24', '2021-01-27 14:29:24', '2021-01-27 14:29:24', 0);
INSERT INTO `w_station_exams` VALUES (48, 0, 0, 3, 2, 0, 0, '0', NULL, 1, 0, 0, '', 0, '2021', '', '', 0, '', 0, '', 0, '', '', '2021-01-27 14:29:31', '2021-01-27 14:29:31', 0, 0, '', '', '2021-01-01 14:29:24', '2021-01-27 14:29:24', '2021-01-27 14:29:24', 0);
INSERT INTO `w_station_exams` VALUES (49, 0, 0, 4, 1, 0, 0, '0', NULL, 1, 0, 0, '', 0, '2021', '', '', 0, '', 0, '', 0, '', '', '2021-01-27 14:29:31', '2021-01-27 14:29:31', 0, 0, '', '', '2021-01-01 14:29:24', '2021-01-27 14:29:24', '2021-01-27 14:29:24', 0);
INSERT INTO `w_station_exams` VALUES (50, 0, 0, 5, 3, 0, 0, '0', NULL, 1, 0, 0, '', 0, '2021', '', '', 0, '', 0, '', 0, '', '', '2021-01-27 14:29:31', '2021-01-27 14:29:31', 0, 0, '', '', '2021-01-01 14:29:24', '2021-01-27 14:29:24', '2021-01-27 14:29:24', 0);
INSERT INTO `w_station_exams` VALUES (51, 0, 0, 6, 3, 0, 0, '0', NULL, 1, 0, 0, '', 0, '2021', '', '', 0, '', 0, '', 0, '', '', '2021-01-27 14:29:31', '2021-01-27 14:29:31', 0, 0, '', '', '2021-01-01 14:29:24', '2021-01-27 14:29:24', '2021-01-27 14:29:24', 0);

-- ----------------------------
-- Table structure for w_stations
-- ----------------------------
DROP TABLE IF EXISTS `w_stations`;
CREATE TABLE `w_stations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '燃气站名',
  `company_id` int(11) NULL DEFAULT 0 COMMENT '所属公司id',
  `type` tinyint(4) NULL DEFAULT 0 COMMENT '0换瓶站, 1 LNG气站, 2 CNG气站',
  `store_gas` int(11) NULL DEFAULT 0 COMMENT '储气量',
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地址',
  `lng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '经度',
  `lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '纬度',
  `contact_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系人',
  `contact_user_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系人手机',
  `contact_user_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系人电话',
  `permit` tinyint(4) NULL DEFAULT 1 COMMENT '经营许可证',
  `permit_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '许可证编号',
  `permit_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经营许可证图片',
  `schedule` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值班信息',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `backup_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备案编号',
  `backup_company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '申报单位',
  `ck_status` tinyint(4) NULL DEFAULT 0 COMMENT '备案状态 0未审核 1已审核',
  `license` tinyint(4) NULL DEFAULT 1 COMMENT '营业执照',
  `license_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '营业执照编号',
  `license_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '营业执照图片',
  `device_ids` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '站点设备',
  `admin_user_id` int(11) NULL DEFAULT 0 COMMENT '人员分配id',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '燃气站' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_stations
-- ----------------------------
INSERT INTO `w_stations` VALUES (1, '昌平', 1, 1, 0, '深圳市福田区园博东街118', '114.010676', '22.543101', '233', '222', '1', 0, '111', NULL, NULL, NULL, '222', '2', 0, 1, '111', 'images/993e4cfa7a760dfb3a612f9744e96e7a.png', '', 2, '2020-12-04 17:08:12', '2020-12-14 18:11:58');
INSERT INTO `w_stations` VALUES (2, '大兴', 1, 0, 0, '深圳市福田区润田路28号-2', '114.020786', '22.552443', '333', '33', '333', 1, '3', 'images/c52d1fc1223cba23e36ad10268ac3f9b.png', '111\r\n222\r\n333\r\n111\r\n111\r\n111\r\n111', NULL, '3', '1', 0, 1, '3', '', '', 2, '2020-12-05 10:32:32', '2020-12-14 18:10:28');
INSERT INTO `w_stations` VALUES (3, '朝阳', 2, 2, 0, '深圳市福田区建业二路', '114.017768', '22.548337', '33', '33', NULL, 1, '3', NULL, NULL, NULL, '33', '2', 0, 1, '3', '', '', 2, '2020-12-05 15:54:51', '2020-12-05 15:54:51');
INSERT INTO `w_stations` VALUES (4, '南山', 1, 0, 0, '北京市西城区学院小街2号北京市第八中学', '116.36', '39.91', '张三', '13635555555', NULL, 0, '123456', NULL, NULL, NULL, '123456', '1', 0, 1, '123456', '', '', 9, '2021-01-14 10:34:23', '2021-01-22 11:35:48');
INSERT INTO `w_stations` VALUES (5, '这是站点名称', 3, 1, 12000, '大兴国际机场', '32.21', '24', '这是安全负责人', '17328700173', '17328700173', 1, '12345678', 'images/1572575b4b18b4a57fb59743c1dd904e.png', '这是值班信息', '这是备注信息', '12345678', '3', 0, 1, '12345678', 'images/bf9d71ca8d1a353e66d63cd4b1d8f4cd.png', '', 5, '2021-01-20 11:51:12', '2021-01-20 11:51:12');
INSERT INTO `w_stations` VALUES (6, '庞各庄站', 3, 1, 10000, '大兴国际机场', '32.21', '116.13', '这是安全负责人', '17328700173', '17328700173', 1, '12345678', NULL, NULL, NULL, '12345678', '3', 1, 1, '12345678', '', '', 3, '2021-01-21 15:54:24', '2021-01-21 15:54:24');

-- ----------------------------
-- Table structure for w_telescope_entries
-- ----------------------------
DROP TABLE IF EXISTS `w_telescope_entries`;
CREATE TABLE `w_telescope_entries`  (
  `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`sequence`) USING BTREE,
  UNIQUE INDEX `w_telescope_entries_uuid_unique`(`uuid`) USING BTREE,
  INDEX `w_telescope_entries_batch_id_index`(`batch_id`) USING BTREE,
  INDEX `w_telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`) USING BTREE,
  INDEX `w_telescope_entries_family_hash_index`(`family_hash`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_telescope_entries_tags
-- ----------------------------
DROP TABLE IF EXISTS `w_telescope_entries_tags`;
CREATE TABLE `w_telescope_entries_tags`  (
  `entry_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  INDEX `w_telescope_entries_tags_entry_uuid_tag_index`(`entry_uuid`, `tag`) USING BTREE,
  INDEX `w_telescope_entries_tags_tag_index`(`tag`) USING BTREE,
  CONSTRAINT `w_telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `w_telescope_entries` (`uuid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_telescope_monitoring
-- ----------------------------
DROP TABLE IF EXISTS `w_telescope_monitoring`;
CREATE TABLE `w_telescope_monitoring`  (
  `tag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_users
-- ----------------------------
DROP TABLE IF EXISTS `w_users`;
CREATE TABLE `w_users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(171) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for w_zones
-- ----------------------------
DROP TABLE IF EXISTS `w_zones`;
CREATE TABLE `w_zones`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '区域名称',
  `zone_range` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '区域范围',
  `station_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '站点',
  `station_names` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '站点名',
  `gas_type` tinyint(4) NULL DEFAULT 0 COMMENT '供气方式',
  `tube_length` int(11) NULL DEFAULT 0 COMMENT '管道长度',
  `cover_area` int(11) NULL DEFAULT 0 COMMENT '供气面积',
  `population` int(11) NULL DEFAULT 0 COMMENT '供气人口',
  `zone_status` tinyint(4) NULL DEFAULT 0 COMMENT '区域状态 0可用 1禁用',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '区域管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_zones
-- ----------------------------
INSERT INTO `w_zones` VALUES (1, '奥林匹克公园', '北五环，朝阳街，中关村', '1,2', '昌平,大兴', 1, 10, 1000, 2000, 1, '2020-12-05 15:15:57', '2020-12-05 15:58:54');
INSERT INTO `w_zones` VALUES (2, '这是区域名称', '这是供气区域范围', '5', '这是站点名称', 0, 1000, 100, 100, 0, '2021-01-20 11:57:21', '2021-01-20 11:57:21');

SET FOREIGN_KEY_CHECKS = 1;

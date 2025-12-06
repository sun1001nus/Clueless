/*
 Navicat Premium Dump SQL

 Source Server         : Javaweb
 Source Server Type    : MySQL
 Source Server Version : 80043 (8.0.43)
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 80043 (8.0.43)
 File Encoding         : 65001

 Date: 02/12/2025 19:40:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id` DESC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (21, '9', 0, '9');
INSERT INTO `item` VALUES (20, '90', 9, '9');
INSERT INTO `item` VALUES (19, '7', 8, '9');
INSERT INTO `item` VALUES (18, '5', 6, '7');
INSERT INTO `item` VALUES (17, '1', 1, '1');
INSERT INTO `item` VALUES (16, '6', 6, '6');
INSERT INTO `item` VALUES (15, '5', 6, '7');
INSERT INTO `item` VALUES (4, '台式电脑', 5000, '还行');
INSERT INTO `item` VALUES (3, 'rog', 10000, '可以');
INSERT INTO `item` VALUES (2, '外星人', 7000, '很好');
INSERT INTO `item` VALUES (1, '联想', 8000, '不错');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'sun', '0613', NULL, '2025-12-01 22:55:09');
INSERT INTO `user` VALUES (2, '1', '2', '', '2025-12-02 00:52:05');
INSERT INTO `user` VALUES (3, '2', '3', '', '2025-12-02 00:53:31');

SET FOREIGN_KEY_CHECKS = 1;

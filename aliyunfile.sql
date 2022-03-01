/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80000
 Source Host           : localhost:3306
 Source Schema         : aliyunfile

 Target Server Type    : MySQL
 Target Server Version : 80000
 File Encoding         : 65001

 Date: 17/09/2021 20:11:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for myfile
-- ----------------------------
DROP TABLE IF EXISTS `myfile`;
CREATE TABLE `myfile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oldfilename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `newfilename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` float(11, 1) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isimg` int(11) NULL DEFAULT 0,
  `downcounts` int(11) NULL DEFAULT 0,
  `uploadtime` datetime NULL DEFAULT NULL,
  `changetime` datetime NULL DEFAULT NULL,
  `ispublic` int(11) NULL DEFAULT 0,
  `iscollect` int(11) NULL DEFAULT 0,
  `isshare` int(11) NULL DEFAULT 0,
  `isrecycle` int(11) NULL DEFAULT 0,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `myfile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `space` float(11, 1) NULL DEFAULT 0.0,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `newavatarname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `regdate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Triggers structure for table myfile
-- ----------------------------
DROP TRIGGER IF EXISTS `setChangetime`;
delimiter ;;
CREATE TRIGGER `setChangetime` BEFORE UPDATE ON `myfile` FOR EACH ROW BEGIN
		
		SET new.changetime = now();

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

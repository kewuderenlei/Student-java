/*
 Navicat Premium Data Transfer

 Source Server         : dbd11
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : student

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 07/06/2020 18:01:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cla_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cla_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cla_name`(`cla_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '2001', '一班', NULL, NULL, NULL);
INSERT INTO `class` VALUES (2, '2002', '二班', NULL, NULL, NULL);
INSERT INTO `class` VALUES (3, '2003', '三班', NULL, NULL, NULL);
INSERT INTO `class` VALUES (4, '2004', '四班', NULL, NULL, NULL);
INSERT INTO `class` VALUES (5, '2005', '五班', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coll_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `coll_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `coll_name`(`coll_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES (1, '1001', '计算机学院', NULL, NULL, NULL);
INSERT INTO `college` VALUES (2, '1002', '外国语学院', NULL, NULL, NULL);
INSERT INTO `college` VALUES (3, '1003', '土木工程学院', NULL, NULL, NULL);
INSERT INTO `college` VALUES (41, '1004', '设计艺术系', NULL, NULL, NULL);
INSERT INTO `college` VALUES (45, '1005', '机械工程系', NULL, NULL, NULL);
INSERT INTO `college` VALUES (54, '1006', '软件工程学院', NULL, NULL, NULL);
INSERT INTO `college` VALUES (55, '1007', 'ghh', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c_teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c_term` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c_hours` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c_credit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '3001', '高数', 't1001', '2018-2019(1)', '20', '笔试', '5');
INSERT INTO `course` VALUES (2, '3002', 'JavaWeb', 't1001', '2018-2019(1)', '20', '上机', '5');
INSERT INTO `course` VALUES (3, '3003', '专业英语', 't1003', '2018-2019(1)', '20', '笔试', '5');
INSERT INTO `course` VALUES (4, '3004', '云计算', 't1002', '2018-2019(1)', '20', '笔试', '5');
INSERT INTO `course` VALUES (5, '3005', '软件工程', 't1002', '2018-2019(1)', '20', '笔试', '5');
INSERT INTO `course` VALUES (6, '3006', 'C语言', 't1003', '2018-2019(1)', '20', '笔试', '5');
INSERT INTO `course` VALUES (7, '3007', 'java', 't1004', '2018-2019(1)', '20', '上机', '5');
INSERT INTO `course` VALUES (8, '3008', '项目管理', 't1005', '2019-2020(1)', '10', '笔试', '5');
INSERT INTO `course` VALUES (9, '3009', 'HTML5', 't1004', '2019-2020(1)', '15', '上机', '5');
INSERT INTO `course` VALUES (10, '3010', '数据结构', 't1005', '2019-2020(1)', '20', '笔试', '5');
INSERT INTO `course` VALUES (11, '3011', '计算机网络', 't1006', '2019-2020(1)', '20', '上机', '5');
INSERT INTO `course` VALUES (12, '3012', '数据库原理', 't1007', '2019-2020(1)', '20', '笔试', '5');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `p_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `p_name`(`p_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, 'p1001', '教务主任');
INSERT INTO `position` VALUES (2, 'p1002', '英语老师');
INSERT INTO `position` VALUES (3, 'p1003', '数学老师');
INSERT INTO `position` VALUES (4, 'p1004', '体育老师');
INSERT INTO `position` VALUES (5, 'p1005', '音乐老师');

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '已选',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES (1, '1621111101', '3001', '已选');
INSERT INTO `sc` VALUES (2, '1621111101', '3003', '已选');
INSERT INTO `sc` VALUES (3, '1621111101', '3005', '已选');
INSERT INTO `sc` VALUES (4, '1621111101', '3007', '已选');
INSERT INTO `sc` VALUES (5, '1621111102', '3004', '已选');
INSERT INTO `sc` VALUES (6, '1621111102', '3003', '已选');
INSERT INTO `sc` VALUES (7, '1621111102', '3006', '已选');
INSERT INTO `sc` VALUES (8, '1621111103', '3001', '已选');
INSERT INTO `sc` VALUES (9, '1621111103', '3002', '已选');
INSERT INTO `sc` VALUES (10, '1621111103', '3003', '已选');
INSERT INTO `sc` VALUES (11, '1621111101', '3002', '已选');
INSERT INTO `sc` VALUES (16, '1621111107', '3001', '已选');
INSERT INTO `sc` VALUES (17, '1621111107', '3002', '已选');
INSERT INTO `sc` VALUES (18, '1621111107', '3010', '已选');
INSERT INTO `sc` VALUES (19, '1621111107', '3011', '已选');
INSERT INTO `sc` VALUES (20, '1621111105', '3008', '已选');
INSERT INTO `sc` VALUES (21, '1621111105', '3010', '已选');
INSERT INTO `sc` VALUES (22, '1621111105', '3011', '已选');
INSERT INTO `sc` VALUES (23, '1621111106', '3008', '已选');
INSERT INTO `sc` VALUES (24, '1621111106', '3012', '已选');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c_no` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `term` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `t_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES (1, '1621111101', '3001', 't201801', '77', 't1001', NULL, NULL, NULL);
INSERT INTO `score` VALUES (2, '1621111101', '3002', 't201802', '66', 't1001', NULL, NULL, NULL);
INSERT INTO `score` VALUES (3, '1621111103', '3001', 't201801', '55', 't1002', NULL, NULL, NULL);
INSERT INTO `score` VALUES (4, '1621111102', '3001', 't201801', '85', 't1001', NULL, NULL, NULL);
INSERT INTO `score` VALUES (5, '1621111102', '3002', 't201802', '74', 't1001', NULL, NULL, NULL);
INSERT INTO `score` VALUES (7, '1621111107', '3001', 't201801', '', 't1001', NULL, NULL, NULL);
INSERT INTO `score` VALUES (8, '1621111107', '3002', 't201801', '', 't1001', NULL, NULL, NULL);
INSERT INTO `score` VALUES (9, '1621111107', '3010', 't201901', '', 't1005', NULL, NULL, NULL);
INSERT INTO `score` VALUES (10, '1621111107', '3011', 't201901', '', 't1006', NULL, NULL, NULL);
INSERT INTO `score` VALUES (11, '1621111105', '3008', 't201901', '66', 't1005', NULL, NULL, NULL);
INSERT INTO `score` VALUES (12, '1621111105', '3010', 't201901', '', 't1005', NULL, NULL, NULL);
INSERT INTO `score` VALUES (13, '1621111105', '3011', 't201901', '', 't1006', NULL, NULL, NULL);
INSERT INTO `score` VALUES (14, '1621111106', '3008', 't201901', '0', 't1005', NULL, NULL, NULL);
INSERT INTO `score` VALUES (15, '1621111106', '3012', 't201901', '', 't1007', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for term
-- ----------------------------
DROP TABLE IF EXISTS `term`;
CREATE TABLE `term`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `t_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of term
-- ----------------------------
INSERT INTO `term` VALUES (1, 't201801', '2018-2019(1)');
INSERT INTO `term` VALUES (2, 't201802', '2018-2019(2)');
INSERT INTO `term` VALUES (3, 't201901', '2019-2020(1)');
INSERT INTO `term` VALUES (4, 't201902', '2019-2020(2)');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `t_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_name`(`t_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '0', '教师', NULL, NULL);
INSERT INTO `type` VALUES (2, '1', '学生', NULL, NULL);
INSERT INTO `type` VALUES (3, '2', '管理员', NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `acc_id`(`acc_id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `pwd`(`pwd`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1621111101', '下水道', '123456', '1', NULL, NULL, NULL);
INSERT INTO `user` VALUES (2, '1621111102', '排气管', '123456', '1', NULL, NULL, NULL);
INSERT INTO `user` VALUES (3, 't1001', '周杰伦', '123456', '0', NULL, NULL, NULL);
INSERT INTO `user` VALUES (4, 't1002', '郭靖', '123456', '0', NULL, NULL, NULL);
INSERT INTO `user` VALUES (5, '1621111103', '备胎', '123456', '1', NULL, NULL, NULL);
INSERT INTO `user` VALUES (6, '1621111104', '黄飞鸿', '123456', '1', NULL, NULL, NULL);
INSERT INTO `user` VALUES (7, 't1003', '林俊杰', '123456', '0', NULL, NULL, NULL);
INSERT INTO `user` VALUES (8, 't1004', '蔡依林', '123456', '0', NULL, NULL, NULL);
INSERT INTO `user` VALUES (9, 'a1001', 'admin', 'admin', '2', NULL, NULL, NULL);
INSERT INTO `user` VALUES (10, '1621111105', '江疏影', '123456', '1', NULL, NULL, NULL);
INSERT INTO `user` VALUES (11, '1621111106', '刘若英', '123456', '1', NULL, NULL, NULL);
INSERT INTO `user` VALUES (13, 't1005', '谭咏麟', '123456', '0', NULL, NULL, NULL);
INSERT INTO `user` VALUES (15, 't1006', '张学友', '123456', '0', NULL, NULL, NULL);
INSERT INTO `user` VALUES (16, 't1007', '韩红', '123456', '0', NULL, NULL, NULL);
INSERT INTO `user` VALUES (17, '1621111107', '杨幂', '123456', '1', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_admin
-- ----------------------------
DROP TABLE IF EXISTS `user_admin`;
CREATE TABLE `user_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ad_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ad_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ad_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ad_age` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ad_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ad_name`(`ad_name`) USING BTREE,
  INDEX `ad_pwd`(`ad_pwd`) USING BTREE,
  INDEX `ad_no`(`ad_no`) USING BTREE,
  CONSTRAINT `ad_name` FOREIGN KEY (`ad_name`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ad_no` FOREIGN KEY (`ad_no`) REFERENCES `user` (`acc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ad_pwd` FOREIGN KEY (`ad_pwd`) REFERENCES `user` (`pwd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_admin
-- ----------------------------
INSERT INTO `user_admin` VALUES (1, 'a1001', 'admin', 'admin', '男', '25', '管理员', NULL);

-- ----------------------------
-- Table structure for user_stu
-- ----------------------------
DROP TABLE IF EXISTS `user_stu`;
CREATE TABLE `user_stu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cla_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `coll_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `head` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '123456',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '学生',
  `age` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `credit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `pwd`(`pwd`) USING BTREE,
  INDEX `cla_name`(`cla_name`) USING BTREE,
  INDEX `coll_name`(`coll_name`) USING BTREE,
  INDEX `t_name`(`type`) USING BTREE,
  CONSTRAINT `cla_name` FOREIGN KEY (`cla_name`) REFERENCES `class` (`cla_name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `coll_name` FOREIGN KEY (`coll_name`) REFERENCES `college` (`coll_name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `name` FOREIGN KEY (`name`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pwd` FOREIGN KEY (`pwd`) REFERENCES `user` (`pwd`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_name` FOREIGN KEY (`type`) REFERENCES `type` (`t_name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`acc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_stu
-- ----------------------------
INSERT INTO `user_stu` VALUES (11, '1621111101', '下水道', '二班', '计算机学院', '男', NULL, '123456', '学生', '20', '福建省厦门市', '10', NULL);
INSERT INTO `user_stu` VALUES (12, '1621111102', '排气管', '三班', '设计艺术系', '男', NULL, '123456', '学生', '15', '福建省厦门市', '10', NULL);
INSERT INTO `user_stu` VALUES (13, '1621111103', '备胎', '一班', '机械工程系', '女', NULL, '123456', '学生', '18', '福建省厦门市', '10', NULL);
INSERT INTO `user_stu` VALUES (14, '1621111104', '黄飞鸿', '三班', '软件工程学院', '男', NULL, '123456', '学生', '20', '福建省厦门市', '10', NULL);
INSERT INTO `user_stu` VALUES (15, '1621111105', '江疏影', '二班', '计算机学院', '女', NULL, '123456', '学生', '19', '福建省厦门市', '10', NULL);
INSERT INTO `user_stu` VALUES (16, '1621111106', '刘若英', '二班', '外国语学院', '女', NULL, '123456', '学生', '18', '福建省厦门市', '10', NULL);
INSERT INTO `user_stu` VALUES (17, '1621111107', '杨幂', '三班', '外国语学院', '女', NULL, '123456', '学生', '25', '福建省厦门市', '0', NULL);

-- ----------------------------
-- Table structure for user_tea
-- ----------------------------
DROP TABLE IF EXISTS `user_tea`;
CREATE TABLE `user_tea`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tea_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tea_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tea_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tea_age` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tea_set` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tea_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '教师',
  `head` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '123456',
  `attr1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `attr5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tid`(`tea_id`) USING BTREE,
  INDEX `tname`(`tea_name`) USING BTREE,
  INDEX `tpwd`(`pwd`) USING BTREE,
  INDEX `tea_set`(`tea_set`) USING BTREE,
  CONSTRAINT `tea_id` FOREIGN KEY (`tea_id`) REFERENCES `user` (`acc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tea_set` FOREIGN KEY (`tea_set`) REFERENCES `position` (`p_name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `tname` FOREIGN KEY (`tea_name`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tpwd` FOREIGN KEY (`pwd`) REFERENCES `user` (`pwd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_tea
-- ----------------------------
INSERT INTO `user_tea` VALUES (10, 't1001', '周杰伦', '男', '30', '英语老师', '15210415210', '教师', NULL, '123456', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_tea` VALUES (11, 't1002', '郭靖', '男', '35', '数学老师', '15210415211', '教师', NULL, '123456', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_tea` VALUES (12, 't1003', '林俊杰', '男', '30', '体育老师', '15210415212', '教师', NULL, '123456', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_tea` VALUES (13, 't1004', '蔡依林', '女', '35', '音乐老师', '15210415213', '教师', NULL, '123456', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_tea` VALUES (14, 't1005', '谭咏麟', '男', '42', '音乐老师', '15210415214', '教师', NULL, '123456', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_tea` VALUES (15, 't1006', '张学友', '男', '45', '教务主任', '15210415215', '教师', NULL, '123456', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_tea` VALUES (16, 't1007', '韩红', '女', '35', '数学老师', '15210415216', '教师', NULL, '123456', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- View structure for cc_view
-- ----------------------------
DROP VIEW IF EXISTS `cc_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `cc_view` AS select `e`.`name` AS `s_name`,`d`.`c_no` AS `c_no`,`a`.`c_term` AS `c_term`,`a`.`c_name` AS `c_name`,`b`.`tea_name` AS `tea_name`,`a`.`c_hours` AS `c_hours`,`a`.`c_credit` AS `c_credit`,`a`.`c_type` AS `c_type`,`d`.`c_status` AS `c_status`,`d`.`s_no` AS `s_no` from ((((`course` `a` join `user_tea` `b`) join `class` `c`) join `sc` `d`) join `user_stu` `e`) where ((`d`.`c_no` = `a`.`c_no`) and (`a`.`c_teacher` = `b`.`tea_id`) and (`e`.`uid` = `d`.`s_no`) and (`a`.`c_teacher` = `b`.`tea_id`));

-- ----------------------------
-- View structure for mystu_view
-- ----------------------------
DROP VIEW IF EXISTS `mystu_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `mystu_view` AS select `c`.`name` AS `name`,`c`.`uid` AS `uid`,`b`.`c_name` AS `c_name`,`b`.`c_term` AS `c_term`,`d`.`tea_id` AS `tea_id`,`d`.`tea_name` AS `tea_name` from (((`sc` `a` join `course` `b`) join `user_stu` `c`) join `user_tea` `d`) where ((`a`.`s_no` = `c`.`uid`) and (`a`.`c_no` = `b`.`c_no`) and (`d`.`tea_id` = `b`.`c_teacher`));

-- ----------------------------
-- View structure for sc_view
-- ----------------------------
DROP VIEW IF EXISTS `sc_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `sc_view` AS select `sc`.`s_no` AS `s_no`,`user_stu`.`name` AS `s_name`,`course`.`c_term` AS `c_term`,`course`.`c_name` AS `c_name`,`user_tea`.`tea_name` AS `tea_name`,`course`.`c_hours` AS `c_hours`,`course`.`c_credit` AS `c_credit`,`course`.`c_type` AS `c_type`,`sc`.`c_status` AS `c_status` from (((`sc` join `course`) join `user_tea`) join `user_stu`) where ((`course`.`c_no` = `sc`.`c_no`) and (`course`.`c_teacher` = `user_tea`.`tea_id`) and (`sc`.`s_no` = `user_stu`.`uid`));

-- ----------------------------
-- View structure for ss_view
-- ----------------------------
DROP VIEW IF EXISTS `ss_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `ss_view` AS select `a`.`uid` AS `s_no`,`a`.`name` AS `s_name`,`e`.`t_no` AS `t_no`,`e`.`t_name` AS `t_name`,`b`.`c_no` AS `c_no`,`a`.`cla_name` AS `cla_name`,`b`.`c_name` AS `c_name`,`c`.`tea_id` AS `tea_id`,`c`.`tea_name` AS `tea_name`,`b`.`c_hours` AS `c_hours`,`b`.`c_credit` AS `c_credit`,`b`.`c_type` AS `c_type`,`d`.`score` AS `score` from ((((`user_stu` `a` join `course` `b`) join `user_tea` `c`) join `score` `d`) join `term` `e`) where ((`d`.`s_no` = `a`.`uid`) and (`d`.`c_no` = `b`.`c_no`) and (`d`.`term` = `e`.`t_no`) and (`d`.`t_no` = `c`.`tea_id`));

-- ----------------------------
-- View structure for tc_view
-- ----------------------------
DROP VIEW IF EXISTS `tc_view`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `tc_view` AS select `b`.`tea_id` AS `tea_id`,`a`.`c_no` AS `c_no`,`a`.`c_term` AS `c_term`,`a`.`c_type` AS `c_type`,`a`.`c_name` AS `c_name`,`a`.`c_hours` AS `c_hours`,`a`.`c_credit` AS `c_credit`,`b`.`tea_name` AS `tea_name` from (`course` `a` join `user_tea` `b`) where (`a`.`c_teacher` = `b`.`tea_id`);

SET FOREIGN_KEY_CHECKS = 1;

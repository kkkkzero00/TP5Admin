/*
Navicat MySQL Data Transfer

Source Server         : alicloud
Source Server Version : 50719
Source Host           : 112.74.43.247:3306
Source Database       : hyadmin

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-03-06 17:51:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hy_article
-- ----------------------------
DROP TABLE IF EXISTS `hy_article`;
CREATE TABLE `hy_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_article
-- ----------------------------
INSERT INTO `hy_article` VALUES ('1', 'set', 'hjk123', '1', '3', '1504877544', null);
INSERT INTO `hy_article` VALUES ('2', 'time', '123sfsd', '1', '3', '1504877544', null);
INSERT INTO `hy_article` VALUES ('4', 'out', 'weqw', '1', '4', '1504877544', null);
INSERT INTO `hy_article` VALUES ('5', 'jessic', 'ewrwer', '1', '4', '1504877544', null);
INSERT INTO `hy_article` VALUES ('6', 'U N I 222', '2t4353f', '1', '2', '141345354', null);
INSERT INTO `hy_article` VALUES ('7', 'U N I 222', '214fd', '1', '2', '141345354', null);
INSERT INTO `hy_article` VALUES ('8', 'U N I 222', 'erer', '1', '2', '141345354', null);
INSERT INTO `hy_article` VALUES ('9', 'Katy Perry1', 'wwwww', '1', '5', '1499829816', null);
INSERT INTO `hy_article` VALUES ('10', 'Katy Perry2', 'wwwww', '1', '5', '1499829816', null);
INSERT INTO `hy_article` VALUES ('11', 'Katy Perry3', 'wwwww', '1', '5', '1499829816', null);
INSERT INTO `hy_article` VALUES ('12', 'Bebe', '123123131', '1', '6', '1499829816', null);
INSERT INTO `hy_article` VALUES ('13', 'Bebe', '34234', '1', '6', '1499829816', null);
INSERT INTO `hy_article` VALUES ('14', 'love galore', null, '1', '41', '1508387442', null);
INSERT INTO `hy_article` VALUES ('15', 'love galore2', null, '1', '214', '1512396242', null);
INSERT INTO `hy_article` VALUES ('16', 'love galore2', null, '1', '215', '1512396260', null);
INSERT INTO `hy_article` VALUES ('17', 'love galore2', null, '1', '216', '1512396349', null);
INSERT INTO `hy_article` VALUES ('18', 'love galore2', null, '1', '217', '1512396372', null);
INSERT INTO `hy_article` VALUES ('19', 'love galore2', null, '1', '218', '1512396469', null);
INSERT INTO `hy_article` VALUES ('20', 'love galore2', null, '1', '219', '1512396528', null);
INSERT INTO `hy_article` VALUES ('21', 'love galore2', null, '1', '220', '1512396654', null);
INSERT INTO `hy_article` VALUES ('22', 'U N I 222', null, '1', '221', '1512621712', null);
INSERT INTO `hy_article` VALUES ('23', 'U N I', null, '1', '222', '1512622541', null);
INSERT INTO `hy_article` VALUES ('24', null, null, '1', '223', '1512736587', null);

-- ----------------------------
-- Table structure for hy_card
-- ----------------------------
DROP TABLE IF EXISTS `hy_card`;
CREATE TABLE `hy_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_card
-- ----------------------------
INSERT INTO `hy_card` VALUES ('1', 'card3', '1');
INSERT INTO `hy_card` VALUES ('2', 'link', '2');
INSERT INTO `hy_card` VALUES ('3', 'dita', '2');
INSERT INTO `hy_card` VALUES ('4', 'Jolin', '2');
INSERT INTO `hy_card` VALUES ('5', 'Katy', '1');

-- ----------------------------
-- Table structure for hy_frame_access
-- ----------------------------
DROP TABLE IF EXISTS `hy_frame_access`;
CREATE TABLE `hy_frame_access` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_frame_access
-- ----------------------------
INSERT INTO `hy_frame_access` VALUES ('1', '1');
INSERT INTO `hy_frame_access` VALUES ('1', '2');
INSERT INTO `hy_frame_access` VALUES ('1', '3');
INSERT INTO `hy_frame_access` VALUES ('2', '3');
INSERT INTO `hy_frame_access` VALUES ('2', '2');

-- ----------------------------
-- Table structure for hy_frame_file
-- ----------------------------
DROP TABLE IF EXISTS `hy_frame_file`;
CREATE TABLE `hy_frame_file` (
  `id` int(11) NOT NULL,
  `name` char(255) NOT NULL DEFAULT '',
  `savename` char(255) NOT NULL DEFAULT '',
  `savepath` char(255) NOT NULL DEFAULT '',
  `ext` char(5) NOT NULL DEFAULT '',
  `mime` char(255) NOT NULL DEFAULT '',
  `size` int(11) unsigned NOT NULL DEFAULT '0',
  `md5` char(32) NOT NULL DEFAULT '',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`location`),
  UNIQUE KEY `uk_md5` (`md5`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_frame_file
-- ----------------------------

-- ----------------------------
-- Table structure for hy_frame_role
-- ----------------------------
DROP TABLE IF EXISTS `hy_frame_role`;
CREATE TABLE `hy_frame_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `rules` varchar(3000) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_frame_role
-- ----------------------------
INSERT INTO `hy_frame_role` VALUES ('1', '超级管理员', 'all', null, '1');
INSERT INTO `hy_frame_role` VALUES ('2', '管理员', '1,1000,2000,2100,2101,2102,2103,2104,2105,2106,2200,2201,2202,2203', null, '1');
INSERT INTO `hy_frame_role` VALUES ('3', '老师', '1,1000,2000,2100,2101,2102,2103,2104,2105,2106', null, '1');
INSERT INTO `hy_frame_role` VALUES ('4', '学生', '1,1000,2000,2100,2101,2102,2103', null, '1');

-- ----------------------------
-- Table structure for hy_frame_rule
-- ----------------------------
DROP TABLE IF EXISTS `hy_frame_rule`;
CREATE TABLE `hy_frame_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `method` int(255) DEFAULT NULL COMMENT '1是 get,2是post,3是put,4是delete',
  `domain` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `https` int(10) DEFAULT '0' COMMENT '0关闭https的检测，1开启',
  `cache` int(10) DEFAULT '0' COMMENT '0为关闭检测，有数值就开启缓存支持',
  `ajax` int(10) DEFAULT '0' COMMENT '0为关闭，1为启动',
  `status` int(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_frame_rule
-- ----------------------------
INSERT INTO `hy_frame_rule` VALUES ('1', '1000', '主页', 'system', null, 'Admin/Index', null, 'admin/System.Index/lndex', '1', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2', '1000', '登录', 'system', null, 'Login', null, 'admin/System.Account/login', '2', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('3', '1000', '切换权限', 'system', null, 'Switch', null, 'admin/System.Account/switchAuth', '1', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('1000', '0', '公共部分路由', null, null, null, null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2000', '0', '用户信息', 'nav', null, null, null, null, null, null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2100', '2000', '用户信息管理', 'menu', null, 'User/User', null, 'admin/User.User/index', '1', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2101', '2100', '列表', 'url', null, 'User/User', 'lists', 'admin/User.User/lists', '1', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2102', '2100', '读取', 'url', null, 'User/User', ':id/read', 'admin/User.User/read', '1', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2103', '2100', '编辑', 'url', null, 'User/User', ':id/edit', 'admin/User.User/edit', '1', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2104', '2100', '新增', 'url', null, 'User/User', null, 'admin/User.User/insert', '2', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2105', '2100', '更新', 'url', null, 'User/User', ':id', 'admin/User.User/update', '3', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2106', '2100', '删除', 'url', null, 'User/User', ':id', 'admin/User.User/delete', '4', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2200', '2000', '学生信息管理', 'menu', null, 'User/Student', null, 'admin/Student.User/index', '1', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2201', '2200', '列表', 'url', null, 'User/Student', 'lists', 'admin/User.Student/lists', '1', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2202', '2200', '读取', 'url', null, 'User/Student', ':id/read', 'admin/User.Student/read', '1', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2203', '2200', '新增', 'url', null, 'User/Student', null, 'admin/User.Student/insert', '2', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('3000', '0', '系统管理', 'system', null, '', null, '', null, null, null, '0', '0', '0', '1');

-- ----------------------------
-- Table structure for hy_user
-- ----------------------------
DROP TABLE IF EXISTS `hy_user`;
CREATE TABLE `hy_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthday` int(11) DEFAULT NULL,
  `qq` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `login_last_time` int(11) DEFAULT NULL,
  `login_times` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `phone` varchar(255) DEFAULT NULL,
  `avatar_id` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_user
-- ----------------------------
INSERT INTO `hy_user` VALUES ('2', 'hjk2', '123123', '456', '1', '2', null, null, '347756896@qq.com', null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('4', 'hjk4', '123123', '234', '2', '2', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('7', 'hjk', null, null, null, '2', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('8', 'hjk', null, null, null, '2', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('9', 'hjk', null, null, null, '2', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('10', 'hjk', null, null, null, '2', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('11', 'hjk', null, null, null, '2', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('12', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('13', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('14', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('15', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('16', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('17', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('18', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('19', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1243534532');
INSERT INTO `hy_user` VALUES ('20', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1243534532');
INSERT INTO `hy_user` VALUES ('21', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1243534532');
INSERT INTO `hy_user` VALUES ('22', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1243534532');
INSERT INTO `hy_user` VALUES ('23', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1243534532');
INSERT INTO `hy_user` VALUES ('24', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('25', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('26', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('27', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('28', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1507816114');
INSERT INTO `hy_user` VALUES ('29', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1508335706');
INSERT INTO `hy_user` VALUES ('30', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1508335719');
INSERT INTO `hy_user` VALUES ('31', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1508382462');
INSERT INTO `hy_user` VALUES ('32', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1508382462');
INSERT INTO `hy_user` VALUES ('33', null, null, null, null, null, null, null, null, null, null, '1', null, null, null, '1508382463');
INSERT INTO `hy_user` VALUES ('34', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1508382525');
INSERT INTO `hy_user` VALUES ('35', null, null, null, null, null, null, null, null, null, null, '1', null, null, null, '1508382527');
INSERT INTO `hy_user` VALUES ('36', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1508382537');
INSERT INTO `hy_user` VALUES ('37', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1508382565');
INSERT INTO `hy_user` VALUES ('38', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1508382812');
INSERT INTO `hy_user` VALUES ('39', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1508382834');
INSERT INTO `hy_user` VALUES ('40', 'hjk', null, null, null, '1', null, null, null, null, null, '1', null, null, null, '1508382844');
INSERT INTO `hy_user` VALUES ('41', 'SZA', null, null, null, '4', null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('123', 'hjk', '123123', '123', null, '1', null, null, null, '1508849549', '10', '1', null, null, 'e4521k6ca1i2ek5vuf9qao51d5', null);
INSERT INTO `hy_user` VALUES ('213', 'hjk6', '2321', '213', null, '2', null, null, null, '1511076607', '81', '1', null, null, 'f09rf19l3o2halgvqdp4ve0hd1', null);
INSERT INTO `hy_user` VALUES ('214', 'hjk', null, null, null, '1', null, null, '347756896@qq.com', null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('215', 'hjk', null, null, null, '1', null, null, '347756896@qq.com', null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('216', 'hjk', null, null, null, '1', null, null, '347756896@qq.com', null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('218', 'hjk', null, null, null, '1', null, null, '347756896@qq.com', null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('219', 'hjk', null, null, null, '1', null, null, '347756896@qq.com', null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('220', 'hjk', null, null, null, '1', null, null, '347756896@qq.com', null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('221', 'hjk45', null, null, null, '2', null, null, '347756896@qq.com', null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('222', 'hjk2', null, null, null, '2', null, null, '347756896@qq.com', null, null, '1', null, null, null, null);
INSERT INTO `hy_user` VALUES ('223', 'hjk', null, null, null, null, null, null, null, null, null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for hy_work
-- ----------------------------
DROP TABLE IF EXISTS `hy_work`;
CREATE TABLE `hy_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_work
-- ----------------------------
INSERT INTO `hy_work` VALUES ('2', 'cry', '2', '1', null);
INSERT INTO `hy_work` VALUES ('3', 'home', '4', '1', null);
INSERT INTO `hy_work` VALUES ('4', 'hjk', '2', '1', '12323424');
INSERT INTO `hy_work` VALUES ('5', 'hjk', '2', '1', '12323424');
INSERT INTO `hy_work` VALUES ('6', 'hjk', '2', '1', '1508850777');
SET FOREIGN_KEY_CHECKS=1;

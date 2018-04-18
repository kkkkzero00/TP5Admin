/*
Navicat MySQL Data Transfer

Source Server         : kzero00
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : hyadmin

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-04-18 17:46:25
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
  `role_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_frame_access
-- ----------------------------
INSERT INTO `hy_frame_access` VALUES ('1', '30000');
INSERT INTO `hy_frame_access` VALUES ('1', '30001');
INSERT INTO `hy_frame_access` VALUES ('1', '30101');
INSERT INTO `hy_frame_access` VALUES ('1', '30102');
INSERT INTO `hy_frame_access` VALUES ('1', '30104');
INSERT INTO `hy_frame_access` VALUES ('1', '30105');
INSERT INTO `hy_frame_access` VALUES ('1', '30106');
INSERT INTO `hy_frame_access` VALUES ('1', '40100');
INSERT INTO `hy_frame_access` VALUES ('1', '40101');
INSERT INTO `hy_frame_access` VALUES ('1', '40102');
INSERT INTO `hy_frame_access` VALUES ('1', '40103');
INSERT INTO `hy_frame_access` VALUES ('1', '40104');
INSERT INTO `hy_frame_access` VALUES ('1', '40105');
INSERT INTO `hy_frame_access` VALUES ('1', '40120');
INSERT INTO `hy_frame_access` VALUES ('1', '40201');
INSERT INTO `hy_frame_access` VALUES ('1', '40202');
INSERT INTO `hy_frame_access` VALUES ('1', '40203');
INSERT INTO `hy_frame_access` VALUES ('1', '40204');
INSERT INTO `hy_frame_access` VALUES ('1', '40205');
INSERT INTO `hy_frame_access` VALUES ('1', '50000');
INSERT INTO `hy_frame_access` VALUES ('1', '60000');
INSERT INTO `hy_frame_access` VALUES ('1', '60100');
INSERT INTO `hy_frame_access` VALUES ('1', '60200');
INSERT INTO `hy_frame_access` VALUES ('1', '60300');
INSERT INTO `hy_frame_access` VALUES ('1', '60400');
INSERT INTO `hy_frame_access` VALUES ('1', '70000');
INSERT INTO `hy_frame_access` VALUES ('1', '70100');
INSERT INTO `hy_frame_access` VALUES ('1', '70200');
INSERT INTO `hy_frame_access` VALUES ('1', '70300');
INSERT INTO `hy_frame_access` VALUES ('2', '30001');
INSERT INTO `hy_frame_access` VALUES ('2', '30101');
INSERT INTO `hy_frame_access` VALUES ('2', '30102');
INSERT INTO `hy_frame_access` VALUES ('2', '40201');
INSERT INTO `hy_frame_access` VALUES ('2', '40202');
INSERT INTO `hy_frame_access` VALUES ('2', '40203');
INSERT INTO `hy_frame_access` VALUES ('2', '40204');
INSERT INTO `hy_frame_access` VALUES ('2', '40205');
INSERT INTO `hy_frame_access` VALUES ('3', '60000');
INSERT INTO `hy_frame_access` VALUES ('3', '60100');
INSERT INTO `hy_frame_access` VALUES ('3', '60200');
INSERT INTO `hy_frame_access` VALUES ('3', '60300');
INSERT INTO `hy_frame_access` VALUES ('3', '60400');
INSERT INTO `hy_frame_access` VALUES ('3', '70000');
INSERT INTO `hy_frame_access` VALUES ('3', '70100');
INSERT INTO `hy_frame_access` VALUES ('3', '70200');
INSERT INTO `hy_frame_access` VALUES ('3', '70300');
INSERT INTO `hy_frame_access` VALUES ('4', '30000');
INSERT INTO `hy_frame_access` VALUES ('4', '30001');
INSERT INTO `hy_frame_access` VALUES ('4', '30101');
INSERT INTO `hy_frame_access` VALUES ('4', '30102');
INSERT INTO `hy_frame_access` VALUES ('4', '30104');
INSERT INTO `hy_frame_access` VALUES ('4', '30105');
INSERT INTO `hy_frame_access` VALUES ('4', '30106');
INSERT INTO `hy_frame_access` VALUES ('9', '30101');
INSERT INTO `hy_frame_access` VALUES ('9', '40101');
INSERT INTO `hy_frame_access` VALUES ('9', '40102');

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
-- Table structure for hy_frame_manager
-- ----------------------------
DROP TABLE IF EXISTS `hy_frame_manager`;
CREATE TABLE `hy_frame_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `role_id` varchar(100) DEFAULT NULL,
  `gender` int(11) DEFAULT '1',
  `login_last_time` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=456457 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_frame_manager
-- ----------------------------
INSERT INTO `hy_frame_manager` VALUES ('565', 'LL', 'ZFsQqKPRl8fqRJ1petQQoll37vVxHKWjGdl0/+lieyJuZ+uqCrVjS4aiS57kEEuaTfJII+P2QsoimPLWA2mFGkk+c4DPIOMfbUCZGzrMO7yQYn0iCe+BRw/jJ/+MIyV2', '3,4', '1', null, null, '1523162538', '1');
INSERT INTO `hy_frame_manager` VALUES ('67890', 'tt', 'Kt1/TZrGyIO9WYgZzxNzd6ujhwrdr1uH9f2NHinNclUiuP4QCn6di61vBBh6XXod8xXWn/GTuCgfZmm3CcZ7448jMNebVAy5gIVr9mf66DOyVRtmvLM0v4iO2hJyrzhJ', '2', '2', null, null, '1523161994', '1');
INSERT INTO `hy_frame_manager` VALUES ('123123', 'admin', 'VfJUDOYipOLvjugt6DWXXzET3D2xqRYElVieeA13nanbqSOdpa1YaEfpkTsSP17eFslkmpk6i7bjz6qMNJMkgFkbanGjgmVLchRZv4VIVjLjZsGQZ75ZxwmrW1d3e7pc', '1', '1', null, null, '1522732631', '1');
INSERT INTO `hy_frame_manager` VALUES ('333333', 'hjk', 'JIkLZkk46UWwtHQH0m9v96wk5PvaFrBxq14H+gjyKd0+c4vxfiowbMYuwmLUn7/v4PD6LE0o/vTl+0zEZRlm8bv3j5LtCXcxkht6La32TLHHl6iDZiEVU95q4+UGk9TY', '9', '1', null, null, '1523103110', '1');
INSERT INTO `hy_frame_manager` VALUES ('456456', 'guest', '81a4NzycjbsuFeTdlFmonBMJuJAu1JWbjBMqBxVvnaot95eAVva8GnVuidR/oi+Ln4idifgXdnbGBFoh9C2plzR/lFBpkn8t4p+fHhoE/ScEHu9nlUJ6439NpAN7ddVr', '2', '2', null, null, '1522732631', '1');

-- ----------------------------
-- Table structure for hy_frame_role
-- ----------------------------
DROP TABLE IF EXISTS `hy_frame_role`;
CREATE TABLE `hy_frame_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_frame_role
-- ----------------------------
INSERT INTO `hy_frame_role` VALUES ('1', '超级管理员', '最高权限管理员', '1');
INSERT INTO `hy_frame_role` VALUES ('2', '管理员', '普通管管理员', '1');
INSERT INTO `hy_frame_role` VALUES ('3', '老师', '这只是个老师', '1');
INSERT INTO `hy_frame_role` VALUES ('4', '学生', '这只是个学生2333', '1');
INSERT INTO `hy_frame_role` VALUES ('9', '教授', '这是教授', '1');

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
  `model` varchar(255) DEFAULT '' COMMENT '前台对应的model',
  `route` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT '' COMMENT '路由的路径',
  `source` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `method` int(255) DEFAULT '0' COMMENT '1是 get,2是post,3是put,4是delete,0是前端路由',
  `open_detail` int(11) DEFAULT '0',
  `domain` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `https` int(10) DEFAULT '0' COMMENT '0关闭https的检测，1开启',
  `cache` int(10) DEFAULT '0' COMMENT '0为关闭检测，有数值就开启缓存支持',
  `ajax` int(10) DEFAULT '0' COMMENT '0为关闭，1为启动',
  `status` int(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7301 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_frame_rule
-- ----------------------------
INSERT INTO `hy_frame_rule` VALUES ('10000', '0', '公共部分路由', 'admin', null, '', null, '', null, null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('10200', '10000', '登录', 'admin', null, '', null, '', 'Login', null, 'admin/System.Account/login', '2', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('10201', '10200', '登录验证', 'admin', null, '', null, '', 'checkUserExist', null, 'admin/System.Account/checkUserExist', '2', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('10202', '10200', '用户认证', 'admin', null, '', null, '', 'userPermission', null, 'admin/System.Account/userPermission', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('10203', '10200', '用户注销', 'admin', null, '', null, '', 'logout', null, 'admin/System.Account/logout', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('10204', '10200', '验证menu路由', 'admin', null, '', null, '', 'checkAuthRoute', null, 'admin/System.Account/checkAuthRoute', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('10205', '10200', '获取密钥', 'admin', null, '', null, '', 'getKeys', null, 'admin/System.Account/getPublickey', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('20000', '0', '主页', 'nav', 'laptop', 'indexPage', '/indexPage', '20000', '', null, '', '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('20100', '20000', '获取主页信息', 'url', null, '', null, '20100-20000', null, null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('30000', '0', 'Users', 'nav', 'user', 'users', '/users', '30000', '', null, null, '0', '1', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('30001', '30000', 'User Detail', 'detail', 'user', 'detail', '/users/:id/detail', '30001-30000', null, null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('30101', '30000', '列表', 'url', null, '', null, '', 'users', 'lists', 'user/Users/lists', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('30102', '30000', '详情', 'url', null, '', null, '', 'users', ':id/read', 'user/Users/read', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('30104', '30000', '新增', 'url', null, '', null, '', 'users', null, 'user/Users/insert', '2', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('30105', '30000', '更新', 'url', null, '', null, '', 'users', ':id', 'user/Users/update', '3', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('30106', '30000', '删除', 'url', null, '', null, '', 'users', '', 'user/Users/delete', '4', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40000', '0', '系统管理', 'nav', 'setting', '', '', '40000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40100', '40000', '管理员管理', 'menu', 'user-add', '', '/manager', '40100-40000', null, null, null, '0', '1', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40101', '40100', '列表', 'url', null, '', null, '', 'manager', 'lists', 'admin/System.Manager/lists', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40102', '40100', '详情', 'url', null, '', null, '', 'manager', ':id/read', 'admin/System.Manager/read', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40103', '40100', '新增', 'url', null, '', null, '', 'manager', null, 'admin/System.Manager/insert', '2', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40104', '40100', '更新', 'url', null, '', null, '', 'manager', ':id', 'admin/System.Manager/update', '3', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40105', '40100', '删除', 'url', null, '', null, '', 'manager', null, 'admin/System.Manager/delete', '4', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40120', '40100', '管理员详情', 'detail', 'lock', 'detail', '/manager/:id/detail', '40120-40100-40000', null, null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40200', '40000', '角色权限管理', 'menu', 'user-add', '', '/role', '40200-40000', 'role', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40201', '40200', '列表', 'url', null, '', null, '', 'role', 'lists', 'admin/System.Role/lists', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40202', '40200', '详情', 'url', null, '', null, '', 'role', ':id/read', 'admin/System.Role/read', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40203', '40200', '新增', 'url', null, '', null, '', 'role', null, 'admin/System.Role/insert', '2', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40204', '40200', '更新', 'url', null, '', null, '', 'role', ':id', 'admin/System.Role/update', '3', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40205', '40200', '删除', 'url', null, '', null, '', 'role', null, 'admin/System.Role/delete', '4', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40206', '40200', '获取权限', 'url', null, '', null, '', 'role/getAccess', '', 'admin/System.Role/getAccess', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40207', '40200', '授权处理', 'url', null, '', null, '', 'role/setAccess', ':id', 'admin/System.Role/setAccess', '2', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('40220', '40200', '角色权限管理详情', 'detail', 'lock', 'detail', '/role/:id/detail', '40220-40200-40000', null, null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('50000', '0', 'Request', 'nav', 'api', 'request', '/request', '50000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('60000', '0', 'UI Element', 'nav', 'camera-o', '', null, '60000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('60100', '60000', 'IconFont', 'menu', 'heart-o', 'iconfont', '/UIElement/iconfont', '60100-60000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('60200', '60000', 'DataTable', 'menu', 'database', 'dataTable', '/UIElement/dataTable', '60200-60000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('60300', '60000', 'DropOption', 'menu', 'bars', 'dropOption', '/UIElement/dropOption', '60300-60000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('60400', '60000', 'Search', 'menu', 'search', 'search', '/UIElement/search', '60400-60000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('70000', '0', 'Recharts', 'nav', 'code-o', '', null, '70000', null, null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('70100', '70000', 'BarChart', 'menu', 'bar-chart', 'barChart', '/charts/barChart', '70100-70000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('70200', '70000', 'AreaChart', 'menu', 'area-chart', 'AreaChart', '/charts/areaChart', '70200-70000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('70300', '70000', 'LineChart', 'menu', 'line-chart', 'lineChart', '/charts/lineChart', '70300-70000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');

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
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT '1',
  `birthday` int(11) DEFAULT NULL,
  `qq` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `login_last_time` int(11) DEFAULT NULL,
  `login_times` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `avatar_id` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_user
-- ----------------------------
INSERT INTO `hy_user` VALUES ('1', 'Jason Lee', 'admin', '456', '1', '15492886465', '湖南省 衡阳市 衡南县', '2', null, null, 'b.jmjc@vepjbhv.va', null, null, '1', null, null, '1496246004', '12');
INSERT INTO `hy_user` VALUES ('2', '	Matthew Lewis', '124134', '452', '1', '13330893583', '吉林省 吉林市 龙潭区', '1', null, null, 'q.vqjpxhy@qmiqzup.biz', null, null, '1', null, null, '1496397722', '34');
INSERT INTO `hy_user` VALUES ('3', '	Brian Anderson', '123123', '234', '2', '15845343862', '河北省 沧州市 泊头市', '2', null, null, 'w.qyugfipkd@smmdqjqr.lu', null, null, '1', null, null, '1496462311', '5');
INSERT INTO `hy_user` VALUES ('4', '	Jeffrey Thompson', 'Jeffrey 242342', '3422', '2', '17598806555', '重庆 重庆市 沙坪坝区', '2', null, null, 'q.uusccjk@smmpvhq.fr', null, null, '1', null, null, '1488729600', '45');
INSERT INTO `hy_user` VALUES ('5', '	Sandra White', '3543534', '2', '1', '17838521019', '黑龙江省 齐齐哈尔市 克东县', '1', null, null, 'p.ikl@vjqykr.jp', null, null, '1', null, null, '1488729600', '3');
INSERT INTO `hy_user` VALUES ('6', 'Jason Thomas', null, '234234', '1', '17725574235', '河北省 沧州市 泊头市', '2', null, null, 'u.bkhstjiorh@msini.bd', null, null, '1', null, null, '1491408000', '4');
INSERT INTO `hy_user` VALUES ('7', 'Karen Martinez', null, null, null, '17270426046', '重庆 重庆市 黔江区', '1', null, null, 'g.kxs@vheii.ws', null, null, '1', null, null, '1491408000', '34');
INSERT INTO `hy_user` VALUES ('8', 'Nancy Miller', null, null, null, '	15463546882', '浙江省 金华市 武义县', '1', null, null, 's.ugjstnwh@xrfhhwlru.ir', null, null, '1', null, null, '1498815182', '3');
INSERT INTO `hy_user` VALUES ('230', '	Carol Hernandez', null, null, null, '14344277888', '北京 北京市 西城区', '1', null, null, 'i.fegb@bwneulxg.gov.cn', null, null, '1', null, null, '1498816642', '3');
INSERT INTO `hy_user` VALUES ('231', '	Scott Lewis', null, null, null, '17884687686', '香港特别行政区 九龙 深水埗区', '1', null, null, 'n.rybsua@cyctwmxb.cx', null, null, '1', null, null, '1483718400', '45');
INSERT INTO `hy_user` VALUES ('232', '	Cynthia Miller', null, null, null, '15211597744', '海南省 三亚市 -', '1', null, null, 'n.cyydndkgf@hyuhtdb.kr', null, null, '1', null, null, '1483718400', '34');
INSERT INTO `hy_user` VALUES ('233', '	Barbara Martinez', null, null, null, '13539649350', '宁夏回族自治区 固原市 泾源县', '2', null, null, 'i.tyylt@smf.fr', null, null, '1', null, null, '1486396800', '23');
INSERT INTO `hy_user` VALUES ('234', '	Steven Martinez', null, null, null, '14306257592', '海外 海外 -', '1', null, null, 'q.iqhj@cnjjhsvx.net.cn', null, null, '1', null, null, '1486396800', '12');
INSERT INTO `hy_user` VALUES ('235', '	Jennifer Robinson', null, null, null, '18542687181', '陕西省 咸阳市 淳化县', '1', null, null, 'r.oiyuijrr@lfjpem.ng', null, null, '1', null, null, '1486396800', '12');
INSERT INTO `hy_user` VALUES ('236', '	Amy Garcia', null, null, null, '18958511355', '内蒙古自治区 乌兰察布市 察哈尔右翼中旗', '1', null, null, 'b.ulktsm@cfj.za', null, null, '1', null, null, '1486396800', '34');
INSERT INTO `hy_user` VALUES ('237', '	James Clark', null, null, null, '14311056432', '江西省 萍乡市 安源区', '2', null, null, 'l.fiueiac@qxomrn.aero', null, null, '1', null, null, '1486396800', '45');
INSERT INTO `hy_user` VALUES ('238', '	Susan Davis', null, null, null, '14187663653', '海南省 三沙市 中沙群岛的岛礁', '1', null, null, 'i.ckvmtp@dpxvnfhdb.kz', null, null, '1', null, null, '1486396800', '6');
INSERT INTO `hy_user` VALUES ('239', '	Richard Thompson', null, null, null, '15655764790', '甘肃省 陇南市 武都区', '2', null, null, 'q.pabjsoiwd@utoyibgq.kz', null, null, '1', null, null, '1499356800', '23');
INSERT INTO `hy_user` VALUES ('240', 'Jennifer Moore3', null, null, null, '13583400543', '海外 海外 -', '1', null, null, 't.jhdinuj@urlusezyv.in', null, null, '1', null, null, '1499410090', '65');
INSERT INTO `hy_user` VALUES ('253', 'hjk', null, null, null, '15079026985', '1232', '1', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('254', 'hjk', null, null, null, '15079026985', 'gdfgf', '1', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('255', 'hjk', null, null, null, '15079026985', 'gdfgf', '1', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('256', 'hjk', null, null, null, '15079026985', 'eterte', '1', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('257', 'hjk', null, null, null, '15079026985', 'eterte', '1', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('258', 'hjk', null, null, null, '15079026985', 'eretre', '1', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('259', 'hjk', null, null, null, '15079026985', 'eretre', '1', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('260', 'hjk', null, null, null, '15079026985', 'eretre', '1', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('261', 'hjk', null, null, null, '15079026985', '32353', '1', null, null, null, null, null, '1', null, null, null, '1');
INSERT INTO `hy_user` VALUES ('262', 'fgf', null, null, null, '15079026985', '2edsgdg', '1', null, null, null, null, null, '1', null, null, null, '11');
INSERT INTO `hy_user` VALUES ('263', '12', null, null, null, '15079026985', 'rgdfgf', '1', null, null, null, null, null, '1', null, null, null, '2');
INSERT INTO `hy_user` VALUES ('264', 'hjk2', null, null, null, '15079026985', 'fgfh', '1', null, null, null, null, null, '1', null, null, null, '23');
INSERT INTO `hy_user` VALUES ('265', 'hjk', null, null, null, '15079026985', 'ereter', '1', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('266', '0', null, null, null, '15079026985', 'tfdfgfg', '1', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('267', '0', null, null, null, '15079026985', '34gf', '1', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('268', '0', null, null, null, '15079026985', 'ergtr', '1', null, null, null, null, null, '1', null, null, null, '21');
INSERT INTO `hy_user` VALUES ('269', '56', null, null, null, '15079026985', '34tdfgdf', '1', null, null, null, null, null, '1', null, null, null, '14');
INSERT INTO `hy_user` VALUES ('270', '35', null, null, null, '15079026985', 'fgfdg', '1', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('271', '0', null, null, null, '15079026985', 'ettretre', '1', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('272', '0', null, null, null, '15079026985', '42342', '2', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('273', '0', null, null, null, '15079026985', 'rtret', '1', null, null, null, null, null, '1', null, null, null, '12');
INSERT INTO `hy_user` VALUES ('274', '0', null, null, null, '15079026985', '243454', '1', null, null, null, null, null, '1', null, null, null, '2');
INSERT INTO `hy_user` VALUES ('275', '0', null, null, null, '15079026985', '434', '1', null, null, null, null, null, '1', null, null, null, '3');
INSERT INTO `hy_user` VALUES ('276', 'gff_set', null, null, null, '15079026985', 'reewr', '1', null, null, null, null, null, '1', null, null, '1522728669', '1');
INSERT INTO `hy_user` VALUES ('277', 'fd4_set', null, null, null, '15079026985', 'derew', '1', null, null, null, null, null, '1', null, null, null, '24');
INSERT INTO `hy_user` VALUES ('278', 'fg_set', null, null, null, '15079026985', 'dfge', '1', null, null, null, null, null, '1', null, null, '1522732344', '12');
INSERT INTO `hy_user` VALUES ('279', 'hjk232_set', null, null, null, '15079026985', 'reet', '1', null, null, null, null, null, '1', null, null, '1522732367', '12');
INSERT INTO `hy_user` VALUES ('280', 'fg34_set', null, null, null, '15079026985', '124345', '1', null, null, null, null, null, '1', null, null, '1522732440', '1');
INSERT INTO `hy_user` VALUES ('281', 'fg34_set', null, null, null, '15079026985', '124345', '1', null, null, null, null, null, '1', null, null, '1522732482', '1');
INSERT INTO `hy_user` VALUES ('282', 'fg34_set', null, null, null, '15079026985', '124345', '1', null, null, null, null, null, '1', null, null, '1522732508', '1');
INSERT INTO `hy_user` VALUES ('283', 'fg34_set', null, null, null, '15079026985', '124345', '1', null, null, null, null, null, '1', null, null, '1522732631', '1');
INSERT INTO `hy_user` VALUES ('290', 'hjk24545', null, null, null, '15079026985', 'edfgf', '1', null, null, '347756896@qq.com', null, null, '1', null, null, '1522842700', '12');
INSERT INTO `hy_user` VALUES ('291', 'paloma', null, null, null, '15079026985', '2efdfgd', '2', null, null, '347756896@qq.com', null, null, '1', null, null, '1522849865', '33');
INSERT INTO `hy_user` VALUES ('292', 'lady gaga', null, null, null, '15079026985', 'efegrege', '2', null, null, '347756896@qq.com', null, null, '1', null, null, '1522849983', '32');
INSERT INTO `hy_user` VALUES ('293', 'katy perry', null, null, null, '13611435193', 'paloma6', '2', null, null, '347756896@qq.com', null, null, '1', null, null, '1522850051', '35');
INSERT INTO `hy_user` VALUES ('294', 'christina3', null, null, null, '13583400543', '1fdfgg', '2', null, null, '347756896@qq.com', null, null, '1', null, null, '1523181725', '36');
INSERT INTO `hy_user` VALUES ('295', 'gjk434', null, null, null, '15079026985', 'fdgddfh', '1', null, null, '347756896@qq.com', null, null, '1', null, null, '1524040891', '12');

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

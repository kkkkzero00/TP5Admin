/*
Navicat MySQL Data Transfer

Source Server         : alicloud
Source Server Version : 50719
Source Host           : 112.74.43.247:3306
Source Database       : hyadmin

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-04-04 17:16:15
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `rule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_frame_access
-- ----------------------------
INSERT INTO `hy_frame_access` VALUES ('6', '2', '2000');
INSERT INTO `hy_frame_access` VALUES ('7', '2', '2100');
INSERT INTO `hy_frame_access` VALUES ('8', '2', '3000');
INSERT INTO `hy_frame_access` VALUES ('9', '2', '3101');
INSERT INTO `hy_frame_access` VALUES ('10', '2', '3102');
INSERT INTO `hy_frame_access` VALUES ('11', '2', '3103');
INSERT INTO `hy_frame_access` VALUES ('12', '2', '3104');
INSERT INTO `hy_frame_access` VALUES ('13', '2', '3105');
INSERT INTO `hy_frame_access` VALUES ('14', '2', '3106');
INSERT INTO `hy_frame_access` VALUES ('15', '3', '4000');
INSERT INTO `hy_frame_access` VALUES ('16', '3', '5000');
INSERT INTO `hy_frame_access` VALUES ('17', '3', '6000');
INSERT INTO `hy_frame_access` VALUES ('18', '3', '6100');
INSERT INTO `hy_frame_access` VALUES ('19', '3', '6200');
INSERT INTO `hy_frame_access` VALUES ('20', '3', '6300');
INSERT INTO `hy_frame_access` VALUES ('21', '3', '6400');
INSERT INTO `hy_frame_access` VALUES ('26', '2', '4000');
INSERT INTO `hy_frame_access` VALUES ('27', '2', '5000');
INSERT INTO `hy_frame_access` VALUES ('28', '2', '6000');
INSERT INTO `hy_frame_access` VALUES ('29', '2', '6100');
INSERT INTO `hy_frame_access` VALUES ('30', '2', '6200');
INSERT INTO `hy_frame_access` VALUES ('31', '2', '6300');
INSERT INTO `hy_frame_access` VALUES ('32', '2', '6400');

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
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=456457 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_frame_manager
-- ----------------------------
INSERT INTO `hy_frame_manager` VALUES ('123123', 'admin', 'admin', '1', '1', null, null, '1');
INSERT INTO `hy_frame_manager` VALUES ('456456', 'guest', 'guest', '2,3', '1', null, null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_frame_role
-- ----------------------------
INSERT INTO `hy_frame_role` VALUES ('1', '超级管理员', null, '1');
INSERT INTO `hy_frame_role` VALUES ('2', '管理员', null, '1');
INSERT INTO `hy_frame_role` VALUES ('3', '老师', null, '1');
INSERT INTO `hy_frame_role` VALUES ('4', '学生', null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=100011 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hy_frame_rule
-- ----------------------------
INSERT INTO `hy_frame_rule` VALUES ('1000', '0', '公共部分路由', null, null, '', null, '', null, null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('1020', '1000', '登录', 'admin', null, '', null, '', 'Login', null, 'admin/System.Account/login', '2', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('1021', '1020', '登录验证', 'admin', null, '', null, '', 'checkUserExist', null, 'admin/System.Account/checkUserExist', '2', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('1022', '1020', '用户认证', 'admin', null, '', null, '', 'userPermission', null, 'admin/System.Account/userPermission', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('1023', '1020', '用户注销', 'admin', null, '', null, '', 'logout', null, 'admin/System.Account/logout', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('1024', '1020', '验证menu路由', 'admin', null, '', null, '', 'checkAuthRoute', null, 'admin/System.Account/checkAuthRoute', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('1025', '1020', '获取密钥', 'admin', null, '', null, '', 'getKeys', null, 'admin/System.Account/getKeys', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2000', '0', '主页', 'nav', 'laptop', 'indexPage', '/indexPage', '2000', '', null, '', '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('2100', '2000', '获取主页信息', 'url', null, '', null, '2100-2000', null, null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('3000', '0', 'Users', 'nav', 'user', 'users', '/users', '3000', '', null, null, '0', '1', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('3001', '3000', 'User Detail', 'detail', 'user', 'detail', '/users/:id/detail', '3001-3000', null, null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('3101', '3000', '列表', 'url', null, '', null, '', 'users', 'lists', 'user/User/lists', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('3102', '3000', '详情', 'url', null, '', null, '', 'users', ':id/read', 'user/User/read', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('3104', '3000', '新增', 'url', null, '', null, '', 'users', null, 'user/User/insert', '2', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('3105', '3000', '更新', 'url', null, '', null, '', 'users', ':id', 'user/User/update', '3', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('3106', '3000', '删除', 'url', null, '', null, '', 'users', '', 'user/User/delete', '4', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('4000', '0', '系统管理', 'nav', 'setting', '', '', '4000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('4100', '4000', '管理员管理', 'menu', 'user-add', '', '/manager', '4100-4000', null, null, null, '0', '1', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('4101', '4100', '列表', 'url', null, '', null, '', 'manager', 'lists', 'admin/System.Manager/lists', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('4102', '4100', '详情', 'url', null, '', null, '', 'manager', ':id/read', 'admin/System.Manager/read', '1', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('4103', '4100', '新增', 'url', null, '', null, '', 'manager', null, 'admin/System.Manager/insert', '2', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('4104', '4100', '更新', 'url', null, '', null, '', 'manager', ':id/edit', 'admin/System.Manager/update', '3', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('4105', '4100', '删除', 'url', null, '', null, '', 'manager', null, 'admin/System.Manager/delete', '4', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('4120', '4100', '管理员详情', 'detail', 'lock', 'detail', '/manager/:id/detail', '4120-4100-4000', null, null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('5000', '0', 'Request', 'nav', 'api', 'request', '/request', '5000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('6000', '0', 'UI Element', 'nav', 'camera-o', '', null, '6000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('6100', '6000', 'IconFont', 'menu', 'heart-o', 'iconfont', '/UIElement/iconfont', '6100-6000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('6200', '6000', 'DataTable', 'menu', 'database', 'dataTable', '/UIElement/dataTable', '6200-6000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('6300', '6000', 'DropOption', 'menu', 'bars', 'dropOption', '/UIElement/dropOption', '6300-6000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('6400', '6000', 'Search', 'menu', 'search', 'search', '/UIElement/search', '6400-6000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('7000', '0', 'Recharts', 'nav', 'code-o', '', null, '7000', null, null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('7100', '7000', 'BarChart', 'menu', 'bar-chart', 'barChart', '/charts/barChart', '7100-7000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('7200', '7000', 'AreaChart', 'menu', 'area-chart', 'AreaChart', '/charts/areaChart', '7200-7000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');
INSERT INTO `hy_frame_rule` VALUES ('7300', '7000', 'LineChart', 'menu', 'line-chart', 'lineChart', '/charts/lineChart', '7300-7000', '', null, null, '0', '0', null, null, '0', '0', '0', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8;

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
INSERT INTO `hy_user` VALUES ('284', 'fg34_set', null, null, null, '15079026985', '124345', '1', null, null, null, null, null, '1', null, null, '1522732632', '1');
INSERT INTO `hy_user` VALUES ('285', 'fg34_set', null, null, null, '15079026985', '124345', '1', null, null, '347756896@qq.com', null, null, '1', null, null, '1522732733', '1');
INSERT INTO `hy_user` VALUES ('286', 'hjk_set', null, null, null, '15079026985', '2343242', '1', null, null, '347756896@qq.com', null, null, '1', null, null, '1522814689', '23');
INSERT INTO `hy_user` VALUES ('287', '213_set', null, null, null, '15079026985', 'rtrtrt', '1', null, null, '347756896@qq.com', null, null, '1', null, null, '1522817219', '12');

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

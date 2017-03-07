# ************************************************************
# Sequel Pro SQL dump
# Version 4529
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.14)
# Database: ShopMart
# Generation Time: 2017-03-06 00:03:58 +0000
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET FOREIGN_KEY_CHECKS=0;


DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `orderitem`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `promotion`;
DROP TABLE IF EXISTS `supplier`;
DROP TABLE IF EXISTS `user`;


-- ----------------------------
-- Table structure for category
-- ----------------------------

CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类别编号',
  `parent_category_id` bigint(20) DEFAULT NULL COMMENT '种类_类别编号',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商编号',
  `category_name` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '1删除，0存在',
  PRIMARY KEY (`category_id`),
  KEY `FK_Relationship_11` (`parent_category_id`),
  KEY `FK_Relationship_7` (`supplier_id`),
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`parent_category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', null, '1', '电子商品', '0');
INSERT INTO `category` VALUES ('2', null, '1', '服装', '0');
INSERT INTO `category` VALUES ('3', null, '1', '化妆品', '0');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------

CREATE TABLE `orderitem` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单项编号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品编号',
  `total_price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `num` decimal(8,0) DEFAULT NULL COMMENT '数量',
  `note` varchar(50) DEFAULT NULL COMMENT '订单项留言',
  `item_price` decimal(20,0) DEFAULT NULL COMMENT '条目总价',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '1删除，0存在',
  PRIMARY KEY (`item_id`),
  KEY `FK_Relationship_3` (`order_id`),
  KEY `FK_Relationship_5` (`product_id`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`ordr_id`),
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', '1', '1', '10000', '1', null, null, '0');
INSERT INTO `orderitem` VALUES ('2', '2', '1', '10000', '1', null, null, '0');
INSERT INTO `orderitem` VALUES ('3', '3', '1', '10000', '1', null, null, '0');
INSERT INTO `orderitem` VALUES ('4', '4', '1', '10000', '1', null, null, '0');
INSERT INTO `orderitem` VALUES ('5', '5', '1', '10000', '1', null, null, '0');
INSERT INTO `orderitem` VALUES ('6', '6', '4', '450', '1', null, null, '0');
INSERT INTO `orderitem` VALUES ('7', '7', '5', '500', '1', null, null, '0');
INSERT INTO `orderitem` VALUES ('8', '12', '5', '500', '1', null, null, '0');
INSERT INTO `orderitem` VALUES ('9', '13', '5', '500', '1', null, null, '0');
INSERT INTO `orderitem` VALUES ('10', '15', '5', '500', '1', null, null, '0');
INSERT INTO `orderitem` VALUES ('11', '16', '5', '500', '1', null, null, '0');
INSERT INTO `orderitem` VALUES ('12', '17', '3', '500', '1', null, null, '0');
INSERT INTO `orderitem` VALUES ('13', '18', '2', '1', '1', null, null, '0');
INSERT INTO `orderitem` VALUES ('14', '19', '2', '1', '1', null, null, '0');
INSERT INTO `orderitem` VALUES ('15', '20', '5', '500', '1', null, null, '0');

-- ----------------------------
-- Table structure for orders
-- ----------------------------

CREATE TABLE `orders` (
  `ordr_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `address` varchar(100) DEFAULT NULL COMMENT '住址',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `postage` decimal(9,0) DEFAULT NULL COMMENT '运费总价',
  `total` decimal(20,0) DEFAULT NULL COMMENT '订单总价',
  `delivery_date` varchar(50) DEFAULT NULL COMMENT '交付日期',
  `delivery_method` varchar(100) DEFAULT NULL COMMENT '交付方式',
  `product_toatl` decimal(20,0) DEFAULT NULL COMMENT '商品总价',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `close_time` datetime DEFAULT NULL COMMENT '完成时间',
  `state` varchar(4) DEFAULT NULL COMMENT '状态',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '1删除，0存在',
  PRIMARY KEY (`ordr_id`),
  KEY `FK_Relationship_1` (`user_id`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '3', '张1', '上海市浦东新区翔融苑', '18312970000', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('2', '3', '张2', '上海市浦东新区翔融苑', '18312970000', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('3', '3', '张3', '上海市浦东新区翔融苑', '18312970000', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('4', '3', '张4', '上海市浦东新区翔融苑', '18312970000', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('5', '3', 'tim', '上海市浦东新区翔融苑', '18312970000', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('6', '3', '张5', '上海市浦东新区翔融苑', '18312970000', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('7', '3', '张6', '上海市浦东新区翔融苑', '18312970000', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('8', '3', '张7', '上海市浦东新区翔融苑', '18312970000', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('9', '3', '张8', '上海市浦东新区翔融苑', '18312970000', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('10', '3', '张9', '上海市浦东新区翔融苑', '18312970000', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('11', '3', 'jane', '上海市浦东新区翔融苑', '18312970000', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('12', '3', 'lily', '上海市浦东新区翔融苑', '18312970000', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('13', '3', 'bill', '上海市浦东新区翔融苑', '18312970000', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('14', '3', 'marry', '上海市浦东新区翔融苑', '18312970000', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('15', '3', 'he', 'lalal', '147384623', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('16', '3', 'bill', '上海市浦东区翔融苑', '18312976875', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('17', '3', 'Tom', '上海市浦东区翔融苑', '18312976875', null, null, null, '快递', null, '2017-03-06 11:33:12', '2017-03-06 11:33:12', null, null, '0');
INSERT INTO `orders` VALUES ('18', '3', 'Tommy', '上海市浦东区翔融苑', '18312976875', null, null, null, '快递', null, '2017-03-06 11:56:54', '2017-03-06 11:56:54', null, null, '0');
INSERT INTO `orders` VALUES ('19', '3', 'bill', '上海市浦东区翔融苑', '18312976875', null, null, null, '快递', null, '2017-03-06 13:09:51', '2017-03-06 13:09:51', null, null, '0');
INSERT INTO `orders` VALUES ('20', '3', 'bill', '上海市浦东区翔融苑', '18312976875', null, null, null, '快递', null, '2017-03-06 13:55:08', '2017-03-06 13:55:08', null, null, '0');

-- ----------------------------
-- Table structure for product
-- ----------------------------

CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `category_id` bigint(20) DEFAULT NULL COMMENT '类别编号',
  `promotion_id` bigint(20) DEFAULT NULL COMMENT '促销编号',
  `supplier_id` bigint(20) DEFAULT NULL COMMENT '供应商编号',
  `product_name` varchar(1024) DEFAULT NULL COMMENT '产品名称',
  `price` decimal(20,0) DEFAULT NULL COMMENT '产品价格',
  `picture` varchar(50) DEFAULT NULL COMMENT '图片',
  `quantity` int(255) DEFAULT NULL COMMENT '产品描述',
  `description` varchar(100) DEFAULT NULL COMMENT '商品存量',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '1删除，0存在',
  PRIMARY KEY (`product_id`),
  KEY `FK_Relationship_10` (`supplier_id`),
  KEY `FK_Relationship_6` (`category_id`),
  KEY `FK_Relationship_8` (`promotion_id`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '1', null, '1', 'mac pro 13', '10000', null, '20', 'ssd固态硬盘', '0');
INSERT INTO `product` VALUES ('2', '1', null, '1', 'u盘', '1', null, '15', 'Kingston 16g 红色', '0');
INSERT INTO `product` VALUES ('3', '2', null, '1', 'zara连衣裙', '500', null, '40', '白色，修身', '0');
INSERT INTO `product` VALUES ('4', '2', null, '1', 'zara长裤', '450', null, '30', '黑色直筒', '0');
INSERT INTO `product` VALUES ('5', '3', null, '1', '粉底液', '500', null, '55', '四色可选', '0');

-- ----------------------------
-- Table structure for promotion
-- ----------------------------

CREATE TABLE `promotion` (
  `promotion_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '促销编号',
  `promotion_name` varchar(50) DEFAULT NULL COMMENT '促销名称',
  `begin_time` datetime DEFAULT NULL COMMENT '促销开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '停止时间',
  `discount` decimal(4,0) DEFAULT NULL COMMENT '促销折扣',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '1删除，0存在',
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of promotion
-- ----------------------------


-- ----------------------------
-- Table structure for supplier
-- ----------------------------

CREATE TABLE `supplier` (
  `supplier_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '供应商编号',
  `supplier_name` varchar(100) DEFAULT NULL COMMENT '供应商名称',
  `address` varchar(100) DEFAULT NULL COMMENT '住址',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `type` varchar(100) DEFAULT NULL COMMENT '供货方式',
  `postcode` varchar(20) DEFAULT NULL COMMENT '邮编',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '1删除，0存在',
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '1', '1', '1', '1', '1', null, 'c4ca4238a0b923820dcc509a6f75849b', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `gender` char(1) DEFAULT NULL COMMENT '性别',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `role` varchar(4) DEFAULT NULL COMMENT '积分',
  `score` bigint(20) DEFAULT NULL COMMENT '角色',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '1删除，0存在',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'c4ca4238a0b923820dcc509a6f75849b', '', '121@qq.com', '123', '0', null, '0');
INSERT INTO `user` VALUES ('2', 'c4ca4238a0b923820dcc509a6f75849b', null, '1@qq.com', null, '1', null, '0');
INSERT INTO `user` VALUES ('3', 'c4ca4238a0b923820dcc509a6f75849b', null, '3@qq.com', null, '2', null, '0');
INSERT INTO `user` VALUES ('4', 'c4ca4238a0b923820dcc509a6f75849b', null, '123456789@qq.com', null, '2', null, '0');
INSERT INTO `user` VALUES ('5', 'c4ca4238a0b923820dcc509a6f75849b', null, '123@qq.com', null, '2', null, '0');
INSERT INTO `user` VALUES ('6', 'c4ca4238a0b923820dcc509a6f75849b', null, '1@qq.com', null, '1', null, '0');
INSERT INTO `user` VALUES ('7', 'c4ca4238a0b923820dcc509a6f75849b', null, '12@163.com', null, '1', null, '0');
INSERT INTO `user` VALUES ('8', 'c4ca4238a0b923820dcc509a6f75849b', null, '2@qq.com', null, '1', null, '0');
INSERT INTO `user` VALUES ('10', 'c4ca4238a0b923820dcc509a6f75849b', null, '54@qq.com', null, '2', null, '0');

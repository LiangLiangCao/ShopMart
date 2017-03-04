/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : shopmart

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001a

Date: 2017-03-03 17:34:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_category_id` bigint(20) DEFAULT NULL,
  `suplr_id` bigint(20) DEFAULT NULL,
  `categ_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `FK_Relationship_11` (`cat_category_id`),
  KEY `FK_Relationship_7` (`suplr_id`),
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`cat_category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`suplr_id`) REFERENCES `supplier` (`suplr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', null, '1', '电子商品');
INSERT INTO `category` VALUES ('2', null, '1', '服装');
INSERT INTO `category` VALUES ('3', null, '1', '化妆品');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `num` decimal(8,0) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `count` decimal(20,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_Relationship_3` (`order_id`),
  KEY `FK_Relationship_5` (`pro_id`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`ordr_id`),
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ordr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `postage` decimal(9,0) DEFAULT NULL,
  `total` decimal(20,0) DEFAULT NULL,
  `delivery_date` varchar(50) DEFAULT NULL,
  `delivery_method` varchar(100) DEFAULT NULL,
  `pro_toatl` decimal(20,0) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `close_time` datetime DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ordr_id`),
  KEY `FK_Relationship_1` (`uid`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pro_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `promo_id` bigint(20) DEFAULT NULL,
  `suplr_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(1024) DEFAULT NULL,
  `price` decimal(20,0) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `FK_Relationship_10` (`suplr_id`),
  KEY `FK_Relationship_6` (`category_id`),
  KEY `FK_Relationship_8` (`promo_id`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`suplr_id`) REFERENCES `supplier` (`suplr_id`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`promo_id`) REFERENCES `promotion` (`promo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '1', null, '1', 'mac pro 13', '10000', null, '20', 'ssd固态硬盘');
INSERT INTO `product` VALUES ('2', '1', null, '1', 'u盘', '1', null, '10', 'Kingston 16g 红色');
INSERT INTO `product` VALUES ('3', '2', null, '1', 'zara连衣裙', '500', null, '8', '白色，修身');
INSERT INTO `product` VALUES ('4', '2', null, '1', 'zara长裤', '450', null, '18', '黑色直筒');
INSERT INTO `product` VALUES ('5', '3', null, '1', 'make up forever粉底液', '500', null, '20', '四色可选');

-- ----------------------------
-- Table structure for promotion
-- ----------------------------
DROP TABLE IF EXISTS `promotion`;
CREATE TABLE `promotion` (
  `promo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `suplr_id` bigint(20) DEFAULT NULL,
  `promo_name` varchar(50) DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `discount` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`promo_id`),
  KEY `FK_Relationship_9` (`suplr_id`),
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`suplr_id`) REFERENCES `supplier` (`suplr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of promotion
-- ----------------------------

-- ----------------------------
-- Table structure for shopitem
-- ----------------------------
DROP TABLE IF EXISTS `shopitem`;
CREATE TABLE `shopitem` (
  `shop_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `count` decimal(20,0) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `num` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `FK_Relationship_2` (`uid`),
  KEY `FK_Relationship_4` (`pro_id`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopitem
-- ----------------------------

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `suplr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `suplyr_name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `postcode` varchar(20) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `suply_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`suplr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '1', '1', '1', '1', '1', null, 'c4ca4238a0b923820dcc509a6f75849b', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` varchar(4) DEFAULT NULL,
  `score` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'c4ca4238a0b923820dcc509a6f75849b', '', '121@qq.com', '12', '0', null);
INSERT INTO `user` VALUES ('2', 'c4ca4238a0b923820dcc509a6f75849b', null, '1@qq.com', null, '1', null);
INSERT INTO `user` VALUES ('3', 'c4ca4238a0b923820dcc509a6f75849b', null, '3@qq.com', null, '2', null);
INSERT INTO `user` VALUES ('4', 'c4ca4238a0b923820dcc509a6f75849b', null, '123456789@qq.com', null, '2', null);
INSERT INTO `user` VALUES ('5', 'c4ca4238a0b923820dcc509a6f75849b', null, '123@qq.com', null, '2', null);
INSERT INTO `user` VALUES ('6', 'c4ca4238a0b923820dcc509a6f75849b', null, '1@qq.com', null, '1', null);
INSERT INTO `user` VALUES ('7', 'c4ca4238a0b923820dcc509a6f75849b', null, '12@163.com', null, '1', null);
INSERT INTO `user` VALUES ('8', 'c4ca4238a0b923820dcc509a6f75849b', null, '2@qq.com', null, '1', null);

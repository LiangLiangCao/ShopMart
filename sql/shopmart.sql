<<<<<<< HEAD
/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : shopmart

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-02-28 17:35:45
*/

SET FOREIGN_KEY_CHECKS=0;


-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL,
  `cat_category_id` bigint(20) DEFAULT NULL,
  `suplr_id` bigint(20) DEFAULT NULL,
  `categ_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `FK_Relationship_11` (`cat_category_id`),
  KEY `FK_Relationship_7` (`suplr_id`),
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`cat_category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`suplr_id`) REFERENCES `supplier` (`suplr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `item_id` bigint(20) NOT NULL,
  `ordr_id` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `num` decimal(8,0) DEFAULT NULL,
  `Note` varchar(50) DEFAULT NULL,
  `count` decimal(20,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_Relationship_3` (`ordr_id`),
  KEY `FK_Relationship_5` (`pro_id`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`ordr_id`) REFERENCES `orders` (`ordr_id`),
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
  `ordr_id` bigint(20) NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `postage` decimal(9,0) DEFAULT NULL,
  `total` decimal(20,0) DEFAULT NULL,
  `DeliveryDate` varchar(50) DEFAULT NULL,
  `DeliveryMethod` varchar(100) DEFAULT NULL,
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
  `pro_id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `promo_id` bigint(20) DEFAULT NULL,
  `suplr_id` bigint(20) DEFAULT NULL,
  `ProductName` varchar(1024) DEFAULT NULL,
  `ProductPrice` decimal(20,0) DEFAULT NULL,
  `Picture` varchar(50) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `DescribeText` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `FK_Relationship_10` (`suplr_id`),
  KEY `FK_Relationship_6` (`category_id`),
  KEY `FK_Relationship_8` (`promo_id`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`suplr_id`) REFERENCES `supplier` (`suplr_id`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`promo_id`) REFERENCES `promotion` (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for promotion
-- ----------------------------
DROP TABLE IF EXISTS `promotion`;
CREATE TABLE `promotion` (
  `promo_id` bigint(20) NOT NULL,
  `suplr_id` bigint(20) DEFAULT NULL,
  `Promo_name` varchar(50) DEFAULT NULL,
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
  `shop_id` bigint(20) NOT NULL,
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
  `suplr_id` bigint(20) NOT NULL,
  `suplyr_name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `Postcode` varchar(20) DEFAULT NULL,
  `RegisterTime` datetime DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `suply_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`suplr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '1', '1', '1', '1', '1', null, 'c4ca4238a0b923820dcc509a6f75849b', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` bigint(20) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` varchar(4) DEFAULT NULL,
  `score` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'c4ca4238a0b923820dcc509a6f75849b', null, null, null, '0', null);
INSERT INTO `user` VALUES ('2', 'c4ca4238a0b923820dcc509a6f75849b', null, null, null, '1', null);
INSERT INTO `user` VALUES ('3', 'c4ca4238a0b923820dcc509a6f75849b', null, null, null, '2', null);
=======
/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : shopmart

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-02-28 17:35:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_name` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`admin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'c4ca4238a0b923820dcc509a6f75849b');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL,
  `cat_category_id` bigint(20) DEFAULT NULL,
  `suplr_id` bigint(20) DEFAULT NULL,
  `categ_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `FK_Relationship_11` (`cat_category_id`),
  KEY `FK_Relationship_7` (`suplr_id`),
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`cat_category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`suplr_id`) REFERENCES `supplier` (`suplr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `item_id` bigint(20) NOT NULL,
  `ordr_id` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `num` decimal(8,0) DEFAULT NULL,
  `Note` varchar(50) DEFAULT NULL,
  `count` decimal(20,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_Relationship_3` (`ordr_id`),
  KEY `FK_Relationship_5` (`pro_id`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`ordr_id`) REFERENCES `orders` (`ordr_id`),
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
  `ordr_id` bigint(20) NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `postage` decimal(9,0) DEFAULT NULL,
  `total` decimal(20,0) DEFAULT NULL,
  `DeliveryDate` varchar(50) DEFAULT NULL,
  `DeliveryMethod` varchar(100) DEFAULT NULL,
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
  `pro_id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `promo_id` bigint(20) DEFAULT NULL,
  `suplr_id` bigint(20) DEFAULT NULL,
  `ProductName` varchar(1024) DEFAULT NULL,
  `ProductPrice` decimal(20,0) DEFAULT NULL,
  `Picture` varchar(50) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `DescribeText` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `FK_Relationship_10` (`suplr_id`),
  KEY `FK_Relationship_6` (`category_id`),
  KEY `FK_Relationship_8` (`promo_id`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`suplr_id`) REFERENCES `supplier` (`suplr_id`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`promo_id`) REFERENCES `promotion` (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for promotion
-- ----------------------------
DROP TABLE IF EXISTS `promotion`;
CREATE TABLE `promotion` (
  `promo_id` bigint(20) NOT NULL,
  `suplr_id` bigint(20) DEFAULT NULL,
  `Promo_name` varchar(50) DEFAULT NULL,
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
  `shop_id` bigint(20) NOT NULL,
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
  `suplr_id` bigint(20) NOT NULL,
  `suplyr_name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `Postcode` varchar(20) DEFAULT NULL,
  `RegisterTime` datetime DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `suply_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`suplr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '1', '1', '1', '1', '1', null, 'c4ca4238a0b923820dcc509a6f75849b', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` bigint(20) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` varchar(4) DEFAULT NULL,
  `score` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'c4ca4238a0b923820dcc509a6f75849b', null, null, null, '0', null);
INSERT INTO `user` VALUES ('2', 'c4ca4238a0b923820dcc509a6f75849b', null, null, null, '1', null);
INSERT INTO `user` VALUES ('3', 'c4ca4238a0b923820dcc509a6f75849b', null, null, null, '2', null);
>>>>>>> 6816783a840b1159aa062120cf62135f1e6a25c6

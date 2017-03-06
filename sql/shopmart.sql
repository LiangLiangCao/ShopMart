# ************************************************************
# Sequel Pro SQL dump
# Version 4529
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.14)
# Database: ShopMart
# Generation Time: 2017-03-04 10:30:57 +0000
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table category
# ------------------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `category`;

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

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`category_id`, `parent_category_id`, `supplier_id`, `category_name`, `is_delete`)
VALUES
	(1,NULL,1,'电子商品',0),
	(2,NULL,1,'服装',0),
	(3,NULL,1,'化妆品',0);

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orderitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orderitem`;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;

INSERT INTO `orderitem` (`item_id`, `order_id`, `product_id`, `total_price`, `num`, `note`, `item_price`, `is_delete`)
VALUES
	(1,1,1,10000,NULL,NULL,NULL,0),
	(2,2,1,10000,NULL,NULL,NULL,0),
	(3,3,1,10000,NULL,NULL,NULL,0),
	(4,4,1,10000,NULL,NULL,NULL,0),
	(5,5,1,10000,NULL,NULL,NULL,0),
	(6,6,4,450,NULL,NULL,NULL,0),
	(7,7,5,500,NULL,NULL,NULL,0),
	(8,12,5,500,NULL,NULL,NULL,0),
	(9,13,5,500,NULL,NULL,NULL,0),
	(10,15,5,500,NULL,NULL,NULL,0);

/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`ordr_id`, `user_id`, `name`, `address`, `phone`, `postage`, `total`, `delivery_date`, `delivery_method`, `product_toatl`, `create_time`, `pay_time`, `close_time`, `state`, `is_delete`)
VALUES
	(1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),
	(12,3,'张三','上海市浦东新区翔融苑','18312970000',NULL,NULL,NULL,'快递',NULL,NULL,NULL,NULL,NULL,0),
	(13,3,'bill','上海市浦东新区翔融苑','18312970000',NULL,NULL,NULL,'快递',NULL,NULL,NULL,NULL,NULL,0),
	(14,3,'marry','上海市浦东新区翔融苑','18312970000',NULL,NULL,NULL,'快递',NULL,NULL,NULL,NULL,NULL,0),
	(15,3,'he','lalal','147384623',NULL,NULL,NULL,'kdnjksf',NULL,NULL,NULL,NULL,NULL,0);

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

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

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`product_id`, `category_id`, `promotion_id`, `supplier_id`, `product_name`, `price`, `picture`, `quantity`, `description`, `is_delete`)
VALUES
	(1,1,NULL,1,'mac pro 13',10000,NULL,20,'ssd固态硬盘',0),
	(2,1,NULL,1,'u盘',1,NULL,10,'Kingston 16g 红色',0),
	(3,2,NULL,1,'zara连衣裙',500,NULL,8,'白色，修身',0),
	(4,2,NULL,1,'zara长裤',450,NULL,18,'黑色直筒',0),
	(5,3,NULL,1,'make up forever粉底液',500,NULL,20,'四色可选',0);

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table promotion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `promotion`;

CREATE TABLE `promotion` (
  `promotion_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '促销编号',
  `promotion_name` varchar(50) DEFAULT NULL COMMENT '促销名称',
  `begin_time` datetime DEFAULT NULL COMMENT '促销开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '停止时间',
  `discount` decimal(4,0) DEFAULT NULL COMMENT '促销折扣',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '1删除，0存在',
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# Dump of table shopitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shopitem`;

CREATE TABLE `shopitem` (
  `shop_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Item编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '主键',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品编号',
  `count` decimal(20,0) DEFAULT NULL COMMENT '条目总价',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `num` decimal(8,0) DEFAULT NULL COMMENT '数量',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '1删除，0存在',
  PRIMARY KEY (`shop_id`),
  KEY `FK_Relationship_2` (`user_id`),
  KEY `FK_Relationship_4` (`product_id`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table supplier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier`;

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

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `address`, `phone`, `type`, `postcode`, `register_time`, `password`, `is_delete`)
VALUES
	(1,'1','1','1','1','1',NULL,'c4ca4238a0b923820dcc509a6f75849b',0);

/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

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

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`user_id`, `password`, `gender`, `email`, `phone`, `role`, `score`, `is_delete`)
VALUES
	(1,'c4ca4238a0b923820dcc509a6f75849b','','121@qq.com','123','0',NULL,0),
	(2,'c4ca4238a0b923820dcc509a6f75849b',NULL,'1@qq.com',NULL,'1',NULL,0),
	(3,'c4ca4238a0b923820dcc509a6f75849b',NULL,'3@qq.com',NULL,'2',NULL,0),
	(4,'c4ca4238a0b923820dcc509a6f75849b',NULL,'123456789@qq.com',NULL,'2',NULL,0),
	(5,'c4ca4238a0b923820dcc509a6f75849b',NULL,'123@qq.com',NULL,'2',NULL,0),
	(6,'c4ca4238a0b923820dcc509a6f75849b',NULL,'1@qq.com',NULL,'1',NULL,0),
	(7,'c4ca4238a0b923820dcc509a6f75849b',NULL,'12@163.com',NULL,'1',NULL,0),
	(8,'c4ca4238a0b923820dcc509a6f75849b',NULL,'2@qq.com',NULL,'1',NULL,0),
	(10,'c4ca4238a0b923820dcc509a6f75849b',NULL,'54@qq.com',NULL,'2',NULL,0);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
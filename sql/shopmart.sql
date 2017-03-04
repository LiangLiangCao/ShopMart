

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
  `cat_category_id` bigint(20) DEFAULT NULL COMMENT '种类_类别编号',
  `suplr_id` bigint(20) DEFAULT NULL COMMENT '供应商编号',
  `categ_name` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `is_delete` int(1) DEFAULT NULL COMMENT '0删除，1存在',
  PRIMARY KEY (`category_id`),
  KEY `FK_Relationship_11` (`cat_category_id`),
  KEY `FK_Relationship_7` (`suplr_id`),
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`cat_category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`suplr_id`) REFERENCES `supplier` (`suplr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`category_id`, `cat_category_id`, `suplr_id`, `categ_name`, `is_delete`)
VALUES
	(1,NULL,1,'电子商品',1),
	(2,NULL,1,'服装',1),
	(3,NULL,1,'化妆品',1);

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orderitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单项编号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `pro_id` bigint(20) DEFAULT NULL COMMENT '产品编号',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `num` decimal(8,0) DEFAULT NULL COMMENT '数量',
  `note` varchar(50) DEFAULT NULL COMMENT '订单项留言',
  `count` decimal(20,0) DEFAULT NULL COMMENT '条目总价',
  `is_delete` int(1) DEFAULT NULL COMMENT '0删除，1存在',
  PRIMARY KEY (`item_id`),
  KEY `FK_Relationship_3` (`order_id`),
  KEY `FK_Relationship_5` (`pro_id`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`ordr_id`),
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `ordr_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `uid` bigint(20) DEFAULT NULL COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '收货人姓名',
  `address` varchar(100) DEFAULT NULL COMMENT '住址',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `postage` decimal(9,0) DEFAULT NULL COMMENT '运费总价',
  `total` decimal(20,0) DEFAULT NULL COMMENT '订单总价',
  `delivery_date` varchar(50) DEFAULT NULL COMMENT '交付日期',
  `delivery_method` varchar(100) DEFAULT NULL COMMENT '交付方式',
  `pro_toatl` decimal(20,0) DEFAULT NULL COMMENT '商品总价',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `close_time` datetime DEFAULT NULL COMMENT '完成时间',
  `state` varchar(4) DEFAULT NULL COMMENT '状态',
  `is_delete` int(1) DEFAULT NULL COMMENT '0删除，1存在',
  PRIMARY KEY (`ordr_id`),
  KEY `FK_Relationship_1` (`uid`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pro_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '产品编号',
  `category_id` bigint(20) DEFAULT NULL COMMENT '类别编号',
  `promo_id` bigint(20) DEFAULT NULL COMMENT '促销编号',
  `suplr_id` bigint(20) DEFAULT NULL COMMENT '供应商编号',
  `product_name` varchar(1024) DEFAULT NULL COMMENT '产品名称',
  `price` decimal(20,0) DEFAULT NULL COMMENT '产品价格',
  `picture` varchar(50) DEFAULT NULL COMMENT '图片',
  `quantity` int(255) DEFAULT NULL COMMENT '产品描述',
  `description` varchar(100) DEFAULT NULL COMMENT '商品存量',
  `is_delete` int(1) DEFAULT NULL COMMENT '0删除，1存在',
  PRIMARY KEY (`pro_id`),
  KEY `FK_Relationship_10` (`suplr_id`),
  KEY `FK_Relationship_6` (`category_id`),
  KEY `FK_Relationship_8` (`promo_id`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`suplr_id`) REFERENCES `supplier` (`suplr_id`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`promo_id`) REFERENCES `promotion` (`promo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`pro_id`, `category_id`, `promo_id`, `suplr_id`, `product_name`, `price`, `picture`, `quantity`, `description`, `is_delete`)
VALUES
	(1,1,NULL,1,'mac pro 13',10000,NULL,20,'ssd固态硬盘',1),
	(2,1,NULL,1,'u盘',1,NULL,10,'Kingston 16g 红色',1),
	(3,2,NULL,1,'zara连衣裙',500,NULL,8,'白色，修身',1),
	(4,2,NULL,1,'zara长裤',450,NULL,18,'黑色直筒',1),
	(5,3,NULL,1,'make up forever粉底液',500,NULL,20,'四色可选',1);

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table promotion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `promotion`;

CREATE TABLE `promotion` (
  `promo_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '促销编号',
  `promo_name` varchar(50) DEFAULT NULL COMMENT '促销名称',
  `begin_time` datetime DEFAULT NULL COMMENT '促销开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '停止时间',
  `discount` decimal(4,0) DEFAULT NULL COMMENT '促销折扣',
  `is_delete` int(1) DEFAULT NULL COMMENT '0删除，1存在',
  PRIMARY KEY (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table shopitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shopitem`;

CREATE TABLE `shopitem` (
  `shop_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Item编号',
  `uid` bigint(20) DEFAULT NULL COMMENT '主键',
  `pro_id` bigint(20) DEFAULT NULL COMMENT '产品编号',
  `count` decimal(20,0) DEFAULT NULL COMMENT '条目总价',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `num` decimal(8,0) DEFAULT NULL COMMENT '数量',
  `is_delete` int(1) DEFAULT NULL COMMENT '0删除，1存在',
  PRIMARY KEY (`shop_id`),
  KEY `FK_Relationship_2` (`uid`),
  KEY `FK_Relationship_4` (`pro_id`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table supplier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `suplr_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '供应商编号',
  `suplyr_name` varchar(100) DEFAULT NULL COMMENT '供应商名称',
  `address` varchar(100) DEFAULT NULL COMMENT '住址',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `type` varchar(100) DEFAULT NULL COMMENT '供货方式',
  `postcode` varchar(20) DEFAULT NULL COMMENT '邮编',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `suply_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `is_delete` int(1) DEFAULT NULL COMMENT '0删除，1存在',
  PRIMARY KEY (`suplr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;

INSERT INTO `supplier` (`suplr_id`, `suplyr_name`, `address`, `phone`, `type`, `postcode`, `register_time`, `password`, `suply_name`, `is_delete`)
VALUES
	(1,'1','1','1','1','1',NULL,'c4ca4238a0b923820dcc509a6f75849b',NULL,1);

/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `gender` char(1) DEFAULT NULL COMMENT '性别',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `role` varchar(4) DEFAULT NULL COMMENT '积分',
  `score` bigint(20) DEFAULT NULL COMMENT '角色',
  `is_delete` int(1) DEFAULT NULL COMMENT '0删除，1存在',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`uid`, `password`, `gender`, `email`, `phone`, `role`, `score`, `is_delete`)
VALUES
	(1,'c4ca4238a0b923820dcc509a6f75849b','','121@qq.com','123','0',NULL,1),
	(2,'c4ca4238a0b923820dcc509a6f75849b',NULL,'1@qq.com',NULL,'1',NULL,1),
	(3,'c4ca4238a0b923820dcc509a6f75849b',NULL,'3@qq.com',NULL,'2',NULL,1),
	(4,'c4ca4238a0b923820dcc509a6f75849b',NULL,'123456789@qq.com',NULL,'2',NULL,1),
	(5,'c4ca4238a0b923820dcc509a6f75849b',NULL,'123@qq.com',NULL,'2',NULL,1),
	(6,'c4ca4238a0b923820dcc509a6f75849b',NULL,'1@qq.com',NULL,'1',NULL,1),
	(7,'c4ca4238a0b923820dcc509a6f75849b',NULL,'12@163.com',NULL,'1',NULL,1),
	(8,'c4ca4238a0b923820dcc509a6f75849b',NULL,'2@qq.com',NULL,'1',NULL,1),
	(10,'c4ca4238a0b923820dcc509a6f75849b',NULL,'54@qq.com',NULL,'2',NULL,1);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
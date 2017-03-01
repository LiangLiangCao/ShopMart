-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 01, 2017 at 01:56 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shopmart`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`category_id` bigint(20) NOT NULL,
  `cat_category_id` bigint(20) DEFAULT NULL,
  `suplr_id` bigint(20) DEFAULT NULL,
  `categ_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE IF NOT EXISTS `orderitem` (
`item_id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `num` decimal(8,0) DEFAULT NULL,
  `note` varchar(50) DEFAULT NULL,
  `count` decimal(20,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`ordr_id` bigint(20) NOT NULL,
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
  `state` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
`pro_id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `promo_id` bigint(20) DEFAULT NULL,
  `suplr_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(1024) DEFAULT NULL,
  `price` decimal(20,0) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE IF NOT EXISTS `promotion` (
`promo_id` bigint(20) NOT NULL,
  `suplr_id` bigint(20) DEFAULT NULL,
  `promo_name` varchar(50) DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `discount` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shopitem`
--

CREATE TABLE IF NOT EXISTS `shopitem` (
`shop_id` bigint(20) NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `count` decimal(20,0) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `num` decimal(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
`suplr_id` bigint(20) NOT NULL,
  `suplyr_name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `postcode` varchar(20) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `suply_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`suplr_id`, `suplyr_name`, `address`, `phone`, `type`, `postcode`, `register_time`, `password`, `suply_name`) VALUES
(1, '1', '1', '1', '1', '1', NULL, 'c4ca4238a0b923820dcc509a6f75849b', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`uid` bigint(20) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` varchar(4) DEFAULT NULL,
  `score` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `password`, `gender`, `email`, `phone`, `role`, `score`) VALUES
(1, 'c4ca4238a0b923820dcc509a6f75849b', NULL, NULL, NULL, '0', NULL),
(2, 'c4ca4238a0b923820dcc509a6f75849b', NULL, NULL, NULL, '1', NULL),
(3, 'c4ca4238a0b923820dcc509a6f75849b', NULL, NULL, NULL, '2', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`category_id`), ADD KEY `FK_Relationship_11` (`cat_category_id`), ADD KEY `FK_Relationship_7` (`suplr_id`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
 ADD PRIMARY KEY (`item_id`), ADD KEY `FK_Relationship_3` (`order_id`), ADD KEY `FK_Relationship_5` (`pro_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`ordr_id`), ADD KEY `FK_Relationship_1` (`uid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
 ADD PRIMARY KEY (`pro_id`), ADD KEY `FK_Relationship_10` (`suplr_id`), ADD KEY `FK_Relationship_6` (`category_id`), ADD KEY `FK_Relationship_8` (`promo_id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
 ADD PRIMARY KEY (`promo_id`), ADD KEY `FK_Relationship_9` (`suplr_id`);

--
-- Indexes for table `shopitem`
--
ALTER TABLE `shopitem`
 ADD PRIMARY KEY (`shop_id`), ADD KEY `FK_Relationship_2` (`uid`), ADD KEY `FK_Relationship_4` (`pro_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
 ADD PRIMARY KEY (`suplr_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
MODIFY `item_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `ordr_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
MODIFY `pro_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
MODIFY `promo_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shopitem`
--
ALTER TABLE `shopitem`
MODIFY `shop_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
MODIFY `suplr_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
ADD CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`cat_category_id`) REFERENCES `category` (`category_id`),
ADD CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`suplr_id`) REFERENCES `supplier` (`suplr_id`);

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
ADD CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`ordr_id`),
ADD CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
ADD CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`suplr_id`) REFERENCES `supplier` (`suplr_id`),
ADD CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
ADD CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`promo_id`) REFERENCES `promotion` (`promo_id`);

--
-- Constraints for table `promotion`
--
ALTER TABLE `promotion`
ADD CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`suplr_id`) REFERENCES `supplier` (`suplr_id`);

--
-- Constraints for table `shopitem`
--
ALTER TABLE `shopitem`
ADD CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
ADD CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

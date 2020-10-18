SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Accounts
-- ----------------------------
DROP TABLE IF EXISTS `Accounts`;
CREATE TABLE `Accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for Address
-- ----------------------------
DROP TABLE IF EXISTS `Address`;
CREATE TABLE `Address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `createdDate` datetime NOT NULL,
  `lastUpdateDate` datetime NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `address_accounts_fk` FOREIGN KEY (`accountId`) REFERENCES `Accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for CreditCard
-- ----------------------------
DROP TABLE IF EXISTS `CreditCard`;
CREATE TABLE `CreditCard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) NOT NULL,
  `nameOnCard` varchar(50) NOT NULL,
  `number` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `expirationDate` date NOT NULL,
  `createdDate` datetime NOT NULL,
  `lastUpdateDate` datetime NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `creditcard_accounts_fk` FOREIGN KEY (`accountId`) REFERENCES `Accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for Customer
-- ----------------------------
DROP TABLE IF EXISTS `Customer`;
CREATE TABLE `Customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) NOT NULL,
  `firstName` varchar(30) NULL,
  `lastName` varchar(30) NULL,
  `email` varchar(50) NOT NULL UNIQUE,
  `createdDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `customer_accounts_fk` FOREIGN KEY (`accountId`) REFERENCES `Accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for Shipment
-- ----------------------------
DROP TABLE IF EXISTS `Shipment`;
CREATE TABLE `Shipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addressId` int(11) NOT NULL,
  `trackingId` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `provider` varchar(100) NOT NULL,
  `price` decimal(18, 2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `shipment_address_fk` FOREIGN KEY (`addressId`) REFERENCES `Address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for Order
-- ----------------------------
DROP TABLE IF EXISTS `Order`;
CREATE TABLE `Order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) NOT NULL,
  `shipmentId` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `totalAmount` int(11) NOT NULL,
  `totalTax` decimal(18, 2) NULL,
  `createdDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `order_accounts_fk` FOREIGN KEY (`accountId`) REFERENCES `Accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_shipment_fk` FOREIGN KEY (`shipmentId`) REFERENCES `Shipment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for OrderDetails
-- ----------------------------
DROP TABLE IF EXISTS `OrderDetails`;
CREATE TABLE `OrderDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `totalAmount` int(11) NOT NULL,
  `totalTax` decimal(18, 2) NULL,
  `createdDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `orderdetails_order_fk` FOREIGN KEY (`orderId`) REFERENCES `Orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderdetails_product_fk` FOREIGN KEY (`productId`) REFERENCES `Product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for Payment
-- ----------------------------
DROP TABLE IF EXISTS `Payment`;
CREATE TABLE `Payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `method` varchar(50) NOT NULL,
  `totalAmount` decimal(18, 2) NOT NULL,
  `createdDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `payment_order_fk` FOREIGN KEY (`orderId`) REFERENCES `Orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for Product
-- ----------------------------
DROP TABLE IF EXISTS `Payment`;
CREATE TABLE `Payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NULL,
  `sku` varchar(12) NULL,
  `size` decimal(18, 2) NULL,
  `upc` varchar(12) NOT NULL,
  `unitPrice` decimal(18, 2) NOT NULL,
  `unitInStock` int(11) NULL,
  `createdDate` datetime NOT NULL,
  PRIMARY KEY (`id`)  
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;

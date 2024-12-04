CREATE TABLE IF NOT EXISTS `product` (
	`product_id` int NOT NULL,
	`category` varchar(50) NOT NULL,
	`description` varchar(50) NOT NULL,
	`manufacturer` varchar(50) NOT NULL,
	`name` varchar(50) NOT NULL,
	`price` decimal(10,2) NOT NULL,
	PRIMARY KEY (`product_id`)
);

CREATE TABLE IF NOT EXISTS `cart` (
	`cart_id` int NOT NULL,
	`total_price` decimal(10,2) NOT NULL,
	PRIMARY KEY (`cart_id`)
);

CREATE TABLE IF NOT EXISTS `cart_item` (
	`cart_item_id` varchar(255) NOT NULL,
	`quantity` int NOT NULL,
	`price` decimal(10,2) NOT NULL,
	`cart_id` int NOT NULL,
	`product_id` int NOT NULL,
	PRIMARY KEY (`cart_item_id`)
);

CREATE TABLE IF NOT EXISTS `user` (
	`user_id` int NOT NULL,
	`email` varchar(255) NOT NULL UNIQUE,
	`password` varchar(255) NOT NULL,
	`enable` bool NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE IF NOT EXISTS `shipping_adress` (
	`shipping_adress_id` int NOT NULL,
	`adress` varchar(255) NOT NULL,
	`city` varchar(100) NOT NULL,
	`state` varchar(100) NOT NULL,
	`zipcode` varchar(20) NOT NULL,
	`country` varchar(100) NOT NULL,
	PRIMARY KEY (`shipping_adress_id`)
);

CREATE TABLE IF NOT EXISTS `billing_adress` (
	`billing_adress_id` int NOT NULL,
	`adress` varchar(255) NOT NULL,
	`city` varchar(100) NOT NULL,
	`state` varchar(100) NOT NULL,
	`zipcode` varchar(20) NOT NULL,
	`country` varchar(100) NOT NULL,
	PRIMARY KEY (`billing_adress_id`)
);

CREATE TABLE IF NOT EXISTS `customer` (
	`customer_id` int NOT NULL,
	`first_name` varchar(100) NOT NULL,
	`last_name` varchar(100) NOT NULL,
	`phone` varchar(20) NOT NULL,
	`shipping_adress_id` int NOT NULL,
	`billing_adress_id` int NOT NULL,
	`user_id` int NOT NULL,
	`cart_id` int NOT NULL,
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE IF NOT EXISTS `authorities` (
	`author_id` int NOT NULL,
	`email` varchar(225) NOT NULL,
	`authorities` varchar(255) NOT NULL,
	PRIMARY KEY (`author_id`)
);

CREATE TABLE IF NOT EXISTS `sales_order` (
	`sale_id` int NOT NULL,
	`cart_id` int NOT NULL,
	`customer_id` int NOT NULL,
	`shipping_adress_id` int NOT NULL,
	`billing_adress_id` int NOT NULL,
	PRIMARY KEY (`sale_id`)
);



ALTER TABLE `cart_item` ADD CONSTRAINT `cart_item_fk3` FOREIGN KEY (`cart_id`) REFERENCES `cart`(`cart_id`);

ALTER TABLE `cart_item` ADD CONSTRAINT `cart_item_fk4` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);



ALTER TABLE `customer` ADD CONSTRAINT `customer_fk4` FOREIGN KEY (`shipping_adress_id`) REFERENCES `shipping_adress`(`shipping_adress_id`);

ALTER TABLE `customer` ADD CONSTRAINT `customer_fk5` FOREIGN KEY (`billing_adress_id`) REFERENCES `billing_adress`(`billing_adress_id`);

ALTER TABLE `customer` ADD CONSTRAINT `customer_fk6` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);

ALTER TABLE `customer` ADD CONSTRAINT `customer_fk7` FOREIGN KEY (`cart_id`) REFERENCES `cart`(`cart_id`);
ALTER TABLE `authorities` ADD CONSTRAINT `authorities_fk1` FOREIGN KEY (`email`) REFERENCES `user`(`email`);
ALTER TABLE `sales_order` ADD CONSTRAINT `sales_order_fk1` FOREIGN KEY (`cart_id`) REFERENCES `cart`(`cart_id`);

ALTER TABLE `sales_order` ADD CONSTRAINT `sales_order_fk2` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`);

ALTER TABLE `sales_order` ADD CONSTRAINT `sales_order_fk3` FOREIGN KEY (`shipping_adress_id`) REFERENCES `shipping_adress`(`shipping_adress_id`);

ALTER TABLE `sales_order` ADD CONSTRAINT `sales_order_fk4` FOREIGN KEY (`billing_adress_id`) REFERENCES `billing_adress`(`billing_adress_id`);
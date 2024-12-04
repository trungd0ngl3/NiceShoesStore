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

CREATE TABLE IF NOT EXISTS `shipping_address` (
	`shipping_address_id` int NOT NULL,
	`address` varchar(255) NOT NULL,
	`city` varchar(100) NOT NULL,
	`state` varchar(100) NOT NULL,
	`zipcode` varchar(20) NOT NULL,
	`country` varchar(100) NOT NULL,
	PRIMARY KEY (`shipping_address_id`)
);

CREATE TABLE IF NOT EXISTS `billing_address` (
	`billing_address_id` int NOT NULL,
	`address` varchar(255) NOT NULL,
	`city` varchar(100) NOT NULL,
	`state` varchar(100) NOT NULL,
	`zipcode` varchar(20) NOT NULL,
	`country` varchar(100) NOT NULL,
	PRIMARY KEY (`billing_address_id`)
);

CREATE TABLE IF NOT EXISTS `customer` (
	`customer_id` int NOT NULL,
	`first_name` varchar(100) NOT NULL,
	`last_name` varchar(100) NOT NULL,
	`phone` varchar(20) NOT NULL,
	`shipping_address_id` int NOT NULL,
	`billing_address_id` int NOT NULL,
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
	`shipping_address_id` int NOT NULL,
	`billing_address_id` int NOT NULL,
	PRIMARY KEY (`sale_id`)
);



ALTER TABLE `cart_item` ADD CONSTRAINT `cart_item_fk3` FOREIGN KEY (`cart_id`) REFERENCES `cart`(`cart_id`);

ALTER TABLE `cart_item` ADD CONSTRAINT `cart_item_fk4` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);



ALTER TABLE `customer` ADD CONSTRAINT `customer_fk4` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_address`(`shipping_address_id`);

ALTER TABLE `customer` ADD CONSTRAINT `customer_fk5` FOREIGN KEY (`billing_address_id`) REFERENCES `billing_address`(`billing_address_id`);

ALTER TABLE `customer` ADD CONSTRAINT `customer_fk6` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);

ALTER TABLE `customer` ADD CONSTRAINT `customer_fk7` FOREIGN KEY (`cart_id`) REFERENCES `cart`(`cart_id`);
ALTER TABLE `authorities` ADD CONSTRAINT `authorities_fk1` FOREIGN KEY (`email`) REFERENCES `user`(`email`);
ALTER TABLE `sales_order` ADD CONSTRAINT `sales_order_fk1` FOREIGN KEY (`cart_id`) REFERENCES `cart`(`cart_id`);

ALTER TABLE `sales_order` ADD CONSTRAINT `sales_order_fk2` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`);

ALTER TABLE `sales_order` ADD CONSTRAINT `sales_order_fk3` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_address`(`shipping_address_id`);

ALTER TABLE `sales_order` ADD CONSTRAINT `sales_order_fk4` FOREIGN KEY (`billing_address_id`) REFERENCES `billing_address`(`billing_address_id`);

-- ------------------------------- 
-- INSERT VALUES
-- ------------------------------- 

INSERT INTO product (product_id, category, description, manufacturer, name, price) VALUES
(1, 'Footwear', 'Running', 'Nike', 'Nike Vaporfly 3', 260.00),
(2, 'Footwear', 'Running', 'Nike', 'Nike Pegasus 41', 140.00),
(3, 'Footwear', 'Running', 'Nike', 'Nike Zoom Fly 6 ', 170.00),
(4, 'Footwear', 'Running', 'Nike', 'Nike Invincible 3', 180.00),
(5, 'Footwear', 'Basketball', 'Nike', 'KD17', 160.00),
(6, 'Footwear', 'Basketball', 'Nike', 'Giannis Immortality 4', 85.00),
(7, 'Footwear', 'Basketball', 'Nike', 'Luka 3', 130.00),
(8, 'Footwear', 'Casual', 'Nike', 'Air Force 1', 115.00),
(9, 'Footwear', 'Casual', 'Nike', 'Air Jordan 3', 200.00),
(10, 'Footwear', 'Casual', 'Nike', 'Air Jordan 5', 200.00),
(11, 'Footwear', 'Running', 'Adidas', 'Ultrarun 5 Running Shoes', 120.00),
(12, 'Footwear', 'Running', 'Adidas', 'Switch Run Running Shoes', 140.00),
(13, 'Footwear', 'Running', 'Adidas', 'Supernova Stride Running Shoes', 155.00),
(14, 'Footwear', 'Running', 'Adidas', 'Runfalcon 5 Running Shoes', 48.00),
(15, 'Footwear', 'Casual', 'Adidas', 'Grand Court TD Lifestyle Court', 148.00),
(16, 'Footwear', 'Casual', 'Adidas', 'Originals Samba OG Casual Shoes', 100.00);

INSERT INTO user (user_id, email, password, enable) VALUES
(1, '22130042@st.hcmuaf.edu.vn', 'dong123', TRUE),
(2, 'jane.shoe_collector@example.com', 'jane456', TRUE);


INSERT INTO customer (customer_id, first_name, last_name, phone, shipping_address_id, billing_address_id, user_id, cart_id) VALUES
(1, 'Trung Dong', 'Le', '123-456-7890', 1, 1, 1, 1),
(2, 'Jane', 'Smith', '987-654-3210', 2, 2, 2, 2);

INSERT INTO shipping_address (shipping_address_id, address, city, state, zipcode, country) VALUES
(1, '123 Shoe St', 'New York', 'NY', '10001', 'USA'),
(2, '456 Sneaker Ave', 'Los Angeles', 'CA', '90001', 'USA');

INSERT INTO billing_address (billing_address_id, address, city, state, zipcode, country) VALUES
(1, '123 Shoe St', 'New York', 'NY', '10001', 'USA'),
(2, '456 Sneaker Ave', 'Los Angeles', 'CA', '90001', 'USA');

INSERT INTO cart (cart_id, total_price) VALUES
(1, 0.00),
(2, 0.00);













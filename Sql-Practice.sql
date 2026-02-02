CREATE DATABASE Met_Practice;
USE Met_Practice;

-- Company: TechMart (E-commerce Company)

CREATE TABLE Customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_name VARCHAR(50),
email VARCHAR(50),
city VARCHAR(50),
signup_date DATE
);

-- Checking the table Created OR Not
SELECT * FROM Customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;


DROP TABLE orders;

-- Creating Another products Table.
CREATE TABLE products(
product_id int PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(50),
category VARCHAR(50),
price DECIMAL (10,2)
);

-- Creating Another orders Table.
CREATE TABLE orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Creating Table Order_item's
CREATE TABLE order_items(
order_item_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
product_id INT,
quantity INT,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- INSERTNG THE DATA INTO CUSTOMERS --
SELECT * FROM customers;
INSERT INTO customers (customer_name, email, city, signup_date) VALUES
					('Aman Sharma', 'aman@gmail.com', 'Delhi', '2024-01-10'),
					('Riya Verma', 'riya@gmail.com', 'Mumbai', '2024-02-15'),
					('Kunal Mehta', 'kunal@gmail.com', 'Bangalore', '2024-03-05'),
					('Sneha Patel', 'sneha@gmail.com', 'Ahmedabad', '2024-04-20');

-- INSERTING THE DATA INTO PRODUCTS -- 
SELECT * FROM products;
INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 60000),
('Smartphone', 'Electronics', 30000),
('Headphones', 'Accessories', 3000),
('Keyboard', 'Accessories', 1500);

-- INSERTING DATA INTO ORDERS --
SELECT * FROM orders;
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-05-01'),
(2, '2024-05-03'),
(1, '2024-05-10'),
(3, '2024-05-15');

-- INSERTING DATA INTO order_items --
SELECT * FROM order_items;
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 1),
(4, 1, 1),
(4, 2, 1);

# Querries Started From Here

-- Easy Level --
-- 1️.View all customers
SELECT * FROM customers;

-- 2.List all products with price > 5000
SELECT * FROM products
WHERE PRICE >5000;

-- 3️.Count total customers
SELECT COUNT(Customer_Id) 
FROM customers;


-- INTERMEDIATE Queries --
-- 1.Total orders per customer
SELECT c.customer_name, COUNT(order_id) AS Total_Orders
FROM customers c
JOIN orders o on c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 2.Total revenue per order
SELECT oi.order_id,
       SUM(p.price * oi.quantity) AS order_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.order_id;

-- 3.Best selling product
SELECT p.product_name, SUM(oi.quantity) AS Total_Sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_Sold DESC
LIMIT 2;


-- Advanced --
-- 1.Customer lifetime value (CLV)
-- This Give LifeTime Purchase Of Customer's
SELECT c.customer_name,
		SUM(p.price * oi.quantity) AS Lifetime_Value
FROM customers c
JOIN orders o  ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY lifetime_value DESC;

-- 2. Rank Customer By There Spendings
SELECT customer_name, lifetime_value,
       RANK() OVER (ORDER BY lifetime_value DESC) AS spending_rank
FROM (
    SELECT c.customer_name,
           SUM(p.price * oi.quantity) AS lifetime_value
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY c.customer_name
) t;

-- Q3. Customer Who Bought Laptop
SELECT DISTINCT c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.product_name = 'Laptop';
COMMIT;




















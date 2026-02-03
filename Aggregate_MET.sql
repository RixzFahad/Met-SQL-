-- =====================================================
-- DATABASE SELECTION
-- =====================================================
-- USE is used to select the database in which
-- all the following operations will be performed
USE rixz_met;


-- =====================================================
-- TABLE CREATION
-- =====================================================
-- products table stores product-related information
-- PRIMARY KEY: uniquely identifies each record
-- FOREIGN KEY: product_type_id references product_types(type_id)

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_type_id INT REFERENCES product_types(type_id),
    name VARCHAR(30) NOT NULL,          -- product name (cannot be NULL)
    description VARCHAR(50),            -- short product description
    price DECIMAL(5,2)                  -- price with 2 decimal precision
);


-- =====================================================
-- INSERTING DATA (MULTIPLE ROW INSERT)
-- =====================================================
-- INSERT INTO is used to add data into the table
-- Multiple rows can be inserted in a single query

INSERT INTO products (product_id, product_type_id, name, description, price)
VALUES
(1, 1, 'Laptop', '15 inch gaming laptop', 899.99),
(2, 1, 'Smartphone', 'Android 5G phone', 699.50),
(3, 2, 'Headphones', 'Noise cancelling headset', 129.99),
(4, 2, 'Bluetooth Speaker', 'Portable speaker', 79.99),
(5, 3, 'Office Chair', 'Ergonomic chair', 149.75),
(6, 3, 'Study Table', 'Wooden study desk', 199.00),
(7, 4, 'Water Bottle', 'Steel insulated bottle', 25.49),
(8, 4, 'Backpack', 'Laptop travel backpack', 59.99),
(9, 2, 'Wireless Mouse', 'Rechargeable mouse', 34.99),
(10, 1, 'Tablet', '10 inch Android tablet', 249.99);


-- =====================================================
-- VIEWING TABLE DATA
-- =====================================================
-- SELECT * retrieves all columns and rows from the table
SELECT * FROM products;


-- =====================================================
-- AGGREGATE FUNCTIONS OVERVIEW
-- =====================================================
-- Aggregate functions operate on multiple rows
-- and return a single summarized value

SELECT
    COUNT(*) AS total_rows,         -- COUNT(): total number of records
    SUM(price) AS total_price,      -- SUM(): total sum of price column
    AVG(price) AS average_price,    -- AVG(): average of price column
    MIN(price) AS minimum_price,    -- MIN(): smallest price value
    MAX(price) AS maximum_price    -- MAX(): largest price value
FROM products;


-- =====================================================
-- QUESTIONS & SOLUTIONS
-- =====================================================

-- Q1. Get the minimum price from the products table
-- MIN() returns the smallest value in a column
SELECT MIN(price) AS min_price
FROM products;


-- Q2. Get product_type_id with minimum price for each type
-- GROUP BY groups records based on product_type_id
SELECT product_type_id, MIN(price) AS min_price
FROM products
GROUP BY product_type_id;


-- Q3. Get product_type_id with minimum price
-- excluding NULL product_type_id values
-- WHERE filters rows BEFORE aggregation
SELECT product_type_id, MIN(price) AS min_price
FROM products
WHERE product_type_id IS NOT NULL
GROUP BY product_type_id;


-- Q4. Get the average price for each product_type_id
-- AVG() calculates mean value
SELECT product_type_id, AVG(price) AS avg_price
FROM products
WHERE product_type_id IS NOT NULL
GROUP BY product_type_id;


-- Q5. Get product_type_id where average price is greater than 20
-- HAVING filters aggregated results
SELECT product_type_id, AVG(price) AS avg_price
FROM products
WHERE product_type_id IS NOT NULL
GROUP BY product_type_id
HAVING AVG(price) > 20;


-- Q6. Display the above result in descending order
-- ORDER BY is used to sort the result set
SELECT product_type_id, AVG(price) AS avg_price
FROM products
WHERE product_type_id IS NOT NULL
GROUP BY product_type_id
HAVING AVG(price) > 20
ORDER BY avg_price DESC;


-- =====================================================
-- Q7. Get the Highest Average Price of product_type_id
-- =====================================================
-- AVG() calculates the average price per product_type_id
-- GROUP BY groups records by product_type_id
-- HAVING filters aggregated results (AVG > 20)
-- ORDER BY DESC sorts from highest to lowest average
-- LIMIT 1 returns only the top record

SELECT 
    product_type_id, 
    AVG(price) AS avg_price
FROM products
WHERE product_type_id IS NOT NULL      -- removes NULL values before aggregation
GROUP BY product_type_id
HAVING AVG(price) > 20                 -- condition on aggregated data
ORDER BY avg_price DESC
LIMIT 1;


-- =====================================================
-- Q8. Get the Highest Maximum Price of product_type_id
-- =====================================================
-- MAX() returns the highest price within each product_type_id
-- GROUP BY groups records by product_type_id
-- ORDER BY DESC ensures the highest MAX price appears first
-- LIMIT 1 fetches only the top product_type_id

SELECT 
    product_type_id, 
    MAX(price) AS max_price
FROM products
WHERE product_type_id IS NOT NULL      -- excludes NULL product_type_id
GROUP BY product_type_id
ORDER BY max_price DESC
LIMIT 1;

-- Q9. What Is The Format Of Applying The Aggregate Function.
-- =====================================================
-- Q9. Format of Applying Aggregate Functions
-- =====================================================
-- Aggregate functions are used to perform calculations
-- on multiple rows and return a single summarized value.
--
-- GENERAL SYNTAX:
--
-- SELECT aggregate_function(column_name)
-- FROM table_name
-- WHERE condition              -- (optional) filters rows before aggregation
-- GROUP BY column_name          -- (optional) groups data
-- HAVING aggregate_condition;   -- (optional) filters aggregated results


-- =====================================================
-- BASIC EXAMPLE (Without GROUP BY)
-- =====================================================
-- Returns a single aggregated result

SELECT AVG(price) AS average_price
FROM products;


-- =====================================================
-- EXAMPLE WITH GROUP BY
-- =====================================================
-- Returns one aggregated result per group

SELECT product_type_id, SUM(price) AS total_price
FROM products
GROUP BY product_type_id;


-- =====================================================
-- EXAMPLE WITH WHERE + GROUP BY + HAVING
-- =====================================================
-- WHERE  -> filters rows before aggregation
-- GROUP BY -> groups rows
-- HAVING -> filters aggregated data

SELECT product_type_id, COUNT(*) AS total_products
FROM products
WHERE product_type_id IS NOT NULL
GROUP BY product_type_id
HAVING COUNT(*) > 1;


-- Q10. Get The Highest SUM Of Product_type_id
SELECT 
    product_type_id, 
    SUM(price) AS max_price
FROM products
WHERE product_type_id IS NOT NULL 
GROUP BY product_type_id
ORDER BY max_price DESC
LIMIT 2;

SELECT *
FROM products;






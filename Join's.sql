-- ==============================
-- SQL JOINS + NORMALIZATION NOTES
-- ==============================

-- 1. WHAT ARE JOINS?
-- Joins are used to combine records from two or more tables.
-- Data is combined based on related/common columns.
-- Common columns usually contain:
--     -> Primary Key (PK)
--     -> Foreign Key (FK)

-- Example Relation:
-- Users.user_id = Orders.user_id


-- 2. WHY DO WE USE SQL JOINS?
-- Retrieve related data from multiple tables.
-- Maintain normalized database structure.
-- Reduce data duplication.
-- Improve database organization.
-- Support relational database design.


-- 3. NORMALIZATION
-- Definition:
-- Process of organizing database tables to reduce redundancy.
-- Break large tables into smaller logical tables.

-- Purpose:
-- Remove duplicate data.
-- Maintain data integrity.
-- Improve database efficiency.
-- Avoid update anomalies.


-- 4. DATA REDUNDANCY
-- Meaning:
-- Unnecessary duplication of data.

-- Problems caused:
-- Duplicate records
-- Null values
-- Incorrect data types
-- Inconsistent data updates
-- Increased storage usage


-- 5. BASIC JOIN TYPES

-- INNER JOIN
-- Returns only matching records from both tables.
SELECT columns
FROM table1
INNER JOIN table2
ON table1.id = table2.id;


-- LEFT JOIN
-- Returns all records from left table + matching from right table.
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.id = table2.id;


-- RIGHT JOIN
-- Returns all records from right table + matching from left table.
SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.id = table2.id;


-- FULL OUTER JOIN
-- Returns all records when match exists in either table.
SELECT columns
FROM table1
FULL OUTER JOIN table2
ON table1.id = table2.id;


-- CROSS JOIN
-- Returns cartesian product (all combinations).
SELECT columns
FROM table1
CROSS JOIN table2;


-- 6. REAL WORLD EXAMPLE (AMAZON)

-- Table: Users
-- user_id (PK)
-- name
-- email

-- Table: Orders
-- order_id (PK)
-- user_id (FK)
-- product
-- price

SELECT Users.name, Orders.product
FROM Users
INNER JOIN Orders
ON Users.user_id = Orders.user_id;


-- 7. KEY CONCEPTS
-- Primary Key:
-- Unique identifier in a table.

-- Foreign Key:
-- Reference to primary key in another table.

-- Relational Database:
-- Tables connected using keys.


-- 8. BENEFITS OF USING JOINS
-- Structured data retrieval
-- Clean database design
-- Scalable system architecture
-- Efficient queries
-- Reduced redundancy

-- CREATING THE TABLE EMPLOYEE'S --

CREATE TABLE employees(
employee_id INT PRIMARY KEY,
employee_name VARCHAR(50),
DEPT_ID INT 
);
INSERT INTO employees(employee_id, employee_name, DEPT_ID)
VALUES
(1, 'Jon Snow', 101),
(2, 'Daenerys Targaryen', 102),
(3, 'Tyrion Lannister', NULL),
(4, 'Arya Stark', 104),
(5, 'Sansa Stark', NULL),
(6, 'Bran Stark', 105),
(7, 'Robb Stark', 104),
(8, 'Cersei Lannister', 103),
(9, 'Jaime Lannister', NULL),
(10, 'Tywin Lannister', 103),
(11, 'Joffrey Baratheon', 106),
(12, 'Stannis Baratheon', NULL),
(13, 'Renly Baratheon', 106),
(14, 'Theon Greyjoy', 107),
(15, 'Yara Greyjoy', NULL),
(16, 'Samwell Tarly', 108),
(17, 'Brienne of Tarth', 109),
(18, 'Sandor Clegane', NULL),
(19, 'Gregor Clegane', 110),
(20, 'Petyr Baelish', 111);

-- View The Data --
SELECT * FROM employees;

-- CREATING DEPARTMENT TABLE

CREATE TABLE department (
    DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(100),
    LOCATION VARCHAR(100)
);

-- SAMPLE INSERT DATA FOR department (for JOIN practice)
INSERT INTO department(DEPT_ID, DEPT_NAME, LOCATION)
VALUES
(101, 'Night Watch', 'The Wall'),
(102, 'Targaryen House', 'Dragonstone'),
(103, 'Lannister House', 'Casterly Rock'),
(104, 'Stark House', 'Winterfell'),
(105, 'Three Eyed Raven', 'North'),
(106, 'Baratheon House', 'Storms End'),
(107, 'Greyjoy House', 'Iron Islands'),
(108, 'Maesters', 'Citadel'),
(109, 'Kingsguard', 'Kings Landing'),
(110, 'Clegane Guard', 'Westerlands'),
(111, 'Small Council', 'Red Keep');

-- Viewing The Data --
SELECT * FROM department;

-- Inner Join :- Get The MAtched Record From The Both Table
SELECT E.employee_name , d.dept_name, d.location
FROM employees E INNER JOIN department D
ON E.dept_id = D.dept_id;


-- LEFT Join {Left Outer Join}
-- Get All Record From Left Table And Matching Details From Table.
SELECT D.dept_name, E.employee_name
FROM department D LEFT JOIN employees E
ON  E.dept_id = D.dept_id;

-- RIGHT join {Right Outer Join}
-- Get All The Record From The Right Table And Matching Details From Table.
SELECT D.dept_name, E.employee_name
FROM department D RIGHT JOIN employees E
ON  E.dept_id = D.dept_id;
-- Full Outer JOin -- 
-- Get All The Records From Both Tables.
-- We Dont Have Full Join In MY SQL Use UNION For Getting Full Data Of Two And More Tables
SELECT D.dept_name, E.employee_name
FROM department D LEFT JOIN employees E
ON  E.dept_id = D.dept_id
UNION
SELECT D.dept_name, E.employee_name
FROM department D RIGHT JOIN employees E
ON  E.dept_id = D.dept_id;

-- ==============================
-- 5. CROSS JOIN
-- ==============================

-- Definition:
-- Cross Join returns the cartesian product of two tables.
-- Every row from the left table is paired with every row
-- from the right table.

-- Key Points:
-- No common column is required.
-- No ON condition is needed.
-- Produces all possible combinations.
-- Result size = rows(table1) * rows(table2)

-- Note:
-- Cross join itself does NOT avoid NULL values.
-- If NULL exists in tables, they will still appear
-- in the result combinations.

-- Syntax Example:
SELECT *
FROM department
CROSS JOIN employees;

-- Example:
-- If table1 has 3 rows
-- and table2 has 4 rows
-- Result will contain 12 rows.

-- Use Cases:
-- Testing combinations
-- Generating pairs
-- Matrix style reports
-- Data simulation
SELECT D.dept_name, E.employee_name
FROM department D CROSS JOIN employees E;

-- SELF join -- We Use Left Join To USE SELF Join.
-- Add A Columns To LEft Table -- MAnager ID
ALTER TABLE employees ADD COLUMN manager_id INT;
SELECT * FROM employees;

-- Updating The Null Value's
SET SQL_SAFE_UPDATES = 0;
UPDATE employees SE




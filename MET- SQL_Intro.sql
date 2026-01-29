-- Live Session Topic's --
-- what is SQL?
-- SQL stands for Structured Query Language
-- SQL is used to communicate with the database
-- using SQL we can store, retrieve, update and delete data
-- SQL works on relational database management systems
-- SQL is a standard language used by most databases
-- SQL helps to manage large amount of data easily
-- SQL queries are written using simple English words
-- Relation database management system is where we can store the data in organized form
-- in the form of rows and columns
-- what is database?
-- The place where we can store our data
-- Data :- is a collection of discrete(a fixed whole number) or continuous values
-- continuous values means infinte number with in arange of numbers
-- when we communicating with the database we use different types of database languages
-- DDL -- Data defination language -- CREATE,ALTER,DROP,TRUNCATE
-- DML -- Data Manipulation Language -- INSERT,UPDATE,DELETE
-- DQL -- Data query language -- SELECT
-- DCL -- Data Control language -- GRANT, REVOKE
-- TCL -- Transaction Control Language -- COMMIT,ROLLBACK, SAVEPOINT.

CREATE DATABASE Rixz_Met;
-- use the met_sql_training
USE Rixz_Met;

-- Q)create a table customers with attributes
-- cust_id,first_name,last_name,country,contact

CREATE TABLE CUSTOMERS(
CUST_ID INT,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
COUNTRY VARCHAR(25),
CONTACT INT);

-- Q) Insert the data into table customers

INSERT INTO CUSTOMERS(CUST_ID,FIRST_NAME,LAST_NAME,COUNTRY,CONTACT) VALUES
(1, "Rixz","Roxx", "INDIA", 978675756),
(12, "Jon","Snow", "NORTH", 900001111),
(13, "Daenerys","Targaryen", "ESSOS", 900002222),
(14, "Arya","Stark", "NORTH", 900003333),
(15, "Tyrion","Lannister", "WESTERLANDS", 900004444),
(16, "Cersei","Lannister", "KINGS_LANDING", 900005555),
(17, "Sansa","Stark", "NORTH", 900006666),
(18, "Jaime","Lannister", "WESTERLANDS", 900007777),
(19, "Bran","Stark", "NORTH", 900008888),
(20, "Robb","Stark", "NORTH", 900009999),
(21, "Khal","Drogo", "DOTHRAKI", 900010101);

-- Viewing The Data From A Table
SELECT * FROM CUSTOMERS;

-- Droping A Table --
DROP TABLE CUSTOMERS;
SELECT * FROM CUSTOMERS;

-- DROP THE PARTICULAR DATABASE --
DROP DATABASE met_sql_training;


-- WHAT TRUNCATE COMMAND DO -- 
#  IT's Only Delete/Remove The Table Data . Don't Delete the Entire Table 

TRUNCATE CUSTOMERS;

-- Difference Between TRUNCATE and DROP
-- TRUNCATE is used to remove all records from a table
-- DROP is used to delete the entire table from database
-- TRUNCATE removes data but table structure remains
-- DROP removes data as well as table structure
-- TRUNCATE is a DDL command
-- DROP is also a DDL command
-- TRUNCATE cannot be rolled back
-- DROP also cannot be rolled back
 -- ______________________________________________________________________________________________________________________________________________ --

-- 2. Advance About Today Session -- 

-- Difference Between DELETE and TRUNCATE
-- DELETE removes selected records using WHERE clause
-- TRUNCATE removes all records at once
-- DELETE can be rolled back
-- TRUNCATE cannot be rolled back

-- What is WHERE clause?
-- WHERE clause is used to filter records based on conditions

-- Example:
-- SELECT * FROM CUSTOMERS WHERE COUNTRY = 'NORTH';

-- What is ORDER BY?
-- ORDER BY is used to sort records in ascending or descending order

-- Example:
-- SELECT * FROM CUSTOMERS ORDER BY FIRST_NAME ASC;

-- What is NULL?
-- NULL represents missing or unknown data

-- What is Constraint?
-- Constraints are rules applied to table columns
-- Examples: PRIMARY KEY, NOT NULL, UNIQUE

-- Why SQL is important?
-- SQL is used in data analysis, backend development, and reporting
-- SQL is required for Data Analyst, Data Scientist, Backend Developer roles

-- Interview Question:
-- Q) Can we recover data after TRUNCATE?
-- A) No, because TRUNCATE does not support rollback

-- Interview Question:
-- Q) Difference between DROP TABLE and TRUNCATE TABLE?
-- A) DROP removes table structure and data, TRUNCATE removes only data


-- _________________________________________________________________________________________________________________________________________ --
-- 3. Question About These Topic's--

-- Q1. Create A Table With Sid, Sname, Smarks --
CREATE TABLE Students(
Sid INT, 
Sname VARCHAR(25),
Smarks INT);

INSERT INTO Students(Sid, Sname, Smarks)
VALUES
(1, "Harry Potter", 95),
(2, "Hermione Granger", 99),
(3, "Ron Weasley", 88),
(4, "Draco Malfoy", 85),
(5, "Luna Lovegood", 92),
(6, "Neville Longbottom", 90),
(7, "Ginny Weasley", 94),
(8, "Cedric Diggory", 91),
(9, "Cho Chang", 89),
(10, "Severus Snape", 98);
-- CHECK THE DATA --
SELECT * FROM Students;

-- Q2. Print The First Row From Student Table's --
SELECT * FROM students 
WHERE Sid = 1;

-- Q)get the records of student who recieves marks greater then or equals to 75
SELECT * FROM STUDENTS WHERE SMARKS>=90;

-- Q)get the records of student name "HArry"
SELECT * FROM STUDENTS WHERE SNAME="Harry Potter";

-- Realtional or comparision operators --> =,!=,>,<,>=,<=

-- Q) get the records of student whose marks not equals to 75
SELECT * FROM Students
WHERE SMARKS != 75;


-- Q) get the records of the student whose marks between 60 and 75

SELECT * FROM STUDENTS WHERE SMarks = 88 AND 92;





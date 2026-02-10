USE rixz_met;
-- Window's Fucntion --
#Check The Least Min Price Of A Products

SELECT * FROM
products; 

SELECT NAME, price 
FROM products 
WHERE price = (SELECT MIN(price) < MIN(price)FROM products);

# Get The Redcord Of Least Minimun Price From Product Id Type.
SELECT product_type_id, MIN(Price) FROM products
WHERE product_type_id IS NOT NULL
GROUP BY product_type_id
ORDER BY MIN(price) ASC;

-- What Is Window's Function-?
/*
Window Function:
- Performs calculations across related rows without grouping them.
- Keeps original row details while adding analytical results.

Why use:
- Running totals
- Ranking / Row numbers
- Moving averages
- Percentiles
- Lead/Lag comparisons

Key point:
- Uses OVER() with PARTITION BY and ORDER BY.
- Unlike GROUP BY, it does NOT collapse rows.
*/



CREATE TABLE sales(
id INT PRIMARY KEY,
employee_name VARCHAR(50),
department VARCHAR(50),
sale_amount DECIMAL (10,2),
sale_date DATE);

INSERT INTO sales(id, employee_name, department, sale_amount, sale_date)
VALUES
(1, 'Ser Alaric Storm', 'North', 5000, '2025-01-01'),
(2, 'Ser Cedric Vale', 'Vale', 4200, '2025-01-02'),
(3, 'Ser Roland Rivers', 'Riverlands', 6100, '2025-01-03'),
(4, 'Ser Tristan Reach', 'Reach', 4700, '2025-01-04'),
(5, 'Ser Dorian Sand', 'Dorne', 7200, '2025-01-05'),
(6, 'Ser Boros Stone', 'Westerlands', 3900, '2025-01-06'),
(7, 'Ser Lyonel Storm', 'Stormlands', 5300, '2025-01-07'),
(8, 'Ser Gawen Crown', 'Crownlands', 6400, '2025-01-08'),
(9, 'Ser Perwyn Snow', 'North', 4550, '2025-01-09'),
(10, 'Ser Martyn Hill', 'Westerlands', 5850, '2025-01-10');

SELECT * FROM sales;

-- Window Function Syntax:
-- function_name(column_name)
-- OVER (
--     PARTITION BY category_column   -- optional: splits data into groups
--     ORDER BY order_column          -- optional: defines calculation order
-- )

-- Example:
-- SUM(sale_amount) OVER(PARTITION BY department ORDER BY sale_date)



-- 1. Row_Number()- Assign The Count Of Numbers In Each Category.
-- Q) get the number of rows for sales table based on date and get the records of sales amount.
SELECT employee_name, department, sale_amount,
ROW_NUMBER()
OVER(PARTITION BY  employee_name ORDER BY sale_date) AS Row_Num
FROM sales;

-- 2. Rank() & Dense_Rank()- Rank The Row's
-- Q). Rank The Rows According To The SAles Amount
SELECT employee_name, department, sale_amount,
DENSE_rank()
OVER(PARTITION BY employee_name ORDER BY sale_date DESC) AS Rank_sale
FROM sales;


SELECT employee_name,
       department,
       sale_amount,
       DENSE_RANK() OVER (ORDER BY sale_amount DESC) AS Rank_sale
FROM sales;

-- What Is Diffrence Between Rank And Dense Rank-?
-- In Rank() It Skip The Number's If It Is A Tie.
-- In DENSE_Rank() Isn't Skip The Number's If It Is A Tie.

-- RANK() vs DENSE_RANK()  (Interview Notes in Inline Comments)

SELECT
    Name,
    Marks,

    RANK() OVER (ORDER BY Marks DESC) AS Rank_Value,
    -- RANK():
    -- Same rank is given when there is a tie
    -- Skips the next number(s) after a tie
    -- Example output: 1, 2, 2, 4  (gap exists)

    DENSE_RANK() OVER (ORDER BY Marks DESC) AS Dense_Rank_Value
    -- DENSE_RANK():
    -- Same rank is given when there is a tie
    -- Does NOT skip numbers after a tie
    -- Example output: 1, 2, 2, 3  (no gaps)

FROM Students;

-- Interview One-Liner:
-- RANK() creates gaps in ranking when ties occur,
-- while DENSE_RANK() keeps rankings continuous without gaps.


-- 3. SUM()- Running Total
-- Get The Sum Of Sales Amount 

SELECT employee_name, SUM(sale_amount) AS Total_Fare
From Sales
GROUP BY employee_name;


-- Running Total using SUM() Window Function
-- Goal: Calculate cumulative sales amount for each employee
-- based on sale date order

SELECT
    EMPLOYEE_NAME,
    SALE_AMOUNT,
    SALE_DATE,

    SUM(SALE_AMOUNT)
        OVER (
            PARTITION BY EMPLOYEE_NAME
            -- PARTITION BY:
            -- Resets the running total for each employee separately

            ORDER BY SALE_DATE
            -- ORDER BY:
            -- Defines the sequence for cumulative calculation
            -- Running total increases based on sale date
        ) AS RUNNING_TOTAL
        -- RUNNING_TOTAL:
        -- Cumulative sum of sales for each employee over time

FROM SALES;

-- Interview One-Liner:
-- "SUM() OVER(PARTITION BY ... ORDER BY ...) calculates a running total
-- without collapsing rows like GROUP BY."


-- 4. AVG() - Running Average
-- Goal: Calculate running (cumulative) average of sales amount
-- for each employee based on sale date order

SELECT
    EMPLOYEE_NAME,
    SALE_AMOUNT,
    SALE_DATE,

    AVG(SALE_AMOUNT)
        OVER (
            PARTITION BY EMPLOYEE_NAME
            -- PARTITION BY:
            -- Resets the running average for each employee separately

            ORDER BY SALE_DATE
            -- ORDER BY:
            -- Defines the sequence for cumulative calculation
            -- Running average updates based on sale date
        ) AS RUNNING_AVG
        -- RUNNING_AVG:
        -- Cumulative average of sales for each employee over time

FROM SALES;

-- 5. LAG() & LEAD() - Compare Previous and Next Rows
-- Goal: Get previous sale amount for each employee/department
-- based on sale date order

SELECT
    EMPLOYEE_NAME,
    DEPARTMENT,
    SALE_AMOUNT,
    SALE_DATE,

    LAG(SALE_AMOUNT)
        OVER (
            PARTITION BY DEPARTMENT
            -- PARTITION BY:
            -- Separates data by department
            -- Previous value is calculated within each department

            ORDER BY SALE_DATE
            -- ORDER BY:
            -- Defines which row is considered previous
            -- Based on chronological sale date
        ) AS PREVIOUS_SALE
        -- PREVIOUS_SALE:
        -- Shows the sale amount from the previous row

FROM SALES;

-- For Next Row Value use LEAD():
-- LEAD(SALE_AMOUNT) OVER (PARTITION BY DEPARTMENT ORDER BY SALE_DATE) AS NEXT_SALE

-- Interview One-Liner:
-- "LAG() fetches data from a previous row and LEAD() fetches data from a next row
-- without using self-joins."



-- Interview One-Liner:
-- "AVG() OVER(PARTITION BY ... ORDER BY ...) calculates a running average
-- without collapsing rows like GROUP BY."


SELECT * FROM sales;


-- 6. FIRST_VALUE() - Get First Value in Each Partition
-- Goal: Get the first sale amount within each department
-- based on the earliest sale date

SELECT
    EMPLOYEE_NAME,
    DEPARTMENT,
    SALE_AMOUNT,
    SALE_DATE,

    FIRST_VALUE(SALE_AMOUNT)
        OVER (
            PARTITION BY DEPARTMENT
            -- PARTITION BY:
            -- Divides data into departments
            -- First value calculated separately for each department

            ORDER BY SALE_DATE
            -- ORDER BY:
            -- Defines which row is considered the first
            -- Earliest sale date comes first

            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
            -- Ensures consistent running window behavior
        ) AS FIRST_VALUE_

FROM SALES;

-- Interview One-Liner:
-- "FIRST_VALUE() returns the first value in a partition based on the ORDER BY
-- without collapsing rows like GROUP BY."



-- 7. NTILE() - Split Data into N Groups (Buckets)
-- Goal: Divide sales records into 3 equal groups within each department
-- based on sale date order

SELECT
    EMPLOYEE_NAME,
    DEPARTMENT,
    SALE_AMOUNT,
    SALE_DATE,

    NTILE(3)
        OVER (
            PARTITION BY DEPARTMENT
            -- PARTITION BY:
            -- Splits data separately within each department

            ORDER BY SALE_DATE
            -- ORDER BY:
            -- Determines how rows are divided into buckets
            -- Based on chronological sale date
        ) AS SPLIT_DATA
        -- SPLIT_DATA:
        -- Assigns bucket numbers (1,2,3) to rows

FROM SALES;
COMMIT;

-- Interview One-Liner:
-- "NTILE(n) divides rows into n nearly equal groups based on ORDER BY
-- within each partition."

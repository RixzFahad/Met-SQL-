USE Rixz_Met;
SELECT * FROM students;
-- Q1. Get The Students Name Which Start From Letter "S".
-- USE The "LIKE" (Logical Operator) And To Atch With The String Use THe "%"
SELECT * FROM students WHERE Sname LIKE "S%";
SELECT * FROM students WHERE Sname LIKE "C%";

-- Q2. Don't Know The first 2 AND Next Letter Is "V" Get The Records Of The Students.
-- For The Unknown Letter's Use "_"
SELECT * FROM students WHERE Sname LIKE "__R%";

-- Q3. Get The Records Of The Students Name Whoose Contains Letter "S".
SELECT * FROM students WHERE Sname LIKE "%E";

-- Q4. Get The Records Of Sid (1,2,3,4)
-- {In} A Logical Operator  Used To Check Multiple Record's At A Time.
SELECT * FROM students WHERE Sid IN (1,2,3);

-- Q5. Get All The Record's Of Students Except Of (1,2,3).
SELECT * FROM students WHERE Sid NOT IN (1,2,3);


ALTER TABLE students
ADD dep2 VARCHAR(50) DEFAULT 'General';
-- Update The Value Of Dep2
UPDATE students
SET dep2 = 'IT'
WHERE Sid IN (1,2,3);
-- Adding Another Col In Existing Table
ALTER TABLE students 
ADD COLUMN City VARCHAR(50);

UPDATE Students
SET dep2 = 'Wizard'
WHERE Sid IN (6,7,8);


-- Adding Values Into NULL 
UPDATE students
SET CITY = "HOGSMEDE"
WHERE Sid IN (4,6,8);

-- How To Update The Null Values
-- To Update The Null We Use Dml --- UPDATE
UPDATE students
SET CITY = 'Hogwarts'
WHERE Sid IN (1,2,3);

-- Before Updating THe Null Value Manually To Fill One Data To All Row First Disable Safe Update.
SET SQL_SAFE_UPDATES = 0;
-- Enable Security Update - 0;

-- Q6. Delete Student Id 10 FROM Table.
 -- DML - DELETE 
 -- Note- If You Want To Add Delete Remove Update In Table You Need To Disable The Sql Security Update.
DELETE FROM students
WHERE Sid = 10;
COMMIT;
ROLLBACK;

-- Transactions Are Nothing But The Set Of Querries.

START TRANSACTION;
DELETE FROM students WHERE Sid = 1;
ROLLBACK;
SELECT * FROM students;

START TRANSACTION;
DELETE FROM students WHERE Sid = 2;
ROLLBACK;
SELECT * FROM students;

START TRANSACTION;
DELETE FROM students WHERE Sid = 2;
ROLLBACK;
SELECT * FROM students;


-- Q. How To Rename The Table
RENAME TABLE students TO Student_details;  -- First Approach

ALTER TABLE student_details
RENAME TO Student_About;  -- Second Approach


-- Q8. Print The Student Name Into Ucase.
SELECT Sname, UCASE(SNAME) AS UpperCase_Name  FROM student_about;

-- Q9. Print The Student Name Into Lcase.
SELECT Sname, LCASE(SNAME) AS UpperCase_Name  FROM student_about;

-- Q9.Merge first name and country as full name
SELECT Sname , City,
       CONCAT(Sname, ' ', City) AS FULL_Details
FROM student_about;


-- Sub String(): Range Of Character From main string Is Knowm As Substring.
-- Q10. Get The First Two Letters From The Name-
SELECT Sname, SUBSTR(Sname, 1,3) AS SUBSTRING FROM student_about;
-- SYNTAx:- SUBSTR(COl_name, Start_position, Count Of Character)




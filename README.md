# 📘 Met-SQL

Met-SQL is a complete SQL learning and practice repository covering **Beginner to Advanced level SQL concepts**, hands-on queries, and **interview-focused questions**.  
This repo is designed for students, beginners, and anyone preparing for SQL interviews.

---

## 📌 What This Repository Covers

- SQL basics and core concepts
- Database and table operations
- Beginner to Advanced SQL queries
- Real-world practice examples
- Interview-oriented questions and answers
- Step-by-step learning path

---

## 🧠 SQL Concepts Included

### 🔹 What is SQL?
SQL (Structured Query Language) is used to store, retrieve, update, and manage data in relational databases.

### 🔹 What is RDBMS?
A Relational Database Management System stores data in **rows and columns** using tables.

---

## 🛠 SQL Command Types

### 1️⃣ DDL – Data Definition Language
Used to define database structure.

| Command | Use |
|------|-----|
| CREATE | Create database or table |
| ALTER | Modify table structure |
| DROP | Delete database or table |
| TRUNCATE | Remove all table data |

---

### 2️⃣ DML – Data Manipulation Language
Used to manipulate table data.

| Command | Use |
|------|-----|
| INSERT | Add new records |
| UPDATE | Modify existing records |
| DELETE | Remove records |

---

### 3️⃣ DQL – Data Query Language
Used to fetch data.

| Command | Use |
|------|-----|
| SELECT | Retrieve data from tables |

---

### 4️⃣ DCL – Data Control Language
Used for access control.

| Command | Use |
|------|-----|
| GRANT | Give permissions |
| REVOKE | Remove permissions |

---

### 5️⃣ TCL – Transaction Control Language
Used to manage transactions.

| Command | Use |
|------|-----|
| COMMIT | Save changes |
| ROLLBACK | Undo changes |
| SAVEPOINT | Set transaction point |

---

## 🚀 Beginner Level Queries (Practice)

```sql
-- View all records
SELECT * FROM Students;

-- Get students with marks >= 75
SELECT * FROM Students WHERE Smarks >= 75;

-- Get student by name
SELECT * FROM Students WHERE Sname = 'Harry Potter';

-- Get students whose marks are not equal to 75
SELECT * FROM Students WHERE Smarks != 75;

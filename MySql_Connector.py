# pip install mysql-connector-python

import mysql.connector as sql

# 1️ Connect to MySQL database
conn = sql.connect(
    host="localhost",
    user="root",
    password="WARMACHINE",
    database="rixz_met"
)

print("Connected successfully")

# 2️ Create cursor
cursor = conn.cursor()

# 3️ Create table
create_table_query = """
CREATE TABLE IF NOT EXISTS users1 (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(50),
    AGE INT,
    COURSE VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
"""
cursor.execute(create_table_query)
print("Table ready")

# 4️ Insert sample data
insert_query = "INSERT INTO users1 (NAME, AGE, COURSE) VALUES (%s,%s,%s)"
values = [
    ("Rixz", 22, "Data Science"),
    ("Alex", 24, "AI"),
    ("Sam", 21, "Python"),
    ("Candy", 21, "Banking"),
    ("Crush", 22, "Data Analyst"),
    ("Samantha", 21, "Fighter"),
]


cursor.executemany(insert_query, values)
conn.commit()
print("Data inserted")

# 5️ Show tables in database
print("\nTables in database:")
cursor.execute("SHOW TABLES")
for table in cursor.fetchall():
    print(table)

# 6️ Fetch table data
print("\nData inside users1:")
cursor.execute("SELECT * FROM users1")
rows = cursor.fetchall()
for row in rows:
    print(row)

# Update User Data
"""student_update = "UPDATE rixz_met SET COURSE = %s WHERE ID = %s"
values = ("Data Science", 22)
cursor.execute(student_update, values)
conn.commit()"""


students_remove = "DELETE FROM users1 WHERE NAME = %s"
cursor.execute(students_remove, ("Samantha",))
conn.commit()
# 7️ Close connection
cursor.close()
conn.close()
print("\nConnection closed")




import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Ram@883091",
    database="student"
)

cursor = conn.cursor()

cursor.execute("""
SELECT s.name, m.marks
FROM Students s
JOIN Marks m ON s.student_id = m.student_id
ORDER BY m.marks DESC
LIMIT 5
""")

print("Top 5 Students:")
for row in cursor.fetchall():
    print(row)


cursor.execute("""
SELECT s.name, a.attendance_percentage
FROM Students s
JOIN Attendance a ON s.student_id = a.student_id
WHERE a.attendance_percentage < 75
""")

print("\nLow Attendance Students:")
for row in cursor.fetchall():
    print(row)

conn.close()
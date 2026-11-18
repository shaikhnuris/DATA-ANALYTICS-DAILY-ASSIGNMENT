-- DAY 11 SOLVED PRACTICE: SELECT, WHERE, ORDER BY
CREATE DATABASE IF NOT EXISTS day11_student_db;
USE day11_student_db;
DROP TABLE IF EXISTS students;
CREATE TABLE students (student_id INT PRIMARY KEY, student_name VARCHAR(50), city VARCHAR(40), age INT, marks INT);
INSERT INTO students VALUES
(1,'Aarav','Delhi',20,85),(2,'Aisha','Bareilly',19,92),(3,'Rahul','Lucknow',21,67),
(4,'Priya','Delhi',20,78),(5,'Kabir','Moradabad',22,88),(6,'Meera','Bareilly',19,73),
(7,'Rohan','Jaipur',21,95),(8,'Sara','Lucknow',20,59),(9,'Dev','Delhi',22,81),(10,'Ishita','Moradabad',19,90);

-- Solution 1: Display all students
SELECT * FROM students;
-- Solution 2: Display only name and marks
SELECT student_name, marks FROM students;
-- Solution 3: Students scoring more than 80
SELECT * FROM students WHERE marks > 80;
-- Solution 4: Students from Delhi
SELECT * FROM students WHERE city = 'Delhi';
-- Solution 5: Highest marks first
SELECT * FROM students ORDER BY marks DESC;
-- Extra: Students whose marks are between 70 and 90
SELECT * FROM students WHERE marks BETWEEN 70 AND 90;

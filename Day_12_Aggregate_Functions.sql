-- DAY 12 SOLVED PRACTICE: Aggregate Functions, GROUP BY, HAVING
CREATE DATABASE IF NOT EXISTS day12_employee_db;
USE day12_employee_db;
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (employee_id INT PRIMARY KEY, employee_name VARCHAR(50), department VARCHAR(40), city VARCHAR(40), salary DECIMAL(10,2));
INSERT INTO employees VALUES
(101,'Aman','IT','Delhi',55000),(102,'Neha','HR','Bareilly',42000),(103,'Sahil','IT','Lucknow',62000),
(104,'Riya','Sales','Delhi',38000),(105,'Mohit','Finance','Jaipur',50000),(106,'Pooja','HR','Lucknow',45000),
(107,'Aditya','Sales','Bareilly',41000),(108,'Nisha','IT','Moradabad',70000),(109,'Kunal','Finance','Delhi',58000),(110,'Tanya','Sales','Jaipur',47000);

-- Solution 1: Total employees
SELECT COUNT(*) AS total_employees FROM employees;
-- Solution 2: Average salary
SELECT ROUND(AVG(salary),2) AS average_salary FROM employees;
-- Solution 3: Highest and lowest salary
SELECT MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary FROM employees;
-- Solution 4: Total salary by department
SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department;
-- Solution 5: Departments with average salary above 45000
SELECT department, ROUND(AVG(salary),2) AS avg_salary
FROM employees GROUP BY department HAVING AVG(salary) > 45000;
-- Extra: Employee count by city
SELECT city, COUNT(*) AS employee_count FROM employees GROUP BY city;

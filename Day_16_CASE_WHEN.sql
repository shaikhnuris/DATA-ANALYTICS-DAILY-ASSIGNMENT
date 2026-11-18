-- DAY 16 SOLVED PRACTICE: CASE WHEN
CREATE DATABASE IF NOT EXISTS day16_sales_db;
USE day16_sales_db;
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (sale_id INT PRIMARY KEY, salesperson VARCHAR(50), region VARCHAR(30), sales_amount DECIMAL(10,2));
INSERT INTO sales VALUES
(1,'Aman','North',85000),(2,'Neha','South',42000),(3,'Sahil','East',67000),(4,'Riya','West',30000),
(5,'Mohit','North',95000),(6,'Pooja','South',55000),(7,'Aditya','East',25000),(8,'Nisha','West',72000);

-- Solution 1: Classify sales performance
SELECT salesperson,sales_amount,
CASE WHEN sales_amount>=70000 THEN 'High'
     WHEN sales_amount>=40000 THEN 'Medium'
     ELSE 'Low' END AS performance
FROM sales;
-- Solution 2: Total sales by region
SELECT region,SUM(sales_amount) AS total_sales FROM sales GROUP BY region;
-- Solution 3: Salespeople with sales above 50000
SELECT * FROM sales WHERE sales_amount>50000;
-- Extra: Count employees in each performance category
SELECT performance,COUNT(*) AS people_count
FROM (SELECT CASE WHEN sales_amount>=70000 THEN 'High'
                  WHEN sales_amount>=40000 THEN 'Medium'
                  ELSE 'Low' END AS performance
      FROM sales) AS result
GROUP BY performance;

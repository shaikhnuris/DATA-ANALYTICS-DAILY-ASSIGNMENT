-- DAY 13 SOLVED PRACTICE: String and Date Functions
CREATE DATABASE IF NOT EXISTS day13_customer_db;
USE day13_customer_db;
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (customer_id INT PRIMARY KEY, first_name VARCHAR(40), last_name VARCHAR(40), email VARCHAR(100), signup_date DATE, city VARCHAR(40));
INSERT INTO customers VALUES
(1,'Aarav','Sharma','aarav@example.com','2025-01-15','Delhi'),
(2,'Aisha','Khan','aisha@example.com','2025-02-20','Bareilly'),
(3,'Rahul','Verma','rahul@example.com','2025-03-05','Lucknow'),
(4,'Priya','Singh','priya@example.com','2025-04-12','Delhi'),
(5,'Kabir','Ali','kabir@example.com','2025-05-25','Moradabad'),
(6,'Meera','Gupta','meera@example.com','2025-06-10','Jaipur');

-- Solution 1: Combine first and last name
SELECT CONCAT(first_name,' ',last_name) AS full_name FROM customers;
-- Solution 2: Names in uppercase
SELECT UPPER(first_name) AS upper_name FROM customers;
-- Solution 3: Email length
SELECT email, LENGTH(email) AS email_length FROM customers;
-- Solution 4: Signup year and month
SELECT customer_id, YEAR(signup_date) AS signup_year, MONTH(signup_date) AS signup_month FROM customers;
-- Solution 5: Customers who signed up after 1 March 2025
SELECT * FROM customers WHERE signup_date > '2025-03-01';
-- Extra: Extract first 5 characters of each email
SELECT email, SUBSTRING(email,1,5) AS email_prefix FROM customers;

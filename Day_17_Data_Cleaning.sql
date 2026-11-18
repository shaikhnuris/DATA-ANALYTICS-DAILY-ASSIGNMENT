-- DAY 17 SOLVED PRACTICE: Data Cleaning Basics (MySQL)
CREATE DATABASE IF NOT EXISTS day17_cleaning_db;
USE day17_cleaning_db;
DROP TABLE IF EXISTS raw_customers;
CREATE TABLE raw_customers (customer_id INT, customer_name VARCHAR(60), email VARCHAR(100), city VARCHAR(40), age INT);
INSERT INTO raw_customers VALUES
(1,'  Aarav Sharma  ','AARAV@EXAMPLE.COM','Delhi',22),(2,'Aisha Khan','aisha@example.com','Bareilly',NULL),
(3,'Rahul Verma','rahul@example.com',' delhi ',25),(4,'Priya Singh','PRIYA@EXAMPLE.COM','Lucknow',23),
(5,'Kabir Ali','kabir@example.com','Moradabad',NULL),(6,'Meera Gupta','meera@example.com','Jaipur',21);

-- Solution 1: Preview trimmed names
SELECT customer_id,TRIM(customer_name) AS clean_name FROM raw_customers;
-- Solution 2: Preview lowercase email
SELECT customer_id,LOWER(TRIM(email)) AS clean_email FROM raw_customers;
-- Solution 3: Standardize city formatting
SELECT customer_id,CONCAT(UPPER(LEFT(TRIM(city),1)),LOWER(SUBSTRING(TRIM(city),2))) AS clean_city FROM raw_customers;
-- Solution 4: Replace missing age with display text
SELECT customer_name,COALESCE(CAST(age AS CHAR),'Not Provided') AS age_display FROM raw_customers;
-- Solution 5: Find records with missing age
SELECT * FROM raw_customers WHERE age IS NULL;
-- Complete cleaned output without changing original table
SELECT customer_id,TRIM(customer_name) AS customer_name,
       LOWER(TRIM(email)) AS email,
       CONCAT(UPPER(LEFT(TRIM(city),1)),LOWER(SUBSTRING(TRIM(city),2))) AS city,
       age
FROM raw_customers;

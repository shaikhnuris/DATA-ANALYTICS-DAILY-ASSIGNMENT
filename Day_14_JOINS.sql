-- DAY 14 SOLVED PRACTICE: INNER JOIN and LEFT JOIN
CREATE DATABASE IF NOT EXISTS day14_orders_db;
USE day14_orders_db;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (customer_id INT PRIMARY KEY, customer_name VARCHAR(50), city VARCHAR(40));
CREATE TABLE orders (order_id INT PRIMARY KEY, customer_id INT, order_date DATE, order_amount DECIMAL(10,2), FOREIGN KEY (customer_id) REFERENCES customers(customer_id));
INSERT INTO customers VALUES (1,'Aarav','Delhi'),(2,'Aisha','Bareilly'),(3,'Rahul','Lucknow'),(4,'Priya','Delhi'),(5,'Kabir','Moradabad'),(6,'Meera','Jaipur');
INSERT INTO orders VALUES (1001,1,'2025-10-01',2500),(1002,2,'2025-10-02',1800),(1003,1,'2025-10-05',3200),(1004,4,'2025-10-08',4500),(1005,3,'2025-10-10',1200),(1006,5,'2025-10-12',2800);

-- Solution 1: Customer names with order details
SELECT c.customer_name,o.order_id,o.order_date,o.order_amount
FROM customers c INNER JOIN orders o ON c.customer_id=o.customer_id;
-- Solution 2: All customers, including customers without orders
SELECT c.customer_name,o.order_id,o.order_amount
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id;
-- Solution 3: Total order amount per customer
SELECT c.customer_name,COALESCE(SUM(o.order_amount),0) AS total_order_amount
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.customer_id,c.customer_name;
-- Extra: Customers who have not placed an order
SELECT c.* FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
WHERE o.order_id IS NULL;

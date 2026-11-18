-- DAY 18 SOLVED MINI PROJECT: E-commerce Sales Analysis (MySQL)
CREATE DATABASE IF NOT EXISTS day18_ecommerce_db;
USE day18_ecommerce_db;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
CREATE TABLE customers (customer_id INT PRIMARY KEY, customer_name VARCHAR(50), city VARCHAR(40));
CREATE TABLE products (product_id INT PRIMARY KEY, product_name VARCHAR(60), category VARCHAR(40), price DECIMAL(10,2));
CREATE TABLE orders (order_id INT PRIMARY KEY, customer_id INT, order_date DATE, status VARCHAR(20), FOREIGN KEY(customer_id) REFERENCES customers(customer_id));
CREATE TABLE order_items (item_id INT PRIMARY KEY, order_id INT, product_id INT, quantity INT, FOREIGN KEY(order_id) REFERENCES orders(order_id), FOREIGN KEY(product_id) REFERENCES products(product_id));
INSERT INTO customers VALUES (1,'Aarav','Delhi'),(2,'Aisha','Bareilly'),(3,'Rahul','Lucknow'),(4,'Priya','Delhi'),(5,'Kabir','Moradabad');
INSERT INTO products VALUES (101,'Laptop','Electronics',55000),(102,'Mouse','Accessories',700),(103,'Keyboard','Accessories',1500),(104,'Monitor','Electronics',12000),(105,'Headphones','Accessories',2500);
INSERT INTO orders VALUES (1001,1,'2025-10-01','Delivered'),(1002,2,'2025-10-03','Delivered'),(1003,1,'2025-10-05','Pending'),(1004,4,'2025-10-08','Delivered'),(1005,3,'2025-10-10','Cancelled'),(1006,5,'2025-10-12','Delivered');
INSERT INTO order_items VALUES (1,1001,101,1),(2,1001,102,2),(3,1002,103,1),(4,1003,104,1),(5,1004,105,2),(6,1004,102,1),(7,1005,101,1),(8,1006,103,2),(9,1006,105,1);

-- Solution 1: Order details with customer name
SELECT o.order_id,c.customer_name,o.order_date,o.status
FROM orders o JOIN customers c ON o.customer_id=c.customer_id;
-- Solution 2: Revenue for each order
SELECT oi.order_id,SUM(oi.quantity*p.price) AS order_revenue
FROM order_items oi JOIN products p ON oi.product_id=p.product_id
GROUP BY oi.order_id ORDER BY oi.order_id;
-- Solution 3: Revenue by product
SELECT p.product_name,SUM(oi.quantity*p.price) AS revenue
FROM order_items oi JOIN products p ON oi.product_id=p.product_id
GROUP BY p.product_id,p.product_name ORDER BY revenue DESC;
-- Solution 4: Spending by customer for delivered orders only
SELECT c.customer_name,SUM(oi.quantity*p.price) AS total_spending
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
JOIN order_items oi ON o.order_id=oi.order_id
JOIN products p ON oi.product_id=p.product_id
WHERE o.status='Delivered'
GROUP BY c.customer_id,c.customer_name ORDER BY total_spending DESC;
-- Solution 5: Count orders by status
SELECT status,COUNT(*) AS total_orders FROM orders GROUP BY status;
-- Solution 6: Units sold by product
SELECT p.product_name,SUM(oi.quantity) AS units_sold
FROM order_items oi JOIN products p ON oi.product_id=p.product_id
GROUP BY p.product_id,p.product_name ORDER BY units_sold DESC;
-- Extra: Revenue by city from delivered orders
SELECT c.city,SUM(oi.quantity*p.price) AS city_revenue
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
JOIN order_items oi ON o.order_id=oi.order_id
JOIN products p ON oi.product_id=p.product_id
WHERE o.status='Delivered'
GROUP BY c.city ORDER BY city_revenue DESC;

-- DAY 15 SOLVED PRACTICE: Subqueries
CREATE DATABASE IF NOT EXISTS day15_product_db;
USE day15_product_db;
DROP TABLE IF EXISTS products;
CREATE TABLE products (product_id INT PRIMARY KEY, product_name VARCHAR(60), category VARCHAR(40), price DECIMAL(10,2), stock INT);
INSERT INTO products VALUES
(1,'Laptop','Electronics',55000,12),(2,'Mouse','Accessories',700,50),(3,'Keyboard','Accessories',1500,35),
(4,'Monitor','Electronics',12000,18),(5,'Headphones','Accessories',2500,25),(6,'Phone','Electronics',30000,20),
(7,'USB Drive','Accessories',600,60),(8,'Tablet','Electronics',22000,10);

-- Solution 1: Products priced above average
SELECT * FROM products WHERE price > (SELECT AVG(price) FROM products);
-- Solution 2: Most expensive product
SELECT * FROM products WHERE price = (SELECT MAX(price) FROM products);
-- Solution 3: Products in Laptop's category
SELECT * FROM products WHERE category = (SELECT category FROM products WHERE product_name='Laptop');
-- Solution 4: Products with stock lower than average stock
SELECT * FROM products WHERE stock < (SELECT AVG(stock) FROM products);
-- Extra: Second highest distinct product price
SELECT MAX(price) AS second_highest_price FROM products
WHERE price < (SELECT MAX(price) FROM products);

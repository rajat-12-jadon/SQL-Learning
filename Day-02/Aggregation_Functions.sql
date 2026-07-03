-- Aggregation Functions

SELECT COUNT(product_id) FROM products; 

SELECT SUM(price) FROM products;

SELECT SUM(price) FROM products 
WHERE category = 'Electronics';

SELECT ROUND(AVG(price), 2) FROM products;

SELECT MIN(price) FROM products;

SELECT MAX(price) FROM products;
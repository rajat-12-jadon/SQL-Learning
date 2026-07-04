-- =====================================================
-- File: 03_Aggregation_Functions.sql
-- Topic: SQL Aggregate Functions
-- Description: Demonstrates commonly used aggregate
-- functions to summarize data in the Products table.
-- =====================================================


-- =====================================================
-- COUNT()
-- Returns the total number of rows.
-- =====================================================

-- Count the total number of products.

SELECT COUNT(*)
FROM products;


-- =====================================================
-- SUM()
-- Returns the total of a numeric column.
-- =====================================================

-- Calculate the total price of all products.

SELECT SUM(price) AS total_price
FROM products;


-- Calculate the total price of products
-- belonging to the 'Electronics' category.

SELECT SUM(price) AS electronics_total_price
FROM products
WHERE category = 'Electronics';


-- =====================================================
-- AVG()
-- Returns the average value.
-- =====================================================

-- Calculate the average product price
-- rounded to two decimal places.

SELECT ROUND(AVG(price), 2) AS average_price
FROM products;


-- =====================================================
-- MIN()
-- Returns the smallest value.
-- =====================================================

-- Find the cheapest product price.

SELECT MIN(price) AS minimum_price
FROM products;


-- =====================================================
-- MAX()
-- Returns the largest value.
-- =====================================================

-- Find the most expensive product price.

SELECT MAX(price) AS maximum_price
FROM products;


-- =====================================================
-- End of File
-- =====================================================
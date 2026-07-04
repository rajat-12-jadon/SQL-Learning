-- =====================================================
-- File: 04_Practice_Set.sql
-- Topic: SQL Practice Set
-- Description: Practice questions based on SQL Clauses,
-- Operators, and Aggregate Functions.
-- =====================================================


-- =====================================================
-- Question 1
-- Display the name and price of the cheapest product
-- in the Products table.
-- =====================================================

SELECT
    name,
    price
FROM products
WHERE price = (
    SELECT MIN(price)
    FROM products
);


-- =====================================================
-- Question 2
-- Find the average price of products belonging to
-- the 'Home & Kitchen' or 'Fitness' category.
-- =====================================================

SELECT
    ROUND(AVG(price), 2) AS average_price
FROM products
WHERE category IN ('Home & Kitchen', 'Fitness');


-- =====================================================
-- Question 3
-- Display the product name and stock quantity where:
-- • Product is available.
-- • Stock quantity is greater than 50.
-- • Price is not equal to ₹299.
-- =====================================================

SELECT
    name,
    stock_quantity
FROM products
WHERE is_available = TRUE
AND stock_quantity > 50
AND price != 299;


-- =====================================================
-- Question 4
-- Find the highest product price in each category.
--
-- Note:
-- This query returns the maximum price for each
-- category. Displaying the corresponding product name
-- will be covered later using Joins/Subqueries.
-- =====================================================

SELECT
    category,
    MAX(price) AS highest_price
FROM products
GROUP BY category;


-- =====================================================
-- Question 5
-- Display all unique categories in uppercase,
-- sorted in descending alphabetical order.
-- =====================================================

SELECT DISTINCT
    UPPER(category) AS category_in_uppercase
FROM products
ORDER BY category_in_uppercase DESC;


-- =====================================================
-- End of File
-- =====================================================
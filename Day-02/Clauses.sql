-- =====================================================
-- File: 01_Clauses.sql
-- Topic: SQL Clauses
-- Description: Demonstrates commonly used SQL clauses
-- using the Products table.
-- =====================================================


-- =====================================================
-- SELECT Clause
-- Retrieve specific columns from the table.
-- =====================================================

-- Show the name and price of all products.

SELECT
    name,
    price
FROM products;


-- =====================================================
-- WHERE Clause
-- Filter records based on a condition.
-- =====================================================

-- Show all products that belong to the 'Electronics' category.

SELECT *
FROM products
WHERE category = 'Electronics';


-- =====================================================
-- GROUP BY Clause
-- Group rows having the same values into summary rows.
-- =====================================================

-- Display each product category only once.

SELECT category
FROM products
GROUP BY category;


-- =====================================================
-- HAVING Clause
-- Filter grouped records.
-- Used after GROUP BY.
-- =====================================================

-- Display categories having more than one product.

SELECT
    category,
    COUNT(*) AS total_products
FROM products
GROUP BY category
HAVING COUNT(*) > 1;


-- =====================================================
-- ORDER BY Clause
-- Sort records in ascending or descending order.
-- =====================================================

-- Display all products sorted by price (Ascending).

SELECT *
FROM products
ORDER BY price ASC;

-- Display all products sorted by price (Descending).

-- SELECT *
-- FROM products
-- ORDER BY price DESC;


-- =====================================================
-- LIMIT Clause
-- Restrict the number of rows returned.
-- =====================================================

-- Display only the first three products.

SELECT *
FROM products
LIMIT 3;


-- =====================================================
-- AS Keyword (Alias)
-- Rename columns in the output.
-- =====================================================

-- Display product name as "Item_Name"
-- and price as "Item_Price".

SELECT
    name AS Item_Name,
    price AS Item_Price
FROM products;


-- =====================================================
-- DISTINCT Clause
-- Remove duplicate values from the result.
-- =====================================================

-- Display all unique product categories.

SELECT DISTINCT category
FROM products;


-- =====================================================
-- End of File
-- =====================================================
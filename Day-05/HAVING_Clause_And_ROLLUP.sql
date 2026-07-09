-- =====================================================
-- File: 02_HAVING_Clause.sql
-- Topic: HAVING Clause & ROLLUP
-- Description: Demonstrates the use of HAVING,
-- GROUP BY, and ROLLUP in PostgreSQL.
-- =====================================================


-- =====================================================
-- Display Products Table
-- =====================================================

SELECT *
FROM products;


-- =====================================================
-- GROUP BY
--
-- Display the total number of products
-- in each category.
-- =====================================================

SELECT
    category,
    COUNT(*) AS total_products
FROM products
GROUP BY category;


-- =====================================================
-- HAVING
--
-- Display only those categories
-- having more than one product.
-- =====================================================

SELECT
    category,
    COUNT(*) AS total_products
FROM products
GROUP BY category
HAVING COUNT(*) > 1;


-- =====================================================
-- HAVING with SUM()
--
-- Display categories whose total
-- stock quantity is greater than 50.
-- =====================================================

SELECT
    category,
    SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category
HAVING SUM(stock_quantity) > 50;


-- =====================================================
-- HAVING with AVG()
--
-- Display categories whose average
-- product price is greater than ₹500.
-- =====================================================

SELECT
    category,
    ROUND(AVG(price), 2) AS average_price
FROM products
GROUP BY category
HAVING AVG(price) > 500;


-- =====================================================
-- HAVING with Multiple Conditions
--
-- Display categories having:
-- • More than 1 product
-- • Average price greater than ₹500
-- =====================================================

SELECT
    category,
    COUNT(*) AS total_products,
    ROUND(AVG(price), 2) AS average_price
FROM products
GROUP BY category
HAVING COUNT(*) > 1
   AND AVG(price) > 500;


-- =====================================================
-- ROLLUP
--
-- ROLLUP adds subtotal rows
-- along with the grand total.
-- =====================================================

SELECT
    category,
    SUM(price) AS total_price
FROM products
GROUP BY ROLLUP(category);


-- =====================================================
-- ROLLUP with COUNT()
--
-- Display the number of products
-- in each category along with
-- the grand total.
-- =====================================================

SELECT
    category,
    COUNT(*) AS total_products
FROM products
GROUP BY ROLLUP(category);


-- =====================================================
-- ROLLUP with Multiple Columns
--
-- Displays subtotal for each category
-- and the grand total.
-- =====================================================

SELECT
    category,
    is_available,
    COUNT(*) AS total_products
FROM products
GROUP BY ROLLUP(category, is_available);


-- =====================================================
-- Practice Question 1
--
-- Display categories having
-- more than 2 available products.
-- =====================================================

SELECT
    category,
    COUNT(*) AS total_products
FROM products
WHERE is_available = TRUE
GROUP BY category
HAVING COUNT(*) > 2;


-- =====================================================
-- Practice Question 2
--
-- Display categories where
-- the maximum price is
-- greater than ₹1000.
-- =====================================================

SELECT
    category,
    MAX(price) AS highest_price
FROM products
GROUP BY category
HAVING MAX(price) > 1000;


-- =====================================================
-- Practice Question 3
--
-- Display categories where
-- the minimum price is
-- less than ₹300.
-- =====================================================

SELECT
    category,
    MIN(price) AS lowest_price
FROM products
GROUP BY category
HAVING MIN(price) < 300;


-- =====================================================
-- Practice Question 4
--
-- Display categories whose
-- total stock quantity is
-- between 50 and 150.
-- =====================================================

SELECT
    category,
    SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category
HAVING SUM(stock_quantity) BETWEEN 50 AND 150;


-- =====================================================
-- Practice Question 5
--
-- Display the total stock quantity
-- of each category and the grand total
-- using ROLLUP.
-- =====================================================

SELECT
    category,
    SUM(stock_quantity) AS total_stock
FROM products
GROUP BY ROLLUP(category);


-- =====================================================
-- Summary
--
-- ✔ GROUP BY
-- ✔ HAVING
-- ✔ HAVING with COUNT()
-- ✔ HAVING with SUM()
-- ✔ HAVING with AVG()
-- ✔ HAVING with Multiple Conditions
-- ✔ ROLLUP
-- ✔ ROLLUP with Multiple Columns
--
-- Note:
-- WHERE filters rows before GROUP BY.
-- HAVING filters groups after GROUP BY.
-- ROLLUP generates subtotal and
-- grand total rows automatically.
-- =====================================================


-- =====================================================
-- End of File
-- =====================================================
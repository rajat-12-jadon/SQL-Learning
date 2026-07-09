-- =====================================================
-- File: 03_COALESCE_Function.sql
-- Topic: COALESCE() Function
-- Description: Demonstrates how to replace NULL values
-- using the COALESCE() function in PostgreSQL.
-- =====================================================


-- =====================================================
-- Display Products Table
-- =====================================================

SELECT *
FROM products;


-- =====================================================
-- COALESCE()
--
-- Returns the first non-NULL value
-- from the given list of expressions.
-- =====================================================


-- =====================================================
-- Example 1
-- Replace NULL category with 'Unknown'.
-- =====================================================

SELECT
    name,
    COALESCE(category, 'Unknown') AS category
FROM products;


-- =====================================================
-- Example 2
-- Replace NULL stock quantity with 0.
-- =====================================================

SELECT
    name,
    COALESCE(stock_quantity, 0) AS stock_quantity
FROM products;


-- =====================================================
-- Example 3
-- Replace NULL price with 0.
-- =====================================================

SELECT
    name,
    COALESCE(price, 0) AS price
FROM products;


-- =====================================================
-- Example 4
-- Using COALESCE() with ROLLUP.
--
-- Instead of displaying NULL,
-- display 'Grand Total'.
-- =====================================================

SELECT
    COALESCE(category, 'Grand Total') AS category,
    SUM(price) AS total_price
FROM products
GROUP BY ROLLUP(category);


-- =====================================================
-- Example 5
-- ROLLUP with COUNT().
-- =====================================================

SELECT
    COALESCE(category, 'Grand Total') AS category,
    COUNT(*) AS total_products
FROM products
GROUP BY ROLLUP(category);


-- =====================================================
-- Example 6
-- ROLLUP with SUM().
-- =====================================================

SELECT
    COALESCE(category, 'Grand Total') AS category,
    SUM(stock_quantity) AS total_stock
FROM products
GROUP BY ROLLUP(category);


-- =====================================================
-- Example 7
-- ROLLUP with Multiple Columns.
-- =====================================================

SELECT
    COALESCE(category, 'Grand Total') AS category,
    COALESCE(CAST(is_available AS TEXT), 'All Products')
        AS availability,
    COUNT(*) AS total_products
FROM products
GROUP BY ROLLUP(category, is_available);


-- =====================================================
-- Example 8
-- Using COALESCE() with LEFT JOIN.
--
-- Students without marks will display
-- meaningful values instead of NULL.
-- =====================================================

SELECT
    s.name,
    COALESCE(m.subject, 'No Subject') AS subject,
    COALESCE(m.marks, 0) AS marks
FROM students_1 AS s
LEFT JOIN marks AS m
ON s.student_id = m.student_id;


-- =====================================================
-- Practice Question 1
--
-- Display all students.
-- If a student has no subject,
-- display 'Not Assigned'.
-- =====================================================

SELECT
    s.name,
    COALESCE(m.subject, 'Not Assigned') AS subject
FROM students_1 AS s
LEFT JOIN marks AS m
ON s.student_id = m.student_id;


-- =====================================================
-- Practice Question 2
--
-- Display all students.
-- If marks are NULL,
-- display 0.
-- =====================================================

SELECT
    s.name,
    COALESCE(m.marks, 0) AS marks
FROM students_1 AS s
LEFT JOIN marks AS m
ON s.student_id = m.student_id;


-- =====================================================
-- Practice Question 3
--
-- Display category-wise total stock.
-- Replace NULL with 'Grand Total'.
-- =====================================================

SELECT
    COALESCE(category, 'Grand Total') AS category,
    SUM(stock_quantity) AS total_stock
FROM products
GROUP BY ROLLUP(category);


-- =====================================================
-- Practice Question 4
--
-- Display category-wise total price.
-- Replace NULL with 'Grand Total'.
-- =====================================================

SELECT
    COALESCE(category, 'Grand Total') AS category,
    SUM(price) AS total_price
FROM products
GROUP BY ROLLUP(category);


-- =====================================================
-- Practice Question 5
--
-- Display the availability status.
-- If availability is NULL,
-- display 'Unknown'.
-- =====================================================

SELECT
    name,
    COALESCE(CAST(is_available AS TEXT), 'Unknown')
        AS availability
FROM products;


-- =====================================================
-- Summary
--
-- ✔ COALESCE()
-- ✔ Replace NULL values
-- ✔ COALESCE with LEFT JOIN
-- ✔ COALESCE with ROLLUP
-- ✔ COALESCE with COUNT()
-- ✔ COALESCE with SUM()
--
-- Syntax:
--
-- COALESCE(expression1,
--          expression2,
--          expression3,
--          ...)
--
-- Returns the first non-NULL value.
-- =====================================================


-- =====================================================
-- End of File
-- =====================================================
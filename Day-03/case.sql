-- =====================================================
-- File: 03_CASE_Statement.sql
-- Topic: CASE Statement
-- Description: Demonstrates the CASE statement in
-- PostgreSQL for conditional logic in queries and
-- updating table data.
-- =====================================================


-- Display all records from the Products table.

SELECT *
FROM products;


-- =====================================================
-- CASE Statement in SELECT
-- Categorize products based on their price.
--
-- Note:
-- This creates a temporary result set and does not
-- modify the actual table data.
-- =====================================================

SELECT
    name,
    price,
    CASE
        WHEN price > 1000 THEN 'Expensive'
        WHEN price BETWEEN 500 AND 1000 THEN 'Moderate'
        ELSE 'Cheap'
    END AS price_tag
FROM products;


-- =====================================================
-- CASE Statement with UPDATE
-- Store the price category permanently in the table.
-- =====================================================

-- Add a new column.

ALTER TABLE products
ADD COLUMN price_tag TEXT;


-- Update the newly added column.

UPDATE products
SET price_tag =
CASE
    WHEN price > 1000 THEN 'Expensive'
    WHEN price BETWEEN 500 AND 1000 THEN 'Moderate'
    ELSE 'Cheap'
END;


-- Display updated table.

SELECT *
FROM products;


-- =====================================================
-- Practice Question 1
--
-- Create a new column named Availability_Status
-- and assign:
-- • 'In Stock'  -> If is_available = TRUE
-- • 'Out of Stock' -> Otherwise
-- =====================================================

ALTER TABLE products
ADD COLUMN availability_status TEXT;


UPDATE products
SET availability_status =
CASE
    WHEN is_available THEN 'In Stock'
    ELSE 'Out of Stock'
END;


-- Display updated table.

SELECT *
FROM products;


-- =====================================================
-- Practice Question 2
--
-- Display:
-- • Product Name
-- • Stock Quantity
-- • Stock Label
--
-- Rules:
-- • High Stock    -> Quantity > 100
-- • Medium Stock  -> Quantity between 30 and 100
-- • Low Stock     -> Otherwise
-- =====================================================

SELECT
    name,
    stock_quantity,
    CASE
        WHEN stock_quantity > 100 THEN 'High Stock'
        WHEN stock_quantity BETWEEN 30 AND 100 THEN 'Medium Stock'
        ELSE 'Low Stock'
    END AS stock_label
FROM products;


-- =====================================================
-- End of File
-- =====================================================
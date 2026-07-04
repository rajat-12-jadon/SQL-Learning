-- =====================================================
-- File: 02_Clauses_With_Operators.sql
-- Topic: SQL Clauses with Operators
-- Description: Demonstrates comparison, logical,
-- range, membership, pattern matching, and NOT operators.
-- =====================================================


-- Display all records from the Products table.

SELECT *
FROM products;


-- =====================================================
-- Comparison Operators
-- =====================================================

-- Equal To (=)
-- Display all products belonging to the 'Electronics' category.

SELECT *
FROM products
WHERE category = 'Electronics';


-- Not Equal To (!=)
-- Display all products except those in the 'Electronics' category.

SELECT *
FROM products
WHERE category != 'Electronics';


-- Greater Than (>)
-- Display products with a price greater than ₹500.

SELECT *
FROM products
WHERE price > 500;


-- =====================================================
-- Logical Operators
-- =====================================================

-- AND
-- Display products priced above ₹500
-- that belong to the 'Accessories' category.

SELECT *
FROM products
WHERE price > 500
AND category = 'Accessories';


-- OR
-- Display products priced above ₹500
-- or belonging to the 'Accessories' category.

SELECT *
FROM products
WHERE price > 500
OR category = 'Accessories';


-- AND + OR
-- Display products priced above ₹500
-- and belonging to either the 'Electronics'
-- or 'Accessories' category.

SELECT *
FROM products
WHERE price > 500
AND (
    category = 'Electronics'
    OR category = 'Accessories'
);


-- =====================================================
-- Range Operators
-- =====================================================

-- Using Comparison Operators
-- Display products priced between ₹400 and ₹1000.

SELECT *
FROM products
WHERE price > 400
AND price < 1000;


-- BETWEEN
-- Display products priced between ₹400 and ₹1000.

SELECT *
FROM products
WHERE price BETWEEN 400 AND 1000;


-- =====================================================
-- Membership Operator
-- =====================================================

-- IN
-- Display products belonging to multiple categories.

SELECT *
FROM products
WHERE category IN (
    'Electronics',
    'Accessories',
    'Fitness'
);


-- =====================================================
-- Pattern Matching
-- =====================================================

-- LIKE 'W%'
-- Product code starts with 'W'.

SELECT *
FROM products
WHERE sku_code LIKE 'W%';


-- LIKE '%123%'
-- Product code contains '123'.

SELECT *
FROM products
WHERE sku_code LIKE '%123%';


-- LIKE '_B%'
-- Second character is 'B'.

SELECT *
FROM products
WHERE sku_code LIKE '_B%';


-- =====================================================
-- NOT Operator
-- =====================================================

-- Display products that do not belong
-- to the 'Electronics' category.

SELECT *
FROM products
WHERE NOT category = 'Electronics';


-- =====================================================
-- End of File
-- =====================================================
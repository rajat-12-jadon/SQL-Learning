-- =====================================================
-- File: 01_String_Functions.sql
-- Topic: SQL String Functions
-- Description: Demonstrates commonly used string
-- functions in PostgreSQL using the Products table.
-- =====================================================


-- Display all records from the Products table.

SELECT *
FROM products;


-- =====================================================
-- UPPER()
-- Converts all characters to uppercase.
-- =====================================================

SELECT
    UPPER(name) AS product_name
FROM products;


-- =====================================================
-- LOWER()
-- Converts all characters to lowercase.
-- =====================================================

SELECT
    LOWER(sku_code) AS sku_code
FROM products;


-- =====================================================
-- LENGTH()
-- Returns the total number of characters.
-- =====================================================

SELECT
    LENGTH(sku_code) AS sku_length
FROM products;


-- =====================================================
-- SUBSTRING()
-- Extract a portion of a string.
-- =====================================================

-- Extract the first 7 characters.

SELECT SUBSTRING('Brother in arms', 1, 7);


-- Extract "arms".

SELECT SUBSTRING('Brother in arms', 12, 4);


-- Extract the first two characters of SKU Code.

SELECT
    name,
    SUBSTRING(sku_code, 1, 2) AS sku_prefix
FROM products;


-- =====================================================
-- LEFT()
-- Returns characters from the left side.
-- =====================================================

SELECT LEFT('Brother Arms', 7);


-- =====================================================
-- RIGHT()
-- Returns characters from the right side.
-- =====================================================

SELECT RIGHT('Brother Arms', 4);


-- =====================================================
-- CONCAT()
-- Joins multiple strings together.
-- =====================================================

SELECT
    CONCAT(name, ' ', category) AS product_with_category
FROM products;


-- =====================================================
-- CONCAT_WS()
-- Concatenates strings using a separator.
-- =====================================================

SELECT
    CONCAT_WS(' ', name, category, stock_quantity)
    AS product_details
FROM products;


-- =====================================================
-- TRIM()
-- Removes leading and trailing spaces.
-- =====================================================

SELECT
    TRIM('     Rajat Jadon     ') AS trimmed_text;


-- =====================================================
-- REPLACE()
-- Replaces a specified part of a string.
-- =====================================================

SELECT
    name,
    REPLACE(
        sku_code,
        LEFT(sku_code, 2),
        'GG'
    ) AS updated_sku
FROM products;


-- =====================================================
-- End of File
-- =====================================================
-- =====================================================
-- File: 01_Views.sql
-- Topic: SQL Views
-- Description: Demonstrates how to create, use,
-- replace, update, and drop SQL Views.
-- =====================================================


-- =====================================================
-- Display Products Table
-- =====================================================

SELECT *
FROM products;


-- =====================================================
-- CREATE VIEW
--
-- Create a view that displays only
-- product name, price and category.
--
-- A View is a virtual table created
-- from one or more SQL queries.
-- =====================================================

CREATE VIEW product_details AS
SELECT
    name,
    price,
    category
FROM products;


-- Display the View.

SELECT *
FROM product_details;


-- =====================================================
-- CREATE VIEW WITH CONDITION
--
-- Create a view that displays only
-- Electronics products.
-- =====================================================

CREATE VIEW electronics_products AS
SELECT
    product_id,
    name,
    price,
    stock_quantity
FROM products
WHERE category = 'Electronics';


-- Display Electronics Products.

SELECT *
FROM electronics_products;


-- =====================================================
-- CREATE OR REPLACE VIEW
--
-- Modify an existing view by adding
-- one more column.
-- =====================================================

CREATE OR REPLACE VIEW product_details AS
SELECT
    name,
    category,
    price,
    stock_quantity
FROM products;


-- Display Updated View.

SELECT *
FROM product_details;


-- =====================================================
-- UPDATE DATA USING VIEW
--
-- Updating a view also updates the
-- original table (if the view is updatable).
-- =====================================================

UPDATE product_details
SET stock_quantity = 80
WHERE name = 'Wireless Mouse';


-- Verify Changes.

SELECT *
FROM products
WHERE name = 'Wireless Mouse';


-- =====================================================
-- DELETE DATA USING VIEW
--
-- Deleting from an updatable view
-- also deletes the row from the
-- original table.
-- =====================================================

-- Uncomment to execute.

-- DELETE FROM product_details
-- WHERE name = 'Yoga Mat';


-- =====================================================
-- DROP VIEW
--
-- Removes the view from the database.
-- =====================================================

-- Uncomment to execute.

-- DROP VIEW product_details;

-- DROP VIEW electronics_products;


-- =====================================================
-- Practice Question 1
--
-- Create a view that displays only
-- products whose price is greater
-- than ₹1000.
-- =====================================================

CREATE VIEW expensive_products AS
SELECT
    product_id,
    name,
    price,
    category
FROM products
WHERE price > 1000;


SELECT *
FROM expensive_products;


-- =====================================================
-- Practice Question 2
--
-- Create a view showing only
-- products that are currently available.
-- =====================================================

CREATE VIEW available_products AS
SELECT
    product_id,
    name,
    stock_quantity,
    category
FROM products
WHERE is_available = TRUE;


SELECT *
FROM available_products;


-- =====================================================
-- Practice Question 3
--
-- Display the names and prices
-- from the Product Details view.
-- =====================================================

SELECT
    name,
    price
FROM product_details;


-- =====================================================
-- Practice Question 4
--
-- Find all Electronics products
-- using the Electronics View.
-- =====================================================

SELECT *
FROM electronics_products
WHERE stock_quantity > 10;


-- =====================================================
-- Practice Question 5
--
-- Count the total number of
-- products in the Available Products View.
-- =====================================================

SELECT
    COUNT(*) AS total_available_products
FROM available_products;


-- =====================================================
-- Summary
--
-- ✔ CREATE VIEW
-- ✔ CREATE OR REPLACE VIEW
-- ✔ SELECT FROM VIEW
-- ✔ UPDATE USING VIEW
-- ✔ DELETE USING VIEW
-- ✔ DROP VIEW
--
-- Note:
-- A View does not store data itself.
-- It stores only the SQL query.
-- Data is always fetched from the
-- original table.
-- =====================================================


-- =====================================================
-- End of File
-- =====================================================
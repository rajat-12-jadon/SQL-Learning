-- =====================================================
-- File: 01_Subqueries.sql
-- Topic: Subqueries
-- Description: Demonstrates different types of
-- subqueries in PostgreSQL.
-- =====================================================


-- =====================================================
-- Display Products Table
-- =====================================================

SELECT *
FROM products;


-- =====================================================
-- What is a Subquery?
--
-- • A Subquery is a query written inside
--   another SQL query.
--
-- • The inner query executes first.
-- • Its result is then used by the outer query.
--
-- A Subquery can be used with:
-- ✔ SELECT
-- ✔ WHERE
-- ✔ FROM
-- ✔ HAVING
-- ✔ INSERT
-- ✔ UPDATE
-- ✔ DELETE
-- =====================================================



-- =====================================================
-- Scalar Subquery
--
-- Returns only one value.
-- =====================================================

SELECT
    name,
    price
FROM products

WHERE price = (

    SELECT MAX(price)
    FROM products

);


-- =====================================================
-- Multiple Row Subquery
--
-- Returns multiple rows.
-- =====================================================

SELECT
    name,
    category

FROM products

WHERE category IN (

    SELECT DISTINCT category
    FROM products
    WHERE price > 1000

);



-- =====================================================
-- Subquery in SELECT Clause
--
-- Display product name,
-- price and average price.
-- =====================================================

SELECT

    name,
    price,

    (

        SELECT ROUND(AVG(price),2)
        FROM products

    ) AS average_price

FROM products;



-- =====================================================
-- Subquery in FROM Clause
--
-- Treats subquery as a temporary table.
-- =====================================================

SELECT
    category,
    average_price

FROM

(
    SELECT
        category,
        ROUND(AVG(price),2) AS average_price

    FROM products

    GROUP BY category

) AS category_average;



-- =====================================================
-- Subquery in HAVING
--
-- Display categories whose average
-- price is greater than overall average.
-- =====================================================

SELECT

    category,
    ROUND(AVG(price),2) AS average_price

FROM products

GROUP BY category

HAVING AVG(price) >

(

    SELECT AVG(price)
    FROM products

);



-- =====================================================
-- Correlated Subquery
--
-- The inner query depends on
-- the outer query.
-- =====================================================

SELECT
    p1.name,
    p1.category,
    p1.price

FROM products p1

WHERE price >

(

    SELECT AVG(price)

    FROM products p2

    WHERE p1.category = p2.category

);



-- =====================================================
-- EXISTS
--
-- Returns TRUE if the subquery
-- returns at least one row.
-- =====================================================

SELECT
    name,
    category

FROM products p

WHERE EXISTS

(

    SELECT 1

    FROM products

    WHERE category = p.category

);



-- =====================================================
-- NOT EXISTS
--
-- Returns TRUE if the subquery
-- returns no rows.
-- =====================================================

SELECT
    name

FROM products p

WHERE NOT EXISTS

(

    SELECT 1

    FROM products

    WHERE category = 'Toys'

);



-- =====================================================
-- ANY
--
-- Compare with any value returned
-- by the subquery.
-- =====================================================

SELECT
    name,
    price

FROM products

WHERE price >

ANY

(

    SELECT price

    FROM products

    WHERE category = 'Fitness'

);



-- =====================================================
-- ALL
--
-- Compare with all values returned
-- by the subquery.
-- =====================================================

SELECT
    name,
    price

FROM products

WHERE price >

ALL

(

    SELECT price

    FROM products

    WHERE category = 'Fitness'

);



-- =====================================================
-- Practice Question 1
--
-- Display products whose price
-- is greater than average price.
-- =====================================================

SELECT
    name,
    price

FROM products

WHERE price >

(

    SELECT AVG(price)
    FROM products

);



-- =====================================================
-- Practice Question 2
--
-- Display the cheapest product.
-- =====================================================

SELECT
    name,
    price

FROM products

WHERE price =

(

    SELECT MIN(price)
    FROM products

);



-- =====================================================
-- Practice Question 3
--
-- Display products belonging to
-- the category having highest
-- average price.
-- =====================================================

SELECT
    name,
    category,
    price

FROM products

WHERE category =

(

    SELECT category

    FROM products

    GROUP BY category

    ORDER BY AVG(price) DESC

    LIMIT 1

);



-- =====================================================
-- Practice Question 4
--
-- Display products priced above
-- the average price of their
-- respective category.
-- =====================================================

SELECT
    p1.name,
    p1.category,
    p1.price

FROM products p1

WHERE p1.price >

(

    SELECT AVG(price)

    FROM products p2

    WHERE p1.category = p2.category

);



-- =====================================================
-- Practice Question 5
--
-- Display categories whose total
-- stock quantity is greater than
-- the overall average stock.
-- =====================================================

SELECT

    category,
    SUM(stock_quantity) AS total_stock

FROM products

GROUP BY category

HAVING SUM(stock_quantity) >

(

    SELECT AVG(stock_quantity)

    FROM products

);



-- =====================================================
-- Summary
--
-- ✔ Scalar Subquery
-- ✔ Multiple Row Subquery
-- ✔ Subquery in SELECT
-- ✔ Subquery in FROM
-- ✔ Subquery in WHERE
-- ✔ Subquery in HAVING
-- ✔ Correlated Subquery
-- ✔ EXISTS
-- ✔ NOT EXISTS
-- ✔ ANY
-- ✔ ALL
--
-- Execution Order:
--
-- 1. Inner Query
-- 2. Outer Query
--
-- Subqueries make SQL more
-- dynamic and flexible.
-- =====================================================


-- =====================================================
-- End of File
-- =====================================================
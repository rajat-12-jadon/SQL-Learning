-- Test based on Clauses, Operators aand Aggregation Function

-- 1. Display the name and price of the cheapest product in the entire table

SELECT name, price FROM products
WHERE price = (
SELECT MIN(price) FROM products
);


-- 2. Find the average price of products that belong to the 'Home & Kitchen' or 'Fitness' category.

SELECT ROUND(AVG(price), 2) FROM products
WHERE category IN ('Fitness', 'Home & Kitchen');


-- 3. Show product names and stock quantity where the product is available, stock is more than 50, and price is not equl to ₹299.

SELECT name, stock_quantity FROM products
WHERE is_available = True AND stock_quantity > 50 AND price != 299;

-- 4. Find the most expensive product in each category (name and price).

SELECT category, MAX(price) as max_price FROM products
GROUP BY category;

-- 5. Show all unique categories in UPPERCASE, sorted in descending order.

SELECT DISTINCT UPPER(category) as category_in_uppercase FROM products
ORDER BY category_in_uppercase DESC;
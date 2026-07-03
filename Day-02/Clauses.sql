-- Some questions to understand Clauses

-- 1. Show the name and price of all products.

SELECT name, price from products;

-- Show all the products where the category is 'Electronics'.

SELECT * FROM products
WHERE category = 'Electronics';

-- Group Products by category, and show each category once.

SELECT category FROM products
GROUP BY category;

-- SHow categories that have more than 1 product. (Use after GROUP BY)

SELECT category, count(*) FROM products
GROUP BY category
HAVING count(*) > 1;

-- Show all products sorted by price in ascending order.

SELECT * FROM products 
ORDER BY price; -- ORDER BY price DESC; -> for descending order

-- Show only the first 3 products from the table

SELECT * FROM products
LIMIT 3;

-- Show product name as "Item_Name" and price as "Item_Price".

SELECT name as Item_Name, price as Item_Price FROM products;

-- Show all the uniue categories from the product.

SELECT DISTINCT category FROM products;

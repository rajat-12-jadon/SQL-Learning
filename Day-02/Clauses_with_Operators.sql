SELECT * FROM products;

-- SQL Clauses with Operators

SELECT * FROM products
WHERE category = 'Electronics';

SELECT * FROM products
WHERE category != 'Electronics';

SELECT * FROM products
WHERE price > 500;

SELECT * FROM products
WHERE price > 500 AND category = 'Accessories';

SELECT * FROM products
WHERE price > 500 OR category = 'Accessories';

SSELECT *
FROM products
WHERE price > 500
AND (
    category = 'Electronics'
    OR category = 'Accessories'
);

SELECT * FROM products
WHERE price < 1000 AND price > 400;

SELECT * FROM products
WHERE price BETWEEN 400 AND 1000;

SELECT * FROM products
WHERE category IN ('Electronics', 'Accessories', 'Fitness');

SELECT * FROM products 
WHERE sku_code LIKE 'W%';

SELECT * FROM products 
WHERE sku_code LIKE '%123%';

SELECT * FROM products 
WHERE sku_code LIKE '_B%';

SELECT * FROM products
WHERE NOT category = 'Electronics';
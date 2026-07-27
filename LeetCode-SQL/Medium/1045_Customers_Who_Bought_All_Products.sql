-- =====================================================
-- Problem: Customers Who Bought All Products
-- LeetCode: 1045
-- Difficulty: Medium
-- Topic: GROUP BY, HAVING, COUNT(DISTINCT), Subquery
-- =====================================================

/*
Problem Link:
https://leetcode.com/problems/customers-who-bought-all-products/

Approach:
1. Count the total number of distinct products.
2. Group the Customer table by customer_id.
3. Count the distinct products purchased by each customer.
4. Return customers whose count equals the total number of products.

Time Complexity: O(n)
Space Complexity: O(1)
*/

SELECT
    customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(*)
    FROM Product
);
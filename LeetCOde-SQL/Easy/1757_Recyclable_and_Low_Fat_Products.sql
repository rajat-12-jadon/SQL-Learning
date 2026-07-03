-- =====================================================
-- Problem: Recyclable and Low Fat Products
-- LeetCode: 1757
-- Difficulty: Easy
-- Topic: SELECT, WHERE
-- =====================================================

SELECT product_id FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
-- =====================================================
-- Problem: Biggest Single Number
-- LeetCode: 619
-- Difficulty: Easy
-- Topic: GROUP BY, HAVING, MAX, Aggregate Functions
-- =====================================================

/*
Problem Link:
https://leetcode.com/problems/biggest-single-number/

Approach:
1. Group the numbers by num.
2. Keep only the numbers that appear exactly once using HAVING COUNT(*) = 1.
3. Return the maximum among those numbers.
4. If no such number exists, MAX() automatically returns NULL.

Time Complexity: O(n)
Space Complexity: O(1)
*/

SELECT
    MAX(num) AS num
FROM MyNumbers
WHERE num IN (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
);
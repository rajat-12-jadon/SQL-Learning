-- =====================================================
-- Problem: Second Highest Salary
-- LeetCode: 176
-- Difficulty: Medium
-- Topic: Aggregate Functions, Subquery, DISTINCT
-- =====================================================


SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);
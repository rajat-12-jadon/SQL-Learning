-- =====================================================
-- Problem: Employee Bonus
-- LeetCode: 577
-- Difficulty: Easy
-- Topic: LEFT JOIN, WHERE, NULL Handling
-- =====================================================

SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;
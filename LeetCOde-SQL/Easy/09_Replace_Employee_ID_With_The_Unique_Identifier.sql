-- =====================================================
-- Problem: Replace Employee ID With The Unique Identifier
-- LeetCode: 1378
-- Difficulty: Easy
-- Topic: LEFT JOIN
-- =====================================================

SELECT
    eu.unique_id,
    e.name
FROM Employees AS e
LEFT JOIN EmployeeUNI AS eu
ON e.id = eu.id;
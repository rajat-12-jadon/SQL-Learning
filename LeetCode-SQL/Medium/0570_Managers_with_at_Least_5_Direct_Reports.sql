-- =====================================================
-- Problem: Managers with at Least 5 Direct Reports
-- LeetCode: 570
-- Difficulty: Medium
-- Topic: Self JOIN, GROUP BY, HAVING
-- =====================================================

SELECT e1.name
FROM Employee e1
JOIN Employee e2
ON e1.id = e2.managerId
GROUP BY e1.id, e1.name
HAVING COUNT(*) >= 5;
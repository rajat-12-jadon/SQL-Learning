-- =====================================================
-- Problem: Classes With at Least 5 Students
-- LeetCode: 596
-- Difficulty: Easy
-- Topic: GROUP BY, HAVING, COUNT
-- =====================================================

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
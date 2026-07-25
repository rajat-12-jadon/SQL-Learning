-- =====================================================
-- Problem: Percentage of Users Attended a Contest
-- LeetCode: 1633
-- Difficulty: Easy
-- Topic: JOIN, COUNT, ROUND, ORDER BY
-- =====================================================

SELECT
    contest_id,
    ROUND(COUNT(user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;
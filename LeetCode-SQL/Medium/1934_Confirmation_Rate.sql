-- =====================================================
-- Problem: Confirmation Rate
-- LeetCode: 1934
-- Difficulty: Medium
-- Topic: LEFT JOIN, GROUP BY, Aggregate Functions, CASE, ROUND
-- =====================================================

SELECT
    s.user_id,
    ROUND(
        COALESCE(
            SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END)::numeric
            / NULLIF(COUNT(c.action), 0),
            0
        ),
        2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id;
-- =====================================================
-- Problem: Find Followers Count
-- LeetCode: 1729
-- Difficulty: Easy
-- Topic: GROUP BY, COUNT(), ORDER BY
-- =====================================================

SELECT user_id, COUNT(follower_id) as followers_count FROM Followers
GROUP BY user_id ORDER BY user_id;
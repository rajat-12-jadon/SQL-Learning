-- =====================================================
-- Problem: Invalid Tweets
-- LeetCode: 1683
-- Difficulty: Easy
-- Topic: String Functions, LENGTH()
-- =====================================================

SELECT tweet_id FROM Tweets
WHERE LENGTH(content) > 15; 
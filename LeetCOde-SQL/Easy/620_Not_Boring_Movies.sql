-- =====================================================
-- Problem: Not Boring Movies
-- LeetCode: 620
-- Difficulty: Easy
-- Topic: WHERE, MOD(%), ORDER BY
-- =====================================================

SELECT * FROM Cinema
WHERE id % 2 != 0 AND description != 'boring' 
ORDER BY rating DESC;
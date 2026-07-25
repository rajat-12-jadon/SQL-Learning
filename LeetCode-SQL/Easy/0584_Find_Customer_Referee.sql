-- =====================================================
-- Problem: Find Customer Referee
-- LeetCode: 584
-- Difficulty: Easy
-- Topic: WHERE, NULL Handling
-- =====================================================

SELECT name FROM Customer
WHERE referee_id IS NULL OR referee_id != 2; 
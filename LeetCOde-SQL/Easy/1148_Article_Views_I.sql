-- =====================================================
-- Problem: Article Views I
-- LeetCode: 1148
-- Difficulty: Easy
-- Topic: DISTINCT, WHERE, ORDER BY
-- =====================================================

SELECT DISTINCT author_id as id FROM Views
WHERE author_id = viewer_id ORDER BY id;
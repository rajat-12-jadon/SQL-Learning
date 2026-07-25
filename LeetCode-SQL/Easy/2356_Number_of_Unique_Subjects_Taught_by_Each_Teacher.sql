-- =====================================================
-- Problem: Number of Unique Subjects Taught by Each Teacher
-- LeetCode: 2356
-- Difficulty: Easy
-- Topic: GROUP BY, COUNT(), DISTINCT
-- =====================================================

SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt FROM Teacher
GROUP BY teacher_id;
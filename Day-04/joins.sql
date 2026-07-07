-- =====================================================
-- File: 04_Joins.sql
-- Topic: SQL Joins
-- Description: Demonstrates different types of joins
-- using Students and Marks tables.
-- =====================================================


-- =====================================================
-- Display Tables
-- =====================================================

SELECT * FROM students_1;

SELECT * FROM marks;


-- =====================================================
-- Insert a Student Without Marks
--
-- This record is added to demonstrate how
-- LEFT JOIN displays NULL values when there
-- is no matching record in the Marks table.
-- =====================================================

INSERT INTO students_1 (name)
VALUES ('Rahul');


-- =====================================================
-- INNER JOIN
--
-- Returns only the matching records
-- from both tables.
-- =====================================================

SELECT
    s.student_id,
    s.name,
    m.subject,
    m.marks
FROM students_1 AS s
INNER JOIN marks AS m
ON s.student_id = m.student_id;


-- =====================================================
-- LEFT JOIN
--
-- Returns all records from the Students table
-- and matching records from the Marks table.
--
-- Students without marks will display NULL.
-- =====================================================

SELECT
    s.student_id,
    s.name,
    m.subject,
    m.marks
FROM students_1 AS s
LEFT JOIN marks AS m
ON s.student_id = m.student_id;


-- =====================================================
-- Students Without Marks
--
-- Find students who do not have any
-- matching record in the Marks table.
-- =====================================================

SELECT
    s.student_id,
    s.name
FROM students_1 AS s
LEFT JOIN marks AS m
ON s.student_id = m.student_id
WHERE m.student_id IS NULL;


-- =====================================================
-- RIGHT JOIN
--
-- Returns all records from the Marks table
-- and matching records from the Students table.
--
-- Note:
-- Since student_id in Marks is a FOREIGN KEY,
-- every mark belongs to an existing student.
-- Therefore, this query returns the same
-- result as INNER JOIN for this dataset.
-- =====================================================

SELECT
    s.student_id,
    s.name,
    m.subject,
    m.marks
FROM students_1 AS s
RIGHT JOIN marks AS m
ON s.student_id = m.student_id;


-- =====================================================
-- FULL OUTER JOIN
--
-- Returns all matching and non-matching
-- records from both tables.
--
-- Rahul appears with NULL values because
-- he has no corresponding record in Marks.
-- =====================================================

SELECT
    s.student_id,
    s.name,
    m.subject,
    m.marks
FROM students_1 AS s
FULL OUTER JOIN marks AS m
ON s.student_id = m.student_id;


-- =====================================================
-- CROSS JOIN
--
-- Returns every possible combination
-- of rows from both tables.
-- =====================================================

SELECT
    s.name,
    m.subject
FROM students_1 AS s
CROSS JOIN marks AS m;


-- =====================================================
-- SELF JOIN
--
-- Join the Students table with itself.
-- Display every student with every
-- other student.
-- =====================================================

SELECT
    s1.name AS student_1,
    s2.name AS student_2
FROM students_1 AS s1
INNER JOIN students_1 AS s2
ON s1.student_id <> s2.student_id;


-- =====================================================
-- Practice Question 1
--
-- Display each student's name,
-- subject and marks.
-- =====================================================

SELECT
    s.name,
    m.subject,
    m.marks
FROM students_1 AS s
INNER JOIN marks AS m
ON s.student_id = m.student_id;


-- =====================================================
-- Practice Question 2
--
-- Display students who scored
-- more than 80 marks.
-- =====================================================

SELECT
    s.name,
    m.subject,
    m.marks
FROM students_1 AS s
INNER JOIN marks AS m
ON s.student_id = m.student_id
WHERE m.marks > 80;


-- =====================================================
-- Practice Question 3
--
-- Display the average marks
-- of each student.
-- =====================================================

SELECT
    s.name,
    ROUND(AVG(m.marks), 2) AS average_marks
FROM students_1 AS s
INNER JOIN marks AS m
ON s.student_id = m.student_id
GROUP BY s.name;


-- =====================================================
-- Practice Question 4
--
-- Count the total number of
-- subjects for each student.
--
-- Rahul has no marks,
-- so COUNT() returns 0.
-- =====================================================

SELECT
    s.name,
    COUNT(m.subject) AS total_subjects
FROM students_1 AS s
LEFT JOIN marks AS m
ON s.student_id = m.student_id
GROUP BY s.name;


-- =====================================================
-- Practice Question 5
--
-- Display students in descending
-- order of their average marks.
-- =====================================================

SELECT
    s.name,
    ROUND(AVG(m.marks), 2) AS average_marks
FROM students_1 AS s
INNER JOIN marks AS m
ON s.student_id = m.student_id
GROUP BY s.name
ORDER BY average_marks DESC;


-- =====================================================
-- End of File
-- =====================================================
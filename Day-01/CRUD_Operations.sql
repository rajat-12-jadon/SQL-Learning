-- =====================================================
-- File: 01_CRUD_Operations.sql
-- Topic: CRUD Operations in PostgreSQL
-- Description: Demonstrates Create, Read, Update and Delete operations.
-- =====================================================

-- Delete the table if it already exists
DROP TABLE IF EXISTS students;

-- Create Table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT CHECK (age >= 18),
    grade CHAR(1),
    is_active BOOLEAN DEFAULT TRUE,
    admission_date DATE DEFAULT CURRENT_DATE
);

-- ==========================================
-- INSERT (Create Records)
-- ==========================================

INSERT INTO students (name, email, age, grade)
VALUES
('Rajat', 'rajat@gmail.com', 23, 'A'),
('Priya', 'priya@gmail.com', 21, 'A'),
('Saumy', 'saumy@gmail.com', 22, 'B');

-- ==========================================
-- SELECT (Read Records)
-- ==========================================

-- Show all records
SELECT * FROM students;

-- Show specific columns
SELECT name, email
FROM students;

-- Show students older than 21
SELECT *
FROM students
WHERE age > 21;

-- ==========================================
-- UPDATE
-- ==========================================

UPDATE students
SET grade = 'A'
WHERE student_id = 3;

-- Check updated data
SELECT * FROM students;

-- ==========================================
-- DELETE
-- ==========================================

DELETE FROM students
WHERE student_id = 2;

-- Check remaining data
SELECT * FROM students;

-- ==========================================
-- Examples of Constraints
-- ==========================================

-- PRIMARY KEY
-- student_id

-- NOT NULL
-- name, email

-- UNIQUE
-- email

-- CHECK
-- age >= 18

-- DEFAULT
-- is_active = TRUE
-- admission_date = CURRENT_DATE

-- ==========================================
-- Data Types Used
-- ==========================================

-- SERIAL
-- VARCHAR
-- INT
-- CHAR
-- BOOLEAN
-- DATE
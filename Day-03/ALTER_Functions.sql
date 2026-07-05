-- =====================================================
-- File: 02_ALTER_Table.sql
-- Topic: ALTER TABLE
-- Description: Demonstrates different ALTER TABLE
-- operations in PostgreSQL.
-- =====================================================


-- =====================================================
-- Create Students Table
-- =====================================================

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age BIGINT
);


-- =====================================================
-- Insert Sample Data
-- =====================================================

INSERT INTO students (name, age)
VALUES
('Rajat', 23),
('Sakshi', 22);


-- Display all records.

SELECT *
FROM students;


-- =====================================================
-- ADD COLUMN
-- Add a new column to the existing table.
-- =====================================================

ALTER TABLE students
ADD COLUMN email VARCHAR(100) DEFAULT 'Not Provided!';


-- Display updated table.

SELECT *
FROM students;


-- =====================================================
-- ALTER COLUMN
-- Set a default value for an existing column.
-- =====================================================

ALTER TABLE students
ALTER COLUMN email
SET DEFAULT 'user@gmail.com';


-- =====================================================
-- RENAME COLUMN
-- Rename an existing column.
-- =====================================================

ALTER TABLE students
RENAME COLUMN name TO full_name;


-- =====================================================
-- ALTER COLUMN TYPE
-- Change the data type of a column.
-- =====================================================

ALTER TABLE students
ALTER COLUMN age
TYPE SMALLINT;


-- =====================================================
-- ADD CONSTRAINT
-- Add a CHECK constraint.
-- =====================================================

ALTER TABLE students
ADD CONSTRAINT age_check
CHECK (age >= 0);


-- =====================================================
-- DROP CONSTRAINT
-- Remove an existing constraint.
-- =====================================================

ALTER TABLE students
DROP CONSTRAINT age_check;


-- =====================================================
-- DROP COLUMN
-- Remove a column from the table.
-- =====================================================

ALTER TABLE students
DROP COLUMN email;


-- =====================================================
-- RENAME TABLE
-- Rename the table.
-- =====================================================

ALTER TABLE students
RENAME TO friends;


-- Display the updated table structure.

\d friends


-- =====================================================
-- End of File
-- =====================================================
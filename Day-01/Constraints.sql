-- =====================================================
-- File: 03_Constraints.sql
-- Topic: Constraints in PostgreSQL
-- Description: Demonstrates commonly used SQL constraints.
-- =====================================================


-- Remove table if it already exists
DROP TABLE IF EXISTS students;


-- =====================================================
-- Create Table with Constraints
-- =====================================================

CREATE TABLE students (

    -- PRIMARY KEY
    student_id SERIAL PRIMARY KEY,

    -- NOT NULL
    name VARCHAR(100) NOT NULL,

    -- UNIQUE + NOT NULL
    email VARCHAR(100) UNIQUE NOT NULL,

    -- CHECK Constraint
    age INT CHECK (age >= 18),

    -- DEFAULT Constraint
    course VARCHAR(50) DEFAULT 'Computer Science',

    -- CHECK Constraint
    cgpa NUMERIC(3,2) CHECK (cgpa >= 0 AND cgpa <= 10)
);


-- =====================================================
-- Insert Valid Records
-- =====================================================

INSERT INTO students (name, email, age, cgpa)
VALUES
('Rajat', 'rajat@gmail.com', 23, 8.45),
('Priya', 'priya@gmail.com', 21, 9.10),
('Saumy', 'saumy@gmail.com', 22, 7.95);


-- =====================================================
-- Display Records
-- =====================================================

SELECT *
FROM students;


-- =====================================================
-- Constraint Examples
-- Uncomment one query at a time to observe the error.
-- =====================================================


-- -----------------------------------------------------
-- NOT NULL Constraint
-- -----------------------------------------------------

-- INSERT INTO students(name, email, age, cgpa)
-- VALUES (NULL, 'abc@gmail.com', 20, 8.0);


-- -----------------------------------------------------
-- UNIQUE Constraint
-- -----------------------------------------------------

-- INSERT INTO students(name, email, age, cgpa)
-- VALUES ('Aman', 'rajat@gmail.com', 20, 8.2);


-- -----------------------------------------------------
-- CHECK Constraint (Age)
-- -----------------------------------------------------

-- INSERT INTO students(name, email, age, cgpa)
-- VALUES ('Rohan', 'rohan@gmail.com', 16, 8.0);


-- -----------------------------------------------------
-- CHECK Constraint (CGPA)
-- -----------------------------------------------------

-- INSERT INTO students(name, email, age, cgpa)
-- VALUES ('Neha', 'neha@gmail.com', 20, 11.2);


-- -----------------------------------------------------
-- DEFAULT Constraint
-- Course will automatically become
-- 'Computer Science'
-- -----------------------------------------------------

INSERT INTO students(name, email, age, cgpa)
VALUES ('Anjali', 'anjali@gmail.com', 22, 9.25);


SELECT *
FROM students;


-- =====================================================
-- Constraints Used
-- =====================================================

-- PRIMARY KEY
-- • Uniquely identifies each row.
-- • Cannot contain NULL values.
-- • Duplicate values are not allowed.

-- NOT NULL
-- • Prevents NULL values from being inserted.

-- UNIQUE
-- • Prevents duplicate values.
-- • NULL values are allowed unless NOT NULL is also specified.

-- CHECK
-- • Validates data before insertion or update.

-- DEFAULT
-- • Automatically assigns a value if none is provided.


-- =====================================================
-- End of File
-- =====================================================
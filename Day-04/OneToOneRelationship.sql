-- =====================================================
-- File: 01_One_To_One_Relationship.sql
-- Topic: One-to-One Relationship
-- Description: Demonstrates a one-to-one relationship
-- between Students and Student_Profiles tables using
-- a Primary Key and Foreign Key.
-- =====================================================


-- =====================================================
-- Create Students Table
-- Each student has a unique Student ID.
-- =====================================================

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


-- =====================================================
-- Insert Sample Data
-- =====================================================

INSERT INTO students (name)
VALUES
    ('Rajat Jadon'),
    ('Sakshi Thakur'),
    ('Sakshi Chaudhary');


-- Display all students.

SELECT *
FROM students;


-- =====================================================
-- Create Student Profiles Table
--
-- student_id acts as both:
-- • PRIMARY KEY
-- • FOREIGN KEY
--
-- This ensures one profile belongs to
-- exactly one student.
-- =====================================================

CREATE TABLE student_profiles (
    student_id INT PRIMARY KEY,
    address TEXT,
    age INT,
    phone VARCHAR(15)
);


-- =====================================================
-- Insert Student Profile Data
-- =====================================================

INSERT INTO student_profiles
(student_id, address, age, phone)
VALUES
    (1, 'Delhi', 23, '9876543210'),
    (2, 'Aligarh', 22, '8976541230'),
    (3, 'Hyderabad', 22, '8967451203');


-- =====================================================
-- Add Foreign Key Constraint
--
-- Links Student Profiles with Students.
-- =====================================================

ALTER TABLE student_profiles
ADD CONSTRAINT fk_student_id
FOREIGN KEY (student_id)
REFERENCES students(student_id);


-- Display Student Profiles.

SELECT *
FROM student_profiles;


-- =====================================================
-- INNER JOIN
--
-- Display complete student information
-- along with profile details.
-- =====================================================

SELECT
    s.student_id,
    s.name,
    sp.address,
    sp.age,
    sp.phone
FROM students AS s
INNER JOIN student_profiles AS sp
ON s.student_id = sp.student_id;


-- =====================================================
-- End of File
-- =====================================================
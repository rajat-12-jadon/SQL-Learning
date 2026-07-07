-- =====================================================
-- File: 03_Many_To_Many_Relationship.sql
-- Topic: Many-to-Many Relationship
-- Description: Demonstrates a many-to-many relationship
-- between Students and Courses using a Junction Table.
-- =====================================================


-- =====================================================
-- Create Students Table
--
-- One student can enroll in multiple courses.
-- =====================================================

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


-- =====================================================
-- Create Courses Table
--
-- One course can have multiple students.
-- Course IDs are assigned manually.
-- =====================================================

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);


-- =====================================================
-- Create Junction Table
--
-- This table connects Students and Courses.
--
-- Composite Primary Key:
-- (student_id, course_id)
--
-- A student cannot enroll in the same
-- course more than once.
-- =====================================================

CREATE TABLE student_courses (
    student_id INT,
    course_id INT,

    PRIMARY KEY (student_id, course_id),

    FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);


-- =====================================================
-- Insert Students
-- =====================================================

INSERT INTO students (name)
VALUES
    ('Rajat Jadon'),
    ('Sakshi Thakur'),
    ('Rahul Sharma'),
    ('Priya Singh');


-- Display Students.

SELECT *
FROM students;


-- =====================================================
-- Insert Courses
-- =====================================================

INSERT INTO courses (course_id, course_name)
VALUES
    (101, 'Database Management System'),
    (102, 'Operating System'),
    (103, 'Computer Networks'),
    (104, 'Data Structures');


-- Display Courses.

SELECT *
FROM courses;


-- =====================================================
-- Insert Student-Course Enrollments
--
-- Demonstrates:
-- • One student can enroll in multiple courses.
-- • One course can have multiple students.
-- =====================================================

INSERT INTO student_courses (student_id, course_id)
VALUES
    (1, 101),
    (1, 102),
    (1, 104),

    (2, 101),
    (2, 103),

    (3, 102),
    (3, 104),

    (4, 101),
    (4, 102),
    (4, 103);


-- Display Junction Table.

SELECT *
FROM student_courses;


-- =====================================================
-- INNER JOIN
--
-- Display each student along with
-- the courses they are enrolled in.
-- =====================================================

SELECT
    s.student_id,
    s.name,
    c.course_id,
    c.course_name
FROM student_courses AS sc
INNER JOIN students AS s
ON sc.student_id = s.student_id
INNER JOIN courses AS c
ON sc.course_id = c.course_id;


-- =====================================================
-- Practice Question 1
--
-- Display the list of students along with
-- the courses they are enrolled in.
-- =====================================================

SELECT
    s.name,
    c.course_name
FROM student_courses AS sc
INNER JOIN students AS s
ON sc.student_id = s.student_id
INNER JOIN courses AS c
ON sc.course_id = c.course_id
ORDER BY s.name;


-- =====================================================
-- Practice Question 2
--
-- Find all the courses taken by
-- the student named 'Rajat Jadon'.
-- =====================================================

SELECT
    s.name,
    c.course_name
FROM student_courses AS sc
INNER JOIN students AS s
ON sc.student_id = s.student_id
INNER JOIN courses AS c
ON sc.course_id = c.course_id
WHERE s.name = 'Rajat Jadon';


-- =====================================================
-- Practice Question 3
--
-- Count the total number of
-- courses each student has enrolled in.
-- =====================================================

SELECT
    s.name,
    COUNT(sc.course_id) AS total_courses
FROM students AS s
INNER JOIN student_courses AS sc
ON s.student_id = sc.student_id
GROUP BY s.student_id, s.name;


-- =====================================================
-- Practice Question 4
--
-- Count the total number of
-- students enrolled in each course.
-- =====================================================

SELECT
    c.course_name,
    COUNT(sc.student_id) AS total_students
FROM courses AS c
INNER JOIN student_courses AS sc
ON c.course_id = sc.course_id
GROUP BY c.course_id, c.course_name;


-- =====================================================
-- Practice Question 5
--
-- Display students who are enrolled
-- in more than two courses.
-- =====================================================

SELECT
    s.name,
    COUNT(sc.course_id) AS total_courses
FROM students AS s
INNER JOIN student_courses AS sc
ON s.student_id = sc.student_id
GROUP BY s.student_id, s.name
HAVING COUNT(sc.course_id) > 2;


-- =====================================================
-- Practice Question 6
--
-- Find the course having the
-- highest number of enrolled students.
-- =====================================================

SELECT
    c.course_name,
    COUNT(sc.student_id) AS total_students
FROM courses AS c
INNER JOIN student_courses AS sc
ON c.course_id = sc.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_students DESC
LIMIT 1;


-- =====================================================
-- Summary
--
-- ✔ One Student  → Many Courses
-- ✔ One Course   → Many Students
-- ✔ Junction Table stores the relationship.
-- ✔ Composite Primary Key prevents duplicate enrollments.
-- ✔ Foreign Keys maintain referential integrity.
-- =====================================================


-- =====================================================
-- End of File
-- =====================================================
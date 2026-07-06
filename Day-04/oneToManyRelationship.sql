-- =====================================================
-- File: 02_One_To_Many_Relationship.sql
-- Topic: One-to-Many Relationship
-- Description: Demonstrates a one-to-many relationship
-- between Students and Marks tables.
-- =====================================================


-- =====================================================
-- Create Students Table
--
-- One student can have multiple marks.
-- =====================================================

CREATE TABLE students_1 (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


-- =====================================================
-- Create Marks Table
--
-- Each mark belongs to one student.
-- =====================================================

CREATE TABLE marks (
    mark_id SERIAL PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT,

    FOREIGN KEY (student_id)
    REFERENCES students_1(student_id)
);


-- =====================================================
-- Insert Students
-- =====================================================

INSERT INTO students_1 (name)
VALUES
    ('Rajat Jadon'),
    ('Sakshi Thakur'),
    ('Sakshi Chaudhary');


-- Display Students.

SELECT *
FROM students_1;


-- =====================================================
-- Insert Marks
--
-- One student can have multiple subjects,
-- demonstrating a One-to-Many relationship.
-- =====================================================

INSERT INTO marks
(student_id, subject, marks)
VALUES
    (1, 'English', 85),
    (1, 'Mathematics', 89),
    (1, 'Science', 92),

    (2, 'English', 80),
    (2, 'Mathematics', 75),
    (2, 'Science', 78),

    (3, 'English', 72),
    (3, 'Mathematics', 70),
    (3, 'Science', 74);


-- Display Marks.

SELECT *
FROM marks;


-- =====================================================
-- INNER JOIN
--
-- Display each student's marks
-- for every subject.
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
-- End of File
-- =====================================================
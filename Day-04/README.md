# Day 4 - Relationships & SQL Joins 🔗

On Day 4, I learned how relational databases establish relationships between tables using **Primary Keys** and **Foreign Keys**. I explored the three fundamental database relationships, practiced different types of SQL joins, imported CSV data into PostgreSQL, and solved practical queries using multiple tables.

---

## 📚 Topics Covered

### Database Relationships

- One-to-One Relationship
- One-to-Many Relationship
- Many-to-Many Relationship
- Primary Key
- Foreign Key
- Composite Primary Key
- Junction (Bridge) Table

### SQL Joins

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- CROSS JOIN
- SELF JOIN

### CSV Import

- Importing CSV files into PostgreSQL using pgAdmin
- Header option while importing CSV
- Importing Products and Orders tables

### Practice

- Display students with their profile details.
- Display students with subject-wise marks.
- Display students with enrolled courses.
- Find students without marks.
- Find all courses taken by a particular student.
- Count courses enrolled by each student.
- Count students enrolled in each course.
- Find students enrolled in more than two courses.
- Find the course with the highest number of enrollments.
- Join Products and Orders tables for practice.

---

## 📂 Files

- **OneToOneRelationship.sql**
  - Demonstrates a One-to-One relationship between `students` and `student_profiles`.

- **oneToManyRelationship.sql**
  - Demonstrates a One-to-Many relationship between `students_1` and `marks`.

- **ManytoManyRelationship.sql**
  - Demonstrates a Many-to-Many relationship using a junction table (`student_courses`).

- **joins.sql**
  - Covers all major SQL joins with practical examples and interview-oriented queries.

- **Exercise_For_Practice.sql**
  - Practice questions based on relationships and joins.

- **Products_Table.csv**
  - Sample products dataset used for join practice.

- **Orders_Table.csv**
  - Sample orders dataset used for join practice.

---

## 🎯 Learning Outcomes

After completing Day 4, I can:

- Design One-to-One, One-to-Many, and Many-to-Many relationships.
- Create Composite Primary Keys.
- Create and use Foreign Key constraints.
- Build Junction Tables for Many-to-Many relationships.
- Retrieve related data using SQL Joins.
- Understand the difference between INNER, LEFT, RIGHT, FULL OUTER, CROSS, and SELF JOIN.
- Identify unmatched records using LEFT JOIN.
- Write analytical queries using JOIN with aggregate functions.
- Import CSV datasets into PostgreSQL using pgAdmin.

---

## 🛠️ Database Used

This folder uses the following tables:

- students
- student_profiles
- students_1
- marks
- courses
- student_courses
- products
- orders

---

## 🚀 Next Topics

- Views
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Date Functions
- NULL Handling
- UNION & UNION ALL
-- =====================================================
-- File: 01_Common_Table_Expressions.sql
-- Topic: Common Table Expressions (CTEs)
-- Description: Demonstrates the use of Common Table
-- Expressions (CTEs) in PostgreSQL.
-- =====================================================


-- =====================================================
-- Display Employees Table
-- =====================================================

SELECT *
FROM employees;


-- =====================================================
-- What is a Common Table Expression (CTE)?
--
-- • A CTE is a temporary named result set.
--
-- • It exists only during the execution
--   of a single SQL statement.
--
-- • CTEs improve query readability and
--   simplify complex SQL queries.
--
-- Syntax:
--
-- WITH cte_name AS
-- (
--      SELECT ...
-- )
--
-- SELECT *
-- FROM cte_name;
-- =====================================================



-- =====================================================
-- Example 1
-- Basic CTE
--
-- Display employees whose salary
-- is greater than ₹70,000.
-- =====================================================

WITH high_salary_employees AS
(
    SELECT *
    FROM employees
    WHERE salary > 70000
)

SELECT *
FROM high_salary_employees;



-- =====================================================
-- Example 2
-- CTE with Aggregate Function
--
-- Calculate average salary of each department.
-- =====================================================

WITH department_average AS
(
    SELECT
        dept,
        ROUND(AVG(salary),2) AS average_salary

    FROM employees

    GROUP BY dept
)

SELECT *
FROM department_average;



-- =====================================================
-- Example 3
-- CTE with JOIN
--
-- Display employee names along with
-- department average salary.
-- =====================================================

WITH department_average AS
(
    SELECT
        dept,
        ROUND(AVG(salary),2) AS average_salary

    FROM employees

    GROUP BY dept
)

SELECT
    e.fname,
    e.lname,
    e.dept,
    e.salary,
    d.average_salary

FROM employees e

JOIN department_average d

ON e.dept = d.dept;



-- =====================================================
-- Example 4
-- Multiple CTEs
--
-- One CTE calculates average salary.
-- Another filters high-paid employees.
-- =====================================================

WITH department_average AS
(
    SELECT
        dept,
        AVG(salary) AS average_salary

    FROM employees

    GROUP BY dept
),

high_paid AS
(
    SELECT *

    FROM employees

    WHERE salary > 70000
)

SELECT
    h.fname,
    h.dept,
    h.salary,
    d.average_salary

FROM high_paid h

JOIN department_average d

ON h.dept = d.dept;



-- =====================================================
-- Example 5
-- CTE with Window Function
--
-- Rank employees according
-- to salary.
-- =====================================================

WITH ranked_employees AS
(
    SELECT
        employee_id,
        fname,
        dept,
        salary,

        RANK() OVER
        (
            ORDER BY salary DESC
        ) AS salary_rank

    FROM employees
)

SELECT *
FROM ranked_employees;



-- =====================================================
-- Example 6
-- Recursive CTE
--
-- Generate numbers from 1 to 10.
-- =====================================================

WITH RECURSIVE numbers AS
(
    SELECT 1 AS num

    UNION ALL

    SELECT num + 1

    FROM numbers

    WHERE num < 10
)

SELECT *
FROM numbers;



-- =====================================================
-- Practice Question 1
--
-- Display employees earning more
-- than the overall average salary.
-- =====================================================

WITH average_salary AS
(
    SELECT AVG(salary) AS avg_salary

    FROM employees
)

SELECT
    fname,
    salary

FROM employees

WHERE salary >

(
    SELECT avg_salary
    FROM average_salary
);



-- =====================================================
-- Practice Question 2
--
-- Display employees with salary
-- greater than department average.
-- =====================================================

WITH department_average AS
(
    SELECT
        dept,
        AVG(salary) AS avg_salary

    FROM employees

    GROUP BY dept
)

SELECT
    e.fname,
    e.salary,
    e.dept

FROM employees e

JOIN department_average d

ON e.dept = d.dept

WHERE e.salary > d.avg_salary;



-- =====================================================
-- Practice Question 3
--
-- Find the highest paid employee
-- in every department.
-- =====================================================

WITH ranked AS
(
    SELECT
        fname,
        dept,
        salary,

        ROW_NUMBER() OVER
        (
            PARTITION BY dept
            ORDER BY salary DESC
        ) AS rank_number

    FROM employees
)

SELECT *

FROM ranked

WHERE rank_number = 1;



-- =====================================================
-- Practice Question 4
--
-- Display total salary
-- department-wise.
-- =====================================================

WITH department_salary AS
(
    SELECT
        dept,
        SUM(salary) AS total_salary

    FROM employees

    GROUP BY dept
)

SELECT *

FROM department_salary;



-- =====================================================
-- Practice Question 5
--
-- Generate numbers from 1 to 20
-- using Recursive CTE.
-- =====================================================

WITH RECURSIVE numbers AS
(
    SELECT 1 AS number

    UNION ALL

    SELECT number + 1

    FROM numbers

    WHERE number < 20
)

SELECT *

FROM numbers;



-- =====================================================
-- Summary
--
-- ✔ WITH Clause
-- ✔ Basic CTE
-- ✔ CTE with Aggregate Functions
-- ✔ CTE with JOIN
-- ✔ Multiple CTEs
-- ✔ CTE with Window Functions
-- ✔ Recursive CTE
--
-- Advantages
--
-- • Improves Readability
-- • Reduces Code Repetition
-- • Simplifies Complex Queries
-- • Easier to Debug
-- • Better Query Organization
--
-- Difference:
--
-- Subquery
-- • Nested inside another query.
-- • Harder to read for complex logic.
--
-- CTE
-- • Named temporary result set.
-- • Easier to understand and reuse.
-- =====================================================


-- =====================================================
-- End of File
-- =====================================================
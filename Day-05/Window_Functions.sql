-- =====================================================
-- File: 06_Window_Functions.sql
-- Topic: Window Functions
-- Description: Demonstrates the use of Window Functions
-- in PostgreSQL for ranking, running totals,
-- averages, and analytical queries.
-- =====================================================


-- =====================================================
-- Display Employees Table
-- =====================================================

SELECT *
FROM employees;


-- =====================================================
-- What are Window Functions?
--
-- • Window Functions perform calculations across
--   a set of rows related to the current row.
--
-- • Unlike GROUP BY, they do NOT collapse rows.
--
-- • Every row remains visible while calculations
--   are performed over a window of rows.
--
-- Syntax:
--
-- Function_Name() OVER (
--      PARTITION BY column_name
--      ORDER BY column_name
-- )
-- =====================================================



-- =====================================================
-- ROW_NUMBER()
--
-- Assigns a unique sequential number
-- to each row.
-- =====================================================

SELECT
    employee_id,
    fname,
    salary,

    ROW_NUMBER() OVER(
        ORDER BY salary DESC
    ) AS row_number

FROM employees;



-- =====================================================
-- RANK()
--
-- Gives same rank to duplicate values.
-- Skips the next rank.
-- =====================================================

SELECT
    employee_id,
    fname,
    salary,

    RANK() OVER(
        ORDER BY salary DESC
    ) AS employee_rank

FROM employees;



-- =====================================================
-- DENSE_RANK()
--
-- Similar to RANK()
-- Does NOT skip ranks.
-- =====================================================

SELECT
    employee_id,
    fname,
    salary,

    DENSE_RANK() OVER(
        ORDER BY salary DESC
    ) AS dense_rank

FROM employees;



-- =====================================================
-- NTILE()
--
-- Divides rows into equal groups.
-- =====================================================

SELECT
    fname,
    salary,

    NTILE(2) OVER(
        ORDER BY salary DESC
    ) AS salary_group

FROM employees;



-- =====================================================
-- LAG()
--
-- Returns value from previous row.
-- =====================================================

SELECT
    fname,
    salary,

    LAG(salary,1)
    OVER(
        ORDER BY salary
    ) AS previous_salary

FROM employees;



-- =====================================================
-- LEAD()
--
-- Returns value from next row.
-- =====================================================

SELECT
    fname,
    salary,

    LEAD(salary,1)
    OVER(
        ORDER BY salary
    ) AS next_salary

FROM employees;



-- =====================================================
-- FIRST_VALUE()
--
-- Returns first value in the window.
-- =====================================================

SELECT
    fname,
    salary,

    FIRST_VALUE(fname)
    OVER(
        ORDER BY salary DESC
    ) AS highest_paid_employee

FROM employees;



-- =====================================================
-- LAST_VALUE()
--
-- Returns last value in the window.
--
-- Note:
-- Specify ROWS BETWEEN UNBOUNDED PRECEDING
-- AND UNBOUNDED FOLLOWING.
-- =====================================================

SELECT
    fname,
    salary,

    LAST_VALUE(fname)
    OVER(
        ORDER BY salary DESC

        ROWS BETWEEN
        UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING

    ) AS lowest_paid_employee

FROM employees;



-- =====================================================
-- SUM() OVER()
--
-- Running Total
-- =====================================================

SELECT
    fname,
    salary,

    SUM(salary)
    OVER(
        ORDER BY employee_id
    ) AS running_total

FROM employees;



-- =====================================================
-- AVG() OVER()
--
-- Running Average
-- =====================================================

SELECT
    fname,
    salary,

    ROUND(

        AVG(salary)
        OVER(
            ORDER BY employee_id
        ),

        2

    ) AS running_average

FROM employees;



-- =====================================================
-- PARTITION BY
--
-- Ranking employees within
-- each department.
-- =====================================================

SELECT
    fname,
    dept,
    salary,

    RANK()
    OVER(

        PARTITION BY dept

        ORDER BY salary DESC

    ) AS department_rank

FROM employees;



-- =====================================================
-- Practice Question 1
--
-- Display employees ranked by salary.
-- =====================================================

SELECT
    fname,
    salary,

    RANK()
    OVER(
        ORDER BY salary DESC
    ) AS salary_rank

FROM employees;



-- =====================================================
-- Practice Question 2
--
-- Display running total
-- of employee salaries.
-- =====================================================

SELECT
    fname,
    salary,

    SUM(salary)
    OVER(
        ORDER BY employee_id
    ) AS running_salary

FROM employees;



-- =====================================================
-- Practice Question 3
--
-- Find highest paid employee
-- in every department.
-- =====================================================

SELECT
    fname,
    dept,
    salary,

    FIRST_VALUE(fname)
    OVER(

        PARTITION BY dept

        ORDER BY salary DESC

    ) AS highest_paid

FROM employees;



-- =====================================================
-- Practice Question 4
--
-- Divide employees into
-- three salary groups.
-- =====================================================

SELECT
    fname,
    salary,

    NTILE(3)
    OVER(
        ORDER BY salary DESC
    ) AS salary_group

FROM employees;



-- =====================================================
-- Practice Question 5
--
-- Compare each employee's salary
-- with the previous employee.
-- =====================================================

SELECT
    fname,
    salary,

    LAG(salary)
    OVER(
        ORDER BY salary
    ) AS previous_salary

FROM employees;



-- =====================================================
-- Summary
--
-- ✔ ROW_NUMBER()
-- ✔ RANK()
-- ✔ DENSE_RANK()
-- ✔ NTILE()
-- ✔ LAG()
-- ✔ LEAD()
-- ✔ FIRST_VALUE()
-- ✔ LAST_VALUE()
-- ✔ SUM() OVER()
-- ✔ AVG() OVER()
-- ✔ PARTITION BY
--
-- Difference:
--
-- ROW_NUMBER()
-- → Unique numbers.
--
-- RANK()
-- → Duplicate ranks.
-- → Skips next rank.
--
-- DENSE_RANK()
-- → Duplicate ranks.
-- → No skipped rank.
--
-- Window Functions do NOT
-- reduce the number of rows.
-- GROUP BY reduces rows.
-- =====================================================


-- =====================================================
-- End of File
-- =====================================================
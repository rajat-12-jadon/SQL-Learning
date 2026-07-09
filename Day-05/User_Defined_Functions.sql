-- =====================================================
-- File: 05_User_Defined_Functions.sql
-- Topic: User Defined Functions (UDF)
-- Description: Demonstrates creating and using
-- User Defined Functions in PostgreSQL using PL/pgSQL.
-- =====================================================


-- =====================================================
-- Display Employees Table
-- =====================================================

SELECT *
FROM employees;


-- =====================================================
-- Function 1
--
-- Return Annual Salary.
-- =====================================================

CREATE OR REPLACE FUNCTION annual_salary(
    monthly_salary NUMERIC
)

RETURNS NUMERIC

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN monthly_salary * 12;

END;

$$;


-- Execute Function

SELECT
    fname,
    salary,
    annual_salary(salary) AS annual_salary
FROM employees;


-- =====================================================
-- Function 2
--
-- Return Employee Salary Category.
-- =====================================================

CREATE OR REPLACE FUNCTION salary_category(
    emp_salary NUMERIC
)

RETURNS TEXT

LANGUAGE plpgsql

AS $$

BEGIN

    IF emp_salary >= 100000 THEN
        RETURN 'High Salary';

    ELSIF emp_salary >= 70000 THEN
        RETURN 'Medium Salary';

    ELSE
        RETURN 'Low Salary';

    END IF;

END;

$$;


-- Execute Function

SELECT
    fname,
    salary,
    salary_category(salary) AS salary_status
FROM employees;


-- =====================================================
-- Function 3
--
-- Calculate Bonus.
-- =====================================================

CREATE OR REPLACE FUNCTION calculate_bonus(
    emp_salary NUMERIC,
    percentage NUMERIC
)

RETURNS NUMERIC

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN emp_salary * percentage / 100;

END;

$$;


-- Execute Function

SELECT
    fname,
    salary,
    calculate_bonus(salary,10) AS bonus
FROM employees;


-- =====================================================
-- Function 4
--
-- Return Employee Full Name.
-- =====================================================

CREATE OR REPLACE FUNCTION full_name(
    first_name VARCHAR,
    last_name VARCHAR
)

RETURNS TEXT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN first_name || ' ' || last_name;

END;

$$;


-- Execute Function

SELECT
    full_name(fname,lname) AS employee_name
FROM employees;


-- =====================================================
-- Function 5
--
-- Return Complete Employee Details.
--
-- Demonstrates RETURNS TABLE.
-- =====================================================

CREATE OR REPLACE FUNCTION employee_details()

RETURNS TABLE
(
    employee_id INT,
    employee_name TEXT,
    department VARCHAR,
    salary NUMERIC
)

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN QUERY

    SELECT
        e.employee_id,
        e.fname || ' ' || e.lname,
        e.dept,
        e.salary

    FROM employees e;

END;

$$;


-- Execute Function

SELECT *
FROM employee_details();


-- =====================================================
-- Practice Question 1
--
-- Create a function that returns
-- double the employee salary.
-- =====================================================

CREATE OR REPLACE FUNCTION double_salary(
    emp_salary NUMERIC
)

RETURNS NUMERIC

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN emp_salary * 2;

END;

$$;


SELECT
    fname,
    salary,
    double_salary(salary) AS double_salary
FROM employees;


-- =====================================================
-- Practice Question 2
--
-- Create a function that converts
-- department names to uppercase.
-- =====================================================

CREATE OR REPLACE FUNCTION uppercase_department(
    department_name VARCHAR
)

RETURNS TEXT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN UPPER(department_name);

END;

$$;


SELECT
    fname,
    uppercase_department(dept) AS department
FROM employees;


-- =====================================================
-- Practice Question 3
--
-- Create a function to calculate
-- 18% GST.
-- =====================================================

CREATE OR REPLACE FUNCTION calculate_gst(
    amount NUMERIC
)

RETURNS NUMERIC

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN amount * 1.18;

END;

$$;


SELECT
    fname,
    salary,
    calculate_gst(salary) AS salary_with_gst
FROM employees;


-- =====================================================
-- Practice Question 4
--
-- Return employee email domain.
-- =====================================================

CREATE OR REPLACE FUNCTION email_domain(
    emp_email VARCHAR
)

RETURNS TEXT

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN SPLIT_PART(emp_email,'@',2);

END;

$$;


SELECT
    fname,
    email,
    email_domain(email) AS domain
FROM employees;


-- =====================================================
-- Practice Question 5
--
-- Return TRUE if salary is greater
-- than ₹80,000 else FALSE.
-- =====================================================

CREATE OR REPLACE FUNCTION is_high_salary(
    emp_salary NUMERIC
)

RETURNS BOOLEAN

LANGUAGE plpgsql

AS $$

BEGIN

    RETURN emp_salary > 80000;

END;

$$;


SELECT
    fname,
    salary,
    is_high_salary(salary) AS high_salary
FROM employees;


-- =====================================================
-- Summary
--
-- ✔ CREATE FUNCTION
-- ✔ RETURNS
-- ✔ RETURN
-- ✔ RETURN QUERY
-- ✔ RETURNS TABLE
-- ✔ IF...ELSIF...ELSE
-- ✔ Parameters
-- ✔ Multiple Parameters
-- ✔ String Functions
-- ✔ Boolean Functions
--
-- Difference:
--
-- Procedure
-- • Performs an action.
-- • Called using CALL.
-- • Does not return a value.
--
-- Function
-- • Returns a value.
-- • Used inside SQL statements.
-- • Called using SELECT.
-- =====================================================


-- =====================================================
-- End of File
-- =====================================================
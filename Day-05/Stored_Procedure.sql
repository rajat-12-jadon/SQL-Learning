-- =====================================================
-- File: 04_Stored_Procedures.sql
-- Topic: Stored Procedures
-- Description: Demonstrates creating and executing
-- Stored Procedures in PostgreSQL using PL/pgSQL.
-- =====================================================


-- =====================================================
-- Create Employees Table
-- =====================================================

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    dept VARCHAR(50),
    salary NUMERIC(10,2)
);


-- =====================================================
-- Display Employees Table
-- =====================================================

SELECT *
FROM employees;


-- =====================================================
-- Stored Procedure 1
--
-- Add a new employee.
--
-- This procedure accepts employee
-- details as parameters and inserts
-- a new record into the Employees table.
-- =====================================================

CREATE OR REPLACE PROCEDURE add_employee(
    p_fname VARCHAR,
    p_lname VARCHAR,
    p_email VARCHAR,
    p_dept VARCHAR,
    p_salary NUMERIC
)

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO employees
    (
        fname,
        lname,
        email,
        dept,
        salary
    )

    VALUES
    (
        p_fname,
        p_lname,
        p_email,
        p_dept,
        p_salary
    );

END;

$$;


-- Execute Procedure

CALL add_employee(
    'Rajat',
    'Jadon',
    'rajat@gmail.com',
    'IT',
    85000
);

CALL add_employee(
    'Sakshi',
    'Thakur',
    'sakshi@gmail.com',
    'HR',
    65000
);

CALL add_employee(
    'Rahul',
    'Sharma',
    'rahul@gmail.com',
    'Finance',
    72000
);


-- Verify Records

SELECT *
FROM employees;


-- =====================================================
-- Stored Procedure 2
--
-- Update an employee's salary.
-- =====================================================

CREATE OR REPLACE PROCEDURE update_salary(
    p_employee_id INT,
    p_new_salary NUMERIC
)

LANGUAGE plpgsql

AS $$

BEGIN

    UPDATE employees

    SET salary = p_new_salary

    WHERE employee_id = p_employee_id;

END;

$$;


-- Execute Procedure

CALL update_salary(1,90000);


-- Verify

SELECT *
FROM employees;


-- =====================================================
-- Stored Procedure 3
--
-- Update employee department.
-- =====================================================

CREATE OR REPLACE PROCEDURE update_department(
    p_employee_id INT,
    p_new_department VARCHAR
)

LANGUAGE plpgsql

AS $$

BEGIN

    UPDATE employees

    SET dept = p_new_department

    WHERE employee_id = p_employee_id;

END;

$$;


-- Execute Procedure

CALL update_department(
    2,
    'Marketing'
);


-- =====================================================
-- Stored Procedure 4
--
-- Increase employee salary by
-- a given percentage.
-- =====================================================

CREATE OR REPLACE PROCEDURE increase_salary(
    p_employee_id INT,
    p_percentage NUMERIC
)

LANGUAGE plpgsql

AS $$

BEGIN

    UPDATE employees

    SET salary = salary + (salary * p_percentage / 100)

    WHERE employee_id = p_employee_id;

END;

$$;


-- Execute Procedure

CALL increase_salary(
    1,
    10
);


-- =====================================================
-- Stored Procedure 5
--
-- Delete an employee.
-- =====================================================

CREATE OR REPLACE PROCEDURE delete_employee(
    p_employee_id INT
)

LANGUAGE plpgsql

AS $$

BEGIN

    DELETE FROM employees

    WHERE employee_id = p_employee_id;

END;

$$;


-- Execute Procedure

CALL delete_employee(3);


-- =====================================================
-- Display Final Employees Table
-- =====================================================

SELECT *
FROM employees;


-- =====================================================
-- Practice Question 1
--
-- Create a procedure to update
-- an employee's email address.
-- =====================================================

CREATE OR REPLACE PROCEDURE update_email(
    p_employee_id INT,
    p_new_email VARCHAR
)

LANGUAGE plpgsql

AS $$

BEGIN

    UPDATE employees

    SET email = p_new_email

    WHERE employee_id = p_employee_id;

END;

$$;


-- Execute Procedure

CALL update_email(
    2,
    'sakshi.marketing@gmail.com'
);


-- =====================================================
-- Practice Question 2
--
-- Create a procedure to transfer
-- an employee to another department.
-- =====================================================

CREATE OR REPLACE PROCEDURE transfer_department(
    p_employee_id INT,
    p_department VARCHAR
)

LANGUAGE plpgsql

AS $$

BEGIN

    UPDATE employees

    SET dept = p_department

    WHERE employee_id = p_employee_id;

END;

$$;


-- Execute Procedure

CALL transfer_department(
    1,
    'Software Development'
);


-- =====================================================
-- Display Updated Employees Table
-- =====================================================

SELECT *
FROM employees;


-- =====================================================
-- Summary
--
-- ✔ CREATE PROCEDURE
-- ✔ CALL
-- ✔ Parameters
-- ✔ INSERT using Procedure
-- ✔ UPDATE using Procedure
-- ✔ DELETE using Procedure
-- ✔ Multiple Stored Procedures
--
-- Note:
-- Stored Procedures perform actions
-- on the database but do not return
-- values directly.
--
-- PostgreSQL uses:
-- LANGUAGE plpgsql
-- =====================================================


-- =====================================================
-- End of File
-- =====================================================
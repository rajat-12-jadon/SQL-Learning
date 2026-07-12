-- =====================================================
-- File: 02_Triggers.sql
-- Topic: Triggers
-- Description: Demonstrates creating and using
-- Triggers in PostgreSQL using PL/pgSQL.
-- =====================================================


-- =====================================================
-- Display Employees Table
-- =====================================================

SELECT *
FROM employees;


-- =====================================================
-- What is a Trigger?
--
-- • A Trigger is a database object that
--   automatically executes when a specified
--   event occurs on a table or view.
--
-- • Triggers help automate tasks such as:
--      ✔ Data Validation
--      ✔ Audit Logging
--      ✔ Automatic Updates
--      ✔ Maintaining Data Integrity
-- =====================================================



-- =====================================================
-- Trigger Syntax
-- =====================================================

-- CREATE TRIGGER trigger_name
--
-- { BEFORE | AFTER | INSTEAD OF }
-- { INSERT | UPDATE | DELETE | TRUNCATE }
--
-- ON table_name
--
-- FOR EACH { ROW | STATEMENT }
--
-- EXECUTE FUNCTION trigger_function_name();



-- =====================================================
-- Explanation
-- =====================================================

-- BEFORE
-- Executes before the event occurs.

-- AFTER
-- Executes after the event occurs.

-- INSTEAD OF
-- Used only on Views.

-- INSERT
-- Trigger fires after/before inserting rows.

-- UPDATE
-- Trigger fires after/before updating rows.

-- DELETE
-- Trigger fires after/before deleting rows.

-- TRUNCATE
-- Trigger fires when an entire table is truncated.

-- FOR EACH ROW
-- Executes once for every affected row.

-- FOR EACH STATEMENT
-- Executes only once for the SQL statement.

-- EXECUTE FUNCTION
-- Specifies which trigger function will run.



-- =====================================================
-- Trigger Types
-- =====================================================

-- BEFORE INSERT
-- AFTER INSERT

-- BEFORE UPDATE
-- AFTER UPDATE

-- BEFORE DELETE
-- AFTER DELETE

-- BEFORE TRUNCATE
-- AFTER TRUNCATE

-- INSTEAD OF Trigger (Views Only)



-- =====================================================
-- Create Audit Table
--
-- Stores every INSERT, UPDATE
-- and DELETE operation.
-- =====================================================

CREATE TABLE employee_audit
(
    audit_id SERIAL PRIMARY KEY,

    employee_id INT,

    action VARCHAR(20),

    action_time TIMESTAMP
    DEFAULT CURRENT_TIMESTAMP
);



-- =====================================================
-- Trigger Function 1
--
-- AFTER INSERT Trigger
--
-- Automatically stores every
-- inserted employee in audit table.
-- =====================================================

CREATE OR REPLACE FUNCTION log_employee_insert()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO employee_audit
    (
        employee_id,
        action
    )

    VALUES
    (
        NEW.employee_id,
        'INSERT'
    );

    RETURN NEW;

END;

$$;



-- =====================================================
-- Create AFTER INSERT Trigger
-- =====================================================

CREATE TRIGGER after_employee_insert

AFTER INSERT

ON employees

FOR EACH ROW

EXECUTE FUNCTION log_employee_insert();



-- =====================================================
-- Test AFTER INSERT Trigger
-- =====================================================

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
    'Rohit',
    'Negi',
    'rohit@gmail.com',
    'IT',
    85000
);



SELECT *

FROM employee_audit;



-- =====================================================
-- Trigger Function 2
--
-- BEFORE INSERT Trigger
--
-- Prevent inserting negative salary.
-- =====================================================

CREATE OR REPLACE FUNCTION validate_salary()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    IF NEW.salary < 0 THEN

        RAISE EXCEPTION
        'Salary cannot be negative';

    END IF;

    RETURN NEW;

END;

$$;



CREATE TRIGGER before_employee_insert

BEFORE INSERT

ON employees

FOR EACH ROW

EXECUTE FUNCTION validate_salary();



-- =====================================================
-- Trigger Function 3
--
-- AFTER UPDATE Trigger
--
-- Log every updated employee.
-- =====================================================

CREATE OR REPLACE FUNCTION log_employee_update()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO employee_audit
    (
        employee_id,
        action
    )

    VALUES
    (
        NEW.employee_id,
        'UPDATE'
    );

    RETURN NEW;

END;

$$;



CREATE TRIGGER after_employee_update

AFTER UPDATE

ON employees

FOR EACH ROW

EXECUTE FUNCTION log_employee_update();



-- Test

UPDATE employees

SET salary = 90000

WHERE employee_id = 1;



-- =====================================================
-- Trigger Function 4
--
-- AFTER DELETE Trigger
--
-- Log deleted employees.
-- =====================================================

CREATE OR REPLACE FUNCTION log_employee_delete()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO employee_audit
    (
        employee_id,
        action
    )

    VALUES
    (
        OLD.employee_id,
        'DELETE'
    );

    RETURN OLD;

END;

$$;



CREATE TRIGGER after_employee_delete

AFTER DELETE

ON employees

FOR EACH ROW

EXECUTE FUNCTION log_employee_delete();



-- Test

DELETE

FROM employees

WHERE employee_id = 2;



SELECT *

FROM employee_audit;



-- =====================================================
-- Practice Question 1
--
-- Create a BEFORE UPDATE Trigger
-- to prevent negative salary.
-- =====================================================

CREATE OR REPLACE FUNCTION prevent_negative_salary()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    IF NEW.salary < 0 THEN

        RAISE EXCEPTION
        'Salary cannot be negative';

    END IF;

    RETURN NEW;

END;

$$;



CREATE TRIGGER before_salary_update

BEFORE UPDATE

ON employees

FOR EACH ROW

EXECUTE FUNCTION prevent_negative_salary();



-- =====================================================
-- Practice Question 2
--
-- Convert employee email
-- into lowercase before insert.
-- =====================================================

CREATE OR REPLACE FUNCTION lowercase_email()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    NEW.email = LOWER(NEW.email);

    RETURN NEW;

END;

$$;



CREATE TRIGGER before_email_insert

BEFORE INSERT

ON employees

FOR EACH ROW

EXECUTE FUNCTION lowercase_email();



-- =====================================================
-- Practice Question 3
--
-- Prevent NULL department.
-- =====================================================

CREATE OR REPLACE FUNCTION validate_department()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

    IF NEW.dept IS NULL THEN

        RAISE EXCEPTION
        'Department cannot be NULL';

    END IF;

    RETURN NEW;

END;

$$;



CREATE TRIGGER before_department_insert

BEFORE INSERT

ON employees

FOR EACH ROW

EXECUTE FUNCTION validate_department();



-- =====================================================
-- Practice Question 4
--
-- Display Audit Table.
-- =====================================================

SELECT *

FROM employee_audit;



-- =====================================================
-- Practice Question 5
--
-- Display all employees.
-- =====================================================

SELECT *

FROM employees;



-- =====================================================
-- NEW vs OLD
-- =====================================================

-- NEW
-- Refers to the newly inserted
-- or updated row.

-- OLD
-- Refers to the existing row
-- before UPDATE or DELETE.



-- =====================================================
-- Advantages of Triggers
-- =====================================================

-- ✔ Automatic Execution
-- ✔ Improves Data Integrity
-- ✔ Audit Logging
-- ✔ Data Validation
-- ✔ Business Rule Enforcement
-- ✔ Reduces Manual Work



-- =====================================================
-- Summary
--
-- ✔ Trigger Function
-- ✔ CREATE TRIGGER
-- ✔ BEFORE Trigger
-- ✔ AFTER Trigger
-- ✔ INSERT Trigger
-- ✔ UPDATE Trigger
-- ✔ DELETE Trigger
-- ✔ TRUNCATE Trigger (Theory)
-- ✔ INSTEAD OF Trigger (Theory)
-- ✔ FOR EACH ROW
-- ✔ FOR EACH STATEMENT
-- ✔ NEW
-- ✔ OLD
-- ✔ RAISE EXCEPTION
--
-- PostgreSQL Trigger Flow
--
-- Event
--      ↓
-- Trigger Fires
--      ↓
-- Trigger Function Executes
--      ↓
-- Database Action Completed
-- =====================================================


-- =====================================================
-- End of File
-- =====================================================
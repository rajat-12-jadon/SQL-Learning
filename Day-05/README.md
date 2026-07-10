# Day 5 - Advanced SQL Concepts 🚀

On Day 5, I explored advanced SQL features in PostgreSQL that are commonly used in real-world database applications. I learned how to create reusable database objects, perform analytical queries using Window Functions, work with NULL values, write Stored Procedures and User Defined Functions, and solve complex queries using Subqueries.

---

## 📚 Topics Covered

### Views

- CREATE VIEW
- CREATE OR REPLACE VIEW
- Updating Data Using Views
- Deleting Data Using Views
- Dropping Views

### HAVING Clause

- GROUP BY with HAVING
- HAVING with Aggregate Functions
- HAVING with Multiple Conditions
- ROLLUP
- HAVING with ROLLUP

### COALESCE()

- Replacing NULL Values
- COALESCE with LEFT JOIN
- COALESCE with ROLLUP
- Handling NULL Values in Queries

### Stored Procedures

- CREATE PROCEDURE
- CALL Statement
- Procedures with Parameters
- INSERT using Procedure
- UPDATE using Procedure
- DELETE using Procedure

### User Defined Functions (UDF)

- CREATE FUNCTION
- RETURN Statement
- RETURNS TABLE
- Functions with Parameters
- IF...ELSIF...ELSE
- String, Numeric and Boolean Functions

### Window Functions

- OVER()
- PARTITION BY
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- NTILE()
- LAG()
- LEAD()
- FIRST_VALUE()
- LAST_VALUE()
- Running Total
- Running Average

### Subqueries

- Scalar Subquery
- Multiple Row Subquery
- Correlated Subquery
- Subquery in SELECT
- Subquery in FROM
- Subquery in WHERE
- Subquery in HAVING
- EXISTS
- NOT EXISTS
- ANY
- ALL

---

## 📂 Files

- **01_Views.sql**
  - Creating, modifying and using SQL Views.

- **02_HAVING_Clause.sql**
  - HAVING Clause, Aggregate Functions and ROLLUP.

- **03_COALESCE_Function.sql**
  - Handling NULL values using COALESCE().

- **04_Stored_Procedures.sql**
  - Creating and executing Stored Procedures using PL/pgSQL.

- **05_User_Defined_Functions.sql**
  - Creating reusable functions with parameters and return values.

- **06_Window_Functions.sql**
  - Ranking, analytical functions, running totals and window operations.

- **07_Subqueries.sql**
  - Scalar, Correlated, Nested, EXISTS, ANY, ALL and interview-oriented subqueries.

---

## 🎯 Learning Outcomes

After completing Day 5, I can:

- Create reusable SQL Views.
- Filter grouped data using HAVING.
- Handle NULL values using COALESCE().
- Write Stored Procedures using PL/pgSQL.
- Create User Defined Functions (UDFs).
- Return values and tables from functions.
- Perform analytical queries using Window Functions.
- Write Scalar, Correlated and Nested Subqueries.
- Use EXISTS, NOT EXISTS, ANY and ALL operators effectively.

---

## 🛠️ Database Used

This folder uses the following tables:

- products
- employees

---

## 🚀 Next Topics

- Common Table Expressions (CTEs)
- Triggers
# Day 6 - Common Table Expressions (CTEs) & Triggers 🚀

On Day 6, I learned two powerful PostgreSQL features: **Common Table Expressions (CTEs)** and **Triggers**. CTEs help simplify complex queries by creating temporary named result sets, while Triggers automate database actions by executing predefined functions when specific events occur on a table.

---

## 📚 Topics Covered

### Common Table Expressions (CTEs)

- WITH Clause
- Basic CTE
- Multiple CTEs
- Recursive CTE
- CTE with Aggregate Functions
- CTE with JOIN
- CTE with Window Functions
- CTE vs Subqueries

### Triggers

- What is a Trigger?
- Trigger Syntax
- Trigger Functions
- BEFORE Trigger
- AFTER Trigger
- INSERT Trigger
- UPDATE Trigger
- DELETE Trigger
- FOR EACH ROW
- FOR EACH STATEMENT
- NEW and OLD Keywords
- Audit Logging
- Data Validation using Triggers
- RAISE EXCEPTION

---

## 📂 Files

- **01_Common_Table_Expressions.sql**
  - Covers Basic CTEs, Multiple CTEs, Recursive CTEs, Aggregate Functions, JOINs, Window Functions, and practice questions.

- **02_Triggers.sql**
  - Demonstrates Trigger Functions, BEFORE & AFTER Triggers, Audit Logging, Data Validation, and practical trigger examples using PL/pgSQL.

---

## 🎯 Learning Outcomes

After completing Day 6, I can:

- Write clean and readable SQL queries using CTEs.
- Use Multiple and Recursive CTEs.
- Combine CTEs with JOINs, Aggregate Functions, and Window Functions.
- Understand the difference between CTEs and Subqueries.
- Create Trigger Functions using PL/pgSQL.
- Automate database operations using Triggers.
- Validate data before INSERT and UPDATE operations.
- Maintain audit logs automatically using Triggers.
- Work with the `NEW` and `OLD` records inside Trigger Functions.

---

## 🛠️ Database Used

This folder uses the following tables:

- employees
- employee_audit

---

## 🚀 Next Steps

- Solve more LeetCode SQL problems.
- Build real-world SQL projects.
- Learn DBMS concepts such as Normalization, Transactions, and Indexing.
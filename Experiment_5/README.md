# Experiment 5: SQL Conditional Logic (Odd & Even Values)

---

## Experiment
This experiment focuses on the use of conditional logic in SQL using the MOD (modulus) operator to determine whether employee salaries are odd or even. The SQL queries demonstrate how numerical data can be analyzed and categorized using conditional logic in a database.

---

## Software Required / Tools
- Oracle FreeSQL / Oracle Database Express Edition (Oracle XE)
- Oracle SQL Developer

---

## Objective
- To understand the concept of conditional logic in SQL.
- To use the MOD operator to determine odd and even numbers.
- To write SQL queries that classify employee salaries as odd or even.
- To analyze numerical data stored in a database table.

---

## Procedure of the Experiment
1. Start the system and log in.
2. Open Oracle SQL Developer.
3. Connect to the required database.
4. Open the SQL Worksheet / Query Tool.
5. Write the SQL commands for creating tables and inserting data.
6. Execute the SQL queries one by one.
7. Observe the output displayed in the results panel.
8. Save the work and take screenshots for record.

---

# SQL Implementation

## Full SQL Code

```sql
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER
);

INSERT INTO employees VALUES (1, 'Jaskaran', 25000);
INSERT INTO employees VALUES (2, 'Yuvi', 30001);
INSERT INTO employees VALUES (3, 'Anhad', 45000);
INSERT INTO employees VALUES (4, 'Manan', 52003);
INSERT INTO employees VALUES (5, 'Kartik', 61000);

COMMIT;

SELECT emp_id, emp_name, salary
FROM employees
WHERE MOD(salary,2) = 0;

SELECT emp_id, emp_name, salary
FROM employees
WHERE MOD(salary,2) <> 0;

SELECT emp_id, emp_name, salary,
CASE
    WHEN MOD(salary,2) = 0 THEN 'Even Salary'
    ELSE 'Odd Salary'
END AS salary_type
FROM employees;
```

---

## Output
### Table Showing Salary Types of all Employees:
<img width="747" height="702" alt="Salary_type_table" src="https://github.com/user-attachments/assets/68f43582-27f3-4708-8e5a-0a49ab9b4a59" />

---

### Table Showing only Employees having Even Salaries:
<img width="745" height="674" alt="Even_Salary_Table" src="https://github.com/user-attachments/assets/6efc0aeb-da68-4d0c-bc0d-57babe1a6ebc" />

---

## Input / Output Details
### Input
- Employee ID
- Employee Name
- Salary
### Output
- Employees with even salaries
- Employees with odd salaries
- Salary classification (Even Salary / Odd Salary)

---

## Learning Outcome
- Understood how SQL conditional logic works.
- Learned to use the MOD function for identifying odd and even numbers.
- Practiced filtering and categorizing data using SQL queries.
- Improved understanding of SQL query execution in Oracle SQL Developer.

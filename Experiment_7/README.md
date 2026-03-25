# 📘 Experiment 7: Design and Performance Analysis of Materialized Views

---

## 🧪 Experiment
This experiment focuses on designing and implementing simple views, complex views, and materialized views in a database system. It demonstrates how materialized views improve query performance by storing precomputed results and compares their efficiency with regular views.

---

## 🛠️ Software Required / Tools
- Oracle FreeSQL / Oracle Database Express Edition (Oracle XE)  
- Oracle SQL Developer  
- PostgreSQL (pgAdmin / DB Fiddle)  

---

## 🎯 Objective
- To understand the concept of views and materialized views  
- To differentiate between simple views, complex views, and materialized views  
- To create and implement views in SQL  
- To analyze performance differences between views  
- To understand the importance of materialized views in real-world applications  

---

## ⚙️ Procedure of the Experiment
1. Start the system and log in  
2. Open Oracle SQL Developer / DB Fiddle  
3. Connect to the required database  
4. Open SQL Worksheet / Query Tool  
5. Create employee and department tables  
6. Insert sample data into tables  
7. Create simple and complex views  
8. Create a materialized view  
9. Execute queries and observe results  
10. Compare performance and record observations  

---

## 💻 SQL Implementation

```sql
-- Drop tables
DROP TABLE employees CASCADE CONSTRAINTS;
DROP TABLE departments CASCADE CONSTRAINTS;

-- Create tables
CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(100)
);

CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(100),
    department_id NUMBER,
    salary NUMBER(10,2),
    hire_date DATE
);

-- Insert data
INSERT INTO departments VALUES (1, 'HR');
INSERT INTO departments VALUES (2, 'IT');
INSERT INTO departments VALUES (3, 'Finance');
INSERT INTO departments VALUES (4, 'Marketing');

INSERT INTO employees VALUES (1, 'Anhad', 1, 40000, DATE '2022-01-10');
INSERT INTO employees VALUES (2, 'Rohit', 2, 60000, DATE '2021-03-15');
INSERT INTO employees VALUES (3, 'Jaskaran', 2, 75000, DATE '2020-07-20');
INSERT INTO employees VALUES (4, 'Yuvraj', 3, 50000, DATE '2022-05-11');

COMMIT;

--------------------------------------------------
-- Simple View
--------------------------------------------------
CREATE VIEW simple_employee_view AS
SELECT emp_id, emp_name, salary
FROM employees;

--------------------------------------------------
-- Complex View
--------------------------------------------------
CREATE VIEW complex_employee_view AS
SELECT 
    d.department_name,
    COUNT(e.emp_id) AS total_employees,
    AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

--------------------------------------------------
-- Materialized View
--------------------------------------------------
CREATE MATERIALIZED VIEW materialized_employee_view
BUILD IMMEDIATE
REFRESH COMPLETE
AS
SELECT 
    d.department_name,
    COUNT(e.emp_id) AS total_employees,
    AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

--------------------------------------------------
-- Output Queries
--------------------------------------------------
SELECT * FROM simple_employee_view;
SELECT * FROM complex_employee_view;
SELECT * FROM materialized_employee_view;
```

---

## 📊 Output

### 🔹 Simple View Output
Displays employee ID, name, and salary.
<img width="736" height="609" alt="Simple_View" src="https://github.com/user-attachments/assets/b57b9169-25a2-4039-a02e-1a864f26655b" />

### 🔹 Complex View Output
Displays department-wise total employees and average salary.
<img width="749" height="574" alt="Complex_View" src="https://github.com/user-attachments/assets/508e662e-c2f7-4e5d-87da-fc34ab076360" />

### 🔹 Materialized View Output
Displays same result as complex view but with faster execution.
<img width="743" height="634" alt="Materialized_View" src="https://github.com/user-attachments/assets/3e6f869b-4ebb-4339-81f8-734e128543fb" />

---

## 🔄 Input / Output Details

### Input
- Employee ID  
- Employee Name  
- Department ID  
- Salary  
- Hire Date  

### Output
- Employee details using simple view  
- Aggregated department data using complex view  
- Precomputed results using materialized view  

---

## 📚 Learning Outcomes
- Understood the concept of views and materialized views  
- Learned differences between simple and complex views  
- Implemented materialized views in Oracle/PostgreSQL  
- Analyzed performance improvement using materialized views  
- Gained knowledge of real-world database optimization techniques  

---

## 🧾 Result
Materialized views store precomputed query results and significantly improve performance compared to complex views, especially for repeated query execution in large-scale systems.

---

## 🌍 Real-World Applications
- SanDisk – Data warehousing  
- JTG – Reporting systems  
- PayPal – Transaction analytics  

---

## 📝 One-Line Summary
Materialized views store query results physically, improving performance compared to regular views.

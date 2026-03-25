DROP TABLE employees CASCADE CONSTRAINTS;
DROP TABLE departments CASCADE CONSTRAINTS;
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
INSERT INTO departments VALUES (1, 'HR');
INSERT INTO departments VALUES (2, 'IT');
INSERT INTO departments VALUES (3, 'Finance');
INSERT INTO departments VALUES (4, 'Marketing');

INSERT INTO employees VALUES (1, 'Anhad', 1, 40000, DATE '2022-01-10');
INSERT INTO employees VALUES (2, 'Rohit', 2, 60000, DATE '2021-03-15');
INSERT INTO employees VALUES (3, 'Jaskaran', 2, 75000, DATE '2020-07-20');
INSERT INTO employees VALUES (4, 'Yuvraj', 3, 50000, DATE '2022-05-11');

COMMIT;
-- Simple View
CREATE VIEW simple_employee_view AS
SELECT emp_id, emp_name, salary
FROM employees;
SELECT * FROM simple_employee_view;
-- Complex View
CREATE VIEW complex_employee_view AS
SELECT 
    d.department_name,
    COUNT(e.emp_id) AS total_employees,
    AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;
SELECT * FROM complex_employee_view;
-- Materialized View
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
SELECT * FROM materialized_employee_view;

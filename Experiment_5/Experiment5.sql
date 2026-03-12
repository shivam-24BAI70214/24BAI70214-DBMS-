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

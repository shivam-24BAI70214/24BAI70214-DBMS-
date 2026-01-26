# SQL Practical – Employee Table and Aggregate Functions

## Experiment
To create an EMPLOYEE table in MySQL Workbench, insert employee records, and perform aggregate queries using `GROUP BY`, `HAVING`, and `ORDER BY` clauses.

---

## Objective
- To create and manage a database table using SQL  
- To insert records into the EMPLOYEE table  
- To calculate average salary using aggregate functions  
- To filter records using `WHERE` and `HAVING` clauses  
- To analyze department-wise salary data  
- To gain hands-on experience with MySQL Workbench  

---

## Practical / Experiment Steps
1. Drop the EMPLOYEE table if it already exists.  
2. Create the EMPLOYEE table with required columns.  
3. Insert employee records into the table.  
4. Display all employee records.  
5. Calculate average salary department-wise.  
6. Retrieve employees having salary greater than 20000.  
7. Display departments having average salary greater than 30000.  
8. Sort departments by average salary in descending order.  

---

## Procedure of the Experiment
(i) Start the system and log in to the computer.  
(ii) Open MySQL Workbench.  
(iii) Create or select the required database.  
(iv) Execute the SQL command to drop the EMPLOYEE table if it exists.  
(v) Create the EMPLOYEE table with appropriate data types.  
(vi) Insert employee records into the table.  
(vii) Execute SELECT queries for data retrieval and analysis.  
(viii) Verify the output after execution.  
(ix) Save the work and capture screenshots for record.  

---

## SQL Code Used

```sql
-- Drop table if it already exists
DROP TABLE IF EXISTS EMPLOYEE;

-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(20),
    DEPARTMENT VARCHAR(20),
    SALARY DECIMAL(10,2),
    JOINING_DATE DATE
);

-- Display table records
SELECT * FROM EMPLOYEE;

-- Insert records into EMPLOYEE table
INSERT INTO EMPLOYEE VALUES (1, 'Jaskaran', 'IT', 30000, '2023-05-23');
INSERT INTO EMPLOYEE VALUES (2, 'Sameer', 'IT', 27000, '2016-05-23');
INSERT INTO EMPLOYEE VALUES (3, 'Kartik', 'HR', 19000, '2025-09-14');
INSERT INTO EMPLOYEE VALUES (4, 'Yuvraj', 'Finance', 22000, '2021-11-06');
INSERT INTO EMPLOYEE VALUES (5, 'Anhad', 'Finance', 55000, '2023-10-25');

-- Average salary department-wise
SELECT 
    DEPARTMENT, 
    ROUND(AVG(SALARY), 2) AS AVG_SAL
FROM EMPLOYEE
GROUP BY DEPARTMENT;

-- Employees with salary greater than 20000
SELECT 
    EMP_ID, 
    EMP_NAME, 
    SALARY
FROM EMPLOYEE
WHERE SALARY > 20000;

-- Departments with average salary greater than 30000
SELECT 
    DEPARTMENT, 
    ROUND(AVG(SALARY), 2) AS AVG_SAL
FROM EMPLOYEE
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 30000;

-- Departments ordered by average salary (descending)
SELECT 
    DEPARTMENT, 
    ROUND(AVG(SALARY), 2) AS AVG_SAL
FROM EMPLOYEE
GROUP BY DEPARTMENT
ORDER BY AVG(SALARY) DESC;
```

---

## Input / Output Details
# Input
SQL commands for:
- Table creation
- Record insertion
- Data retrieval
- Aggregate functions (AVG)
- Filtering using WHERE and HAVING
# Output
- EMPLOYEE table created successfully
- Employee records inserted into the table
- Department-wise average salary displayed
- Employees with salary greater than 20000 retrieved
- Departments with average salary greater than 30000 displayed
- Departments sorted by average salary in descending order

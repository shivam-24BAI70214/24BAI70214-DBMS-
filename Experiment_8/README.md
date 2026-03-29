# 📘 Experiment 8: Stored Procedure in PostgreSQL (Employee Count by Gender)

---

## 🧪 Experiment
This experiment focuses on designing and implementing a **stored procedure in PostgreSQL**. It demonstrates how to use IN, OUT, and INOUT parameters to process and return data dynamically.

---

## 🛠️ Software Required / Tools
- PostgreSQL (pgAdmin / DB Fiddle)  
- SQL (DDL, DML)  
- PL/pgSQL  

---

## 🎯 Objective
- To understand stored procedures in PostgreSQL  
- To learn the use of IN, OUT, and INOUT parameters  
- To execute procedures using DO block  
- To retrieve and display processed results  

---

## ⚙️ Procedure of the Experiment
1. Start the system and log in  
2. Open pgAdmin / DB Fiddle  
3. Connect to the database  
4. Open Query Tool  
5. Create employees table  
6. Insert sample data  
7. Create stored procedure  
8. Execute procedure using DO block  
9. Observe output  

---

## 💻 SQL Implementation

```sql
-- Drop table if exists
DROP TABLE IF EXISTS employees;

-- Create table
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    gender VARCHAR(10),
    salary NUMERIC(10,2)
);

-- Insert data
INSERT INTO employees (emp_name, gender, salary) VALUES
('Anhad', 'Male', 30000),
('Riya', 'Female', 35000),
('Jaskaran', 'Male', 28000),
('Simran', 'Female', 40000),
('Yuvraj', 'Male', 32000);

--------------------------------------------------
-- Stored Procedure
--------------------------------------------------
CREATE OR REPLACE PROCEDURE get_Employee_Count_BY_Gender (
    IN IN_GENDER VARCHAR(20),
    OUT OUT_COUNT INT,
    INOUT STATUS VARCHAR(20)
)
AS
$$
BEGIN
    SELECT COUNT(*) 
    INTO OUT_COUNT  
    FROM employees  
    WHERE GENDER = 'Male';

    STATUS := 'SUCCESS';
END;
$$ LANGUAGE PLPGSQL;

--------------------------------------------------
-- Execution Block
--------------------------------------------------
DO
$$
DECLARE
    GEN VARCHAR(20) := 'Male';
    Count_of_Employee INT;
    STATUS VARCHAR := 'Pending';
BEGIN
    CALL get_Employee_Count_BY_Gender(GEN, Count_of_Employee, STATUS);

    RAISE NOTICE 
    'YOUR COUNT OF EMPLOYEE BY GENDER IS % AND YOUR STATUS IS %',
    Count_of_Employee, STATUS;
END;
$$;
```

---

## Output
<img width="986" height="806" alt="DBMS_Exp-8" src="https://github.com/user-attachments/assets/d0f73bb2-c4d7-4b50-8019-ad5c80b5778f" />

---

## 🔄 Input / Output Details
### Input
- Employee Name
- Gender
- Salary
### Output
- Count of employees by gender
- Execution status

---

## 📚 Learning Outcomes
- Understood stored procedures in PostgreSQL
- Learned usage of IN, OUT, and INOUT parameters
- Executed procedures using DO block
- Displayed output using RAISE NOTICE
- Gained hands-on experience with PL/pgSQL

---

## 🧾 Result

The stored procedure successfully calculates the number of employees and returns the result along with execution status.

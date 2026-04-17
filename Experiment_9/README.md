# 📘 Experiment 9: PL/SQL Package Development (Employee Management)

---

## 🧪 Experiment  
This experiment focuses on designing and implementing a **PL/SQL Package** in Oracle. It demonstrates how to use a **package specification and package body**, along with **procedures and shared cursors**, to achieve modular and reusable database programming.

---

## 🛠️ Software Required / Tools  
- Oracle Database / SQL*Plus / Oracle Live SQL  
- SQL (DDL, DML)  
- PL/SQL  

---

## 🎯 Objective  
- To understand PL/SQL packages  
- To learn package specification and package body  
- To implement procedures inside packages  
- To use shared cursors within a package  
- To execute package procedures and display results  

---

## ⚙️ Procedure of the Experiment  
1. Start the system and log in  
2. Open Oracle SQL*Plus / Live SQL  
3. Connect to the database  
4. Create employees table  
5. Insert sample data  
6. Create package specification  
7. Create package body with procedures and cursor  
8. Execute package procedures  
9. Observe output  

---

## 💻 SQL Implementation  

```sql
--------------------------------------------------
-- Create Table
--------------------------------------------------
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER
);

--------------------------------------------------
-- Insert Data
--------------------------------------------------
INSERT INTO employees VALUES (1, 'Anhad', 30000);
INSERT INTO employees VALUES (2, 'Jaskaran', 40000);
INSERT INTO employees VALUES (3, 'Yuvraj', 50000);

COMMIT;

--------------------------------------------------
-- Package Specification
--------------------------------------------------
CREATE OR REPLACE PACKAGE emp_package AS

    -- Procedure to display all employees
    PROCEDURE show_employees;

    -- Procedure to display employee by ID
    PROCEDURE get_employee(p_id NUMBER);

END emp_package;
/

--------------------------------------------------
-- Package Body
--------------------------------------------------
CREATE OR REPLACE PACKAGE BODY emp_package AS

    -- Shared Cursor
    CURSOR emp_cursor IS
        SELECT emp_id, emp_name, salary FROM employees;

    --------------------------------------------------
    -- Procedure: Show All Employees
    --------------------------------------------------
    PROCEDURE show_employees IS
    BEGIN
        FOR rec IN emp_cursor LOOP
            DBMS_OUTPUT.PUT_LINE(
                'ID: ' || rec.emp_id ||
                ' Name: ' || rec.emp_name ||
                ' Salary: ' || rec.salary
            );
        END LOOP;
    END;

    --------------------------------------------------
    -- Procedure: Get Employee by ID
    --------------------------------------------------
    PROCEDURE get_employee(p_id NUMBER) IS
    BEGIN
        FOR rec IN emp_cursor LOOP
            IF rec.emp_id = p_id THEN
                DBMS_OUTPUT.PUT_LINE(
                    'Employee Found -> ID: ' || rec.emp_id ||
                    ' Name: ' || rec.emp_name ||
                    ' Salary: ' || rec.salary
                );
            END IF;
        END LOOP;
    END;

END emp_package;
/

--------------------------------------------------
-- Execution
--------------------------------------------------
SET SERVEROUTPUT ON;

BEGIN
    emp_package.show_employees;
END;
/

BEGIN
    emp_package.get_employee(2);
END;
/
```

---

## Output  
- Displays all employee records using `show_employees`
<img width="745" height="676" alt="EXP-9_1" src="https://github.com/user-attachments/assets/a5462360-4547-4331-9821-21faa044fb45" />

- Displays specific employee details using `get_employee`  
<img width="747" height="671" alt="EXP-9_3" src="https://github.com/user-attachments/assets/07e259aa-7c54-4040-a97f-06ebc55eee4a" />

---

## 🔄 Input / Output Details  

### Input  
- Employee ID (for specific search)  

### Output  
- List of all employees  
- Details of a specific employee  
- Employee ID, Name, and Salary  

---

## 📚 Learning Outcomes  
- Understood PL/SQL package structure  
- Learned difference between package specification and body  
- Implemented procedures inside packages  
- Used shared cursor for efficient data handling  
- Executed package procedures successfully  

---

## 🧾 Result  

The PL/SQL package was successfully created and executed. It demonstrated modular programming using procedures and shared cursors, improving code reusability and efficiency in database operations.

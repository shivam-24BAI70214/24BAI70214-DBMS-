# Experiment 6: Understanding and Implementing Cursors for Row-by-Row Data Processing

---

## Experiment
This experiment focuses on understanding and implementing cursors in PL/SQL to process multiple rows returned by a query. It demonstrates the use of implicit cursors, explicit cursors, and cursor attributes to apply business logic on database records in a row-by-row manner.

---

## Software Required / Tools
- Oracle FreeSQL / Oracle Database Express Edition (Oracle XE)  
- Oracle SQL Developer  

---

## Objective
- To understand the concept of cursors in PL/SQL.  
- To differentiate between implicit and explicit cursors.  
- To use cursor attributes like `%FOUND`, `%NOTFOUND`, `%ROWCOUNT`, and `%ISOPEN`.  
- To process multiple rows using explicit cursors.  
- To apply business logic using cursor-based processing.  

---

## Procedure of the Experiment
1. Start the system and log in.  
2. Open Oracle SQL Developer.  
3. Connect to the required database.  
4. Open the SQL Worksheet / Query Tool.  
5. Create the employee table and insert data.  
6. Execute PL/SQL blocks demonstrating cursor usage.  
7. Observe outputs in DBMS Output panel.  
8. Save the work and take screenshots for record.  

---

# SQL / PL-SQL Implementation

## Full SQL Code

```sql
-- Drop table (if exists)
DROP TABLE employees;

-- Create table
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER,
    department VARCHAR2(50)
);

-- Insert data
INSERT INTO employees VALUES (101, 'Amit', 30000, 'HR');
INSERT INTO employees VALUES (102, 'Neha', 45000, 'IT');
INSERT INTO employees VALUES (103, 'Raj', 50000, 'Finance');
INSERT INTO employees VALUES (104, 'Simran', 40000, 'IT');
INSERT INTO employees VALUES (105, 'Karan', 35000, 'HR');

COMMIT;

--------------------------------------------------
-- Implicit Cursor Example
--------------------------------------------------
SET SERVEROUTPUT ON;

DECLARE
    v_rows NUMBER;
BEGIN
    UPDATE employees
    SET salary = salary + 5000
    WHERE emp_id = 101;

    v_rows := SQL%ROWCOUNT;

    DBMS_OUTPUT.PUT_LINE('Rows Updated: ' || v_rows);
END;
/

--------------------------------------------------
-- Explicit Cursor Example
--------------------------------------------------
DECLARE
    CURSOR emp_cursor IS
        SELECT emp_id, emp_name, salary FROM employees;

    v_id employees.emp_id%TYPE;
    v_name employees.emp_name%TYPE;
    v_salary employees.salary%TYPE;

BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_id, v_name, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_id ||
            ', Name: ' || v_name ||
            ', Salary: ' || v_salary
        );
    END LOOP;

    CLOSE emp_cursor;
END;
/

--------------------------------------------------
-- Cursor Attributes Example
--------------------------------------------------
DECLARE
    CURSOR emp_cursor IS
        SELECT emp_name, salary FROM employees;

    v_name employees.emp_name%TYPE;
    v_salary employees.salary%TYPE;

BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_name, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Row ' || emp_cursor%ROWCOUNT ||
            ': ' || v_name || ' earns ' || v_salary
        );
    END LOOP;

    IF emp_cursor%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is open, now closing...');
        CLOSE emp_cursor;
    END IF;
END;
/

--------------------------------------------------
-- Business Logic Example
--------------------------------------------------
DECLARE
    CURSOR emp_cursor IS
        SELECT emp_id, salary FROM employees;

    v_id employees.emp_id%TYPE;
    v_salary employees.salary%TYPE;

BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_id, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;

        IF v_salary < 40000 THEN
            UPDATE employees
            SET salary = salary + 2000
            WHERE emp_id = v_id;

            DBMS_OUTPUT.PUT_LINE(
                'Bonus added to Employee ID: ' || v_id
            );
        END IF;
    END LOOP;

    CLOSE emp_cursor;
    COMMIT;
END;
```
## Output
- Implicit Cursor Output
<img width="744" height="675" alt="Implicit_cursor" src="https://github.com/user-attachments/assets/6aabc72e-7a54-4edb-a2aa-1fd10d607a3c" />

- Explicit Cursor Output
<img width="746" height="678" alt="Explicit_Cursor" src="https://github.com/user-attachments/assets/cbaf517d-cf17-4868-a101-f17e6568cf8d" />

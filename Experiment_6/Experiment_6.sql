CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER,
    department VARCHAR2(50)
);
INSERT INTO employees VALUES (101, 'Yuvraj', 30000, 'HR');
INSERT INTO employees VALUES (102, 'Jaskaran', 45000, 'IT');
INSERT INTO employees VALUES (103, 'Rohit', 50000, 'Finance');
INSERT INTO employees VALUES (104, 'Simran', 40000, 'IT');
INSERT INTO employees VALUES (105, 'Kartik', 35000, 'HR');

COMMIT;

    -- Implicit cursor example
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

  -- Explicit cursor example
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

-- Cursor Attributes example
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

  -- Real-World Business Logic Example
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
/

 -- Output Verification
SELECT * FROM employees;

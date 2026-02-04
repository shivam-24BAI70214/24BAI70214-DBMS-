# Experiment 4: Conditional Control Statements in PL/SQL (PL/pgSQL)

---

## Experiment
This experiment focuses on the implementation of conditional control statements in PL/SQL (PL/pgSQL) such as IF–ELSE, IF–ELSIF–ELSE, ELSIF Ladder, and CASE statements. These constructs are used to control the flow of execution based on logical conditions and demonstrate decision-making capabilities in PostgreSQL.

---

## Software Required/Tools
- Oracle FreeSQL
- PL/SQL

---

## Objective
- To understand the concept of conditional control statements in PL/SQL.
- To implement IF–ELSE, IF–ELSIF–ELSE, ELSIF ladder, and CASE statements.
- To analyze program execution flow based on different conditions.
- To gain practical experience in writing PL/pgSQL blocks using PostgreSQL.

---

## Procedure of the Experiment
1. Start the system and log in.
2. Open PostgreSQL using pgAdmin.
3. Connect to the required database.
4. Open the Query Tool.
5. Write the PL/pgSQL programs as per the experiment.
6. Execute the programs one by one.
7. Verify the output displayed in the Messages panel.
8. Save the work and take screenshots for record.

---

## Practical / Experiment Steps
The following PL/pgSQL programs were written and executed to demonstrate conditional control statements:

### Program 1: IF–ELSE Statement  
**Purpose:** Check whether a given number is positive or non-positive.

```sql
DECLARE
    num NUMBER := 5;
BEGIN
    IF num > 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number ' || num || ' is Positive');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number ' || num || ' is Non-Positive');
    END IF;
END;
```
<img width="739" height="682" alt="Result_1" src="https://github.com/user-attachments/assets/d32b27d6-3a75-4c68-94dd-81a44316492d" />

### Program 2: IF–ELSIF–ELSE Statement  
**Purpose:** Evaluate grade of a student.

```sql
DECLARE
    marks NUMBER := 82;
BEGIN
    IF marks >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: A');
    ELSIF marks >= 75 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: B');
    ELSIF marks >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: C');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Grade: Fail');
    END IF;
END;
```
<img width="743" height="683" alt="Result_2" src="https://github.com/user-attachments/assets/bb7d4634-80e1-4b87-a6b9-8c77d3dac840" />

### Program 3: ELSIF Ladder 
**Purpose:** Determine performance status.

```sql
DECLARE
    marks NUMBER := 68;
BEGIN
    IF marks >= 85 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Excellent');
    ELSIF marks >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Very Good');
    ELSIF marks >= 55 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Good');
    ELSIF marks >= 40 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Average');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Performance: Poor');
    END IF;
END;
```
<img width="740" height="685" alt="Result_3" src="https://github.com/user-attachments/assets/e449b053-e52b-4201-98d0-f22b5cd61242" />

### Program 4: CASE Statement
**Purpose:** Display day name based on day number.

```sql
DECLARE
    day_no NUMBER := 3;
    day_name VARCHAR2(20);
BEGIN
    day_name := CASE day_no
        WHEN 1 THEN 'Sunday'
        WHEN 2 THEN 'Monday'
        WHEN 3 THEN 'Tuesday'
        WHEN 4 THEN 'Wednesday'
        WHEN 5 THEN 'Thursday'
        WHEN 6 THEN 'Friday'
        WHEN 7 THEN 'Saturday'
        ELSE 'Invalid Day Number'
    END;

    DBMS_OUTPUT.PUT_LINE('Day: ' || day_name);
END;
```
<img width="738" height="680" alt="Result_4" src="https://github.com/user-attachments/assets/3afc3017-99c5-4496-b568-100fcee31d65" />

---

## Input / Output Details and Screenshots
### Input
- Integer number
- Student marks
- Day number (1–7)
### Output
- Message indicating positive or non-positive number
- Student grade
- Performance status
- Day name

---

## Learning Outcome:
- Understood the concept of conditional control statements in PL/SQL.
- Learned to implement IF–ELSE, IF–ELSIF–ELSE, ELSIF ladder, and CASE statements.
- Gained practical experience in writing and executing PL/SQL programs in Oracle Free SQL.
- Developed logical thinking and decision-making skills using conditional statements.
- Learned to display program output using DBMS_OUTPUT.PUT_LINE.

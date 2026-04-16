# 📘 Experiment 9: Database Triggers in PostgreSQL (Employee Salary Validation)

---

## 🎯 Aim
To understand and implement database triggers in PostgreSQL to automate data validation and computational logic, ensuring data integrity by enforcing business rules during DML operations.

---

## 🎯 Objective
- To understand the concept of database triggers  
- To implement BEFORE INSERT trigger in PostgreSQL  
- To automate calculation of total payable amount  
- To enforce validation rules using triggers  
- To handle exceptions using PL/pgSQL

---

## 🛠️ Software Required / Tools
- PostgreSQL (pgAdmin / DB Fiddle)  
- SQL (DDL, DML)  
- PL/pgSQL  

---

## ⚙️ Procedure
1. Start the system and log in  
2. Open pgAdmin / DB Fiddle  
3. Connect to the database  
4. Open Query Tool  
5. Create the `employee` table  
6. Create trigger function  
7. Create trigger on table  
8. Insert records into table  
9. Observe trigger execution and output  

---

## 💻 SQL Implementation

### 🔹 Step 1: Create Table
```sql
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    working_hours INT,
    perhour_salary NUMERIC,
    total_payable_amount NUMERIC
);
```
### 🔹 Step 2: Create Trigger Function
```sql
CREATE OR REPLACE FUNCTION CALCULATE_AMOUNT()
RETURNS TRIGGER
AS
$$
BEGIN
    NEW.total_payable_amount = NEW.perhour_salary * NEW.working_hours;

    IF NEW.total_payable_amount > 25000 THEN
        RAISE EXCEPTION 'AMOUNT IS GREATER THAN 25000';
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;
```
### 🔹 Step 3: Create Trigger
```sql
CREATE OR REPLACE TRIGGER CAL_PAYABLE_AMOUNT
BEFORE INSERT
ON EMPLOYEE
FOR EACH ROW
EXECUTE FUNCTION CALCULATE_AMOUNT();
```
### 🔹 Step 4: Insert Valid Data
```sql
DO
$$
BEGIN
    INSERT INTO EMPLOYEE(emp_id, emp_name, working_hours, perhour_salary)
    VALUES (1, 'AKASH', 10, 250);

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '%', SQLERRM;
END;
$$;
```
### 🔹 Step 5: View Data
```sql
SELECT * FROM EMPLOYEE;
```
### 🔹 Step 6: Insert Invalid Data
```sql
DO
$$
BEGIN
    INSERT INTO EMPLOYEE(emp_id, emp_name, working_hours, perhour_salary)
    VALUES (2, 'AKASH', 10, 250000);

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '%', SQLERRM;
END;
$$;
```

---

## 📊 Output
### ✅ Valid Insert
<img width="653" height="609" alt="Exp-9_Output1" src="https://github.com/user-attachments/assets/c76cc39b-3440-4d2a-b0f1-513874c9538a" />

### ❌ Invalid Insert
<img width="625" height="585" alt="Exp-9_Output2" src="https://github.com/user-attachments/assets/fda463ab-738b-4a86-837c-6ceddc5cd55c" />

---

## 🔄 Input / Output Details
### 🔹 Input
-	Employee ID
- Employee Name
- Working Hours
- Per Hour Salary
### 🔹 Output
- Automatically calculated total payable amount
- Error message if payable exceeds limit

---

## 📚 Learning Outcomes
- Understood database triggers in PostgreSQL
- Learned how to automate calculations using triggers
- Implemented data validation using business rules
- Gained knowledge of BEFORE INSERT triggers
- Handled exceptions using PL/pgSQL

---

## 🧾 Result
The trigger successfully calculates the total payable amount and restricts insertion of records where the amount exceeds the defined limit, thereby maintaining data integrity.

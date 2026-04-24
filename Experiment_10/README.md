# 📘 Experiment: Trigger for Automatic Primary Key Implementation  

---

## 🧪 Experiment  
This experiment focuses on designing and implementing a **database trigger** that automatically implements the functionality of a **primary key**, ensuring unique identification of records without manual intervention. It demonstrates how triggers can replicate the behavior of a stored procedure for enforcing data integrity.

---

## 🛠️ Software Required / Tools  

### Database Management System:  
- Oracle Database Express Edition (Oracle XE)  
- PostgreSQL Database  

### Database Administration Tool / Client Tool:  
- Oracle SQL Developer (for Oracle XE)  
- pgAdmin (for PostgreSQL)  

---

## 🎯 Objective  
To create a database trigger that automatically enforces primary key constraints or generates unique key values, replicating the functionality of a stored procedure.  

---

## ⚙️ Problem Statement  
In enterprise databases, primary keys must be unique for every record. Manual assignment of keys can lead to errors.  

Design a trigger that:  
- Automatically generates or enforces a primary key value during record insertion.  
- Implements the logic similar to a stored procedure.  
- Demonstrates automated primary key functionality for a table.  

(Industry relevance: Amazon, Flipkart, Oracle)  

---

## ⚙️ Practical / Experiment Steps  
1. Identify the table requiring automated primary key enforcement.  
2. Design a trigger that activates before insert operations.  
3. Ensure that every new record receives a unique primary key automatically.  
4. Validate the trigger by inserting multiple records and verifying unique keys.  

---

## 💻 SQL Implementation (PostgreSQL – pgAdmin)  

```sql
--------------------------------------------------
-- Drop Table if Exists
--------------------------------------------------
DROP TABLE IF EXISTS customers;

--------------------------------------------------
-- Create Table
--------------------------------------------------
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

--------------------------------------------------
-- Create Sequence
--------------------------------------------------
CREATE SEQUENCE customers_seq
START 1
INCREMENT 1;

--------------------------------------------------
-- Create Trigger Function
--------------------------------------------------
CREATE OR REPLACE FUNCTION auto_generate_pk()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id IS NULL THEN
        NEW.id := nextval('customers_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--------------------------------------------------
-- Create Trigger
--------------------------------------------------
CREATE TRIGGER customers_trigger
BEFORE INSERT ON customers
FOR EACH ROW
EXECUTE FUNCTION auto_generate_pk();

--------------------------------------------------
-- Insert Data
--------------------------------------------------
INSERT INTO customers (name, email) VALUES
('Anhad', 'anhad@gmail.com'),
('Rohit', 'rohit@gmail.com'),
('Kartik', 'kartik@gmail.com');

--------------------------------------------------
-- Display Output
--------------------------------------------------
SELECT * FROM customers;
```

---

## 📊 Output
- Automatically generated unique IDs for each record
- Records inserted without manually specifying primary key

<img width="887" height="721" alt="Exp-10 DBMS 24BAI70214_Out-1" src="https://github.com/user-attachments/assets/f91ecd83-87b9-419f-a230-0bb3b1939088" />
-- 
<img width="879" height="663" alt="Exp-10 DBMS 24BAI70214_Out-2" src="https://github.com/user-attachments/assets/3fab5fa0-afcf-45fe-81a8-6ede98ed217b" />

---

## 🔄 Input / Output Details

### Input

- Customer Name
- Email

### Output
- Automatically generated ID
- Customer Name
- Email

---

## 📚 Learning Outcome

After completing this experiment, the learner will be able to:

- Understand the purpose and working of database triggers.
- Implement automated primary key functionality using triggers.
- Ensure data integrity without manual key assignment.
- Apply trigger-based automation in real-world enterprise applications such as Amazon, Flipkart, and Oracle.

---

## 🧾 Result

The trigger was successfully created and executed. It automatically generated unique primary key values for each record during insertion, ensuring data integrity and eliminating manual errors.

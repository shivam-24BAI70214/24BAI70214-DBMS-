# Experiment 1 – Library Management System using SQL

## AIM
To design and implement a Library Management System database using SQL with appropriate tables, constraints, and relationships, and to perform DDL, DML, and DCL operations for secure database management.

## Software Requirements
- MySQL Workbench
- SQL Server

## OBJECTIVE
- To understand database creation and table design  
- To implement primary keys, foreign keys, and constraints  
- To perform insert, select, update, and delete operations  
- To create database users and manage privileges using GRANT and REVOKE commands  

## PRACTICAL / EXPERIMENT STEPS
1. Create and select the required database  
2. Create tables using DDL commands  
3. Apply primary key, foreign key, and check constraints  
4. Insert records into the tables  
5. Retrieve data using SELECT queries  
6. Create a librarian user  
7. Grant privileges to the user  
8. Revoke privileges when required  

## PROCEDURE OF THE EXPERIMENT
1. Start the system and log in to the computer.  
2. Open MySQL database server.  
3. Create and select the `library_db` database.  
4. Create tables for books, library visitors, and book issue records.  
5. Insert sample data into the tables.  
6. Execute SELECT queries to verify inserted records.  
7. Create a database user named **LIBRARIAN** with a password.  
8. Grant SELECT, INSERT, UPDATE, and DELETE privileges to the librarian.  
9. Revoke the privileges to verify access control.  

## SQL PROGRAM
```sql
USE library_db;

DROP TABLE IF EXISTS BOOK_ISSUE;
DROP TABLE IF EXISTS LIBRARY_VISITORS;
DROP TABLE IF EXISTS BOOK_S;

CREATE TABLE BOOK_S (
    BOOK_ID INT PRIMARY KEY,
    BOOK_NAME VARCHAR(20) NOT NULL,
    AUTHOR_NAME VARCHAR(20) NOT NULL,
    BOOK_COUNT INT NOT NULL CHECK (BOOK_COUNT > 0)
);

INSERT INTO BOOK_S VALUES
(101, 'HARRY POTTER', 'DAVID', 3);
```
<img width="1051" height="265" alt="ss_1" src="https://github.com/user-attachments/assets/5e522a7d-aab5-4a95-9466-e83aee24e5f9" />

```sql
CREATE TABLE LIBRARY_VISITORS (
    USER_ID INT PRIMARY KEY,
    NAME VARCHAR(20) NOT NULL,
    AGE INT NOT NULL CHECK (AGE >= 17),
    EMAIL VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO LIBRARY_VISITORS VALUES
(501, 'VANSH SHARMA', 18, 'vansh08@gmail.com'),
(502, 'VANI', 19, 'vani08@gmail.com');
```
<img width="1052" height="272" alt="ss_2" src="https://github.com/user-attachments/assets/dc3e3681-fa65-464f-b573-80df1479ed4a" />

```sql
CREATE TABLE BOOK_ISSUE (
    BOOK_ISSUE_ID INT PRIMARY KEY,
    USER_ID INT NOT NULL,
    BOOK_ID INT NOT NULL,
    ISSUE_DATE DATE,
    FOREIGN KEY (USER_ID) REFERENCES LIBRARY_VISITORS(USER_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES BOOK_S(BOOK_ID)
);

INSERT INTO BOOK_ISSUE VALUES
(1001, 501, 101, '2026-01-08');
```
<img width="1047" height="269" alt="ss_3" src="https://github.com/user-attachments/assets/68e95734-76f9-4d7a-8ec8-f3010a33282c" />

```sql
CREATE USER IF NOT EXISTS 'LIBRARIAN'@'localhost'
IDENTIFIED BY 'ShivamDBMS3819';

GRANT SELECT, INSERT, UPDATE, DELETE
ON library_db.BOOK_S TO 'LIBRARIAN'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE
ON library_db.BOOK_ISSUE TO 'LIBRARIAN'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE
ON library_db.LIBRARY_VISITORS TO 'LIBRARIAN'@'localhost';
```
<img width="1054" height="327" alt="Grant" src="https://github.com/user-attachments/assets/8f49999b-b9d3-43e1-9590-7ee6858395e5" />

<img width="1049" height="264" alt="ss_4" src="https://github.com/user-attachments/assets/275b1971-f58c-409b-bf0f-aebe392c063e" />

```sql
REVOKE SELECT, INSERT, UPDATE, DELETE
ON library_db.BOOK_S FROM 'LIBRARIAN'@'localhost';
```
<img width="1056" height="262" alt="ss_5" src="https://github.com/user-attachments/assets/7da315ec-e750-4e65-a0e7-a34e15a5a3c1" />

```sql
REVOKE SELECT, INSERT, UPDATE, DELETE
ON library_db.BOOK_ISSUE FROM 'LIBRARIAN'@'localhost';
```
<img width="1048" height="258" alt="ss_6" src="https://github.com/user-attachments/assets/6ee633cb-d61e-4346-8694-e353076352e9" />

```sql
REVOKE SELECT, INSERT, UPDATE, DELETE
ON library_db.LIBRARY_VISITORS FROM 'LIBRARIAN'@'localhost';
```
<img width="1055" height="332" alt="Grant__ss" src="https://github.com/user-attachments/assets/70608ae8-9b11-4232-9ec8-8772f6828238" />

<img width="1049" height="233" alt="ss_7" src="https://github.com/user-attachments/assets/9d6ee762-4a9a-4a47-b73b-eda40cd14e46" />


## LEARNING OUTCOME
- Learned how to design a relational database
- Understood the use of primary key and foreign key constraints
- Gained practical experience with DDL, DML, and DCL commands
- Learned role-based access control for database security
- Developed the ability to manage and secure database access using user roles and privilege control, ensuring data integrity and protection against unauthorized operations.

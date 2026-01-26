INSERT INTO books (id, name, author_name, count) 
VALUES (3, 'The Philosopher's Stone', 'J.K. Rowling', 5);

SELECT 
    table_name, 
    privilege_type 
FROM 
    information_schema.table_privileges 
WHERE 
    grantee = 'librarian';

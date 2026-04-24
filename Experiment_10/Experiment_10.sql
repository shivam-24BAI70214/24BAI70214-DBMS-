DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

CREATE SEQUENCE customers_seq
START 1
INCREMENT 1;

CREATE OR REPLACE FUNCTION auto_generate_pk()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id IS NULL THEN
        NEW.id := nextval('customers_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER customers_trigger
BEFORE INSERT ON customers
FOR EACH ROW
EXECUTE FUNCTION auto_generate_pk();

INSERT INTO customers (name, email) VALUES
('Anhad', 'anhad@gmail.com'),
('Rohit', 'rohit@gmail.com'),
('Kartik', 'kartik@gmail.com');

SELECT * FROM customers;

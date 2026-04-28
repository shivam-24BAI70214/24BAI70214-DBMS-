CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products VALUES
(1, 'Laptop'),
(2, 'Mobile'),
(3, 'Tablet');

INSERT INTO Orders VALUES
(101, 1),
(102, 1),
(103, 2);

SELECT p.product_name, COUNT(o.order_id) AS total_orders
FROM Products p
LEFT JOIN Orders o
ON p.product_id = o.product_id
GROUP BY p.product_name;

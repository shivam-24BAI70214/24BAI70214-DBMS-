CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO Suppliers VALUES
(1,'Anhad Traders','Delhi'),
(2,'Rohit Suppliers','Mumbai'),
(3,'Kartik Stores','Chandigarh');
DELIMITER $$
CREATE PROCEDURE SwapCities(
    IN id1 INT,
    IN id2 INT
)
BEGIN
    DECLARE city1 VARCHAR(50);
    DECLARE city2 VARCHAR(50);

    SELECT city INTO city1 FROM Suppliers WHERE supplier_id = id1;
    SELECT city INTO city2 FROM Suppliers WHERE supplier_id = id2;

    UPDATE Suppliers SET city = city2 WHERE supplier_id = id1;
    UPDATE Suppliers SET city = city1 WHERE supplier_id = id2;
END $$
DELIMITER ;
CALL SwapCities(1, 2);

-- 12. Realizar un procedimiento que seleccionar los campos nombre del producto, precio y stock (únicamente) de las frutas secas y mariscos.
USE NORTHWIND;
GO
-- Crear el procedimiento almacenado
CREATE PROCEDURE GetDriedFruitsAndSeafoodDetails
AS
BEGIN
    SELECT ProductName, UnitPrice, UnitsInStock
    FROM Products
    WHERE CategoryID IN (7, 8);
END;

-- Llamar al procedimiento almacenado
EXEC GetDriedFruitsAndSeafoodDetails;
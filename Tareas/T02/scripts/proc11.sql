-- 11. Realizar un procedimiento que seleccionar los campos nombre del producto y precio (únicamente) de los quesos y productos cárnicos.
USE NORTHWIND;
GO
-- Crear el procedimiento almacenado
CREATE PROCEDURE GetCheeseAndMeatProductsNameAndPrice
AS
BEGIN
    SELECT ProductName, UnitPrice
    FROM Products
    WHERE CategoryID IN (4, 6);
END;

-- Llamar al procedimiento almacenado
EXEC GetCheeseAndMeatProductsNameAndPrice;
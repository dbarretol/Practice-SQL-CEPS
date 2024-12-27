-- 9. Realizar un procedimiento que seleccionar los campos nombre del producto y precio (únicamente) de los  productos diferentes a cárnicos.
USE NORTHWIND;
GO
-- Crear el procedimiento almacenado
CREATE PROCEDURE GetNonMeatProductsNameAndPrice
AS
BEGIN
    SELECT ProductName, UnitPrice
    FROM Products
    WHERE CategoryID <> 6;
END;

-- Llamar al procedimiento almacenado
EXEC GetNonMeatProductsNameAndPrice;
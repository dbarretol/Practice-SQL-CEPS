-- 6. Realizar un procedimiento que seleccione todos los productos que no corresponde a la categoría bebidas (1)
USE NORTHWIND;
GO
-- Crear el procedimiento almacenado
CREATE PROCEDURE GetProductsNotInBeverages
AS
BEGIN
    SELECT *
    FROM Products
    WHERE CategoryID <> 1;
END;

-- Llamar al procedimiento almacenado
EXEC GetProductsNotInBeverages;
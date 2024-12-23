-- 10. Realizar un procedimiento que obtenga la cantidad de productos granos y cereales.
USE NORTHWIND;
GO
-- Crear el procedimiento almacenado
CREATE PROCEDURE GetCountOfGrainsAndCerealsProducts
AS
BEGIN
    SELECT COUNT(*) AS GrainsAndCerealsProductCount
    FROM Products
    WHERE CategoryID = 5;
END;

-- Llamar al procedimiento almacenado
EXEC GetCountOfGrainsAndCerealsProducts;
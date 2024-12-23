-- 13. Realizar un procedimiento que seleccionar el promedio de los precios de los confites.
USE NORTHWIND;
GO
-- Crear el procedimiento almacenado
CREATE PROCEDURE GetAveragePriceOfConfections
AS
BEGIN
    SELECT AVG(UnitPrice) AS AverageConfectionPrice
    FROM Products
    WHERE CategoryID = 3;
END;

-- Llamar al procedimiento almacenado
EXEC GetAveragePriceOfConfections;

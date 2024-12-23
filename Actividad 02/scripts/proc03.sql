-- 3. Realizar un procedimiento que determine la cantidad de registros que un cliente está en la tabla ORDERS.
USE NORTHWIND;
GO
-- Crear el procedimiento almacenado
CREATE PROCEDURE GetOrderCountByCustomer
    @CustomerID NCHAR(5)
AS
BEGIN
    SELECT 
        @CustomerID AS CustomerID,
        COUNT(*) AS OrderCount
    FROM Orders
    WHERE CustomerID = @CustomerID;
END;
GO

-- Llamar al procedimiento almacenado
EXEC GetOrderCountByCustomer @CustomerID = 'ALFKI';
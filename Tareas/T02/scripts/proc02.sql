-- 2. Crear un procedimiento que determine la cantidad de clientes cuyo identificador (o sea el código) inicia con un determinado carácter.
USE NORTHWIND;
GO
-- Crear el procedimiento almacenado
CREATE PROCEDURE GetCustomerCountByInitial
    @Initial CHAR(1)
AS
BEGIN
    SELECT 
        @Initial AS InitialCharacter,
        COUNT(*) AS CustomerCount
    FROM Customers
    WHERE CustomerID LIKE @Initial + '%';
END;
GO
-- Llamar al procedimiento almacenado
EXEC GetCustomerCountByInitial @Initial = 'A';
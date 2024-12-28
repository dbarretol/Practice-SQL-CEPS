-- 1. Realizar un procedimiento almacenado que devuelva los clientes (Customers) según el país (Country).
USE NORTHWIND;
GO
-- Crear el procedimiento almacenado
CREATE PROCEDURE GetCustomersByCountry
    @Country NVARCHAR(50)
AS
BEGIN
    SELECT 
        CustomerID,
        CompanyName,
        ContactName,
        ContactTitle,
        Address,
        City,
        Region,
        PostalCode,
        Country,
        Phone,
        Fax
    FROM Customers
    WHERE Country = @Country;
END;
GO

-- Llamar al procedimiento almacenado
EXEC GetCustomersByCountry @Country = 'Germany';
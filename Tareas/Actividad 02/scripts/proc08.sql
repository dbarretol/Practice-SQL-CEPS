-- 8. Realizar un procedimiento que seleccionar todos los campos de los registros que no corresponden a categoría mariscos de la tabla productos.
USE NORTHWIND;
GO
-- Crear el procedimiento almacenado
CREATE PROCEDURE GetProductsNotInSeafood
AS
BEGIN
    SELECT *
    FROM Products
    WHERE CategoryID <> 8;
END;

-- Llamar al procedimiento almacenado
EXEC GetProductsNotInSeafood;
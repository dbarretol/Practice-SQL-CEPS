-- 5. Realizar un procedimiento que seleccione todos los registros de tabla Productos y Categories a la vez.
USE NORTHWIND;
GO
-- Crear el procedimiento almacenado
CREATE PROCEDURE GetAllProductsAndCategories
AS
BEGIN
    SELECT Products.*, Categories.*
    FROM Products
    JOIN Categories ON Products.CategoryID = Categories.CategoryID;
END;

-- Llamar al procedimiento almacenado
EXEC GetAllProductsAndCategories;

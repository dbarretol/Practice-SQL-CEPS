-- 7. Realizar un procedimiento que obtenga la cantidad de registros que no corresponde a condimentos
USE NORTHWIND;
GO
-- Crear el procedimiento almacenado
CREATE PROCEDURE GetCountOfNonCondimentProducts
AS
BEGIN
    SELECT COUNT(*) AS NonCondimentProductCount
    FROM Products
    WHERE CategoryID <> 2;
END;

-- Llamar al procedimiento almacenado
EXEC GetCountOfNonCondimentProducts;

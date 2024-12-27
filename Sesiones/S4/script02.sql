--  ######################## PROCEDIMIENTOS ALMACENADOS  ########################  --

-- Crear la base de datos y usarla
CREATE DATABASE BDUNI
GO
USE BDUNI
GO

-- Crear la tabla ALUMNOS
CREATE TABLE ALUMNOS (
    CODALU INT NOT NULL PRIMARY KEY,
    NOMBRES VARCHAR(50),
    DISTRITO VARCHAR(40),
    EDAD INT
)
GO

-- ********* Insertar un registro en la tabla ALUMNOS *********
INSERT INTO ALUMNOS
VALUES (1, 'JUAN RIVERA', 'COMAS', 18)
GO

-- Crear el procedimiento almacenado SPU_INSERTALU
CREATE PROCEDURE SPU_INSERTALU
    @COD INT,
    @NOM VARCHAR(50),
    @DIS VARCHAR(40),
    @EDAD INT
AS
BEGIN
    INSERT INTO ALUMNOS VALUES (@COD, @NOM, @DIS, @EDAD)
END
GO

-- Ejecutar el procedimiento almacenado SPU_INSERTALU
EXECUTE SPU_INSERTALU 2, 'ANA SALAS', 'LOS OLIVOS', 19
GO

-- ********* Mostrar la tabla ALUMNOS *********
-- Crear el procedimiento almacenado SPU_LISTAALU
CREATE PROCEDURE SPU_LISTAALU
AS
BEGIN
    SELECT * FROM ALUMNOS
END
GO

-- Ejecutar el procedimiento almacenado SPU_LISTAALU
EXEC SPU_LISTAALU
GO

-- ********* Mostrar la tabla ALUMNOS en un distrito *********
-- Crear el procedimiento almacenado SPU_LISTAALU
CREATE PROCEDURE SPU_LISTAALU2 @DIS VARCHAR(40)
AS
BEGIN
    SELECT * FROM ALUMNOS WHERE [DISTRITO] = @DIS
END
GO

-- Ejecutar el procedimiento almacenado SPU_LISTAALU
EXEC SPU_LISTAALU2 'COMAS'
GO

-- ********* mODIFICAR REGISTROS INDIVIDUALES*********

-- Crear el procedimiento almacenado SPU_MODIALU
CREATE PROCEDURE SPU_MODIALU 
    @COD INT, 
    @NOM VARCHAR(50), 
    @DIS VARCHAR(40), 
    @EDAD INT
AS
BEGIN
    UPDATE ALUMNOS
    SET [NOMBRES] = @NOM, [DISTRITO] = @DIS, [EDAD] = @EDAD
    WHERE [CODALU] = @COD
END
GO

-- Ejecutar el procedimiento almacenado
EXEC SPU_MODIALU 2, 'ANA SALAS', 'LINCE', 20
GO

-- ********* ELIMINAR REGSITROS*********
-- Crear el procedimiento almacenado SPU_ELIMINAALU
CREATE PROCEDURE SPU_ELIMINAALU 
    @COD INT
AS
BEGIN
    DELETE FROM ALUMNOS
    WHERE [CODALU] = @COD
END
GO

-- Ejecutar el procedimiento almacenado SPU_ELIMINAALU
EXEC SPU_ELIMINAALU 1
GO

-- ********* MOSTRAR 5 PRODUCTOS MAS CAROS*********
USE NORTHWIND
GO
-- Verificar que el procedimiento no exista
IF OBJECT_ID('TOP5PRECIOS') IS NOT NULL
BEGIN
    DROP PROCEDURE TOP5PRECIOS
END
GO

CREATE PROCEDURE TOP5PRECIOS
AS
BEGIN
    SET ROWCOUNT 5
    SELECT * FROM PRODUCTS ORDER BY [UnitPrice] DESC
END
GO

-- Ejecutar el procedimiento almacenado TOP5PRECIOS
EXEC TOP5PRECIOS
GO


-- ********* Listar los pedidos realizados por un determinado cliente,
-- ingresando el nombre de la compañía como parámetro ********* 

CREATE PROCEDURE SPU_PEDIDOSCLI
    @CIA VARCHAR(50)
AS
BEGIN
    SELECT C.[CompanyName], C.[Country], P.[OrderID], P.[OrderDate]
    FROM [dbo].[Customers] C
    INNER JOIN [dbo].[Orders] P ON C.CustomerID = P.CustomerID
    WHERE C.[CompanyName] = @CIA
END
GO

EXEC SPU_PEDIDOSCLI 'Ana Trujillo Emparedados y helados'
EXEC SPU_PEDIDOSCLI [B's Beverages]

-- ******* SP para traer producto y precio ***********
CREATE PROCEDURE usp_Products_Traer_Nombre_Precio
    @ProductID INT,
    @ProductName VARCHAR(50) OUTPUT,
    @UnitPrice MONEY OUTPUT
AS
BEGIN
    SELECT 
        @ProductName = ProductName,
        @UnitPrice = UnitPrice
    FROM Products
    WHERE ProductID = @ProductID
END
GO

-- Llamar al procedimiento
DECLARE @Nombre VARCHAR(50), @Precio MONEY

EXECUTE usp_Products_Traer_Nombre_Precio
    10, @Nombre OUTPUT, @Precio OUTPUT

SELECT @Nombre AS Nombre, @Precio AS Precio
GO

-- ***** Procedimiento almacenado que cuenta los productos que empiezan con un determinado carácter (o caracteres) *******
CREATE PROCEDURE usp_Product_cantidad
    @ProductName VARCHAR(50)
AS
BEGIN
    DECLARE @Cantidad INT

    SELECT @Cantidad = COUNT(*)
    FROM Products 
    WHERE ProductName LIKE @ProductName + '%'

    RETURN @Cantidad
END
GO

-- Probar el procedimiento almacenado
DECLARE @R INT
EXECUTE @R = usp_Product_cantidad 'R'
SELECT @R AS Cantidad
GO



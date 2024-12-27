--  ######################## Manejo de errores  ########################  --

-- Implementar un script que permita mostrar los valores que emiten las
-- funciones de control de errores a partir de una división por cero.

BEGIN TRY
    -- Código que puede generar un error
    SELECT 1 / 0
END TRY
BEGIN CATCH
    -- Manejo de errores
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage
END CATCH
GO

-- Implementar un script que permita registrar un nuevo distrito;en caso
-- ocurriera algún error en el registro, mostrar un mensaje.
-- Crear la base de datos y usarla
CREATE DATABASE TALLERBD
GO
USE TALLERBD
GO

-- Manejo de errores
BEGIN TRY
    -- Código para insertar en la tabla DISTRITO
    DECLARE @COD CHAR(3) = 'D02',
            @DIS VARCHAR(40) = 'MIRAFLORES'

    INSERT INTO DISTRITO VALUES (@COD, @DIS)

    PRINT 'REGISTRO EXITOSO EN LA TABLA DISTRITO'
END TRY
BEGIN CATCH
    -- Manejo de errores
    PRINT 'ERROR AL REGISTRAR EN LA TABLA DISTRITO'
END CATCH
GO

SELECT * FROM [dbo].[DISTRITO]

-- ************** CAMBUAR TABLA ORDERS ******************
USE NORTHWIND
GO

SELECT * FROM [dbo].[Orders]
GO

UPDATE [dbo].[Orders]
SET [EmployeeID] = 10 
WHERE [OrderID] = 10248
GO

IF @@ERROR <> 0
    PRINT 'NO SE PUEDE ACTUALIZAR LA TABLA PEDIDOS'
GO

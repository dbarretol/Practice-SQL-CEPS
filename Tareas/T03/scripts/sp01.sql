USE DBL
GO
-- 1. Procedimiento almacenado que permita listar los datos de los clientes, dentro de los cuales se debe mostrar el nombre del distrito.
IF OBJECT_ID('SP_LISTACLIENTES') IS NOT NULL
    DROP PROCEDURE SP_LISTACLIENTES
GO

CREATE PROCEDURE SP_LISTACLIENTES
AS
BEGIN
    SELECT C.IDE_CLI AS CODIGO, 
           C.APE_CLI AS APELLIDOS,
           C.NOM_CLI AS NOMBRES, 
           C.DNI_CLI AS DNI,
           C.TEL_CLI AS TELEFONO,
           D.DES_DIS AS DISTRITO,
           C.COR_CLI AS CORREO
    FROM CLIENTE C
    JOIN DISTRITO D ON C.IDE_DIS = D.IDE_DIS
END
GO

-- PRUEBA:
EXEC SP_LISTACLIENTES
GO
-- #### CASO DESARROLLADO: Procedimientos alamcenados #### 
USE DBL
GO

-- Implemente los siguientes procedimientos almacenados:

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

-- 2. Procedimientos almacenados que permitan dar mantenimiento a la tabla CLIENTE.
IF OBJECT_ID('SP_NUEVOCLIENTE') IS NOT NULL
    DROP PROCEDURE SP_NUEVOCLIENTE
GO

CREATE PROCEDURE SP_NUEVOCLIENTE(
    @COD CHAR(5),
    @APE VARCHAR(30),
    @NOM VARCHAR(30),
    @DNI CHAR(8),
    @TEL VARCHAR(25),
    @DIS CHAR(3),
    @COR VARCHAR(50)
)
AS
BEGIN
    INSERT INTO CLIENTE VALUES (@COD, @APE, @NOM, @DNI, @TEL, @DIS, @COR)
END
GO

IF OBJECT_ID('SP_MODIFICACLIENTE') IS NOT NULL
    DROP PROCEDURE SP_MODIFICACLIENTE
GO

CREATE PROCEDURE SP_MODIFICACLIENTE(
    @COD CHAR(5),
    @APE VARCHAR(30),
    @NOM VARCHAR(30),
    @DNI CHAR(8),
    @TEL VARCHAR(25),
    @DIS CHAR(3),
    @COR VARCHAR(50)
)
AS
BEGIN
    UPDATE CLIENTE
    SET APE_CLI = @APE, NOM_CLI = @NOM,
        DNI_CLI = @DNI, TEL_CLI = @TEL,
        IDE_DIS = @DIS, COR_CLI = @COR
    WHERE IDE_CLI = @COD
END
GO

IF OBJECT_ID('SP_ELIMINACLIENTE') IS NOT NULL
    DROP PROCEDURE SP_ELIMINACLIENTE
GO

CREATE PROCEDURE SP_ELIMINACLIENTE(
    @COD CHAR(5)
)
AS
BEGIN
    DELETE FROM CLIENTE
    WHERE IDE_CLI = @COD
END
GO

-- PRUEBA
EXEC SP_NUEVOCLIENTE 'CL009', 'ROLF', 'CARLOS', '45784598', '541-5858', 'L05', 'CROLF@GMAIL.COM'
GO

EXEC SP_MODIFICACLIENTE 'CL009', 'ROLF', 'CARLOS', '45784598', '541-5858', 'L05', 'CROLF@GMAIL.COM'
GO

EXEC SP_ELIMINACLIENTE 'CL009'
GO

-- 3. Procedimiento almacenado que determine el �ltimo c�digo del cliente registrado.
IF OBJECT_ID('SP_ULTIMOCODIGO') IS NOT NULL
    DROP PROCEDURE SP_ULTIMOCODIGO
GO

CREATE PROCEDURE SP_ULTIMOCODIGO
AS
BEGIN
    SELECT TOP 1 C.IDE_CLI
    FROM CLIENTE C
    ORDER BY C.IDE_CLI DESC
END
GO

-- PRUEBA
EXEC SP_ULTIMOCODIGO
GO

-- 4. Procedimiento almacenado que muestre el total de clientes por distrito.
IF OBJECT_ID('SP_TOTALCLIENTESXDISTRITO') IS NOT NULL
    DROP PROCEDURE SP_TOTALCLIENTESXDISTRITO
GO

CREATE PROCEDURE SP_TOTALCLIENTESXDISTRITO
AS
BEGIN
    SELECT D.DES_DIS AS DISTRITO,
           COUNT(*) AS [TOTAL DE CLIENTES]
    FROM CLIENTE C
    JOIN DISTRITO D ON C.IDE_DIS = D.IDE_DIS
    GROUP BY D.DES_DIS
END
GO

-- PRUEBA
EXEC SP_TOTALCLIENTESXDISTRITO
GO

-- 5. Procedimiento almacenado que permita listar los clientes de un determinado distrito.
IF OBJECT_ID('SP_CLIENTESxDISTRITO') IS NOT NULL
    DROP PROCEDURE SP_CLIENTESxDISTRITO
GO

CREATE PROCEDURE SP_CLIENTESxDISTRITO(
    @DISTRITO VARCHAR(30)
)
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
    WHERE D.DES_DIS = @DISTRITO
END
GO

-- PRUEBA
EXEC SP_CLIENTESxDISTRITO 'LOS OLIVOS'
GO

-- 6. Procedimiento almacenado que permita mostrar informaci�n del detalle de alquiler, de acuerdo al n�mero de alquiler.
IF OBJECT_ID('SP_DETALLEALQUILER') IS NOT NULL
    DROP PROCEDURE SP_DETALLEALQUILER
GO

CREATE PROCEDURE SP_DETALLEALQUILER (
    @NUMERO INT
)
AS
BEGIN
    SELECT D.NUM_ALQ AS ALQUILER,
           C.NOM_CLI + SPACE(1) + C.APE_CLI AS CLIENTE,
           D.MAT_AUT AS MATRICULA
    FROM DETALLEALQUILER D
    JOIN CLIENTE C ON D.IDE_CLI = C.IDE_CLI
    WHERE D.NUM_ALQ = @NUMERO
END
GO

-- PRUEBA
EXEC SP_DETALLEALQUILER '2'
GO


-- 7. Procedimiento almacenado que permita mostrar los registros de autom�viles de un determinado color.
IF OBJECT_ID('SP_AUTOSxCOLOR') IS NOT NULL
    DROP PROCEDURE SP_AUTOSxCOLOR
GO

CREATE PROCEDURE SP_AUTOSxCOLOR(
    @COLOR VARCHAR(30)
)
AS
BEGIN
    SELECT A.MAT_AUT AS MATRICULA,
           A.COL_AUT AS COLOR,
           A.MOD_AUT AS MODELO
    FROM AUTOMOVIL A
    WHERE A.COL_AUT = @COLOR
END
GO

-- PRUEBA
EXEC SP_AUTOSxCOLOR 'NEGRO'
GO

-- 8. Procedimiento almacenado que muestra el detalle de alquiler de acuerdo al nombre de un determinado cliente.
IF OBJECT_ID('SP_DETALLExCLIENTE') IS NOT NULL
    DROP PROCEDURE SP_DETALLExCLIENTE
GO

CREATE PROCEDURE SP_DETALLExCLIENTE(
    @CLIENTE VARCHAR(30)
)
AS
BEGIN
    SELECT D.NUM_ALQ AS ALQUILER,
           C.NOM_CLI + SPACE(1) + C.APE_CLI AS CLIENTE,
           D.MAT_AUT AS MATRICULA
    FROM CLIENTE C
    JOIN DETALLEALQUILER D ON C.IDE_CLI = D.IDE_CLI
    WHERE C.NOM_CLI + SPACE(1) + C.APE_CLI = @CLIENTE
END
GO

-- PRUEBA
EXEC SP_DETALLExCLIENTE 'MANUEL CARLOS'
GO

-- 9. Procedimiento almacenado que permita listar los alquileres de un determinado a�o de registro.
IF OBJECT_ID('SP_ALQUILERxA�O') IS NOT NULL
    DROP PROCEDURE SP_ALQUILERxA�O
GO

CREATE PROCEDURE SP_ALQUILERxA�O(
    @A�O INT
)
AS
BEGIN
    SELECT A.NUM_ALQ AS ALQUILER,
           A.FEC_ALQ AS FECHA,
           A.MON_ALQ AS MONTO
    FROM ALQUILER A
    WHERE YEAR(A.FEC_ALQ) = @A�O
END
GO

-- PRUEBA
EXEC SP_ALQUILERxA�O 2012
GO

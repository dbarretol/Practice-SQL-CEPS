-- ######### FUNCIONES DEFINIDAS POR EL USUARIO ######
USE NORTHWIND
GO
-- DETERMINAR EL MAYOR DE 3 NUMEROS
-- SOL 1
DECLARE @N1 INT = 15, @N2 INT = 8, @N3 INT = 23, @MAYOR INT
SET @MAYOR = IIF((@N1 > @N2 AND @N1 > @N3), @N1, IIF((@N2 > @N1 AND @N2 > @N3), @N2, @N3))
PRINT 'EL MAYOR NUMERO ES: ' + STR(@MAYOR)

-- ***************** Funcion personalizada *****************
CREATE FUNCTION FN_MAXDOS(@N1 INT, @N2 INT) RETURNS INT
BEGIN
    RETURN IIF(@N1 > @N2, @N1, @N2)
END
GO

-- Ejemplo de uso de la función+
PRINT DBO.FN_MAXDOS(7, 3)

-- ***************** Funcion que determine el mayor de 3 numeros *****************
CREATE FUNCTION FN_MAX3(@N1 INT, @N2 INT, @N3 INT)
RETURNS INT
AS
BEGIN
    RETURN IIF(@N1 > @N2 AND @N1 > @N3, @N1, IIF(@N2 > @N3, @N2, @N3))
END
GO

-- Ejemplo de uso de la función
PRINT DBO.FN_MAX3(7, 13, 25)
PRINT DBO.FN_MAX3(47, 33, 25)

-- otra forma
CREATE FUNCTION FN_MAXTRES(@N1 INT, @N2 INT, @N3 INT)
RETURNS INT
AS
BEGIN
    RETURN DBO.FN_MAXDOS(DBO.FN_MAXDOS(@N1, @N2), @N3)
END
GO

-- Ejemplo de uso de la función
PRINT DBO.FN_MAXTRES(17, 13, 25)

-- ******************************
USE TALLERBD
GO
PRINT DBO.FN_MAXTRES(17, 13, 25) -- Arroja error porque la funcion fue definida en otro xontexto (BD)
PRINT [NORTHWIND].DBO.FN_MAXTRES(17, 13, 25) -- Funciona correctamente

-- ***********************************************************

USE NORTHWIND
GO

CREATE TABLE NOTAS
(
    IDEVAL INT NOT NULL PRIMARY KEY,
    CURSO VARCHAR(30),
    P1 INT,
    P2 INT,
    P3 INT,
    PROM AS ((P1 + P2 + P3) / 3)
);

INSERT INTO NOTAS (IDEVAL, CURSO, P1, P2, P3)
VALUES 
    (1, 'EXCEL 1', 10, 15, 12),
    (2, 'SQL SERVER', 20, 15, 18),
    (3, 'REDES', 10, 11, 12);

-- Selecciona todos los datos de la tabla NOTAS
SELECT * FROM NOTAS;

-- Selecciona los datos específicos y calcula el mayor de las tres notas
SELECT 
    [IDEVAL], 
    [CURSO], 
    [P1], 
    [P2], 
    [P3], 
    DBO.FN_MAXTRES(P1, P2, P3) AS MAYOR,
    [PROM] 
FROM 
    [dbo].[NOTAS];

-- ********* Consulta generada como objeto tabla *********
SELECT 
    [IDEVAL], 
    [CURSO], 
    [P1], 
    [P2], 
    [P3], 
    DBO.FN_MAXTRES(P1, P2, P3) AS MAYOR,
    [PROM]
INTO REPORTE
FROM [dbo].[NOTAS];

-- ******** Ejercicio Paises ******
CREATE FUNCTION FN_GetCountry (@CUS_ID CHAR(5))
RETURNS VARCHAR(15)
BEGIN
    DECLARE @CUS_COUNTRY VARCHAR(15)
    SET @CUS_COUNTRY = 'Cliente NE'
    SELECT @CUS_COUNTRY = c.Country 
    FROM Customers c 
    WHERE c.CustomerID = @CUS_ID
    RETURN @CUS_COUNTRY
END
GO

-- Pruebas de la función
SELECT dbo.FN_GetCountry('ANATR') AS Pais;
SELECT dbo.FN_GetCountry('NNNNN') AS Pais;

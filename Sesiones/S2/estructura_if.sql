-- Estructuras de control de flujo --

-- ******** Mostrar el mensaje aprobado para una determinada evaluaci�n ******** 
DECLARE @N1 INT = 15,
        @N2 INT = 13,
        @PROM DECIMAL(5, 2)

-- Calcular el promedio
SET @PROM = (@N1 + @N2) / 2.0

-- Imprimir el promedio final
PRINT 'PROMEDIO FINAL: ' + CAST(@PROM AS CHAR(5))

-- Determinar si es aprobado o desaprobado
IF @PROM >= 10.5
    PRINT 'APROBADO'
ELSE
    PRINT 'DESAPROBADO'


-- ******** Realizar un script que eval�e qui�n es el mayor de dos n�meros enteros ******** 
DECLARE @N1 INT = 15,
        @N2 INT = 24,
        @R INT

-- Evaluar qui�n es el mayor
IF @N1 > @N2
    SET @R = @N1
ELSE
    SET @R = @N2

-- Imprimir el mayor n�mero
PRINT 'EL MAYOR N�MERO ES: ' + STR(@R)

-- ******** Qu� pasar�a si los 2 n�meros son iguales ******** 
DECLARE @N1 INT = 24,
        @N2 INT = 24,
        @R INT

-- Evaluar qui�n es el mayor o si son iguales
IF @N1 > @N2
    SET @R = @N1
ELSE IF @N2 > @N1
    SET @R = @N2
ELSE
    PRINT 'LOS N�MEROS SON IGUALES'

-- Imprimir el mayor n�mero si no son iguales
IF @N1 <> @N2
    PRINT 'EL MAYOR N�MERO ES: ' + STR(@R)

-- ******** Realizar un script que eval�e un n�mero entero, si es positivo, negativo o cero
DECLARE @N1 INT = 5

-- Evaluar si el n�mero es negativo, cero o positivo
IF @N1 < 0
    PRINT 'EL N�MERO ES NEGATIVO'
ELSE IF @N1 = 0
    PRINT 'EL N�MERO ES CERO'
ELSE
    PRINT 'EL N�MERO ES POSITIVO'


-- ******** Identificar el tipo de tri�ngulo ingresando sus lados, validar si el tri�ngulo existe o no ******** 
DECLARE @A DECIMAL(7,2) = 4,
        @B DECIMAL(7,2) = 4,
        @C DECIMAL(7,2) = 14,
        @TIPO VARCHAR(20)

-- Validar si el tri�ngulo existe
IF ((@A + @B > @C) AND (@A + @C > @B) AND (@C + @B > @A))
BEGIN
    PRINT 'EL TRI�NGULO EXISTE'

    -- Identificar el tipo de tri�ngulo
    IF (@A = @B AND @B = @C)
        SET @TIPO = 'EQUILATERO'
    ELSE IF (@A = @B OR @B = @C OR @C = @A)
        SET @TIPO = 'IS�SCELES'
    ELSE
        SET @TIPO = 'ESCALENO'

    PRINT 'EL TIPO DE TRI�NGULO ES ' + @TIPO
END
ELSE
    PRINT 'EL TRI�NGULO NO EXISTE'


-- ******** Ejercicio: Distrito ********
CREATE DATABASE TALLERBD
GO
USE TALLERBD
GO

CREATE TABLE DISTRITO (
    COD_DIS CHAR(5) NOT NULL PRIMARY KEY,
    NOM_DIS VARCHAR(50)
)
GO

-- Declaramos las variables y les asignamos valor
DECLARE @CODIGO CHAR(5) = 'D38',
        @NOMBRE VARCHAR(40) = 'NUEVO SAN JUAN'
-- Buscamos la existencia de dicho distrito
IF EXISTS (SELECT * FROM DISTRITO WHERE NOM_DIS = @NOMBRE)
BEGIN
    PRINT 'DISTRITO YA SE ENCUENTRA REGISTRADO'
END
ELSE
BEGIN
    INSERT INTO DISTRITO VALUES (@CODIGO, @NOMBRE)
    PRINT 'DISTRITO REGISTRADO CORRECTAMENTE'
END
GO


-- ******** Ejercicio: Facturas ******** 
USE TALLERBD
GO

CREATE TABLE FACTURA (
    NUM_FAC VARCHAR(12) PRIMARY KEY,
    FEC_FAC DATE,
    COD_CLI CHAR(5),
    FEC_CAN DATE,
    EST_FAC VARCHAR(10),
    COD_VEN CHAR(3),
    POR_IGV DECIMAL(18, 0)
);

-- Comprobaci�n de facturas para un a�o espec�fico
DECLARE @TOTAL INT
DECLARE @A�O INT = 2017

-- Consulta para contar el n�mero de facturas en un a�o espec�fico
SELECT @TOTAL = COUNT(*) 
FROM FACTURA F 
WHERE YEAR(F.FEC_FAC) = @A�O

-- Imprimir el resultado
IF @TOTAL > 0
BEGIN
    PRINT 'EN EL A�O ' + CAST(@A�O AS CHAR(4)) + ' HAY ' + CAST(@TOTAL AS CHAR(2)) + ' FACTURAS REGISTRADAS'
END
ELSE
BEGIN
    PRINT 'EN EL A�O ' + CAST(@A�O AS CHAR(4)) + ' NO HAY FACTURAS REGISTRADAS'
END
GO

-- ******** Ejercicio: Productos ******** 
USE TALLERBD
GO

CREATE TABLE PRODUCTO (
    COD_PRO CHAR(5) PRIMARY KEY,
    DES_PRO VARCHAR(50),
    PRE_PRO MONEY,
    SAC_PRO INT,
    SMI_PRO INT,
    UNI_PRO VARCHAR(30),
    LIN_PRO VARCHAR(30),
    IMP_PRO VARCHAR(10)
);

DECLARE @UNIDAD CHAR(3) = 'UNI',
        @TOTAL INT

-- Consulta para contar el n�mero de productos por tipo de unidad
SELECT @TOTAL = COUNT(*)
FROM PRODUCTO
WHERE UNI_PRO = @UNIDAD

-- Imprimir resultados
PRINT 'EL TIPO DE UNIDAD ' + @UNIDAD
PRINT 'TIENE UN TOTAL DE ' + CAST(@TOTAL AS VARCHAR(5)) + ' PRODUCTOS'

-- Evaluar condiciones
IF @TOTAL > 0 AND @TOTAL < 10
    PRINT 'CONDICI�N: INICIAR REPORTE'
ELSE
    PRINT 'CONDICI�N: CONFORME'
GO

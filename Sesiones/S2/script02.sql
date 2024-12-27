-- Estructuras de control de flujo --

-- ******** Mostrar el mensaje aprobado para una determinada evaluación ******** 
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


-- ******** Realizar un script que evalúe quién es el mayor de dos números enteros ******** 
DECLARE @N1 INT = 15,
        @N2 INT = 24,
        @R INT

-- Evaluar quién es el mayor
IF @N1 > @N2
    SET @R = @N1
ELSE
    SET @R = @N2

-- Imprimir el mayor número
PRINT 'EL MAYOR NÚMERO ES: ' + STR(@R)

-- ******** Qué pasaría si los 2 números son iguales ******** 
DECLARE @N1 INT = 24,
        @N2 INT = 24,
        @R INT

-- Evaluar quién es el mayor o si son iguales
IF @N1 > @N2
    SET @R = @N1
ELSE IF @N2 > @N1
    SET @R = @N2
ELSE
    PRINT 'LOS NÚMEROS SON IGUALES'

-- Imprimir el mayor número si no son iguales
IF @N1 <> @N2
    PRINT 'EL MAYOR NÚMERO ES: ' + STR(@R)

-- ******** Realizar un script que evalúe un número entero, si es positivo, negativo o cero
DECLARE @N1 INT = 5

-- Evaluar si el número es negativo, cero o positivo
IF @N1 < 0
    PRINT 'EL NÚMERO ES NEGATIVO'
ELSE IF @N1 = 0
    PRINT 'EL NÚMERO ES CERO'
ELSE
    PRINT 'EL NÚMERO ES POSITIVO'


-- ******** Identificar el tipo de triángulo ingresando sus lados, validar si el triángulo existe o no ******** 
DECLARE @A DECIMAL(7,2) = 4,
        @B DECIMAL(7,2) = 4,
        @C DECIMAL(7,2) = 14,
        @TIPO VARCHAR(20)

-- Validar si el triángulo existe
IF ((@A + @B > @C) AND (@A + @C > @B) AND (@C + @B > @A))
BEGIN
    PRINT 'EL TRIÁNGULO EXISTE'

    -- Identificar el tipo de triángulo
    IF (@A = @B AND @B = @C)
        SET @TIPO = 'EQUILATERO'
    ELSE IF (@A = @B OR @B = @C OR @C = @A)
        SET @TIPO = 'ISÓSCELES'
    ELSE
        SET @TIPO = 'ESCALENO'

    PRINT 'EL TIPO DE TRIÁNGULO ES ' + @TIPO
END
ELSE
    PRINT 'EL TRIÁNGULO NO EXISTE'


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

-- Comprobación de facturas para un año específico
DECLARE @TOTAL INT
DECLARE @AÑO INT = 2017

-- Consulta para contar el número de facturas en un año específico
SELECT @TOTAL = COUNT(*) 
FROM FACTURA F 
WHERE YEAR(F.FEC_FAC) = @AÑO

-- Imprimir el resultado
IF @TOTAL > 0
BEGIN
    PRINT 'EN EL AÑO ' + CAST(@AÑO AS CHAR(4)) + ' HAY ' + CAST(@TOTAL AS CHAR(2)) + ' FACTURAS REGISTRADAS'
END
ELSE
BEGIN
    PRINT 'EN EL AÑO ' + CAST(@AÑO AS CHAR(4)) + ' NO HAY FACTURAS REGISTRADAS'
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

-- Consulta para contar el número de productos por tipo de unidad
SELECT @TOTAL = COUNT(*)
FROM PRODUCTO
WHERE UNI_PRO = @UNIDAD

-- Imprimir resultados
PRINT 'EL TIPO DE UNIDAD ' + @UNIDAD
PRINT 'TIENE UN TOTAL DE ' + CAST(@TOTAL AS VARCHAR(5)) + ' PRODUCTOS'

-- Evaluar condiciones
IF @TOTAL > 0 AND @TOTAL < 10
    PRINT 'CONDICIÓN: INICIAR REPORTE'
ELSE
    PRINT 'CONDICIÓN: CONFORME'
GO

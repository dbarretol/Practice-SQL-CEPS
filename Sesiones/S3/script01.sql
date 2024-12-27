--  ######################## Estructuras de control : CASE  ########################  --


-- ******** Establecer el formato de fecha ******** 
SET DATEFORMAT DMY

-- Declarar variables
DECLARE @FECHAHOY DATE,
        @MES INT,
        @NMES VARCHAR(15)

-- Asignar valores a las variables
SET @FECHAHOY = '16/2/2024'
SET @MES = MONTH(@FECHAHOY)

SET @NMES = CASE @MES
    WHEN 1 THEN 'ENERO'
    WHEN 2 THEN 'FEBRERO'
    WHEN 3 THEN 'MARZO'
    WHEN 4 THEN 'ABRIL'
    WHEN 5 THEN 'MAYO'
    WHEN 6 THEN 'JUNIO'
    WHEN 7 THEN 'JULIO'
    WHEN 8 THEN 'AGOSTO'
    WHEN 9 THEN 'SEPTIEMBRE'
    WHEN 10 THEN 'OCTUBRE'
    WHEN 11 THEN 'NOVIEMBRE'
    WHEN 12 THEN 'DICIEMBRE'
    ELSE 'MES DESCONOCIDO'
END

PRINT @NMES

--  ********  Indica la cantidad de días que tiene el mes correspondiente a una determinada fecha ******** 
DECLARE @fechahoy DATE,
        @mes INT,
        @Nmes VARCHAR(10),
        @dias INT

-- Asignar valores a las variables
SET @fechahoy = '16/12/2024'
SET @mes = MONTH(@fechahoy)

-- Determinar la cantidad de días del mes
SET @dias = CASE @mes
    WHEN 1 THEN 31
    WHEN 2 THEN 28 -- No estamos considerando años bisiestos aquí
    WHEN 3 THEN 31
    WHEN 4 THEN 30
    WHEN 5 THEN 31
    WHEN 6 THEN 30
    WHEN 7 THEN 31
    WHEN 8 THEN 31
    WHEN 9 THEN 30
    WHEN 10 THEN 31
    WHEN 11 THEN 30
    WHEN 12 THEN 31
    ELSE 0 -- Por si acaso, para manejar cualquier valor inesperado
END

-- Imprimir la cantidad de días
PRINT CAST(@dias AS VARCHAR(2)) + ' días'

-- ******** version optimizada: Indica la cantidad de días que tiene el mes correspondiente a una determinada fecha ********
DECLARE @fechahoy DATE,
        @mes INT,
        @anio INT,
        @dias INT

-- Asignar valores a las variables
SET @fechahoy = '16/06/2024'
SET @mes = MONTH(@fechahoy)
SET @anio = YEAR(@fechahoy)

-- Determinar la cantidad de días del mes
SET @dias = CASE 
    WHEN @mes IN (1, 3, 5, 7, 8, 10, 12) THEN 31
    WHEN @mes IN (4, 6, 9, 11) THEN 30
    WHEN @mes = 2 THEN CASE 
        WHEN (@anio % 4 = 0 AND @anio % 100 <> 0) OR (@anio % 400 = 0) THEN 29
        ELSE 28
    END
    ELSE 0 -- Por si acaso, para manejar cualquier valor inesperado
END

-- Imprimir la cantidad de días
PRINT CAST(@dias AS VARCHAR(2)) + ' días'


-- SACAR UN MENSAJE DE LA ETAPA DE UNA PERSONA SEGUN SU EDAD, SE INGRESARA LA FECHA DE
-- NACIMIENTO, CALCULAR LA EDAD E INDICAR SI ES UN NIÑO (0-11), ADOLESCENTE (12-17),
-- ADULTO (18-60), ADULTO MAYOR MAS DE 60 AÑOS

-- SACAR UN MENSAJE DE LA ETAPA DE UNA PERSONA SEGÚN SU EDAD.
-- SE INGRESARÁ LA FECHA DE NACIMIENTO, CALCULAR LA EDAD E INDICAR SI ES UN NIÑO (0-11),
-- ADOLESCENTE (12-17), ADULTO (18-60), ADULTO MAYOR MÁS DE 60 AÑOS.

DECLARE @FECHANAC DATE,
        @EDAD INT,
        @MENS VARCHAR(15)

SET @FECHANAC = '16/12/2000'-- Asignar valor a la fecha de nacimiento
SET @EDAD = DATEDIFF(YEAR, @FECHANAC, GETDATE())-- Calcular la edad

-- Determinar la etapa de la persona
SET @MENS = CASE
    WHEN @EDAD >= 0 AND @EDAD <= 11 THEN 'NIÑO'				-- WHEN @EDAD BETWEEN 0 AND 11 THEN 'NIÑO'
    WHEN @EDAD >= 12 AND @EDAD <= 17 THEN 'ADOLESCENTE'		-- WHEN @EDAD BETWEEN 12 AND 17 THEN 'ADOLESCENTE'
    WHEN @EDAD >= 18 AND @EDAD <= 60 THEN 'ADULTO'			-- WHEN @EDAD BETWEEN 18 AND 60 THEN 'ADULTO'
    WHEN @EDAD > 60 THEN 'ADULTO MAYOR'
    ELSE 'DESCONOCIDO' -- Por si acaso la edad no se encuentra dentro de los rangos
END

-- Imprimir el mensaje
PRINT 'LA PERSONA ES UN : ' + @MENS

-- ******** Reemplazar tratamiento de usuario ******** 
USE NORTHWIND
GO

SELECT 
    [EmployeeID], 
    [FirstName], 
    [LastName],
    CASE [TitleOfCourtesy]
        WHEN 'Mrs.' THEN 'SEÑORA'
        WHEN 'Ms.' THEN 'SEÑORITA'
        WHEN 'Mr.' THEN 'SEÑOR'
        WHEN 'Dr.' THEN 'DOCTOR'
        ELSE 'DESCONOCIDO' -- Por si acaso algún título no está contemplado
    END AS TRATAMIENTO
FROM [dbo].[Employees]


-- ######################## Estructuras de control : WHILE  ########################  --

-- ******** TABLA DE MULTIPLICAR DEL 1 AL 12 DE CUALQUIER NÚMERO ********

DECLARE @N INT = 12,
        @I INT = 1

WHILE (@I <= 12)
BEGIN
    PRINT CAST(@I AS CHAR(2)) + ' * ' + CAST(@N AS CHAR(2)) + ' = ' + CAST(@I * @N AS CHAR(3))
    SET @I = @I + 1
END

-- ******** MOSTRAR LOS # PRODUCTOS MAS CAROS USANDO WHILE ********
-- Mostrar los 3 productos más caros, usando WHILE
USE NORTHWIND
GO

DECLARE @N INT = 3,
        @I INT = 1

-- Crear una tabla temporal para almacenar los productos ordenados por precio
CREATE TABLE #TopProducts (
    RowNum INT IDENTITY(1, 1),
    ProductName VARCHAR(40),
    UnitPrice MONEY
)

-- Insertar los productos ordenados por precio en la tabla temporal
INSERT INTO #TopProducts (ProductName, UnitPrice)
SELECT [ProductName], [UnitPrice]
FROM [dbo].[Products]
ORDER BY [UnitPrice] DESC

-- Usar WHILE para mostrar los productos más caros
WHILE @I <= @N
BEGIN
    SELECT [ProductName], [UnitPrice]
    FROM #TopProducts
    WHERE RowNum = @I
    
    SET @I = @I + 1
END

-- Eliminar la tabla temporal
DROP TABLE #TopProducts

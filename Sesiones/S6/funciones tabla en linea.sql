-- ############## Funciones TABLA EN LINEA ###########################
USE NORTHWIND
GO
-- Selección de todos los datos de la tabla NOTAS
SELECT * FROM NOTAS;

-- Creación de la función que retorna la tabla NOTAS
CREATE FUNCTION FN_NOTAS()
RETURNS TABLE
AS
RETURN (SELECT * FROM NOTAS);
GO

-- Selección de todos los datos utilizando la función creada
SELECT * FROM DBO.FN_NOTAS();
GO

-- ************************** FUNCION: Retorna clinte por pais **************************
-- Creación de la función que retorna los clientes por país
CREATE FUNCTION FN_CLIENTESXPAIS(@P NVARCHAR(15))
RETURNS TABLE
AS
RETURN (
    SELECT * FROM Customers
    WHERE Country = @P
);
GO

-- Selección de clientes del país especificado utilizando la función FN_CLIENTESXPAIS
SELECT * FROM FN_CLIENTESXPAIS('Mexico');
SELECT * FROM FN_CLIENTESXPAIS('BRAZIL');
GO

-- ############## Funciones TABLA MULTISENTENCIA ###########################
CREATE FUNCTION FN_NOTASCP()
RETURNS @TABLA TABLE (
    CUR VARCHAR(30),
    PR INT
)
AS
BEGIN
    INSERT INTO @TABLA
    SELECT CURSO, PROM
    FROM NOTAS;
    RETURN;
END
GO

-- Selección de datos usando la función creada
SELECT * FROM FN_NOTASCP();
GO

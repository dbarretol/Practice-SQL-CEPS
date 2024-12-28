-- ############## Funciones TABLA EN LINEA ###########################
USE NORTHWIND
GO
-- Selecci�n de todos los datos de la tabla NOTAS
SELECT * FROM NOTAS;

-- Creaci�n de la funci�n que retorna la tabla NOTAS
CREATE FUNCTION FN_NOTAS()
RETURNS TABLE
AS
RETURN (SELECT * FROM NOTAS);
GO

-- Selecci�n de todos los datos utilizando la funci�n creada
SELECT * FROM DBO.FN_NOTAS();
GO

-- ************************** FUNCION: Retorna clinte por pais **************************
-- Creaci�n de la funci�n que retorna los clientes por pa�s
CREATE FUNCTION FN_CLIENTESXPAIS(@P NVARCHAR(15))
RETURNS TABLE
AS
RETURN (
    SELECT * FROM Customers
    WHERE Country = @P
);
GO

-- Selecci�n de clientes del pa�s especificado utilizando la funci�n FN_CLIENTESXPAIS
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

-- Selecci�n de datos usando la funci�n creada
SELECT * FROM FN_NOTASCP();
GO

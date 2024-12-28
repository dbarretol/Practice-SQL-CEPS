/* 9. Implemente una función multisentencia que permita mostrar todos los registros de los automóviles. */
USE DBL
GO

-- Verifica si la función existe y la elimina si es necesario
IF OBJECT_ID('FN_LISTADOAUTOS') IS NOT NULL
BEGIN
    DROP FUNCTION FN_LISTADOAUTOS;
END
GO

-- Implementación de la función
CREATE FUNCTION FN_LISTADOAUTOS()
RETURNS @TABLA TABLE (
    CODIGO CHAR(10),
    COLOR VARCHAR(30),
    MODELO VARCHAR(30)
)
AS
BEGIN
    INSERT INTO @TABLA
    SELECT A.MAT_AUT, A.COL_AUT, A.MOD_AUT
    FROM AUTOMOVIL A;

    RETURN;
END
GO

-- Prueba:
SELECT * FROM FN_LISTADOAUTOS();
GO

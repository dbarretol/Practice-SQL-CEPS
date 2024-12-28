/* 10. Implemente una función multisentencia que permita mostrar todos los registros de los detalles de alquileres. */
USE DBL
GO

-- Implementación de la función
IF OBJECT_ID('FN_LISTADODETALLE') IS NOT NULL
BEGIN
    DROP FUNCTION FN_LISTADODETALLE;
END
GO

CREATE FUNCTION FN_LISTADODETALLE()
RETURNS @TABLA TABLE(
    NUMERO INT,
    CLIENTE VARCHAR(30),
    AUTOMOVIL CHAR(10)
)
AS
BEGIN
    INSERT INTO @TABLA
    SELECT 
        D.NUM_ALQ,
        C.NOM_CLI + SPACE(1) + C.APE_CLI,
        D.MAT_AUT
    FROM DETALLEALQUILER D
    JOIN CLIENTE C ON D.IDE_CLI = C.IDE_CLI;

    RETURN;
END
GO

-- Prueba:
SELECT * FROM FN_LISTADODETALLE();
GO

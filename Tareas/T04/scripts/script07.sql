/* 7. Implemente una función tabla en línea que permita mostrar todos los registros de los automóviles de un determinado color. Luego, muestre una lista de los automóviles de un determinado color. */
USE DBL
GO

-- Implementación de la función
IF OBJECT_ID('FN_LISTAAUTOMOVILES') IS NOT NULL
    DROP FUNCTION FN_LISTAAUTOMOVILES;
GO

CREATE FUNCTION FN_LISTAAUTOMOVILES()
RETURNS TABLE
AS
RETURN (
    SELECT 
        A.MAT_AUT AS MATRICULA,
        A.COL_AUT AS COLOR,
        A.MOD_AUT AS MODELO
    FROM AUTOMOVIL A
);
GO

-- Reporte de automóviles por color
SELECT *
FROM FN_LISTAAUTOMOVILES() A
WHERE A.COLOR = 'NEGRO';
GO

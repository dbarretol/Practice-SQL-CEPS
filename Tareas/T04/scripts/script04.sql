/* 4. Función que permita mostrar el total de automóviles de un determinado color, para luego mostrar el siguiente reporte:

| COLOR DE AUTO | TOTAL |
|---------------|-------|
| XXXXXXXXX     | 99    |
| XXXXXXXXX     | 99    | */

USE DBL
GO

-- Implementación de la función
IF OBJECT_ID('FN_AUTOSxCOLOR') IS NOT NULL
    DROP FUNCTION FN_AUTOSxCOLOR;
GO

CREATE FUNCTION FN_AUTOSXCOLOR(@COLOR VARCHAR(40))
RETURNS INT
AS
BEGIN
    DECLARE @TOTAL INT;

    SELECT @TOTAL = COUNT(*)
    FROM AUTOMOVIL A
    WHERE A.COL_AUT = @COLOR;

    RETURN @TOTAL;
END
GO

-- Reporte
SELECT DISTINCT 
    A.COL_AUT AS [COLOR DE AUTO],
    DBO.FN_AUTOSxCOLOR(A.COL_AUT) AS [TOTAL]
FROM AUTOMOVIL A;
GO

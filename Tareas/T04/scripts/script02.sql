/* 2. Función que permita mostrar el menor monto de alquiler en un determinado año, para luego mostrar el siguiente reporte:

| MONTO MINIMO | AÑO ALQUILER |
|--------------|--------------|
| 999.99       | 9999         |
| 999.99       | 9999         |
| 999.99       | 9999         | */

USE DBL
GO

-- Implementación de la función
IF OBJECT_ID('FN_MENOR_MONTO') IS NOT NULL
    DROP FUNCTION FN_MENOR_MONTO;
GO

CREATE FUNCTION FN_MENOR_MONTO(@AÑO INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @MONTO MONEY;

    SELECT @MONTO = MIN(A.MON_ALQ)
    FROM ALQUILER A
    WHERE YEAR(A.FEC_ALQ) = @AÑO;

    RETURN @MONTO;
END
GO

-- Reporte
SELECT DISTINCT 
    YEAR(A.FEC_ALQ) AS [AÑO ALQUILER],
    DBO.FN_MENOR_MONTO(YEAR(A.FEC_ALQ)) AS [MONTO MINIMO]
FROM ALQUILER A;
GO

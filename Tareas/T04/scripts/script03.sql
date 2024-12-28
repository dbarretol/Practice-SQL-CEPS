/* 3. Función que permita mostrar el monto acumulado de alquiler en un determinado año, para luego mostrar el siguiente reporte:

| AÑO ALQUILER | MONTO ACUMULADO |
|--------------|-----------------|
| 9999         | 999.99          |
| 9999         | 999.99          |
| 9999         | 999.99          | */

USE DBL
GO

-- Implementación de la función
IF OBJECT_ID('FN_MONTOACUMULADO') IS NOT NULL
    DROP FUNCTION FN_MONTOACUMULADO;
GO

CREATE FUNCTION FN_MONTOACUMULADO(@AÑO INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @MONTO MONEY;

    SELECT @MONTO = SUM(A.MON_ALQ)
    FROM ALQUILER A
    WHERE YEAR(A.FEC_ALQ) = @AÑO;

    RETURN @MONTO;
END
GO

-- Reporte
SELECT DISTINCT 
    YEAR(A.FEC_ALQ) AS [AÑO ALQUILER],
    DBO.FN_MONTOACUMULADO(YEAR(A.FEC_ALQ)) AS [MONTO ACUMULADO]
FROM ALQUILER A;
GO

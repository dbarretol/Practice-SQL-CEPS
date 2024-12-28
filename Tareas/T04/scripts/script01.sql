/* 1. Función que devuelva el promedio del monto de alquiler, para luego mostrar el siguiente
reporte:

| AÑO ALQUILER | PROMEDIO POR AÑO |
|--------------|------------------|
| 9999         | 999.99           |
| 9999         | 999.99           |
| 9999         | 999.99           | */
USE DBL
GO

-- Verifica si la función existe y la elimina si es necesario
IF OBJECT_ID('FN_PROMEDIOxAÑO') IS NOT NULL
    DROP FUNCTION FN_PROMEDIOxAÑO;
GO

-- Crea la función FN_PROMEDIOXAÑO que retorna el promedio de MON_ALQ para un año específico
CREATE FUNCTION FN_PROMEDIOXAÑO(@AÑO INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @MONTO MONEY;

    SELECT @MONTO = AVG(A.MON_ALQ)
    FROM ALQUILER A
    WHERE YEAR(A.FEC_ALQ) = @AÑO;

    RETURN @MONTO;
END
GO

-- Reporte
SELECT DISTINCT 
    YEAR(A.FEC_ALQ) AS [AÑO ALQUILER],
    DBO.FN_PROMEDIOXAÑO(YEAR(A.FEC_ALQ)) AS [PROMEDIO POR AÑO]
FROM ALQUILER A
GO

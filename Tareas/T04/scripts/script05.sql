/* 5. Función que permita mostrar la diferencia de años entre la fecha de alquiler y el año actual,
para luego mostrar el siguiente reporte:

| ALQUILER | MONTO  | FECHA ALQUILER | DIFERENCIA EN AÑOS |
|----------|--------|-----------------|--------------------|
| 99       | 999.99 | 99/99/9999      | 99                 |
| 99       | 999.99 | 99/99/9999      | 99                 |
| 99       | 999.99 | 99/99/9999      | 99                 | */

USE DBL
GO

-- Implementación de la función
IF OBJECT_ID('FN_DIFERENCIAxAÑOS') IS NOT NULL
    DROP FUNCTION FN_DIFERENCIAxAÑOS;
GO

CREATE FUNCTION FN_DIFERENCIAXAÑOS(@FECHA DATE)
RETURNS INT
AS
BEGIN
    DECLARE @TOTAL INT;

    SELECT @TOTAL = DATEDIFF(YY, @FECHA, GETDATE());

    RETURN @TOTAL;
END
GO

-- Reporte
SELECT 
    A.NUM_ALQ AS ALQUILER,
    A.MON_ALQ AS MONTO,
    A.FEC_ALQ AS [FECHA ALQUILER],
    DBO.FN_DIFERENCIAxAÑOS(A.FEC_ALQ) AS [DIFERENCIA EN AÑOS]
FROM ALQUILER A;
GO

/* 8. Implemente una función tabla en línea que permita mostrar todos los registros de los alquileres según el año de registro. Luego, muestre el registro de los alquileres de un determinado año. */
USE DBL
GO

-- Implementación de la función
IF OBJECT_ID('FN_LISTAAALQUILER') IS NOT NULL
    DROP FUNCTION FN_LISTAAALQUILER;
GO

CREATE FUNCTION FN_LISTAAALQUILER(@AÑO INT)
RETURNS TABLE
AS
RETURN (
    SELECT 
        A.NUM_ALQ AS ALQUILER,
        A.FEC_ALQ AS FECHA,
        A.MON_ALQ AS MONTO
    FROM ALQUILER A
    WHERE YEAR(A.FEC_ALQ) = @AÑO
);
GO

-- Reporte de alquileres por año
DECLARE @AÑO INT = 2011;
SELECT *
FROM FN_LISTAAALQUILER(@AÑO);
GO

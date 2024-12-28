-- ***************************** Consulta 07 ***************************** 
-- Mostrar el siguiente listado de los alquileres, adicionando una columna que 
-- tome en cuenta el siguiente criterio:
-- MONTO ALQUILER	CRITERIO
-- MENOR A 50		BAJO
-- ENTRE 50 Y 100	MEDIO
-- MAYOR A 100		ALTO
USE DBL
GO

SELECT 
    A.NUM_ALQ AS ALQUILER, 
    A.FEC_ALQ AS FECHA,
    A.MON_ALQ AS MONTO,
    CASE
        WHEN A.MON_ALQ < 50 THEN 'BAJO'
        WHEN A.MON_ALQ BETWEEN 50 AND 100 THEN 'MEDIO'
        WHEN A.MON_ALQ > 100 THEN 'ALTO'
    END AS CONDICION
FROM ALQUILER A;

GO
USE DBL
GO

-- 9. Procedimiento almacenado que permita listar los alquileres de un determinado año de registro.
IF OBJECT_ID('SP_ALQUILERxAÑO') IS NOT NULL
    DROP PROCEDURE SP_ALQUILERxAÑO
GO

CREATE PROCEDURE SP_ALQUILERxAÑO(
    @AÑO INT
)
AS
BEGIN
    SELECT A.NUM_ALQ AS ALQUILER,
           A.FEC_ALQ AS FECHA,
           A.MON_ALQ AS MONTO
    FROM ALQUILER A
    WHERE YEAR(A.FEC_ALQ) = @AÑO
END
GO

-- PRUEBA
EXEC SP_ALQUILERxAÑO 2012
GO
USE DBL
GO

-- 4. Procedimiento almacenado que muestre el total de clientes por distrito.
IF OBJECT_ID('SP_TOTALCLIENTESXDISTRITO') IS NOT NULL
    DROP PROCEDURE SP_TOTALCLIENTESXDISTRITO
GO

CREATE PROCEDURE SP_TOTALCLIENTESXDISTRITO
AS
BEGIN
    SELECT D.DES_DIS AS DISTRITO,
           COUNT(*) AS [TOTAL DE CLIENTES]
    FROM CLIENTE C
    JOIN DISTRITO D ON C.IDE_DIS = D.IDE_DIS
    GROUP BY D.DES_DIS
END
GO

-- PRUEBA
EXEC SP_TOTALCLIENTESXDISTRITO
GO
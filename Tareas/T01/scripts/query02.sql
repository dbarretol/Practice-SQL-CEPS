-- ***************************** Consulta 02 ***************************** 
-- Mostrar la información del detalle de alquiler a través de variables y
-- el uso de PRINT
USE DBL
GO

DECLARE @NUM INT = 1
SELECT 
    D.NUM_ALQ AS ALQUILER,
    C.NOM_CLI + SPACE(1) + C.APE_CLI AS CLIENTE,
    D.MAT_AUT AS MATRICULA
FROM 
    DETALLEALQUILER D
JOIN 
    CLIENTE C ON D.IDE_CLI = C.IDE_CLI
WHERE 
    D.NUM_ALQ = @NUM
GO
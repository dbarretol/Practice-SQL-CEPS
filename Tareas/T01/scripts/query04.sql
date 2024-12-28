-- ***************************** Consulta 04 ***************************** 
-- Mostrar una lista de automóviles de un determinado color, dicho valor 
-- debe ser ingresado por una variable.
USE DBL
GO

DECLARE @COLOR VARCHAR(30) = 'ROJO';

SELECT A.*
FROM AUTOMOVIL A
WHERE A.COL_AUT = @COLOR;

GO

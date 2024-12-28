USE DBL
GO

-- 7. Procedimiento almacenado que permita mostrar los registros de automóviles de un determinado color.
IF OBJECT_ID('SP_AUTOSxCOLOR') IS NOT NULL
    DROP PROCEDURE SP_AUTOSxCOLOR
GO

CREATE PROCEDURE SP_AUTOSxCOLOR(
    @COLOR VARCHAR(30)
)
AS
BEGIN
    SELECT A.MAT_AUT AS MATRICULA,
           A.COL_AUT AS COLOR,
           A.MOD_AUT AS MODELO
    FROM AUTOMOVIL A
    WHERE A.COL_AUT = @COLOR
END
GO

-- PRUEBA
EXEC SP_AUTOSxCOLOR 'NEGRO'
GO
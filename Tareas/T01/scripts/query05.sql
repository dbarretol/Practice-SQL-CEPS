-- ***************************** Consulta 05 *****************************
-- Script que permita registrar un nuevo automóvil; en caso exista, solo 
-- debe actualizarlo.
USE DBL
GO

DECLARE @MAT CHAR(10) = 'UH-5475',
        @COL VARCHAR(30) = 'ROJO',
        @MOD VARCHAR(30) = 'L30';

IF EXISTS (SELECT * FROM AUTOMOVIL A WHERE A.MAT_AUT = @MAT)
BEGIN
    UPDATE AUTOMOVIL
		SET COL_AUT = @COL, MOD_AUT = @MOD
		WHERE MAT_AUT = @MAT;    
    PRINT 'ACTUALIZACION CORRECTA';
END
ELSE
BEGIN
    INSERT INTO AUTOMOVIL (MAT_AUT, COL_AUT, MOD_AUT)
    VALUES (@MAT, @COL, @MOD);    
    PRINT 'INSERCION CORRECTA';
END
GO
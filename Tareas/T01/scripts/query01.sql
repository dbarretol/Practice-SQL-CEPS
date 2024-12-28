-- ***************************** Consulta 01 *****************************
-- Mostrar la información de un determinado cliente a través de variables y el uso de PRINT.
USE DBL
GO

DECLARE @COD CHAR(5),
       @APE VARCHAR(30),
       @NOM VARCHAR(30),
       @DNI CHAR(8),
       @TEL VARCHAR(25),
       @DIS CHAR(3),
       @COR VARCHAR(50)

SET @COD = 'CL002'

SELECT @APE = C.APE_CLI, 
      @NOM = C.NOM_CLI,
      @DNI = C.DNI_CLI, 
      @TEL = C.TEL_CLI,
      @DIS = C.IDE_DIS, 
      @COR = C.COR_CLI 
FROM CLIENTE C
WHERE C.IDE_CLI = @COD

PRINT ' **DATOS DEL CLIENTE **'
PRINT '-----------------------------'
PRINT 'CODIGO: ' + @COD
PRINT '-----------------------------'
PRINT 'APELLIDOS: ' + @APE
PRINT 'NOMBRES: ' + @NOM
PRINT 'DNI: ' + @DNI
PRINT 'TELEFONO: ' + @TEL
PRINT 'DISTRITO: ' + @DIS
PRINT 'CORREO:' + @COR
GO
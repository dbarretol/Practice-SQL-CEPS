-- ***************************** Consulta 03 ***************************** 
-- Mostrar el nombre completo del cliente a partir de su código, a través 
-- de variables y el uso de PRINT
USE DBL
GO

DECLARE @COD CHAR(5) = 'CL001';

SELECT C.NOM_CLI + SPACE(1) + C.APE_CLI AS CLIENTE
	FROM CLIENTE C
	WHERE C.IDE_CLI = @COD;
GO

DECLARE @COD CHAR(5) = 'CL001';
DECLARE @CLIENTE VARCHAR(40);

SELECT @CLIENTE = C.NOM_CLI + SPACE(1) + C.APE_CLI
	FROM CLIENTE C
	WHERE C.IDE_CLI = @COD;

PRINT 'EL CODIGO ' + @COD + ' PERTENECE AL CLIENTE ' + @CLIENTE;
GO
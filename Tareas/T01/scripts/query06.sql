-- ***************************** Consulta 06 ***************************** 
-- Script que permita registrar un nuevo cliente validando la existencia 
-- del nombre del distrito. En caso el distrito exista, los datos del 
-- cliente se registrarán; caso contrario, mostrar el mensaje "Código de 
-- distrito no existe".

USE DBL
GO

-- Declarar variables del cliente
DECLARE @COD CHAR(5) = 'CL008', --CL009
        @APE VARCHAR(30) = 'CARBAJAL',
        @NOM VARCHAR(30) = 'SANDRO',
        @DNI CHAR(8) = '57856767',
        @TEL VARCHAR(25) = '598-5667',
        @DIS CHAR(3) = 'L05',--L11
        @COR VARCHAR(50) = 'SCARBAJA@HOTMAIL.COM';

-- Verificar existencia del distrito
IF EXISTS (SELECT * FROM DISTRITO D WHERE D.IDE_DIS = @DIS)
BEGIN
    -- Insertar cliente
    INSERT INTO CLIENTE (IDE_CLI, APE_CLI, NOM_CLI, DNI_CLI, TEL_CLI, IDE_DIS, COR_CLI)
    VALUES (@COD, @APE, @NOM, @DNI, @TEL, @DIS, @COR);

    PRINT 'INSERCION CORRECTA';
END
ELSE
BEGIN
    PRINT 'CODIGO DE DISTRITO NO EXISTE';
END;

GO
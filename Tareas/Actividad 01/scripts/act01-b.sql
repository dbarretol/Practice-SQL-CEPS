-- Parte B: Implementación de consultas:

-- ***************************** Consulta 01 *****************************
-- Mostrar la información de un determinado cliente a través de variables y el uso de PRINT.
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

-- ***************************** Consulta 02 ***************************** 
-- Mostrar la información del detalle de alquiler a través de variables y
-- el uso de PRINT
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

-- ***************************** Consulta 03 ***************************** 
-- Mostrar el nombre completo del cliente a partir de su código, a través 
-- de variables y el uso de PRINT
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

-- ***************************** Consulta 04 ***************************** 
-- Mostrar una lista de automóviles de un determinado color, dicho valor 
-- debe ser ingresado por una variable.
DECLARE @COLOR VARCHAR(30) = 'ROJO';

SELECT A.*
FROM AUTOMOVIL A
WHERE A.COL_AUT = @COLOR;

GO

-- ***************************** Consulta 05 *****************************
-- Script que permita registrar un nuevo automóvil; en caso exista, solo 
-- debe actualizarlo.
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

-- ***************************** Consulta 06 ***************************** 
-- Script que permita registrar un nuevo cliente validando la existencia 
-- del nombre del distrito. En caso el distrito exista, los datos del 
-- cliente se registrarán; caso contrario, mostrar el mensaje "Código de 
-- distrito no existe".
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

-- ***************************** Consulta 07 ***************************** 
-- Mostrar el siguiente listado de los alquileres, adicionando una columna que 
-- tome en cuenta el siguiente criterio:
-- MONTO ALQUILER	CRITERIO
-- MENOR A 50		BAJO
-- ENTRE 50 Y 100	MEDIO
-- MAYOR A 100		ALTO
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
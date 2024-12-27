--  *************** Flujos de control ***************

--  *************** Determinar el mayor de 2 números  *************** 
DECLARE @N1 INT, @N2 INT;
DECLARE @R VARCHAR(20);

-- Asignar valores a las variables
SET @N1 = 20;
SET @N2 = 2;

-- Comparar los números y asignar el resultado
IF @N1 > @N2
    SET @R = 'ES EL MAYOR ' + LTRIM(STR(@N1));
ELSE
    SET @R = 'ES EL MAYOR ' + LTRIM(STR(@N2));

-- Mostrar el resultado
PRINT @R;

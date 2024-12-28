/* 6. Implemente una función tabla en línea que permita mostrar todos los registros de los clientes. Luego, muestre a los clientes de un determinado distrito. */
USE DBL
GO

-- Implementación de la función
IF OBJECT_ID('FN_LISTACLIENTES') IS NOT NULL
    DROP FUNCTION FN_LISTACLIENTES;
GO

CREATE FUNCTION FN_LISTACLIENTES()
RETURNS TABLE
AS
RETURN (
    SELECT 
        C.IDE_CLI AS CODIGO,
        C.NOM_CLI + SPACE(1) + C.APE_CLI AS CLIENTE,
        C.DNI_CLI AS DNI,
        C.TEL_CLI AS TELEFONO,
        D.DES_DIS AS DISTRITO,
        C.COR_CLI AS CORREO
    FROM CLIENTE C
    JOIN DISTRITO D ON C.IDE_DIS = D.IDE_DIS
);
GO

-- Reporte de clientes por distrito
SELECT *
FROM FN_LISTACLIENTES() C
WHERE C.DISTRITO = 'LOS OLIVOS';
GO

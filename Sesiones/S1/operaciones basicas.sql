--  *************** comentario en una linea *************** 
use NORTHWIND -- activa la bd Northwind
/* linea 1
linea 2
linea 3 */
declare @nota int
declare @alu varchar(30)
set @nota=18
set @alu='Fernando'
print @alu+' tu tienes '+ltrim(str(@nota))


--  *************** calcular el promedio de 2 notas *************** 
declare @nota1 int,@nota2 int
declare @prom numeric(7,2)
set @nota1=18
set @nota2=13
set @prom=(@nota1+@nota2)/2.0
print 'el promedio obtenido es:' + str(@prom)

--  *************** mostrar cantidad de clientes registrados *************** 
declare @cant int
select @cant=count(*) from [dbo]. [Customers]
print 'cantidad de clientes registrados:'+ltrim(str(@cant))

--  *************** Crear esquema/tabla *************** 
create schema ventas

create table ventas.clientes
(codcli int,
nombres varchar(30))

insert ventas.clientes
values (1,'juan carlos')

select * from ventas.clientes

-- *************** Determinar precio mínimo y máximo *************** 
DECLARE @precio_min smallmoney, @precio_max smallmoney;

-- Variables asignadas
SELECT
    @precio_min = MIN([UnitPrice]),
    @precio_max = MAX([UnitPrice])
FROM [dbo].[Products]

-- Variables devueltas
SELECT
    @precio_min as Minimo,
    @precio_max as Maximo;

-- *************** Complementar a que productos le corresponden estos precios (min y max) *************** 
-- Determinar precio mínimo y máximo y los nombres de los productos correspondientes
DECLARE @precio_min smallmoney, @precio_max smallmoney;
DECLARE @nprod1 varchar(30), @nprod2 varchar(30);

-- Variables asignadas
SELECT
    @precio_min = MIN([UnitPrice]),
    @precio_max = MAX([UnitPrice])
FROM [dbo].[Products];

-- Obtener el nombre del producto con el precio mínimo
SELECT @nprod1 = [ProductName]
FROM [dbo].[Products]
WHERE [UnitPrice] = (SELECT MIN([UnitPrice]) FROM [dbo].[Products]);

-- Obtener el nombre del producto con el precio máximo
SELECT @nprod2 = [ProductName]
FROM [dbo].[Products]
WHERE [UnitPrice] = (SELECT MAX([UnitPrice]) FROM [dbo].[Products]);

-- Seleccionar los resultados
SELECT
    @precio_min AS Minimo, @precio_max AS Maximo
SELECT
    @nprod1 AS Producto1, @nprod2 AS Producto2;

-- *************** Determinar la cantidad de pedidos atendidos por und determinao empleado ***************
-- Determinar la cantidad de pedidos atendidos por un determinado empleado
DECLARE @nemp INT, @cant INT;

-- Asignar el ID del empleado
SET @nemp = 5;

-- Contar la cantidad de pedidos atendidos por el empleado
SELECT @cant = COUNT(*)
FROM [dbo].[Orders]
WHERE [EmployeeID] = @nemp;

-- Imprimir el resultado
PRINT 'Cantidad de pedidos atendidos por el empleado ' + LTRIM(STR(@nemp)) + ' es ' + LTRIM(STR(@cant));

-- *************** Mostrar ademas el nombre del empleado *************** 
-- Determinar la cantidad de pedidos atendidos y el nombre del empleado
DECLARE @nemp INT, @cant INT;
DECLARE @empName NVARCHAR(40);

-- Asignar el ID del empleado
SET @nemp = 1;

-- Obtener el nombre del empleado
SELECT @empName = [FirstName] + ' ' + [LastName]
FROM [dbo].[Employees]
WHERE [EmployeeID] = @nemp;

-- Contar la cantidad de pedidos atendidos por el empleado
SELECT @cant = COUNT(*)
FROM [dbo].[Orders]
WHERE [EmployeeID] = @nemp;

-- Imprimir el resultado
PRINT 'Cantidad de pedidos atendidos por el empleado ' + @empName + ' (ID: ' + LTRIM(STR(@nemp)) + ') es ' + LTRIM(STR(@cant));

-- *************** Crear un STORE PROCEDURE *************** 
-- Crear el procedimiento almacenado
CREATE PROCEDURE SPU_EMPLEPED @EmployeeID INT
AS
BEGIN
    DECLARE @cant INT;
    DECLARE @empName NVARCHAR(50);

    -- Obtener el nombre del empleado
    SELECT @empName = [FirstName] + ' ' + [LastName]
    FROM [dbo].[Employees]
    WHERE [EmployeeID] = @EmployeeID;

    -- Contar la cantidad de pedidos atendidos por el empleado
    SELECT @cant = COUNT(*)
    FROM [dbo].[Orders]
    WHERE [EmployeeID] = @EmployeeID;

    -- Imprimir el resultado
    PRINT 'Cantidad de pedidos atendidos por el empleado ' + @empName + ' (ID: ' + LTRIM(STR(@EmployeeID)) + ') es ' + LTRIM(STR(@cant));
END;


-- Llamar al procedimiento almacenado
EXEC SPU_EMPLEPED @EmployeeID = 5;
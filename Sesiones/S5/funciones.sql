-- ############### FUNCIONES ###############

-- Promedio de precio de productos
USE NORTHWIND
GO

-- **** FUNCION AVG ****
SELECT AVG(UnitPrice) AS PromedioPrecio
FROM dbo.Products
GO

-- **** FUNCION SUM ****
-- Importe total comprado por cada cliente
SELECT dbo.Customers.CompanyName,
       SUM(dbo.[Order Details].UnitPrice * dbo.[Order Details].Quantity) AS ImporteTotal
FROM dbo.Customers
INNER JOIN dbo.Orders ON dbo.Customers.CustomerID = dbo.Orders.CustomerID
INNER JOIN dbo.[Order Details] ON dbo.Orders.OrderID = dbo.[Order Details].OrderID
GROUP BY dbo.Customers.CompanyName
GO

-- Creando vista
CREATE VIEW VW_CLIIMPORTES
AS
SELECT dbo.Customers.CompanyName,
       SUM(dbo.[Order Details].UnitPrice * dbo.[Order Details].Quantity) AS ImporteTotal
FROM dbo.Customers
INNER JOIN dbo.Orders ON dbo.Customers.CustomerID = dbo.Orders.CustomerID
INNER JOIN dbo.[Order Details] ON dbo.Orders.OrderID = dbo.[Order Details].OrderID
GROUP BY dbo.Customers.CompanyName
GO
--  Llamando a la vista
SELECT * FROM [dbo].[VW_CLIIMPORTES] ORDER BY CompanyName
GO

-- **** FUNCION COUNT ****
SELECT * FROM [dbo].[Customers]
SELECT COUNT([ContactName]) FROM [dbo].[Customers]
SELECT COUNT([Fax]) FROM [dbo].[Customers]
SELECT COUNT(*) FROM [dbo].[Customers]

-- **** FUNCION GETDATE / DATENAME ****
SELECT DATENAME(MM, GETDATE())

-- **** FUNCION CHOOSE ****
SELECT CHOOSE(MONTH([OrderDate]),
					'ENERO', 
					'FEBRERO', 
					'MARZO', 
					'ABRIL' , 
					'MAYO',
					'JUNIO', 
					'JULIO', 
					'AGOSTO', 
					'SETIEMBRE', 
					'OCTUBRE', 
					'NOVIEMBRE', 
					'DICIEMBRE' )
AS MES FROM [dbo]. [Orders]

-- **** FUNCION IIF ****

SELECT PRODUCTID, 
       ProductName, 
       SupplierID, 
       CategoryID,
       QuantityPerUnit, 
       UnitPrice, 
       UnitsInStock, 
       UnitsOnOrder, 
       ReorderLevel,
       IIF(Discontinued=0,'Descontinuado','Vigente') AS [Estado Producto]
FROM Products

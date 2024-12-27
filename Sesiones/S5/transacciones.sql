-- ############## TRANSACCIONES ###############


-- *********** Transacción implícita: autocommit ***********
USE NORTHWIND
GO

-- Insertar un nuevo cliente
INSERT INTO [dbo].[Customers] ([CustomerID], [CompanyName])
VALUES ('AC123', 'ACME SYSTEM')
GO

-- Seleccionar todos los registros de la tabla Customers
SELECT * FROM [Customers]
GO

-- Eliminar el cliente insertado anteriormente
DELETE FROM [Customers] 
WHERE [CustomerID] = 'AC123'
GO
-- Eliminar el cliente insertado anteriormente
DELETE FROM [Customers] 
WHERE [CustomerID] = 'AROUT'
GO

-- *********** Transacción explícita ***********
BEGIN TRAN

-- Insertar un nuevo cliente
INSERT INTO [dbo].[Customers] ([CustomerID], [CompanyName])
VALUES ('AC123', 'ACME SYSTEM')
GO

-- Seleccionar todos los registros de la tabla Customers
SELECT * FROM [Customers]
GO

-- Actualizar el nombre de contacto del cliente
UPDATE [Customers]
SET [ContactName] = 'JORGE RIVERA' 
WHERE [CustomerID] = 'AC123'
GO

-- Revertir la transacción
ROLLBACK TRAN
GO

-- ----------------------------------------------
BEGIN TRAN

-- Insertar un nuevo cliente
INSERT INTO [dbo].[Customers] ([CustomerID], [CompanyName])
VALUES ('AC123', 'ACME SYSTEM')
GO

-- Seleccionar todos los registros de la tabla Customers
SELECT * FROM [Customers]
GO

-- Actualizar el nombre de contacto del cliente
UPDATE [Customers]
SET [ContactName] = 'JORGE RIVERA' 
WHERE [CustomerID] = 'AC123'
GO

-- Revertir la transacción
COMMIT TRAN
GO
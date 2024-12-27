-- ############## TRANSACCIONES ###############


-- *********** Transacci�n impl�cita: autocommit ***********
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

-- *********** Transacci�n expl�cita ***********
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

-- Revertir la transacci�n
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

-- Revertir la transacci�n
COMMIT TRAN
GO
-- #### Sesión 06: TRIGERRS / CURSORES ###

CREATE DATABASE bdventas;
GO
USE bdventas;
GO

CREATE TABLE CLIENTES (
    CODCLI INT NOT NULL PRIMARY KEY,
    NOMCLI VARCHAR(50),
    DISTRITO VARCHAR(30)
);

-- TRIGGER
CREATE TRIGGER TR_MENSAJEINS
ON CLIENTES
FOR INSERT
AS
PRINT 'SE INSERTO UN NUEVO CLIENTE HOY ' + CAST(GETDATE() AS CHAR(10));

-- Insertar registros en CLIENTES
INSERT INTO CLIENTES (CODCLI, NOMCLI, DISTRITO)
VALUES (1, 'EVA RUIZ', 'LINCE');

INSERT INTO CLIENTES (CODCLI, NOMCLI, DISTRITO)
VALUES (2, 'JOSE ZARATE', 'SURCO');

-- ************ Ejemplo usando Northwind ************
USE NORTHWIND;
GO

-- TRIGGER
CREATE TRIGGER modificacion_Clientes
ON Customers 
FOR UPDATE 
AS
PRINT 'Han actualizado la tabla de Customers';

-- Actualizar un registro en Customers
UPDATE Customers 
SET ContactName = 'Maria Walters'
WHERE CustomerID = 'AROUT';

-- Seleccionar registros de Customers
SELECT * FROM Customers;

-- Seleccionar registros de deleted (asumiendo que es una tabla o vista)
SELECT * 
FROM deleted;

-- *******************************************
USE bdventas;
GO

CREATE TABLE tablaPruebas
(
codigo INT,
nombre VARCHAR(30),
fecha DATE
)

CREATE TRIGGER TriggertablaPruebas 
ON tablaPruebas
AFTER INSERT, UPDATE, DELETE
AS
SELECT * FROM deleted;
SELECT * FROM inserted;

-- Insertar registros en tablaPruebas
INSERT INTO tablaPruebas (codigo, nombre, fecha)
VALUES 
(1, 'Maria Morales', '2016-05-14'),
(2, 'Luis Alberto Pérez', '2016-05-29');

-- Eliminar registro de tablaPruebas
DELETE FROM tablaPruebas
WHERE codigo = 2;

-- Actualizar registro en tablaPruebas
UPDATE tablaPruebas
SET nombre = 'Marcia Morales'
WHERE codigo = 1;

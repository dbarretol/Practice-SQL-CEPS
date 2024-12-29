-- Creación de la base de datos
CREATE DATABASE Control_Pedidos
GO

-- Uso de la base de datos
USE Control_Pedidos
GO

-- Creación de la tabla producto
CREATE TABLE producto
(
    idproducto CHAR(8) NOT NULL,
    nombreproducto VARCHAR(25),
    existencia INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL, -- precio costo
    preciov DECIMAL(10,2) NOT NULL, -- precio venta
    CONSTRAINT pk_idproducto PRIMARY KEY (idproducto)
)
GO

-- Creación de la tabla pedidos
CREATE TABLE pedidos
(
    idpedido INT IDENTITY,
    idproducto CHAR(8) NOT NULL,
    cantidad_pedido INT,
    CONSTRAINT fk_idbod FOREIGN KEY (idproducto) REFERENCES producto(idproducto)
)
GO

-- Inserción de registros
BEGIN TRANSACTION

INSERT INTO producto VALUES('prod001', 'Filtros pantalla', 5, 10, 12.5)
INSERT INTO producto VALUES('prod002', 'parlantes', 7, 10, 11.5)
INSERT INTO producto VALUES('prod003', 'mouse', 8, 4.5, 6)
INSERT INTO producto VALUES('prod004', 'monitor', 10, 60.2, 80.0)
INSERT INTO producto VALUES('prod005', 'lapiz', 5, 1.2, 2.0)

COMMIT TRANSACTION
GO
-- =============================================================================================================================
-- 1. Crear un desencadenador que se active cada vez que se inserte un registro en la tabla pedidos y otro para la tabla producto.
-- =============================================================================================================================

-- Desencadenador para la tabla 'pedidos' que se activa cuando se inserta un nuevo pedido
CREATE TRIGGER trg_insert_pedido
ON pedidos
AFTER INSERT
AS
BEGIN
    PRINT 'Nuevo pedido insertado'
END
GO

-- Desencadenador para la tabla 'producto' que se activa cuando se inserta un nuevo producto
CREATE TRIGGER trg_insert_producto
ON producto
AFTER INSERT
AS
BEGIN
    PRINT 'Nuevo producto insertado'
END
GO

-- prueba 
-- Insertar un nuevo pedido (esto activará el trigger trg_insert_pedido)
INSERT INTO pedidos (idproducto, cantidad_pedido)
VALUES ('prod001', 2);

-- Insertar un nuevo producto (esto activará el trigger trg_insert_producto)
INSERT INTO producto (idproducto, nombreproducto, existencia, precio, preciov)
VALUES ('prod006', 'teclado', 10, 15.5, 20.0);

-- =============================================================================================================================
-- 2. Crear un desencadenador para la tabla producto, que se active cada vez que se inserte un registro o se actualice la columna precio, la condición para aceptar al inserción o la actualización es que el precio costo no debe ser mayor que el precio venta.
-- =============================================================================================================================

-- Desencadenador para la tabla producto en inserción y actualización
CREATE TRIGGER trg_check_precio
ON producto
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @precio_costo DECIMAL(10, 2);
    DECLARE @precio_venta DECIMAL(10, 2);
    
    -- Obtener los valores de los precios del producto insertado o actualizado
    SELECT @precio_costo = precio, @precio_venta = preciov
    FROM INSERTED;

    -- Verificar si el precio costo es mayor que el precio venta
    IF @precio_costo > @precio_venta
    BEGIN
        PRINT 'Error: El precio costo no puede ser mayor que el precio de venta.'
        ROLLBACK TRANSACTION; -- Deshacer la transacción
    END
END
GO

-- Pruebas
-- Intentar insertar un producto con precio costo mayor que el precio de venta
-- Esto debería disparar un error y hacer rollback de la transacción.
INSERT INTO producto (idproducto, nombreproducto, existencia, precio, preciov)
VALUES ('prod007', 'auriculares', 10, 30.0, 25.0);

-- Intentar actualizar el precio de un producto para que el precio costo sea mayor que el precio de venta
-- Esto debería disparar un error y hacer rollback de la transacción.
UPDATE producto
SET precio = 50.0, preciov = 40.0
WHERE idproducto = 'prod001';

-- =============================================================================================================================
-- 3. Crear un desencadenador para la tabla pedidos que cada vez que se realice un pedido descuente la existencia de la tabla productos, en caso que la cantidad del pedido supere a la existencia debe deshacer la transacción y mostrar un mensaje de error.
-- =============================================================================================================================

-- Desencadenador para la tabla pedidos en inserción
CREATE TRIGGER trg_descuento_existencia
ON pedidos
AFTER INSERT
AS
BEGIN
    DECLARE @idproducto CHAR(8);
    DECLARE @cantidad_pedido INT;
    DECLARE @existencia_actual INT;

    -- Obtener los valores del pedido insertado
    SELECT @idproducto = idproducto, @cantidad_pedido = cantidad_pedido
    FROM INSERTED;

    -- Verificar la existencia del producto en la tabla 'producto'
    SELECT @existencia_actual = existencia
    FROM producto
    WHERE idproducto = @idproducto;

    -- Si la cantidad del pedido es mayor que la existencia, deshacer la transacción
    IF @cantidad_pedido > @existencia_actual
    BEGIN
        THROW 50001, 'Error: La cantidad solicitada excede la existencia disponible.', 1;
        -- No se requiere ROLLBACK TRANSACTION, THROW lo maneja automáticamente.
    END
    ELSE
    BEGIN
        -- Si la cantidad es válida, actualizar la existencia en la tabla producto
        UPDATE producto
        SET existencia = existencia - @cantidad_pedido
        WHERE idproducto = @idproducto;
    END
END
GO


-- Pruebas
-- Insertar un pedido que no exceda la existencia del producto (esto debería descontar la existencia).
INSERT INTO pedidos (idproducto, cantidad_pedido)
VALUES ('prod001', 3);

-- Intentar insertar un pedido con una cantidad mayor que la existencia disponible (esto debería hacer rollback).
INSERT INTO pedidos (idproducto, cantidad_pedido)
VALUES ('prod001', 10);

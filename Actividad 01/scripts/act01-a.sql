-- CREACIÓN DE BASE DE DATOS: TABLAS Y RELACIONES

-- Crear la base de datos y activarla para uso
CREATE DATABASE DBL;
GO

USE DBL;
GO

-- # Crear tablas

-- ## Tabla DISTRITO
CREATE TABLE DISTRITO (
    IDE_DIS CHAR(3) PRIMARY KEY,
    DES_DIS VARCHAR(40)
);

-- Insertar los datos en la tabla Distritos
INSERT INTO DISTRITO (IDE_DIS, DES_DIS)
VALUES
    ('L01', 'LIMA'),
    ('L02', 'LINCE'),
    ('L03', 'BREÑA'),
    ('L04', 'LOS OLIVOS'),
    ('L05', 'RIMAC'),
    ('L06', 'SAN MARTIN DE PORRES'),
    ('L07', 'SAN LUIS'),
    ('L08', 'SAN BORJA');

-- ## Tabla ALQUILER
CREATE TABLE ALQUILER (
    NUM_ALQ INT PRIMARY KEY,
    FEC_ALQ DATE,
    MON_ALQ MONEY
);

-- Insertar los datos en la tabla ALQUILER
INSERT INTO ALQUILER (NUM_ALQ, FEC_ALQ, MON_ALQ)
VALUES
    (1, '2010-03-12', 185.00),
    (2, '2011-01-02', 100.00),
    (3, '2011-05-01', 54.00),
    (4, '2012-08-11', 85.00),
    (5, '2012-06-22', 18.00),
    (6, '2012-01-30', 15.00),
    (7, '2012-04-16', 165.00),
    (8, '2012-05-23', 135.00),
    (9, '2012-03-21', 225.00);

-- ## Tabla AUTOMOVIL
CREATE TABLE AUTOMOVIL (
    MAT_AUT VARCHAR(10) PRIMARY KEY,
    COL_AUT VARCHAR(30),
    MOD_AUT VARCHAR(30)
);

-- Insertar los datos en la tabla AUTMOVIL
INSERT INTO AUTOMOVIL (MAT_AUT, COL_AUT, MOD_AUT)
VALUES
    ('AF-456', 'ROJO', 'SEDAN'),
    ('D4-243', 'NEGRO', 'SEDAN'),
    ('FD-463', 'PLATA', 'STATION WAGON'),
    ('FG-654', 'PLATA', 'L10'),
    ('GG-654', 'ROJO', 'CAMIONETA'),
    ('GT-532', 'ROJO', 'SEDAN'),
    ('H5-455', 'ROJO', 'STATION WAGON'),
    ('HY-345', 'PLATA', 'CHERY'),
    ('SF-112', 'ROJO', 'LI'),
    ('YT-457', 'NEGRO', 'STATION WAGON');


-- ## Tabla CLIENTE
CREATE TABLE CLIENTE (
    IDE_CLI VARCHAR(5) PRIMARY KEY,
    APE_CLI VARCHAR(30),
    NOM_CLI VARCHAR(30),
    DNI_CLI CHAR(8),
    TEL_CLI VARCHAR(25),
    IDE_DIS CHAR(3),
    COR_CLI VARCHAR(50),
	FOREIGN KEY (IDE_DIS) REFERENCES DISTRITO(IDE_DIS)
);

-- Insertar los datos en la tabla Clientes
INSERT INTO CLIENTE(IDE_CLI, APE_CLI, NOM_CLI, DNI_CLI, TEL_CLI, IDE_DIS, COR_CLI)
VALUES
    ('CL001', 'LOPEZ', 'MARIA', '10856985', '526-5254', 'L03', NULL),
    ('CL002', 'GOMEZ', 'JOSE', '02188525', '585-8212', 'L02', NULL),
    ('CL003', 'ACOSTA', 'JESUS', '07415482', '485-1598', 'L01', NULL),
    ('CL004', 'ARIAS', 'GUADALUPE', '08995255', '258-8569', 'L04', NULL),
    ('CL005', 'CARLOS', 'MANUEL', '10418525', '296-9685', 'L08', NULL),
    ('CL006', 'GERZ', 'BRIGITTE', '10952155', '585-1254', 'L06', NULL),
    ('CL007', 'BARBOSA', 'MARISOL', '78514855', '584-5869', 'L04', NULL);

-- ## Tabla DETALLEALQUILER
CREATE TABLE DETALLEALQUILER (
    NUM_ALQ INT,
    IDE_CLI VARCHAR(5),
    MAT_AUT VARCHAR(10),
    PRIMARY KEY (NUM_ALQ, IDE_CLI, MAT_AUT),
    FOREIGN KEY (IDE_CLI) REFERENCES CLIENTE(IDE_CLI),
    FOREIGN KEY (MAT_AUT) REFERENCES AUTOMOVIL(MAT_AUT),
    FOREIGN KEY (NUM_ALQ) REFERENCES ALQUILER(NUM_ALQ)  -- Añadido FK hacia ALQUILER
);

-- Insertar los datos en la tabla DETALLEALQUILER
INSERT INTO DETALLEALQUILER (NUM_ALQ, IDE_CLI, MAT_AUT)
VALUES
    (1, 'CL002', 'GG-654'),
    (2, 'CL002', 'GT-532'),
    (3, 'CL006', 'FD-463'),
    (3, 'CL007', 'GT-532'),
    (4, 'CL005', 'H5-455'),
    (5, 'CL004', 'SF-112'),
    (6, 'CL004', 'YT-457'),
    (7, 'CL003', 'GT-532');

-- *************************************** FIN: Creacion de tablas **************************************
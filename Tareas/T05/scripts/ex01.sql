-- ********** Crear la base de datos **********
CREATE DATABASE Control_Examen_SuCarnet;
GO

-- Hacer uso de la base de datos
USE Control_Examen_SuCarnet;
GO

-- ********** CREAR TABLAS Y RELACIONES **********
-- Crear la tabla Alumnos
CREATE TABLE Alumnos (
    Carnet VARCHAR(10) NOT NULL PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL,
    Apellido1 VARCHAR(30) NOT NULL,
    Apellido2 VARCHAR(30) NOT NULL,
    Sexo VARCHAR(2) NOT NULL
);
GO

-- Crear la tabla Examenes
CREATE TABLE Examenes (
    cod_examen INT NOT NULL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    n_preguntas INT NOT NULL
);
GO

-- Crear la tabla Notas
CREATE TABLE Notas (
    cod_examen INT NOT NULL FOREIGN KEY REFERENCES Examenes(cod_examen),
    Carnet VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES Alumnos(Carnet),
    nota_examen DECIMAL(4,2) NOT NULL,
    fecha SMALLDATETIME NOT NULL
);
GO

-- Crear la tabla Respuestas
CREATE TABLE Respuestas (
    cod_examen INT NOT NULL FOREIGN KEY REFERENCES Examenes(cod_examen),
    Carnet VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES Alumnos(Carnet),
    n_pregunta INT NOT NULL,
    opcion_respuesta INT NOT NULL
);
GO

-- Crear la tabla Preguntas
CREATE TABLE Preguntas (
    cod_examen INT NOT NULL FOREIGN KEY REFERENCES Examenes(cod_examen),
    n_pregunta INT NOT NULL,
    texto_pregunta VARCHAR(100) NOT NULL,
    n_opciones INT NOT NULL,
    opcion_correcta INT NOT NULL
);
GO

-- Crear la tabla Opciones
CREATE TABLE Opciones (
    cod_examen INT NOT NULL FOREIGN KEY REFERENCES Examenes(cod_examen),
    n_pregunta INT NOT NULL,
    n_opcion INT NOT NULL,
    texto_opcion VARCHAR(50) NULL
);
GO

-- ********** PROCEDIMIENTOS ALMACENADOS **********
-- =============================================================================
-- PROCEDIMIENTO 01: Insert_Alumno
-- =============================================================================
CREATE PROCEDURE Insert_Alumno
@carnet CHAR(8), 
@nombre CHAR(15), 
@apell1 CHAR(15), 
@apel12 CHAR(15),
@sexo CHAR(1)
AS
BEGIN
    INSERT INTO Alumnos (Carnet, Nombre, Apellido1, Apellido2, Sexo)
    VALUES (@carnet, @nombre, @apell1, @apel12, @sexo);
    RETURN 0;
END
GO

-- Ejecutar el procedimiento almacenado para insertar registros
EXEC Insert_Alumno 'SB970326', 'Alicia', 'Salinas', 'Benitez', 'F';
EXEC Insert_Alumno 'SC970245', 'Carlos', 'Salazar', 'Calderon', 'M';
EXEC Insert_Alumno 'RC970201', 'Karla', 'Ramirez', 'Chicas', 'F';

-- Seleccionar todos los registros de la tabla Alumnos
SELECT * FROM Alumnos;

-- =============================================================================
-- Ejercicio 02: Insert_Exa
-- =============================================================================
CREATE PROC Insert_Exa
@cod INT,
@title VARCHAR(100),
@NPreg INT
AS
BEGIN
    INSERT INTO Examenes (cod_examen, titulo, n_preguntas)
    VALUES (@cod, @title, @NPreg);
    RETURN 0;
END
GO

-- Agregando Datos del Examen
EXEC Insert_Exa 1, 'Conceptos de Procedimientos Almacenados', 2;
EXEC Insert_Exa 2, 'Conceptos sobre Redes de Area Local', 3;
SELECT * FROM Examenes;

-- Agregando datos a preguntas
INSERT INTO Preguntas (cod_examen, n_pregunta, texto_pregunta, n_opciones, opcion_correcta)
VALUES 
(1, 1, 'Con que sentencia se crea un procedimiento almacenado:', 3, 3),
(1, 2, 'Con que comando se ejecuta un procedimiento almacenado:', 2, 1);
SELECT * FROM Preguntas;

-- Agregando datos a opciones
INSERT INTO Opciones (cod_examen, n_pregunta, n_opcion, texto_opcion)
VALUES 
(1, 1, 1, 'Create Procedure'),
(1, 1, 2, 'Create Proc'),
(1, 1, 3, 'Ambas opciones'),
(1, 2, 1, 'EXECUTE'),
(1, 2, 2, 'sp_executesql');
SELECT * FROM Opciones;

-- =============================================================================
-- Ejercicio 03: Mensajes de Error definidos por el usuario
-- =============================================================================
-- Creando los mensajes o verificar si ya existe el mensaje
USE master;
GO

EXEC sp_addmessage 50001, 16, N'Usted se encuentra en la ultima pregunta del examen';
GO


-- =============================================================================
-- Ejercicio 04: Procedimiento almacenado
-- =============================================================================
USE Control_Examen_SuCarnet
GO

-- Verificar si existe el procedimiento y si este existe se elimina
IF EXISTS (SELECT name FROM sysobjects
           WHERE name = 'Calculo_de_Nota' AND type = 'P')
DROP PROCEDURE Calculo_de_Nota;
GO

-- Creación del procedimiento
CREATE PROC Calculo_de_Nota
@carnetx VARCHAR(10),
@codexamen INT
AS
BEGIN
    DECLARE @totcorrecta INT,      -- contador para respuestas correctas
            @porcentaje FLOAT,     -- porcentaje de cada pregunta
            @npreguntas INT,       -- número de preguntas del examen
            @correctaresp INT,     -- captura la opción correcta del examen (opc_correcta)
            @respuesta INT,        -- captura la opción que seleccionó el alumno (opcion_respuesta)
            @perfect FLOAT,        -- constante = 10
            @NOTA FLOAT;           -- nota del examen

    -- Verifica la cantidad de preguntas que tiene el examen
    SELECT @npreguntas = CONVERT(FLOAT, COUNT(n_pregunta))
    FROM Preguntas
    WHERE cod_examen = @codexamen;

    -- Asigna un valor a la variable @perfect
    SELECT @perfect = 10.00;

    -- Calcula el porcentaje para cada pregunta
    SELECT @porcentaje = @perfect / @npreguntas;

    -- Inicializa el contador de respuestas correctas a 0
    SELECT @totcorrecta = 0;

    -- Bucle para verificar cada pregunta
    WHILE (@npreguntas > 0)
    BEGIN
        -- Asigna la opción correcta del examen
        SELECT @correctaresp = opcion_correcta
        FROM Preguntas
        WHERE (cod_examen = @codexamen AND n_pregunta = @npreguntas);

        -- Asigna la respuesta del alumno del examen
        SELECT @respuesta = opcion_respuesta
        FROM Respuestas
        WHERE (cod_examen = @codexamen AND Carnet = @carnetx AND n_pregunta = @npreguntas);

        -- Compara la opción correcta del examen con la respuesta del alumno
        IF (@correctaresp = @respuesta)
        BEGIN
            -- Incrementa el contador si coinciden las opciones
            SELECT @totcorrecta = @totcorrecta + 1;
        END

        -- Decrementa el total de preguntas
        SELECT @npreguntas = @npreguntas - 1;
    END

    -- Calcula la nota del examen
    SELECT @NOTA = @totcorrecta * @porcentaje;

    -- Agrega la nota a la tabla Notas
    INSERT INTO Notas (cod_examen, Carnet, nota_examen, fecha)
    VALUES (@codexamen, @carnetx, @NOTA, GETDATE());
	END;

    -- Mostrar la nota en la ventana de resultados
    SELECT 'NOTA_EXAMEN' = CONVERT(FLOAT, @NOTA);

GO

-- =============================================================================
-- Ejercicio 05: Crear trigger
-- =============================================================================
-- Verificamos si existe el trigger y si este existe, se elimina
IF EXISTS (SELECT name FROM sysobjects
           WHERE name = 'Warning' AND type = 'TR')
DROP TRIGGER Warning;
GO

-- Creación del trigger
CREATE TRIGGER Warning
ON Respuestas
FOR INSERT
AS
BEGIN
    DECLARE @tot_preguntas INT,
            @Npregunta INT,
            @codExa INT,
            @Nota FLOAT,
            @carnetx VARCHAR(10);

    -- Indica que se disparará al insertar datos en la tabla respuestas
    SELECT @codExa = cod_examen FROM inserted;
    SELECT @tot_preguntas = n_preguntas FROM Examenes WHERE cod_examen = @codExa;
    SELECT @Npregunta = n_pregunta FROM inserted;

    IF @Npregunta = @tot_preguntas
    BEGIN
        RAISERROR ('Ha alcanzado el total de preguntas.', 16, 1);

        SELECT @carnetx = carnet FROM inserted; -- nueva línea

        -- Nota que un Trigger puede llamar a un Store Procedure
        EXEC Calculo_de_Nota @carnetx, @codExa;

        SELECT @Nota = nota_examen FROM Notas WHERE cod_examen = @codExa AND carnet = @carnetx;
        PRINT 'Su nota fue: ' + CONVERT(VARCHAR(4), @Nota);
    END
END
GO


-- Realizando pruebas

-- A la pregunta 1 contestó la opción 3, es la correcta
INSERT INTO Respuestas (cod_examen, Carnet, n_pregunta, opcion_respuesta)
VALUES (1, 'RC970201', 1, 3);

-- A la pregunta 2 contestó la opción 2, contestó mal
INSERT INTO Respuestas (cod_examen, Carnet, n_pregunta, opcion_respuesta)
VALUES (1, 'RC970201', 2, 2);

-- Verificando los registros de la tabla Respuestas
SELECT * FROM Respuestas;

-- Verificando los registros de la tabla Notas
SELECT * FROM Notas;
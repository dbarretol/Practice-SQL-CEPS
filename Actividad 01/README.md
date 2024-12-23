# Actividad #01
## Problema

**a) Generar la siguiente base de datos:**

![Base de datos](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/0d0053768fd85abf425d7a048f3fc4d37cbee236/Actividad%2001/recursos/base_de_Datos.png)

Con la siguiente información: [Datos](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2001/scripts/bd01.xlsx)

**b) Implementar las siguientes consultas:**

1. Mostrar la información de un determinado cliente a través de variables y el uso de PRINT.
2. Mostrar la información del detalle de alquiler a través de variables y el uso de PRINT.
3. Mostrar el nombre completo del cliente a partir de su código, a través de variables y el uso de PRINT.
4. Mostrar una lista de automóviles de un determinado color, dicho valor debe ser ingresado por una variable.
5. Script que permita registrar un nuevo automóvil; en caso exista, solo debe actualizarlo.
6. Script que permita registrar un nuevo cliente validando la existencia del nombre del distrito. En caso el distrito exista, los datos del cliente se registrarán; caso contrario, mostrar el mensaje "Código de distrito no existe".
7. Mostrar el siguiente listado de los alquileres, adicionando una columna que tome en cuenta el siguiente criterio:

        MONTO ALQUILER      CRITERIO
        -------------       ---------
        MENOR A 50          BAJO
        ENTRE 50 Y 100      MEDIO
        MAYOR A 100         ALTO

## Solución:

a) Para crear la base de datos, utilizar el siguiente script: [act01-a](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2001/scripts/act01-a.sql)

![Base de datos recreada](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/refs/heads/main/Actividad%2001/recursos/base_de_datos_recreada.png)

b) Las implementaciones de consultas estan definidas en: [act01-b](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2001/scripts/act01-b.sql)

* Resultado de consulta 1:

![Consulta 01](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/0d0053768fd85abf425d7a048f3fc4d37cbee236/Actividad%2001/recursos/imp01.png)

* Resultado de consulta 2:

![Consulta 02](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/0d0053768fd85abf425d7a048f3fc4d37cbee236/Actividad%2001/recursos/imp02.png)

* Resultado de consulta 3:

![Consulta 03](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/0d0053768fd85abf425d7a048f3fc4d37cbee236/Actividad%2001/recursos/imp03a.png)
![Consulta 03](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/0d0053768fd85abf425d7a048f3fc4d37cbee236/Actividad%2001/recursos/imp03b.png)

* Resultado de consulta 4:

![Consulta 04](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/0d0053768fd85abf425d7a048f3fc4d37cbee236/Actividad%2001/recursos/imp04.png)

* Resultado de consulta 5:

![Consulta 05](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/0d0053768fd85abf425d7a048f3fc4d37cbee236/Actividad%2001/recursos/imp05a.png)
![Consulta 05](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/0d0053768fd85abf425d7a048f3fc4d37cbee236/Actividad%2001/recursos/imp05b.png)

* Resultado de consulta 6:

![Consulta 06](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/0d0053768fd85abf425d7a048f3fc4d37cbee236/Actividad%2001/recursos/imp06a.png)
![Consulta 06](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/0d0053768fd85abf425d7a048f3fc4d37cbee236/Actividad%2001/recursos/imp06b.png)

* Resultado de consulta 7:

![Consulta 07](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/0d0053768fd85abf425d7a048f3fc4d37cbee236/Actividad%2001/recursos/imp07.png)

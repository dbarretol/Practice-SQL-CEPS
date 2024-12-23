# Actividad 02

la base de datos northwind se puede crear usando el script ubicado en:

 https://github.com/microsoft/sql-server-samples/tree/master/samples/databases/northwind-pubs

Usar para la base de datos NorthWind para:

1.	Realizar un procedimiento almacenado que devuelva los clientes (Customers) según el país (Country).

[Código](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2002/scripts/proc01.sql)

Prueba: `EXEC GetCustomersByCountry @Country = 'Germany';`

![Test01](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/refs/heads/main/Actividad%2002/recursos/Test01.png)

2.	Crear un procedimiento que determine la cantidad de clientes cuyo identificador (o sea el código) inicia con un determinado carácter.

[Código](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2002/scripts/proc02.sql)

Prueba: `EXEC GetCustomerCountByInitial @Initial = 'A';`

![Test02](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/refs/heads/main/Actividad%2002/recursos/Test02.png)

3.	Realizar un procedimiento que determine la cantidad de registros que un cliente está en la tabla ORDERS.

[Código](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2002/scripts/proc03.sql)

Prueba: `EXEC GetOrderCountByCustomer @CustomerID = 'ALFKI';`

![Test03](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/refs/heads/main/Actividad%2002/recursos/Test03.png)

4.	Realizar una base de datos similar a Northwind, pero que los nombre de tablas, campos y registros estén en castellano.

**Pendiente**

5.	Realizar un procedimiento que seleccione todos los registros de tabla Productos y Categories a la vez.

[Código](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2002/scripts/proc05.sql)

Prueba: `EXEC GetAllProductsAndCategories;`

![Test05](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/refs/heads/main/Actividad%2002/recursos/Test05.png)

6.	Realizar un procedimiento que seleccione todos los productos que no corresponde a la categoría bebidas (1)

[Código](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2002/scripts/proc06.sql)

Prueba: `EXEC GetProductsNotInBeverages;`

![Test06](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/refs/heads/main/Actividad%2002/recursos/Test06.png)

7.	Realizar un procedimiento que obtenga la cantidad de registros que no corresponde a condimentos

[Código](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2002/scripts/proc07.sql)

Prueba: `EXEC GetCountOfNonCondimentProducts;`

![Test07](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/refs/heads/main/Actividad%2002/recursos/Test07.png)

8.	Realizar un procedimiento que seleccionar todos los campos de los registros que no corresponden a categoría mariscos de la tabla productos.

[Código](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2002/scripts/proc08.sql)

Prueba: `EXEC GetProductsNotInSeafood;`

![Test08](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/refs/heads/main/Actividad%2002/recursos/Test08.png)

9.	Realizar un procedimiento que seleccionar los campos nombre del producto y precio (únicamente) de los  productos diferentes a cárnicos.

[Código](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2002/scripts/proc09.sql)

Prueba: `EXEC GetNonMeatProductsNameAndPrice;`

![Test09](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/refs/heads/main/Actividad%2002/recursos/Test09.png)

10.	Realizar un procedimiento que obtenga la cantidad de productos granos y cereales.

[Código](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2002/scripts/proc10.sql)

Prueba: `EXEC GetCountOfGrainsAndCerealsProducts;`

![Test10](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/refs/heads/main/Actividad%2002/recursos/Test10.png)

11.	Realizar un procedimiento que seleccionar los campos nombre del producto y precio (únicamente) de los quesos y productos cárnicos.

[Código](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2002/scripts/proc11.sql)

Prueba: `EXEC GetCheeseAndMeatProductsNameAndPrice;`

![Test11](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/refs/heads/main/Actividad%2002/recursos/Test11.png)

12.	Realizar un procedimiento que seleccionar los campos nombre del producto, precio y stock (únicamente) de las frutas secas y mariscos.

[Código](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2002/scripts/proc12.sql)

Prueba: `EXEC GetDriedFruitsAndSeafoodDetails;`

![Test12](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/refs/heads/main/Actividad%2002/recursos/Test12.png)

13.	Realizar un procedimiento que seleccionar el promedio de los precios de los confites.

[Código](https://github.com/dbarretol/Practice-SQL-CEPS/blob/main/Actividad%2002/scripts/proc13.sql)

Prueba: `EXEC GetAveragePriceOfConfections;`

![Test13](https://raw.githubusercontent.com/dbarretol/Practice-SQL-CEPS/refs/heads/main/Actividad%2002/recursos/Test13.png)

# Actividad 02

El código de solución se ubica en: 

Usar para la base de datos NorthWind para:

1.	Realizar un procedimiento almacenado que devuelva los clientes (Customers) según el país (Country).

Prueba: `EXEC GetCustomersByCountry @Country = 'Germany';`

2.	Crear un procedimiento que determine la cantidad de clientes cuyo identificador (o sea el código) inicia con un determinado carácter.

Prueba: `EXEC GetCustomerCountByInitial @Initial = 'A';`

3.	Realizar un procedimiento que determine la cantidad de registros que un cliente está en la tabla ORDERS.

Prueba: `EXEC GetOrderCountByCustomer @CustomerID = 'ALFKI';`

4.	Realizar una base de datos similar a Northwind, pero que los nombre de tablas, campos y registros estén en castellano.


5.	Realizar un procedimiento que seleccione todos los registros de tabla Productos y Categories a la vez.

Prueba: `EXEC GetAllProductsAndCategories;`

6.	Realizar un procedimiento que seleccione todos los productos que no corresponde a la categoría bebidas (1)

7.	Realizar un procedimiento que obtenga la cantidad de registros que no corresponde a condimentos

8.	Realizar un procedimiento que seleccionar todos los campos de los registros que no corresponden a categoría mariscos de la tabla productos.

9.	Realizar un procedimiento que seleccionar los campos nombre del producto y precio (únicamente) de los  productos diferentes a cárnicos.

10.	Realizar un procedimiento que obtenga la cantidad de productos granos y cereales.

11.	Realizar un procedimiento que seleccionar los campos nombre del producto y precio (únicamente) de los quesos y productos cárnicos.

12.	Realizar un procedimiento que seleccionar los campos nombre del producto, precio y stock (únicamente) de las frutas secas y mariscos.

13.	Realizar un procedimiento que seleccionar el promedio de los precios de los confites.

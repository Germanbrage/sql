/*  ##EJERCICIO 1
  1.Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), 
nombre (texto) y email (texto). */
CREATE TABLE IF NOT EXISTS public.clientes (
ID SERIAL PRIMARY KEY,
Name VARCHAR (255),
Email VARCHAR (255)
);

/*  2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y 
email="
 juan@example.com". */
INSERT INTO public.clientes (name, email)
VALUES ('Juan', 'juan@example.com');

/*  3. Actualizar el email del cliente con id=1 a "
 juan@gmail.com". */
 UPDATE public.clientes
SET email = 'juan@gmail.com'
WHERE id = 1;

/*  4. Eliminar el cliente con id=1 de la tabla "Clientes". */
DELETE FROM public.clientes
WHERE id = 1;

/*  5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero) */
CREATE TABLE IF NOT EXISTS public.pedidos (
ID SERIAL PRIMARY KEY,
Cliente_id INT,
Producto VARCHAR (255),
Cantidad INT,
FOREIGN KEY (Cliente_id) REFERENCES clientes (id)
);


/*  6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, 
producto="Camiseta" y cantidad=2 */
INSERT INTO pedidos (Cliente_id, Producto,Cantidad)
VALUES (1,'Camiseta',2);

/*  7. Actualizar la cantidad del pedido con id=1 a 3 */
UPDATE public.pedidos
SET cantidad = 3
WHERE id = 1;

/*  8. Eliminar el pedido con id=1 de la tabla "Pedidos". */
DELETE FROM public.pedidos
WHERE id = 1;

/*   9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave 
primaria), nombre (texto) y precio (decimal) */
CREATE TABLE IF NOT EXISTS public.productos (
ID SERIAL PRIMARY KEY,
Nombre VARCHAR (255),
Precio INT);

/*  10. Insertar varios productos en la tabla "Productos" con diferentes valores. */
INSERT INTO public.productos (nombre, precio)
VALUES ('Camiseta', 8),
       ('Cazadora', 20),
       ('Pantalón', 15);

/*  11. Consultar todos los clientes de la tabla "Clientes". */
SELECT * FROM clientes;

/*  12.Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes. */
SELECT pedidos.*, Clientes.name AS nombre_clientes
FROM pedidos
LEFT JOIN clientes ON clientes.id = pedidos.cliente_id;

/*  13.Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50 */
SELECT * FROM productos
WHERE precio > 50;

/*  14.Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5. */
SELECT * FROM pedidos
WHERE cantidad >  5;

/*  15.Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A". */
SELECT nombre FROM clientes
WHERE nombre LIKE 'A%';

/*  16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente. */
SELECT name, COUNT (pedidos.id) AS total_pedidos
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id 
GROUP BY clientes.name;

/*  17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto. */
SELECT Productos.nombre, SUM(Pedidos.cantidad) AS total_pedidos
FROM Productos
INNER JOIN Pedidos ON Productos.nombre = Pedidos.producto
GROUP BY Productos.nombre;

/*   18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha. */
ALTER TABLE Pedidos 
ADD COLUMN fecha DATE;

/*  19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto". */
ALTER TABLE pedidos
ALTER COLUMN producto TYPE int USING producto:integer;

ALTER TABLE pedidos
RENAME COLUMN producto TO producto_id;

ALTER TABLE Productos 
ADD CONSTRAINT unique_producto UNIQUE (id);

ALTER TABLE Pedidos
ADD CONSTRAINT fk_producto_id
FOREIGN KEY (producto_id)
REFERENCES Productos(id);

/*   20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa. */ 
SELECT 
    clientes.name AS Nombre_Cliente,
    productos.nombre AS Nombre_Producto,
    pedidos.cantidad AS Cantidad
FROM 
    pedidos
INNER JOIN 
    clientes ON pedidos.cliente_id = clientes.id
INNER JOIN 
    productos ON pedidos.producto = productos.id;

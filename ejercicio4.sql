/*  ##EJERCICIO 4
  NIVEL DIFICULTAD: EXPERTO
 1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y "id_producto" (entero, clave foránea de la tabla "Productos"). */
 CREATE TABLE IF NOT EXISTS pedidos (
  id SERIAL PRIMARY KEY,
  id_usuario INTEGER,
  id_producto INTEGER 
 FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
 FOREIGN KEY (id_producto) REFERENCES productos.(id)
 );

/*  2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos. */
INSERT INTO pedidos (id_usuario, id_producto)
VALUES (1,3),
       (1,6),
       (2,3),
       (3,1);

/*  3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE). */
SELECT 
    Usuarios.nombre AS Nombre_Usuario, 
    COALESCE(Productos.nombre, 'Sin pedido') AS Nombre_Producto
FROM 
    Usuarios
LEFT JOIN 
    Pedidos ON Usuarios.id = Pedidos.id_usuario
LEFT JOIN 
    Productos ON Pedidos.id_producto = Productos.id;

/*  4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que no han realizado ningún pedido (utiliza LEFT JOIN). */
SELECT 
    Usuarios.nombre AS Nombre_Usuario,
    IF(Pedidos.id IS NULL, 'No ha realizado pedidos', 'Ha realizado pedidos') AS Estado_Pedido
FROM 
    Usuarios
LEFT JOIN 
    Pedidos ON Usuarios.id = Pedidos.id_usuario;

/*  5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza 
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE) */
ALTER TABLE pedidos
ADD COLUMN cantidad INT DEFAULT 1; 

UPDATE pedidos 
SET cantidad = 5;

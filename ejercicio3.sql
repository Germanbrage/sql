/*  ##EJERCICIO 3
  NIVEL DIFICULTAD: DIFÍCIL
  1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico). */
CREATE TABLE productos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255),
	precio INTEGER
);

/*  2. Inserta al menos cinco registros en la tabla "Productos". */
INSERT INTO productos (nombre,precio)
VALUES 
    ('Cámara', 18),
    ('Rotulador', 2),
    ('Plato', 4),
    ('Camiseta', 9),
    ('Zapatos', 29);

/*  3. Actualiza el precio de un producto en la tabla "Productos". */
UPDATE productos
SET precio = 30 
WHERE id = 5;

/*  4. Elimina un producto de la tabla "Productos". */
DELETE FROM productos 
WHERE id = 5;

/*   5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la Tabla "Productos"). */
ALTER TABLE usuarios
ADD COLUMN id_producto INTEGER;

UPDATE usuarios
SET id_producto = productos.id
FROM productos
WHERE usuarios.id_producto = productos.id;

SELECT 
    usuarios.nombre as usuario,
    productos.nombre AS producto
FROM usuarios
INNER JOIN productos ON usuarios.id_producto = productos.id;

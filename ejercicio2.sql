/*  ##EJERCICIO 2
  NIVEL FÁCIL
  1. Crea una base de datos llamada "MiBaseDeDatos".
  (Se realiza sin escribir código)

  2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero). */
CREATE TABLE IF NOT EXISTS Usuarios (
id SERIAL PRIMARY KEY,
nombre VARCHAR (255),
edad INTEGER);

/*   3. Inserta dos registros en la tabla "Usuarios". */
INSERT INTO
	usuarios (nombre,edad)
VALUES
              ('Juan',23),
             ('Ricardo',31);

/*  4. Actualiza la edad de un usuario en la tabla "Usuarios". */
UPDATE usuarios
SET nombre = 'Rafa'
WHERE id = 1;

/*  5. Elimina un usuario de la tabla "Usuarios". */
DELETE FROM usuarios
WHERE id = 2;

/* NIVEL MODERADO
  1.Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto). */
CREATE TABLE IF NOT EXISTS Ciudades (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR (255),
	país VARCHAR (255)
);

/*  2. Inserta al menos tres registros en la tabla "Ciudades". */
INSERT INTO ciudades (nombre, pais)
VALUES
('Lima', 'Perú'),
('Ulán Bator', 'Mongolia'),
('Skopje', 'Macedonia');

/*   3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades". */
ALTER TABLE usuarios 
ADD COLUMN id_ciudad integer;

ALTER TABLE usuarios
ADD CONSTRAINT fk_usuario_ciudad
FOREIGN KEY (id_ciudad)
REFERENCES ciudades(id);

/*  4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN). */ 
SELECT 
    usuarios.nombre,
    ciudades.nombre AS ciudad,
    ciudades.país AS pais
FROM usuarios 
LEFT JOIN ciudades ON id_ciudad = ciudades.id;

/*   5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN). */
SELECT 
    usuarios.id,  
	usuarios.nombre,
    ciudades.nombre AS ciudad,
    ciudades.país AS pais
FROM usuarios 
INNER JOIN ciudades ON id_ciudad = ciudades.id;

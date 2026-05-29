
CREATE DATABASE bibloteca;
USE bibloteca;

--Tabla de autor
CREATE TABLE autor(
    id_autorINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

--Tabla Categoria
CREATE TABLE categoria(
    id_categoria INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   titulo VARCHAR(200) NOT NULL,
   año_publicacion YEAR NOT NULL,
   isbn VARCHAR(20) NOT NULL UNIQUE

);

--Tabla intermedia: Libro Autor
CREATE TABLE libro_autor(
    id libro INT NOT NULL,
    id_autor INT NOT NULL,

    PRIMARY KEY (id_libro, id_autor),

    FOREIGN KEY (id_libro) 
    REFERENCES autor(id_autor)
    ON DELETE CASCADE,

    FOREIGN KEY (id_autor)
    id_libro INT NOT NULL,
    id_categoria INT NOT NULL,
);
--tabla libro-categoria
CREATE TABLE libro_categoria(
    id_libro INT NOT NULL,
    id_categoria INT NOT NULL,

    PRIMARY KEY(id_libro,id_categoria),

    FOREIGN KEY (id_libro)
    REFERENCES libro(id_libro)
    ON DELETE CASCADE,

    FOREIGN KEY (id_categoria)
    REFERENCES categoria(id_categoria)
    ON DELETE CASCADE
);

--TABLA EJEMPLAR
CREATE TABLE ejemplar(
    id_ejemplar INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_libro INT NOT NULL,
    estado ENUM('disponible', 'prestado', 'reservado') default 'disponible',
    FOREIGN KEY (id_libro)
    ON DELETE CASCADE 
);

--TABLA USUARIO
CREATE TABLE usuario(
    id_usuario INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    matricula VARCHAR(30) NOT NULL UNIQUE,
    tipo ENUM('estudiante', 'profesor','empleado') DEFAULT 'estudiante'
);

--TABLA PRESTAMO
CREATE TABLE prestamo(
    id_prestamo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_ejemplar INT NOT NULL,

    fecha_salida DATE NOT NULL,
    fecha_devolucion_esperada  DATE NOT NULL,
    fecha_devolucion_ real DATE,

FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
FOREIGN KEY (id_ejemplar)
    REFERENCES ejemplar(id_ejemplar)
    
);

--tabla multa
CREATE TABLE multa(
    id_multa INT AUTO_INCREMENT NOT NULL PRIMARY KEY,

    id_prestamo INT NOT NULL UNIQUE,
    monto DECIMAL(10,2) NOT NULL,
    pagada BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (id_prestamo)
    REFERENCES prestamo (id_prestamo)
    ON DELETE CASCADE
)

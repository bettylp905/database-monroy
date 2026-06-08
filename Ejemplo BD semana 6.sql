
-- Crear Base de Datos
CREATE DATABASE IF NOT EXISTS escuela;
USE escuela;

-- Tabla de Departamentos
CREATE TABLE departamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de Profesores
CREATE TABLE profesores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(100),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);

-- Tabla de Cursos
CREATE TABLE cursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    creditos INT,
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES profesores(id)
);

-- Tabla de Estudiantes
CREATE TABLE estudiantes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(100),
    fecha_nacimiento DATE
);

-- Tabla de Inscripciones
CREATE TABLE inscripciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

-- Tabla de Aulas
CREATE TABLE aulas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    capacidad INT
);

-- Tabla de Horarios
CREATE TABLE horarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_curso INT,
    id_aula INT,
    dia_semana VARCHAR(15),
    hora_inicio TIME,
    hora_fin TIME,
    FOREIGN KEY (id_curso) REFERENCES cursos(id),
    FOREIGN KEY (id_aula) REFERENCES aulas(id)
);

-- Tabla de Notas
CREATE TABLE notas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_inscripcion INT,
    nota DECIMAL(4,2),
    FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id)
);
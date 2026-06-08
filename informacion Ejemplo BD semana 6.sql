
-- Insertar datos en Departamentos
INSERT INTO departamentos (nombre) VALUES 
('Matemáticas'), ('Ciencias'), ('Humanidades'), ('Ingeniería');

-- Insertar datos en Profesores
INSERT INTO profesores (nombre, apellido, email, id_departamento) VALUES
('Ana', 'Ramírez', 'ana.ramirez@escuela.edu', 1),
('Luis', 'González', 'luis.gonzalez@escuela.edu', 2),
('Clara', 'López', 'clara.lopez@escuela.edu', 3),
('Pedro', 'Martínez', 'pedro.martinez@escuela.edu', 4);

-- Insertar datos en Cursos
INSERT INTO cursos (nombre, creditos, id_profesor) VALUES
('Álgebra', 5, 1),
('Biología', 4, 2),
('Historia', 3, 3),
('Programación', 6, 4),
('Física', 4, 2),
('Ética', 2, 3);

-- Insertar datos en Estudiantes
INSERT INTO estudiantes (nombre, apellido, email, fecha_nacimiento) VALUES
('Juan', 'Pérez', 'juan.perez@correo.com', '2000-04-15'),
('María', 'Gómez', 'maria.gomez@correo.com', '2001-06-21'),
('Carlos', 'Sánchez', 'carlos.sanchez@correo.com', '1999-12-30'),
('Lucía', 'Díaz', 'lucia.diaz@correo.com', '2002-01-10');

-- Insertar datos en Inscripciones
INSERT INTO inscripciones (id_estudiante, id_curso, fecha_inscripcion) VALUES
(1, 1, '2024-01-15'),
(1, 2, '2024-01-15'),
(2, 1, '2024-01-20'),
(2, 3, '2024-01-21'),
(3, 4, '2024-01-22'),
(4, 5, '2024-01-23');

-- Insertar datos en Aulas
INSERT INTO aulas (nombre, capacidad) VALUES
('Aula 101', 30),
('Aula 102', 25),
('Laboratorio 1', 20),
('Sala Conferencias', 50);

-- Insertar datos en Horarios
INSERT INTO horarios (id_curso, id_aula, dia_semana, hora_inicio, hora_fin) VALUES
(1, 1, 'Lunes', '08:00:00', '10:00:00'),
(2, 2, 'Martes', '10:00:00', '12:00:00'),
(3, 4, 'Miércoles', '13:00:00', '15:00:00'),
(4, 3, 'Jueves', '09:00:00', '11:00:00'),
(5, 2, 'Viernes', '08:00:00', '10:00:00');

-- Insertar datos en Notas
INSERT INTO notas (id_inscripcion, nota) VALUES
(1, 8.5),
(2, 9.0),
(3, 7.5),
(4, 6.8),
(5, 9.2),
(6, 7.0);
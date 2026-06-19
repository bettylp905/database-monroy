DELIMITER \\

CREATE PROCEDURE sp_total_estudiantes_curso(
    IN p_id_curso INT
)
BEGIN
    SELECT c.nombre AS curso,
           COUNT(i.id) AS total_estudiantes
    FROM cursos c
    LEFT JOIN inscripciones i
        ON c.id = i.id_curso
    WHERE c.id = p_id_curso
    GROUP BY c.id, c.nombre;
END\\

DELIMITER //
-- SELECT * FROM vv_rendimiento;

use escuela;
-- CREATE VIEW vv_rendimiento AS
SELECT
 e.id,
 CONCAT(e.nombre,' ',e.apellido)
    AS estudiante,
avg(n.nota) AS promedio
FROM estudiantes e
JOIN inscripciones i
 ON e.id=i.id_estudiante
JOIN notas n
on i.id=n.id_inscripcion
GROUP BY e.id;
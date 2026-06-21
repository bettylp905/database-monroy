CREATE PROCEDURE ap_inscribir_seguro(
    IN p_estuddiante int,
    in p_curso INT
)
BEGIN 
IF EXISTS(
    SELECT 1
    FROM inscripciones
    WHERE id_estudiante=p_estudinte
    AND id_curso=p_curso
)THEN
 SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT='Ya inscrito';

 ELSE
 INSERT INTO inscripciones(
    id_estudiante.id_curso,
    fecha_inscripcion)
    VALUES(
        p_estudiante.p_curso,
        fecha_inscripcion)
    VALUES(
        p_estudiante,p_curso,CURDATE());
    END IF;
    
 END;
 
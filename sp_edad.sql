DELIMITER //

CREATE PROCEDURE sp_calcular_edad( IN p_id_estudiante INT, OUT p_edad INT)
BEGIN
    -- Calculamos la edad y la guardamos en la variable de salida (p_edad)
    SELECT 
    TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE()) --timestampdiff calcula la diferencia en años entre la fecha de nacimiento y la fecha actual
    INTO p_edad
    FROM estudiantes e
    WHERE e.id = p_id_estudiante;
END //

DELIMITER ;

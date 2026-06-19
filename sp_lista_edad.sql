DELIMITER //

CREATE PROCEDURE sp_lista_edad()
BEGIN
    -- Calculamos la edad y la guardamos en la variable de salida (p_edad)
    SELECT CONCAT(e.nombre, ' ', e.apellido) as nombre, 
        TIMESTAMPDIFF(YEAR, e.fecha_nacimiento, CURDATE()) as edad
    FROM estudiantes e
    ORDER BY e.nombre;
END //

DELIMITER ;
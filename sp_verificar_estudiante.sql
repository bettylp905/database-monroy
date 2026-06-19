DELIMITER //

CREATE PROCEDURE sp_inscribir_flujo_completo(
    IN p_id_estudiante INT,
    IN p_id_curso INT
)
BEGIN
    -- Declaramos las cajitas (variables) para guardar nuestras validaciones
    DECLARE v_existe_estudiante INT;
    DECLARE v_existe_curso INT;
    DECLARE v_ya_inscrito INT;

    -- PASO 1: Verificar que el estudiante existe
    SELECT COUNT(*) INTO v_existe_estudiante
    FROM estudiantes
    WHERE id = p_id_estudiante;

    -- PASO 2: Verificar que el curso existe
    SELECT COUNT(*) INTO v_existe_curso
    FROM cursos
    WHERE id = p_id_curso;

    -- PASO 3: Verificar que no exista inscripción previa
    SELECT COUNT(*) INTO v_ya_inscrito
    FROM inscripciones
    WHERE id_estudiante = p_id_estudiante AND id_curso = p_id_curso;

    -- PASO 4: Evaluamos las condiciones y decidimos si inscribir o rechazar
    IF v_existe_estudiante = 0 THEN
        -- Falla el Paso 1
        SELECT 'Error: El estudiante no está registrado en el sistema.' AS Mensaje_Retorno;
        
    ELSEIF v_existe_curso = 0 THEN
        -- Falla el Paso 2
        SELECT 'Error: El curso indicado no existe en la escuela.' AS Mensaje_Retorno;
        
    ELSEIF v_ya_inscrito > 0 THEN
        -- Falla el Paso 3
        SELECT 'Error: El estudiante ya se encuentra inscrito en este curso.' AS Mensaje_Retorno;
        
    ELSE
        -- ¡Pasa todas las pruebas! Procedemos a inscribirlo
        INSERT INTO inscripciones (id_estudiante, id_curso, fecha_inscripcion)
        VALUES (p_id_estudiante, p_id_curso, CURDATE());
        
        -- Retornamos el mensaje de éxito
        SELECT 'Éxito: El estudiante ha sido inscrito al curso correctamente.' AS Mensaje_Retorno;
        
    END IF;

END //

DELIMITER ;
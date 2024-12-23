USE elcuervopetshop;

-- __________________________________________________________________________________________________________
-- PRIMER PROCEDIMIENTO TCL -- REGISTRAR UN NUEVO PROGRAMA DE FIDELIZACIÓN
DELIMITER //

CREATE PROCEDURE RegistrarProgramaFidelidad (
    IN p_id_cliente INT,
    IN p_puntos INT,
    IN p_nivel_fidelidad ENUM('ALTO', 'MEDIO', 'BAJO')
)
BEGIN
    -- INICIAR LA TRANSACCIÓN
    START TRANSACTION;

    -- INSERTAR UN NUEVO CLIENTE AL PROGRAMA DE FIDELIZACIÓN
    INSERT INTO programas_de_fidelidad (id_cliente, puntos_acumulados, nivel_fidelidad)
    VALUES (p_id_cliente, p_puntos, p_nivel_fidelidad);

    -- HACER PERMANENTE LA TRANSACCIÓN
    COMMIT;
    
END //

DELIMITER ;


-- __________________________________________________________________________________________________________
-- SEGUNDO PROCEDIMIENTO TCL -- ACTUALIZAR EL PRECIO DE UN PRODUCTO


DELIMITER //

CREATE PROCEDURE ActualizarPrecioProducto (
    IN p_id_producto INT,
    IN p_precio_nuevo DECIMAL(10, 2)
)
BEGIN
    -- DECLARACIÓN DE VARIABLES
    DECLARE v_existente INT;

    -- INICIAR LA TRANSACCIÓN
    START TRANSACTION;

    -- CHEQUEO DE LA EXISTENCIA DEL PRODUCTO
    SELECT COUNT(*) INTO v_existente FROM productos WHERE id_producto = p_id_producto;

    -- SI EL PRODUCTO NO EXISTE, HACER ROLLBACK
    IF v_existente = 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no existe';
    ELSE
        -- SI EL PRODUCTO EXISTE, ACTUALIZAR EL PRECIO
        UPDATE productos
        SET precio = p_precio_nuevo
        WHERE id_producto = p_id_producto;

        -- HACER PERMANENTE LA TRANSACCIÓN
        COMMIT;
    END IF;
    
END //

DELIMITER ;


-- __________________________________________________________________________________________________________
-- TERCER PROCEDIMIENTO TCL -- REGISTRAR UNA PROMOCIÓN
DELIMITER //

CREATE PROCEDURE RegistrarPromocion (
    IN p_nombre_promocion VARCHAR(255),
    IN p_descripcion TEXT,
    IN p_fecha_inicio DATETIME,
    IN p_fecha_fin DATETIME,
    IN p_descuento DECIMAL(5, 2)
)
BEGIN
    -- INICIAR LA TRANSACCIÓN
    START TRANSACTION;

    -- SAVEPOINT
    SAVEPOINT antes_promocion;

    -- INSERTAR LA NUEVA PROMOCIÓN
    INSERT INTO promociones (nombre_promocion, descripcion, fecha_inicio, fecha_fin, porcentaje_descuento)
    VALUES (p_nombre_promocion, p_descripcion, p_fecha_inicio, p_fecha_fin, p_descuento);

    -- HACER PERMANENTE LA TRANSACCIÓN
    COMMIT;

END //

DELIMITER ;

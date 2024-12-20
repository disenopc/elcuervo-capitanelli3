USE elcuervopetshop;


-- Usuario para área de compras (usuario 1)
CREATE USER "usuario_1"@"%" IDENTIFIED BY pass_123!;
GRANT SELECT ON elcuervopetshop.vista_rotacion_inventarios TO "usuario_1"@"%";
GRANT SELECT ON elcuervopetshop.vista_mensual_crecimiento_ventas TO "usuario_1"@"%";
-- Usuario para área de ventas (usuario 2)
CREATE USER "usuario_2"@"%" IDENTIFIED BY pass_123!;
GRANT SELECT ON elcuervopetshop.* TO "usuario_2"@"%";
-- Usuario para área de postventa (usuario 3)
CREATE USER "usuario_3"@"%" IDENTIFIED BY pass_123!;
GRANT ALL PRIVILEGES ON elcuervopetshop.* TO "usuario_3"@"%";

FLUSH PRIVILEGES;

SELECT * FROM mysql.user;
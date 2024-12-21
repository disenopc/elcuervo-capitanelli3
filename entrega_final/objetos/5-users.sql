USE elcuervopetshop;


DROP USER IF EXISTS 
'usuario_uri'@'%',
'usuario_gero'@'%',
'usuario_dani'@'%';


-- Usuario para área de compras (usuario 1)
CREATE USER 'usuario_uri'@'%' IDENTIFIED BY 'pass_123!';
GRANT SELECT ON elcuervopetshop.vista_rotacion_inventarios TO 'usuario_uri'@'%';
GRANT SELECT ON elcuervopetshop.vista_mensual_crecimiento_ventas TO 'usuario_uri'@'%';

-- Usuario para área de ventas (usuario 2)
CREATE USER 'usuario_gero'@'%' IDENTIFIED BY 'pass_123!';
GRANT SELECT ON elcuervopetshop.* TO 'usuario_gero'@'%';

-- Usuario para área de postventa (usuario 3)
CREATE USER 'usuario_dani'@'%' IDENTIFIED BY 'pass_123!';
GRANT ALL PRIVILEGES ON elcuervopetshop.* TO 'usuario_dani'@'%';

FLUSH PRIVILEGES;

SELECT * FROM mysql.user;

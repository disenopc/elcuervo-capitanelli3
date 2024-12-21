-- Usuario sin permiso de root
DROP DATABASE IF EXISTS elcuervopetshop;
CREATE DATABASE IF NOT EXISTS  elcuervopetshop;


DROP USER IF EXISTS 'non_root'@'%';
CREATE USER 'non_root'@'%' IDENTIFIED BY 'pass_123!';
GRANT ALL PRIVILEGES ON elcuervopetshop.* TO 'non_root'@'%' WITH GRANT OPTION;
GRANT SUPER ON *.* TO 'non_root'@'%' WITH GRANT OPTION;

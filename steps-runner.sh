# para levantar este contenedor con el servidor de mysql:

docker compose up --build -d


# acceder a ese contenedor para ver que data tiene

docker exec -it mysql-server bash


#crear la base de datos desde el codigo sql creado

docker exec -it -e MYSQL_PWD="coderhouse" mysql-server mysql -u root -e "source /proyecto_sql/entrega_final/estructura.sql;"


# ver las tablas 

docker exec -it mysql-server mysql -u root -p -e "SHOW TABLES FROM elcuervopetshop"


# popular la base de datos

docker exec -it -e MYSQL_PWD="coderhouse" mysql-server mysql -u root -e "source /proyecto_sql/entrega_final/population.sql;"


# borrar todo y poner de cero

docker exec -it -e MYSQL_PWD="coderhouse" mysql-server mysql -u root -e "DROP DATABASE IF EXISTS elcuervopetshop;"

docker exec -it -e MYSQL_PWD="coderhouse" mysql-server \
mysql \
--verbose \
-u root \
-e "source proyecto_sql/entrega_final/estructura.sql;\
source proyecto_sql/entrega_final/population.sql;\
source proyecto_sql/entrega_final/objetos/1-vistas.sql;\
source proyecto_sql/entrega_final/objetos/2-funciones.sql;\
source proyecto_sql/entrega_final/objetos/3-procedimientos.sql;\
source proyecto_sql/entrega_final/objetos/4-triggers.sql;"



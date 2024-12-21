# para levantar este contenedor con el servidor de mysql:
docker compose up --build -d

# al estar dentro de una carpeta agregar el nombre de la carpeta si no ejecuta
docker compose -f "entrega_final/docker-compose.yml" up --build -d

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

# Levantar el proyecto como root
docker exec -it -e MYSQL_PWD="coderhouse" mysql-server \
mysql --verbose -u root -e "
    source proyecto_sql/entrega_final/estructura.sql;
    source proyecto_sql/entrega_final/population.sql;
    source proyecto_sql/entrega_final/objetos/1-vistas.sql;
    source proyecto_sql/entrega_final/objetos/2-funciones.sql;
    source proyecto_sql/entrega_final/objetos/3-procedimientos.sql;
    source proyecto_sql/entrega_final/objetos/4-triggers.sql;
    source proyecto_sql/entrega_final/objetos/5-users.sql;"

# Levantar todo como usuario non-root
#Levantar como root
docker exec -it -e MYSQL_PWD="coderhouse" mysql-server mysql -u root -e "source proyecto_sql/entrega_final/usuario-non-root.sql;"

docker exec -it -e MYSQL_PWD="pass_123!" mysql-server \
mysql --verbose -u non_root -e "
source proyecto_sql/entrega_final/estructura.sql;
source proyecto_sql/entrega_final/population.sql;
source proyecto_sql/entrega_final/objetos/1-vistas.sql;
source proyecto_sql/entrega_final/objetos/2-funciones.sql;
source proyecto_sql/entrega_final/objetos/3-procedimientos.sql;
source proyecto_sql/entrega_final/objetos/4-triggers.sql;
source proyecto_sql/entrega_final/objetos/5-users.sql;"

# Dar de baja la base de datos
docker compose down

# Ver info de las tablas en cada una en particular 
docker exec -it mysql-server mysql -u root -p -e "SELECT * FROM elcuervopetshop.promociones;"
docker exec -it mysql-server mysql -u root -p -e "SELECT * FROM elcuervopetshop.categoria_de_producto;"
 # en caso de querer visualizar otra tabla solo reemplazar lo que sigue luego del punto de "elcuervopetshop."
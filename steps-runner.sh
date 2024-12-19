# para levantar este contenedor con el servidor de mysql:

docker compose up -- build -d


# acceder a ese contenedor para ver que data tiene

docker exec -it mysql - server bash

#crear la base de datos desde el codigo sql creado

docker exec -it mysql-server mysql -u root -p -e "source ./elcuervo-capitanelli3/mysql:/estructura.sql;"

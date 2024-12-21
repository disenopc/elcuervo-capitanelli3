#!make
include .env


SERVICE_NAME=mysql-server
HOST=127.0.0.1
PORT=3306
PASSWORD=${ROOT_PASSWORD}
DATABASE=${DATABASE_NAME}
BACKUP_DIR_FILES=${BACKUP_DIR}

DOCKER_COMPOSE_FILE=./docker-compose.yml
DATABASE_CREATION=/proyecto_sql/entrega_final/estructura.sql
DATABASE_POPULATION=/proyecto_sql/entrega_final/population.sql
CURDATE=$(shell date --iso=seconds)

FILES := $(wildcard ./objects/*.sql)


.PHONY: all up objects clean

all: info up objects

info:
	@echo "This is a project for $(DATABASE)"
	

up:
	@echo "Create the instance of docker"
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d --build

	@echo "Waiting for MySQL to be ready..."
	bash wait_docker.sh


	@echo "Create the import and run de script"
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root -e "source $(DATABASE_CREATION);"
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root --local-infile=1 -e "source $(DATABASE_POPULATION)"

objects:
	@echo "Create objects in database"
	@for file in $(FILES); do \
	    echo "Process $$file and add to the database: $(DATABASE_NAME)"; \
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME)  mysql -u root -e "source $$file"; \
	done

test-db:
	@echo "Testing the tables"
	@TABLES=$$(docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root -N -B -e "USE $(DATABASE_NAME); SHOW TABLES;"); \
	for TABLE in $$TABLES; do \
		echo "Table: $$TABLE"; \
		docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root -N -B -e "USE $(DATABASE_NAME); SELECT * FROM $$TABLE LIMIT 5;"; \
		echo "----------------------------------------------"; \
	done

access-db:
	@echo "Access to db-client"
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root

backup-db:
	@echo "Back up database by structure and data"
	# Dump MySQL database to a file
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysqldump -u root $(DATABASE) > ./$(BACKUP_DIR_FILES)/$(DATABASE)-$(CURDATE).sql

clean-db:
	@echo "Remove the Database"
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root --host $(HOST) --port $(PORT) -e "DROP DATABASE IF EXISTS $(DATABASE);"
	@echo "Bye"
	docker compose -f $(DOCKER_COMPOSE_FILE) down
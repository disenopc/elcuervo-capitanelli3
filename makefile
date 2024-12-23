#!make
include .env


SERVICE_NAME=mysql-server
HOST=127.0.0.1
PORT=3306
PASSWORD=${ROOT_PASSWORD}
DATABASE=${DATABASE_NAME}
BACKUP_DIR_FILES=entrega_final/${BACKUP_DIR}

DOCKER_COMPOSE_FILE=./docker-compose.yml
DATABASE_CREATION=/proyecto_sql/entrega_final/estructura.sql
DATABASE_POPULATION=/proyecto_sql/entrega_final/population.sql
CURDATE=$(shell date +%Y%m%d_%H%M%S)

FILES := $(wildcard ./proyecto_sql/entrega_final/objetos/.)
OBJECTS_DIR=./entrega_final/objetos

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
	@echo "Creando objetos en la base de datos: $(DATABASE_NAME)"
	# Montar y procesar cada archivo de la carpeta objetos
	@for file in $(OBJECTS_DIR)/*.sql; do \
	    echo "Procesando $$file y agregando a la base de datos: $(DATABASE_NAME)"; \
	    docker exec -i -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root $(DATABASE_NAME) < $$file; \
	done
	@echo "Todos los objetos han sido creados correctamente."

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



debug-objects:
	@echo "==== Debugging Database Objects ===="
	@echo "\n=== Stored Procedures ==="
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root -e "SELECT ROUTINE_NAME, ROUTINE_TYPE FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA='$(DATABASE)';"
	@echo "\n=== Triggers ==="
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root -e "SELECT TRIGGER_NAME, EVENT_MANIPULATION, EVENT_OBJECT_TABLE FROM information_schema.TRIGGERS WHERE TRIGGER_SCHEMA='$(DATABASE)';"
	@echo "\n=== Views ==="
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root -e "SELECT TABLE_NAME FROM information_schema.VIEWS WHERE TABLE_SCHEMA='$(DATABASE)';"
	@echo "\n=== Functions ==="
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root -e "SELECT ROUTINE_NAME FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA='$(DATABASE)' AND ROUTINE_TYPE='FUNCTION';"




backup-db:
	@echo "Creando respaldo completo de la base de datos, incluyendo estructura y datos..."
	@mkdir -p ./$(BACKUP_DIR_FILES)
	# Realizar respaldo de estructura y datos de la base de datos
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysqldump -u root \
		--routines \
		--triggers \
		--events \
		--databases $(DATABASE) \
		--add-drop-database \
		--add-drop-table \
		--create-options \
		--single-transaction \
		--set-gtid-purged=OFF \
		--dump-date \
		--add-locks \
		--comments \
		> ./$(BACKUP_DIR_FILES)/$(DATABASE)-$(CURDATE).sql

	@echo "Incluyendo los objetos de la carpeta $(OBJECTS_DIR)..."
	# Concatenar los objetos al archivo de respaldo
	@cat $(OBJECTS_DIR)/*.sql >> ./$(BACKUP_DIR_FILES)/$(DATABASE)-$(CURDATE).sql

	@echo "Respaldo completado en ./$(BACKUP_DIR_FILES)/$(DATABASE)-$(CURDATE).sql"

clean-db:
	@echo "Remove the Database"
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root --host $(HOST) --port $(PORT) -e "DROP DATABASE IF EXISTS $(DATABASE);"
	@echo "Bye"
	docker compose -f $(DOCKER_COMPOSE_FILE) down



check-files:
	@echo "=== Checking Object Files ==="
	@echo "Looking for SQL files in: $(OBJECTS_DIR)"
	@ls -la $(OBJECTS_DIR)*.sql || echo "No SQL files found"
	@echo "\n=== File Contents Preview ==="
	@for file in $(OBJECTS_DIR)*.sql; do \
		if [ -f "$$file" ]; then \
			echo "\nFile: $$file"; \
			head -n 5 "$$file"; \
		fi \
	done


verify-objects:
	@echo "=== Verifying Database Connection ==="
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root -e "SELECT DATABASE();"
	
	@echo "\n=== Checking Database Objects ==="
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root $(DATABASE) -e "\
		SELECT 'Procedures' as object_type, COUNT(*) as count FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA='$(DATABASE)' AND ROUTINE_TYPE='PROCEDURE' \
		UNION ALL \
		SELECT 'Functions', COUNT(*) FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA='$(DATABASE)' AND ROUTINE_TYPE='FUNCTION' \
		UNION ALL \
		SELECT 'Triggers', COUNT(*) FROM information_schema.TRIGGERS WHERE TRIGGER_SCHEMA='$(DATABASE)' \
		UNION ALL \
		SELECT 'Views', COUNT(*) FROM information_schema.VIEWS WHERE TABLE_SCHEMA='$(DATABASE)';"

load-test-object:
	@echo "=== Creating Test Procedure ==="
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root $(DATABASE) -e "\
		DROP PROCEDURE IF EXISTS test_proc; \
		DELIMITER // \
		CREATE PROCEDURE test_proc() \
		BEGIN \
			SELECT 'Test procedure works' AS message; \
		END // \
		DELIMITER ;"
	
	@echo "\n=== Verifying Test Procedure ==="
	docker exec -it -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root $(DATABASE) -e "\
		SELECT ROUTINE_NAME, ROUTINE_TYPE \
		FROM information_schema.ROUTINES \
		WHERE ROUTINE_SCHEMA='$(DATABASE)';"
restore-db:
	@echo "Restaurando la base de datos desde el archivo de respaldo..."
	docker exec -i -e MYSQL_PWD=$(PASSWORD) $(SERVICE_NAME) mysql -u root $(DATABASE) < ./$(BACKUP_DIR_FILES)/$(DATABASE)-$(CURDATE).sql
	@echo "Restauración completada."
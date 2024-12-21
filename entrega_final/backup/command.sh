# Mi backup con mysqldump teniendo en cuenta funciones y procedimientos


mysqldump -u root -p `
--host=127.0.0.1 `
--port=3306 `
--databases elcuervopetshop `
--routines `
--verbose | Out-File -Encoding utf8 backup-elcuervopetshop.bk.sql

CREATE DATABASE IF NOT EXISTS docker_db;
CREATE USER IF NOT EXISTS obelkhad@'%' IDENTIFIED BY 'obelkhad_passwd';
GRANT ALL PRIVILEGES ON docker_db.* TO obelkhad@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root_passwd';
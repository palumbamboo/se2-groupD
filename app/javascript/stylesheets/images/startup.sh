#!/bin/bash
dpkg-reconfigure mysql-server-5.7
service mysql start
mkdir -p ./uploads/materials
mysql -u root "-ppwd" -e "Alter USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'pwd'"
mysql -u root "-ppwd" -e "CREATE DATABASE students; USE students;"
mysql -u root "-ppwd" students -e "source ./db/init_db.sql"
node server.js
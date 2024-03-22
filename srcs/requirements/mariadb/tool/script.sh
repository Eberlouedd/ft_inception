#!/bin/bash

service mysql start

if [ -d /var/lib/mysql/${SQL_DATABASE} ]
then
	echo "The database already exists."
else
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"
fi

mysqladmin -uroot -p$SQL_ROOT_PASSWORD shutdown && echo -e "shutdown [\033[32mOK\033[0m]"

exec mysqld_safe

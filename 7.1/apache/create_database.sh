#!/bin/bash

while [ ! -e /var/run/mysqld/mysqld.sock ]
do
  sleep 0.5
done

cat /database_vars
. /database_vars

password="$(sudo mysql <<< "SELECT PASSWORD('${MYSQL_PASSWORD}');" | grep "^*")"
sudo mysql <<< "\
CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@\`%\` IDENTIFIED BY PASSWORD '${password}';\
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@\`%\`;\
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;\
FLUSH PRIVILEGES;\
"

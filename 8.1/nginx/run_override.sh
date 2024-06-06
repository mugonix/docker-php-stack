#!/bin/bash

sudo -E bash -c 'echo "MYSQL_DATABASE=${MYSQL_DATABASE}" > /database_vars'
sudo -E bash -c 'echo "MYSQL_USER=${MYSQL_USER}" >> /database_vars'
sudo -E bash -c 'echo "MYSQL_PASSWORD=${MYSQL_PASSWORD}" >> /database_vars'

sudo chmod o+x /run.sh

exec /run.sh

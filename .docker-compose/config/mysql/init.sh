#!/bin/bash
create() {
  # Create Databases
  mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"CREATE DATABASE IF NOT EXISTS magento;"
  mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"CREATE DATABASE IF NOT EXISTS wp;"
  # Grant privileges
  mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"GRANT ALL ON magento.* TO $MYSQL_USER;"
  mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"GRANT ALL ON wp.* TO $MYSQL_USER;"
}

create

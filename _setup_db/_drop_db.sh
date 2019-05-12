#!/bin/bash
# This is script to drop database
# All reguired configs are set by set_env.sh

###########################################################################
echo "Dropping database and user"
###########################################################################

echo "Please enter root user MySQL password!"
# not secure but fast way for demo app to request password
read -s rootpasswd

mysql -u${DBROOTUSR} -p${rootpasswd} -e "DROP DATABASE IF EXISTS ${DBNAME};"
mysql -u${DBROOTUSR} -p${rootpasswd} -e "DROP USER ${DBUSR}@localhost;"

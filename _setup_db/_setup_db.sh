#!/bin/bash
# This is script to create database
# All reguired configs are set by set_env.sh

###########################################################################
echo "Creating data base and user"
###########################################################################
# If /root/.my.cnf exists then it won't ask for root password
if [ -f /root/.my.cnf ]; then

	mysql -e "CREATE DATABASE IF NOT EXISTS ${DBNAME} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
	mysql -e "CREATE USER ${DBUSR}@localhost IDENTIFIED BY '${DBPWD}';"
	mysql -e "GRANT ALL PRIVILEGES ON ${DBNAME}.* TO '${DBUSR}'@'localhost';" # for demo app just granting all priviledges
	mysql -e "FLUSH PRIVILEGES;"

# If /root/.my.cnf doesn't exist then it'll ask for root password   
else
	echo "Please enter root user MySQL password!"
	# not secure but fast way for demo app to request password
	read -s rootpasswd
	mysql -u${DBROOTUSR} -p${rootpasswd} -e "CREATE DATABASE IF NOT EXISTS ${DBNAME} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
	mysql -u${DBROOTUSR} -p${rootpasswd} -e "CREATE USER ${DBUSR}@localhost IDENTIFIED BY '${DBPWD}';"
	mysql -u${DBROOTUSR} -p${rootpasswd} -e "GRANT ALL PRIVILEGES ON ${DBNAME}.* TO '${DBUSR}'@'localhost';" # for demo app just granting all priviledges
	mysql -u${DBROOTUSR} -p${rootpasswd} -e "FLUSH PRIVILEGES;"
fi

###########################################################################
echo "Loading schemas"
###########################################################################
if [ -f ${SCHEMA_FILE} ]; then

	mysql -u${DBUSR} ${DBNAME} < ${SCHEMA_FILE}

else

	echo "Error: Missing schema file (${SCHEMA_FILE})!"

fi

###########################################################################
echo "Seeding initial data"
###########################################################################
if [ -f ${DATA_FILE} ]; then

	mysql -u${DBUSR} ${DBNAME} < ${DATA_FILE}

else

	echo "Error: Missing data file (${DATA_FILE})!"

fi

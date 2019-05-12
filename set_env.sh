#!/bin/bash

###########################################################
# This config part used by api and _setup_db
###########################################################
# data base host
export DBHOST="localhost"
# data base port
export DBPORT=3306
# data base root user
export DBROOTUSR="root"
# data base user
export DBUSR="quiz_app"
# data base password. 
# For this demo app will be not encrypted just empty
export DBPWD=""
# data base name
export DBNAME="quiz_app"

###########################################################
# This part used only by _setup_db
###########################################################
# quiz schema file
export SCHEMA_FILE="quiz_schema.sql"
# quiz data seed file
export DATA_FILE="quiz_data.sql"
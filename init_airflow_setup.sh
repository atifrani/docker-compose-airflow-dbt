#!/bin/sh

# WARNING: Run this script only during initial airflow db setup.

IS_INITDB=True
AIRFLOW_USER=admin
AIRFLOW_PASSWORD=password12345
AIRFLOW_USER_EMAIL=axel@airflow.com

if [ $IS_INITDB ]; then

  echo "Initializing Airflow DB setup and Admin user setup because value of IS_INITDB is $IS_INITDB"
  echo " Airflow admin username will be $AIRFLOW_USER"

  docker exec -ti airflow_webserver_cont airflow db migrate && echo "Initialized airflow DB"
  docker exec -ti airflow_webserver_cont airflow users create --role Admin --username $AIRFLOW_USER --password $AIRFLOW_PASSWORD -e $AIRFLOW_USER_EMAIL -f airflow -l airflow && echo "Created airflow Initial admin user with username $AIRFLOW_USER"

else
  echo "Skipping InitDB and InitUser setup because value of IS_INITDB is $IS_INITDB"
fi

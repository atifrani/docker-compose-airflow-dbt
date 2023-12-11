# How to Scale-out Apache Airflow 2.7 with Redis and Celery:

## docker-compose-airflow


_Note: Updated to Airflow version 2.2.0_

Docker Compose Apache Airflow (Official Docker Images) with CeleryExecutor, InitDB and InitUser

Ideal for small/medium aiflow deployments.

### Features
- Add any linux packages to image
- Add python libraries to the image.


### How to deploy:

**Prerequisite**: Docker and docker-compose to be installed. 

**Step 1:** Clone this Repo and open terminal.

**Step 2:** Go through .env file, init_airflow_setup.sh, docker-compose.yml file to change settings according to your preference. Or you can just keep them as it is for local development.

**Step 3:** Build customer docker image Run `docker build . -f Dockerfil  --tag dbt-airflow`

**Step 3:** Run `docker-compose up -d`

**Step 4:** Run `sh init_airflow_setup.sh` (Run this only for initial deployment)

**Step 5:** Go to http://localhost:8080 and login with user: admin and password: password12345 as specified in init_airflow_setup.sh script

**Step 6:** Run few dags and monitor Celery workers at http://localhost:5555

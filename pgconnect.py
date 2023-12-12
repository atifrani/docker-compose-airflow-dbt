from os import environ as env
import configparser

# Open the Airflow config file
config = configparser.ConfigParser()
config.read('/root/airflow/airflow.cfg')

# Store the URL of the Postgresql database
config['core']['sql_alchemy_conn'] = 'postgresql+psycopg2://{user}:{password}@postgres/{db}'.format(user=env.get('POSTGRES_USER'), password=env.get('POSTGRES_PASSWORD'), db=env.get('POSTGRES_DB'))
#config['core']['executor'] = 'LocalExecutor'
config['core']['executor'] = 'CeleryExecutor'
with open('/root/airflow/airflow.cfg', 'w') as f:
     config.write(f)  
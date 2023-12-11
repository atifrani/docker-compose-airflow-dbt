FROM apache/airflow:2.7.3

# Install any linux packages here (Optional)

USER root

RUN apt-get update -yqq \
    && apt-get install -y vim \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Add any python libraries  (Optional)
#https://airflow.apache.org/docs/apache-airflow/stable/extra-packages-ref.html?highlight=snowflake

USER airflow

RUN pip install --no-cache-dir --user \
    'python-dotenv' \
    'apache-airflow-providers-http==2.0.1' \
    'apache-airflow-providers-postgres==2.2.0' \
    'dbt-snowflake==1.7.1' \
    'apache-airflow-providers-snowflake==5.1.2'


USER airflow

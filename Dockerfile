FROM apache/airflow:2.7.3

# Install any linux packages here (Optional)

USER root

RUN apt-get update -yqq \
    && apt-get install -y vim \
    && apt-get install -y netcat \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add any python libraries 

USER airflow

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

USER airflow

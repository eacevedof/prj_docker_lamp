FROM jupyter/pyspark-notebook

USER root

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    -y jq vim wget unzip ca-certificates cron procps moreutils bsdmainutils build-essential git

RUN wget https://github.com/duckdb/duckdb/releases/download/v1.0.0/duckdb_cli-linux-amd64.zip -O /tmp/duckdb_cli.zip \
    && unzip /tmp/duckdb_cli.zip -d /duckdb \
    && sleep 3 \
    && mv /duckdb/duckdb /duckdb/duckdb-cli

RUN chmod -R 777 /home/jovyan/work

COPY ./.bashrc /home/jovyan/.bashrc

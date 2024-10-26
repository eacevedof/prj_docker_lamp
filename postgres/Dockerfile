# https://hub.docker.com/_/postgres
# 17.0 no admite pgvector
# FROM postgres:17.0
FROM ankane/pgvector

#ARG POSTGRES_VERSION=15

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    -y jq vim wget unzip ca-certificates

RUN chmod -R 777 /var/lib/postgresql
RUN chmod -R 777 /tmp

COPY ./.bashrc /root/.bashrc
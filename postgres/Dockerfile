# https://hub.docker.com/_/postgres
# 17.0 no admite pgvector
# FROM postgres:17.0
FROM ankane/pgvector

#ARG POSTGRES_VERSION=15

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    -y jq vim curl wget unzip ca-certificates procps bsdmainutils build-essential git

RUN chmod -R 777 /var/lib/postgresql
RUN chmod -R 777 /tmp

COPY ./.bashrc /root/.bashrc

RUN apt-get -y install vsftpd
RUN mkdir -p /ftp/logs && chmod 777 /ftp/logs
RUN mkdir -p /ftp/etl/in && chmod 777 /ftp/etl/in
RUN mkdir -p /ftp/etl/out && chmod 777 /ftp/etl/out

RUN mkdir /app_shared
RUN chmod -R 777 /app_shared

COPY ftp-up.sh /ftp/ftp-up.sh
RUN chmod +x /ftp/ftp-up.sh

COPY vsftpd.conf /etc/vsftpd.conf
RUN chmod 666 /etc/vsftpd.conf

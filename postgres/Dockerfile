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
RUN mkdir -p /etl/in && chmod 666 /etl/in
RUN mkdir -p /etl/out && chmod 666 /etl/out

COPY ftp-up.sh /etl/ftp-up.sh
RUN chmod +x /etl/ftp-up.sh

COPY vsftpd.conf /etc/vsftpd.conf
RUN chmod 666 /etc/vsftpd.conf

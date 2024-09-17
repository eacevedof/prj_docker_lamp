# https://hub.docker.com/_/mariadb
FROM mysql:8.0.24

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    -y jq vim wget unzip ca-certificates

RUN chmod -R 777 /var/lib/mysql
RUN chmod -R 777 /tmp
RUN echo "disable-log-bin=1" >> /etc/mysql/my.cnf \
    && echo "tmpdir=/tmp" >> /etc/mysql/my.cnf \
    && echo "sort_buffer_size=8M" >> /etc/mysql/my.cnf

# https://duckdb.org/docs/guides/file_formats/excel_import.html
RUN wget https://github.com/duckdb/duckdb/releases/download/v1.0.0/duckdb_cli-linux-amd64.zip -O /tmp/duckdb_cli.zip \
    && unzip /tmp/duckdb_cli.zip -d /duckdb \
    && sleep 3 \
    && mv /duckdb/duckdb /duckdb/duckdb-cli

COPY ./.bashrc /root/.bashrc

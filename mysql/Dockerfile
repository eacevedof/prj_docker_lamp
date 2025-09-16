FROM mysql:8.0.24

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C


RUN mv /etc/apt/sources.list /etc/apt/sources.list.old \
    && echo "deb http://archive.debian.org/debian buster main contrib non-free" > /etc/apt/sources.list \
    && echo "deb http://archive.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list \
    && echo "deb http://archive.debian.org/debian buster-updates main" >> /etc/apt/sources.list \
    && apt-get update -o Acquire::Check-Valid-Until=false


RUN apt-get -y install --no-install-recommends \
    -y jq vim wget unzip ca-certificates procps curl build-essential git

# https://duckdb.org/docs/guides/file_formats/excel_import.html
RUN wget https://github.com/duckdb/duckdb/releases/download/v1.0.0/duckdb_cli-linux-amd64.zip -O /tmp/duckdb_cli.zip \
    && unzip /tmp/duckdb_cli.zip -d /duckdb \
    && sleep 3 \
    && mv /duckdb/duckdb /duckdb/duckdb-cli

RUN chmod -R 777 /var/lib/mysql
RUN chmod -R 777 /tmp
RUN echo "tmpdir=/tmp" >> /etc/mysql/my.cnf \
    && echo "net_read_timeout=600" >> /etc/mysql/my.cnf \
    && echo "net_write_timeout=600" >> /etc/mysql/my.cnf \
    && echo "max_allowed_packet=64M" >> /etc/mysql/my.cnf \
    && echo "sort_buffer_size=8M" >> /etc/mysql/my.cnf \
    && echo "secure_file_priv=/tmp" >> /etc/mysql/my.cnf \
    && echo "innodb_online_alter_log_max_size=1073741824" >> /etc/mysql/my.cnf \
    # for CDC change data capture
    && echo "server-id=1" >> /etc/mysql/my.cnf \
    && echo "log-bin=mysql-bin" >> /etc/mysql/my.cnf \
    && echo "expire_logs_days=30" >> /etc/mysql/my.cnf \
    && echo "binlog_format=ROW" >> /etc/mysql/my.cnf

COPY ./.bashrc /root/.bashrc

RUN mkdir /app_shared
RUN chmod -R 777 /app_shared
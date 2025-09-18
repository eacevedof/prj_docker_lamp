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

# Create MySQL configuration file with proper structure
RUN echo "[mysqld]" > /etc/mysql/conf.d/custom.cnf \
    && echo "# MyISAM recovery settings" >> /etc/mysql/conf.d/custom.cnf \
    && echo "myisam-recover-options=BACKUP,FORCE" >> /etc/mysql/conf.d/custom.cnf \
    && echo "key_buffer_size=256M" >> /etc/mysql/conf.d/custom.cnf \
    && echo "myisam_sort_buffer_size=64M" >> /etc/mysql/conf.d/custom.cnf \
    && echo "" >> /etc/mysql/conf.d/custom.cnf \
    && echo "# General stability" >> /etc/mysql/conf.d/custom.cnf \
    && echo "innodb_file_per_table=1" >> /etc/mysql/conf.d/custom.cnf \
    && echo "innodb_flush_log_at_trx_commit=2" >> /etc/mysql/conf.d/custom.cnf \
    && echo "innodb_buffer_pool_size=1024M" >> /etc/mysql/conf.d/custom.cnf \
    && echo "innodb_online_alter_log_max_size=1073741824" >> /etc/mysql/conf.d/custom.cnf \
    && echo "" >> /etc/mysql/conf.d/custom.cnf \
    && echo "# Network and timeouts" >> /etc/mysql/conf.d/custom.cnf \
    && echo "net_read_timeout=600" >> /etc/mysql/conf.d/custom.cnf \
    && echo "net_write_timeout=600" >> /etc/mysql/conf.d/custom.cnf \
    && echo "wait_timeout=3600" >> /etc/mysql/conf.d/custom.cnf \
    && echo "interactive_timeout=3600" >> /etc/mysql/conf.d/custom.cnf \
    && echo "max_allowed_packet=128M" >> /etc/mysql/conf.d/custom.cnf \
    && echo "" >> /etc/mysql/conf.d/custom.cnf \
    && echo "# Memory and disk management" >> /etc/mysql/conf.d/custom.cnf \
    && echo "tmpdir=/tmp" >> /etc/mysql/conf.d/custom.cnf \
    && echo "tmp_table_size=64M" >> /etc/mysql/conf.d/custom.cnf \
    && echo "max_heap_table_size=64M" >> /etc/mysql/conf.d/custom.cnf \
    && echo "sort_buffer_size=8M" >> /etc/mysql/conf.d/custom.cnf \
    && echo "secure_file_priv=/tmp" >> /etc/mysql/conf.d/custom.cnf \
    && echo "" >> /etc/mysql/conf.d/custom.cnf \
    && echo "# Binary logging for CDC" >> /etc/mysql/conf.d/custom.cnf \
    && echo "server-id=1" >> /etc/mysql/conf.d/custom.cnf \
    && echo "log-bin=mysql-bin" >> /etc/mysql/conf.d/custom.cnf \
    && echo "expire_logs_days=1" >> /etc/mysql/conf.d/custom.cnf \
    && echo "binlog_format=ROW" >> /etc/mysql/conf.d/custom.cnf \
    && echo "max_binlog_size=100M" >> /etc/mysql/conf.d/custom.cnf \
    && echo "binlog_expire_logs_seconds=86400" >> /etc/mysql/conf.d/custom.cnf

COPY ./.bashrc /root/.bashrc

RUN mkdir /app_shared
RUN chmod -R 777 /app_shared
#!/usr/bin/env bash

echo "- creating etl user for ftp access"
useradd -m -d /etl -s /bin/bash etluser && \
echo "etluser:etl" | chpasswd

echo "- creating permissions for etl user"
chown -R etluser:etluser /etl && chmod -R 777 /etl

service vsftpd restart

cd /etl

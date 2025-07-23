#!/usr/bin/env bash

echo "- creating etl user for ftp access"
useradd -m -d /ftp/etl -s /bin/bash etlu && \
echo "etlu:etlp" | chpasswd

echo "- creating permissions for etl user"
chown -R etlu:etlu /ftp/etl && chmod -R 777 /ftp/etl

cd /ftp/etl/in

service vsftpd restart


#!/usr/bin/env bash

echo "- creating etl user for ftp access"
useradd -m -d /etl -s /bin/bash etluser && \
echo "etluser:etl" | chpasswd

echo "- creating permissions for etl user"
chown -R etluser:etluser /etl && chmod -R u+rwX /etl

echo "- enabling ftp access"
chmod -R 777 /var/run/vsftpd/empty

service vsftpd start

# https://hub.docker.com/_/mariadb
FROM mysql:8.0.24

# RUN apt-get update # esto rompe
# RUN apt-get install -y iputils-ping
# RUN apt-get install -y vim

RUN chmod -R 777 /var/lib/mysql
RUN chmod -R 777 /tmp

COPY ./.bashrc /root/.bashrc
COPY ./my-custom.cnf /etc/mysql/conf.d/my-custom.cnf

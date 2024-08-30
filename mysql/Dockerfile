# https://hub.docker.com/_/mariadb
FROM mysql:8.0.24

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C
# RUN apt-get update # esto rompe para evitar eso hay q ejecutar:
    # apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C
# RUN apt-get install -y iputils-ping
# RUN apt-get install -y vim

RUN chmod -R 777 /var/lib/mysql
RUN chmod -R 777 /tmp

COPY ./.bashrc /root/.bashrc
COPY ./my-8-0-24.cnf /etc/mysql/conf.d/my-8-0-24.cnf

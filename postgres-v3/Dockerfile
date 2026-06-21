FROM postgres:18

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       vim curl bash \
    && rm -rf /var/lib/apt/lists/*

RUN chmod -R 777 /var/lib/postgresql
RUN chmod -R 777 /tmp

COPY .bashrc /root/.bashrc

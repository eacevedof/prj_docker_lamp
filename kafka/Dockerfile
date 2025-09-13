FROM apache/kafka:latest

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    -y jq vim wget unzip ca-certificates procps curl build-essential git

COPY ./.bashrc /root/.bashrc

RUN mkdir /app_shared
RUN chmod -R 777 /app_shared

# producer and consumer examples in python
# https://github.com/eacevedof/prj_python37/blob/master/kafka/test-consumer.py
# https://github.com/eacevedof/prj_python37/blob/master/kafka/test-producer.py
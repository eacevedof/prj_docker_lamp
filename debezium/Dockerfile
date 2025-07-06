FROM debezium/connect:2.7.3.Final

USER root

RUN microdnf update -y && microdnf install -y curl

RUN mkdir -p /debezium/config

COPY ./debezium/config/mysql-connector.json /debezium/config/mysql-connector.json

RUN curl -X POST -H "Content-Type: application/json" \
  --data @/debezium/config/mysql-connector.json \
  http://localhost:8383/connectors
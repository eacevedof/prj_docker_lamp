FROM debezium/connect:2.7.3.Final

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    curl

RUN curl -X POST -H "Content-Type: application/json" \
  --data @./debezium/config/mysql-connector.json \
  http://localhost:8383/connectors
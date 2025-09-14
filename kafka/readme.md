```bash
cd /opt/kafka/bin

# crear topic
mysql.cdc.db_kafka_cdc.users
mysql.cdc.db_kafka_cdc.user_sessions
mysql.cdc.db_kafka_cdc.security_events
mysql.cdc.db_kafka_cdc.audit_logs
mysql.cdc.db_kafka_cdc.failed_logins

./kafka-topics.sh --bootstrap-server localhost:9092 --create --partitions 3 --replication-factor 1 --topic NOMBRE_DEL_TOPIC

# listar topics
./kafka-topics.sh --bootstrap-server localhost:9092 --list

# borrar topic
./kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic NOMBRE_DEL_TOPIC

# ver contenido de un topic
./kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic.check_producer --from-beginning
```
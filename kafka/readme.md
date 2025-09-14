```bash
cd /opt/kafka/bin

# crear topic
./kafka-topics.sh --bootstrap-server localhost:9092 --create --topic NOMBRE_DEL_TOPIC --partitions 3 --replication-factor 1

# listar topics
./kafka-topics.sh --bootstrap-server localhost:9092 --list

# borrar topic
./kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic NOMBRE_DEL_TOPIC

# ver contenido de un topic
./kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic.check_producer --from-beginning
```
#!/usr/bin/env bash

docker-compose up kafka-cluster

docker run --rm -it -v "$(pwd)":/tutorial --net=host landoop/fast-data-dev bash

cd /tutorial/source/demo-1

kafka-topics --create --topic demo-1-standalone --partitions 3 --replication-factor 1 --zookeeper 127.0.0.1:2181

connect-standalone worker.properties file-stream-demo-standalone.properties




docker run --rm -it --net=host landoop/fast-data-dev bash
kafka-topics --create --topic demo-2-distributed --partitions 3 --replication-factor 1 --zookeeper 127.0.0.1:2181




docker ps
docker exec -it container_id bash
touch demo-file.txt
echo "hi" >> demo-file.txt
echo "hello" >> demo-file.txt


docker run --rm -it --net=host landoop/fast-data-dev bash

kafka-console-consumer --topic demo-2-distributed --from-beginning --bootstrap-server 127.0.0.1:9092

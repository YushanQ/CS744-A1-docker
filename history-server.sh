#!/bin/bash

container_name=$(docker ps | grep "spark-master" | awk '{print $1}')

if [ -z "$container_name" ]; then
  echo "Error: Spark master container not found."
  exit 1
fi

docker exec $container_name /bin/bash -c "hdfs dfs -mkdir -p hdfs://nn:9000/spark-logs"
docker exec $container_name /bin/bash -c "/spark-3.3.4-bin-hadoop3/sbin/start-history-server.sh"

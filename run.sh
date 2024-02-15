#! /bin/bash
bash pull.sh
bash clear.sh
docker stack deploy -c compose.yml spark-cluster
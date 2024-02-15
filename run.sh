#! /bin/bash
bash pull.sh
bash clear.sh
bash docker stack deploy -c compose.yml spark-cluster
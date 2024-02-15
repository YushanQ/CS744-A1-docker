#! /bin/bash
manager_node_id=$(docker node ls | grep Leader | awk '{print $1}')
# label the node
docker node update --label-add hdfs=master $manager_node_id
docker node update --label-add spark=master $manager_node_id

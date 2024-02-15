#! /bin/bash

docker build . -f Dockerfile -t austinguish259/cs744-a1:base
docker push austinguish259/cs744-a1:base
docker build . -f hdfs-namenode.Dockerfile -t austinguish259/cs744-a1:hdfs-namenode
docker push austinguish259/cs744-a1:hdfs-namenode
docker build . -f hdfs-datanode.Dockerfile -t austinguish259/cs744-a1:hdfs-datanode
docker push austinguish259/cs744-a1:hdfs-datanode
docker build . -f spark-master.Dockerfile -t austinguish259/cs744-a1:spark-master
docker push austinguish259/cs744-a1:spark-master
docker build . -f spark-worker.Dockerfile -t austinguish259/cs744-a1:spark-worker
docker push austinguish259/cs744-a1:spark-worker

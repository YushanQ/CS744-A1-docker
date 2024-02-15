FROM austinguish259/cs744-a1:base

CMD hdfs datanode -fs hdfs://nn:9000 && hdfs dfs mkdir -p hdfs://10.10.1.1:9000/spark-logs && sleep infinity

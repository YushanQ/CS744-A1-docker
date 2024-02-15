FROM austinguish259/cs744-a1:base

CMD hdfs dfs mkdir -p hdfs://nn:9000/spark-logs && /spark-3.3.4-bin-hadoop3/sbin/start-master.sh && /spark-3.3.4-bin-hadoop3/sbin/start-history-server.sh && sleep infinity
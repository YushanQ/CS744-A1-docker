FROM austinguish259/cs744-a1:base

CMD /bin/bash -c  "/spark-3.3.4-bin-hadoop3/sbin/start-master.sh && hdfs dfs mkdir -p hdfs://nn:9000/spark-logs && /spark-3.3.4-bin-hadoop3/sbin/start-history-server.sh && sleep infinity"
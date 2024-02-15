FROM austinguish259/cs744-a1:base

CMD /bin/bash -c  "/spark-3.3.4-bin-hadoop3/sbin/start-master.sh && /spark-3.3.4-bin-hadoop3/sbin/start-history-server.sh && sleep infinity"
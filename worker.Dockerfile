FROM base
CMD /spark-3.3.4-bin-hadoop3/sbin/start-worker.sh spark://spark-boss:7077 && sleep infinity
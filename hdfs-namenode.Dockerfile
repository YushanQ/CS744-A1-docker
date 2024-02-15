FROM austinguish259:base

CMD hdfs namenode -format -force && \
    hdfs namenode -fs hdfs://nn:9000
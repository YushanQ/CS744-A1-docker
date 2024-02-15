FROM austinguish259/cs744-a1:base

CMD hdfs namenode -format -force && \
    hdfs namenode -fs hdfs://nn:9000
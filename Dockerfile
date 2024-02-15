FROM ubuntu:20.04
RUN apt update -y && apt install -y openjdk-8-jdk python3 wget iputils-ping python3-distutils
# RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 10

#jupyter
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py
RUN pip3 install pyspark==3.3.4

#HDFS
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz && tar zvxf hadoop-3.3.6.tar.gz

#Spark
RUN wget https://archive.apache.org/dist/spark/spark-3.3.4/spark-3.3.4-bin-hadoop3.tgz && tar zvxf spark-3.3.4-bin-hadoop3.tgz

RUN export PATH=/hadoop-3.3.6/bin:${PATH} && export PATH=$PATH:~/hadoop-3.3.6/sbin:${PATH}

ENV HADOOP_HOME=/hadoop-3.3.6
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

WORKDIR /hadoop-3.3.6/etc/hadoop
COPY ./config/core-site.xml .
COPY ./config/hdfs-site.xml .

WORKDIR /spark-3.3.4-bin-hadoop3/conf/
COPY ./config/spark-env.sh .


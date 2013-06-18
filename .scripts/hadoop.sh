#!/bin/bash

hlaunch(){
    sudo service zookeeper-server start
    sudo service hadoop-hdfs-datanode start
    sudo service hadoop-hdfs-namenode start
    sudo service hadoop-hdfs-secondarynamenode start
    sudo service hadoop-0.20-mapreduce-jobtracker start
    sudo service hadoop-0.20-mapreduce-tasktracker start
    sudo service hbase-master start
    sudo service hbase-regionserver start
    sudo jps -l | sort -n
}

hstop(){
    sudo service hbase-regionserver stop
    sudo service hbase-master stop
    sudo service hadoop-0.20-mapreduce-jobtracker stop
    sudo service hadoop-0.20-mapreduce-tasktracker stop
    sudo service hadoop-hdfs-datanode stop
    sudo service hadoop-hdfs-namenode stop
    sudo service hadoop-hdfs-secondarynamenode stop
    sudo service zookeeper-server stop
    sudo jps -l | sort -n
}

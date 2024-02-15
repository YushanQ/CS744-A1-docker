#!/bin/bash

mkfs.ext4 /dev/xvda4
mkdir -p /mnt/data 
mount /dev/xvda4 /mnt/data 

mkdir -p /mnt/data/datanode
mkdir -p /mnt/data/namenode
mkdir -p /mnt/data/tmp
chown -R $(whoami) /mnt/data

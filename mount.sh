#!/bin/bash

sudo mkfs.ext4 /dev/xvda4
sudo mkdir -p /mnt/data 
sudo mount /dev/xvda4 /mnt/data 
sudo rm -rf /mnt/data/*
sudo mkdir -p /mnt/data/datanode
sudo mkdir -p /mnt/data/namenode
sudo mkdir -p /mnt/data/tmp
sudo chown -R $(whoami) /mnt/data

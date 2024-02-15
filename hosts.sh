#!/bin/bash

# make a backup of the original file
cp /etc/hosts /etc/hosts.bak
# get the hostname
base_string=$(hostname)
node0="node0"
node1="node1"
node2="node2"
result_string=$(echo "$base_string" | cut -d'.' -f2-)
node0_host_name="$node0.$result_string"
node1_host_name="$node1.$result_string"
node2_host_name="$node2.$result_string"
echo "10.10.1.1 $node0_host_name" >> /etc/hosts
echo "10.10.1.2 $node1_host_name" >> /etc/hosts
echo "10.10.1.3 $node2_host_name" >> /etc/hosts

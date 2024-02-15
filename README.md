# CS744-A1-docker

## Install Docker
Follow the Instruction here to install Docker on each machine:

`sudo bash ./install-docker.sh`

To verify the installation, you can run

`docker run hello-world`

## Set up Docker Swarm network

On node0, run: 

`docker swarm init --advertise-addr 10.10.1.1`

You will get output like:

docker swarm init --advertise-addr 192.168.99.100
Swarm initialized: current node (dxn1zf6l61qsb1josjja83ngz) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join \ 
    --token xxx \
    xxx.xxx.xxx.xxx:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

You should add node1 & node2 to the network by running the command listed in the output.

To very the network is set up, you can run: \
`docker node ls`

## Label the node

As we assign node 0 as the master for HDFS and spark, other nodes as workers. You should label the leader properly. Run these commands on node0:  \
`docker node update --label-add hdfs=master <Node0 Id>`

`docker node update --label-add spark=master <Node0 Id>`

You can fetch the Node0 Id by running:  \
`docker node ls`

## Create overlay network

You should create the network. This is for connection between different machines.  \
`docker network create -d overlay cluster_net_swarm`

## Build Image

## Docker Stack Deploy

## Well Done!



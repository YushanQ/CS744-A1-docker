# CS744-A1-docker

## Mounting disks
Your home directory in the CloudLab machine is relatively small and can only hold 16GB of data. We have also enabled another mount point to contain around 96GB of space on each node which should be sufficient to complete this assignment.

However you need to create this mount point using the following commands (on each node).

`sudo bash ./mount.sh`

After you complete the above steps you can verify this is correct by running

`df -h | grep "data"` 


```/dev/xvda4                                        95G   60M   90G   1% /mnt/data```

~~Now you can use /mnt/data to store files in HDFS or to store shuffle data in Spark (see below). It helps to change the ownership of this directory so that sudo is not required for all future commands. You can identify the current user with the command who and then change the directory ownership with `sudo chown -R <user> /mnt/data`~~

## Install Docker
Follow the Instruction here to install Docker on each machine:

`sudo bash ./install-docker.sh`

To verify the installation, you can run

`docker run hello-world`

## Modify the hosts file
By simply run `sudo bash hosts.sh` on each machine

## Set up Docker Swarm 

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

~~As we assign node 0 as the master for HDFS and spark, other nodes as workers. You should label the leader properly. Run these commands on node0:  \~~
~~`docker node update --label-add hdfs=master <Node0 Id>`~~

~~`docker node update --label-add spark=master <Node0 Id>`~~

~~You can fetch the Node0 Id by running:  \~~
~~`docker node ls`~~

Simply run `bash label.sh` on `node0`

## Create overlay network

You should create the network. This is for connection between different machines.  \
`docker network create -d overlay cluster_net_swarm`


## Docker Stack Deploy

## Well Done!
# Credits
Thanks uw-madison CS544 course  [course_repo](https://github.com/cs544-wisc/f23) and  jware-solutions/docker-big-data-cluster  [repo](https://github.com/jware-solutions/docker-big-data-cluster/tree/master), they help us a lot to create this repo.


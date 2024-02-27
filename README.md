# CS744-A1-docker

## Mounting Disks

**[Run on each machine]**

Your home directory in the CloudLab machine has limited space. We have provided an additional mount point with around 90GB on each node. Execute the following commands on each node to create and verify this mount point:

```bash
bash ./mount.sh
df -h | grep "data"
```

Ensure the output shows a mount point like `/dev/xvda4 95G 60M 90G 1% /mnt/data`.

## Install Docker

**[Run on each machine]**

Follow the instructions to install Docker on each machine:

```bash
sudo bash ./install_docker.sh
```

Verify the installation by running the `hello-world` container.

`docker run hello-world`

## Modify the Hosts File

**[Run on each machine]**

Update the hosts file on each machine by running:

```bash
sudo bash hosts.sh
```

## Set Up Docker Swarm

**[Run on node0]**

On `node0`, initialize the Docker Swarm:

```bash
docker swarm init --advertise-addr \<node0-private-ip\>
```
Typically, the private IP address is `10.10.1.1` for `node0`. You can find the private IP address by running `ifconfig` and looking for the `inet` address under the `eth1` interface.

**[Run on each machine]**

Follow the instructions to add worker nodes to the swarm.

**[Run on node0]**

To verify the network setup, run:

```bash
docker node ls #on manager node(default is node0)
```

## Label the Node (deprecated, use label.sh)

~~Assign node0 as the master for HDFS and Spark. Label the leader properly by running these commands on node0: bash
docker node update --label-add hdfs=master <Node0 Id>
docker node update --label-add spark=master <Node0 Id>~~

Use the provided script to label the nodes:

**[Run on node0]**

```bash
bash label.sh
```

## Create Overlay Network

Create an overlay network for communication between different machines:

**[Run on node0]**

```bash
docker network create -d overlay cluster_net_swarm
```

## Docker Stack Deploy

Deploy the Docker stack:

**[Run on node0]**

```bash
bash ./run.sh
```

To verify the cluster setup, open \<node0-public-ip\>:9870 and  \<node0-public-ip\>:8080 to check the node liveness.

## [Optional] History Server

**[Run on node0]**

Optional steps for setting up a History Server

```bash
bash ./history-server.sh
```

To verify the history server setup, open \<node0-public-ip\>:18080

# Credits

Thanks to the UW-Madison CS544 course [course_repo](https://github.com/cs544-wisc/f23) and jware-solutions/docker-big-data-cluster [repo](https://github.com/jware-solutions/docker-big-data-cluster/tree/master) for their assistance in creating this repository .


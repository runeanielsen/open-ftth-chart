# Setting up open-ftth on kubernetes

Documentation and config files for open-ftth on Kubernetes

## Requirements

* Kubectl
* Helm
* Configured Kubernetes cluster with provisioned storage
* Git

## Setup

To setup the cluster run the following command.

``` sh
./setup.sh
```

The script will provision the cluster with the following:

* Kafka
* Zookeeper
* Kafka-connect
* KSQL-Server
* Cassandra

## Teardown

Run the following script to teardown the cluster.

``` sh
./teardown.sh
```

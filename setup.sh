#!/bin/sh

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

kubectl create ns openftth

kubectl apply -f 'https://strimzi.io/install/latest?namespace=openftth' -n openftth
kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-persistent-single.yaml \
        -n openftth

helm install openftth-cassandra bitnami/cassandra -n openftth

kubectl apply -f ./postgis.yaml -n openftth

kubectl -n openftth create secret generic postgres-credentials \
  --from-file=./secrets/debezium-postgres-credentials.properties

kubectl create -f ./connectors/postgres-connect-cluster.yaml

kubectl create -f ./connectors/postgis-connector.yaml

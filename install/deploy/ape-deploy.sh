#!/bin/bash
# --------------------------------------------------------------------
BASE_DIR=
EXEC_FILE="$0"
BASE_NAME=$(basename "$EXEC_FILE")
if [ "$EXEC_FILE" = "./$BASE_NAME" ] || [ "$EXEC_FILE" = "$BASE_NAME" ]; then
  BASE_DIR=$(pwd)
else
  BASE_DIR=$(echo "$EXEC_FILE" | sed 's/'"\/${BASE_NAME}"'$//')
fi
# --------------------------------------------------------------------

# Configuration load
source "${BASE_DIR}"/../conf/ape.conf

# --------------------------------------------------------------------
echo "make directories"
mkdir -p "$APP_DIR"/data/storage/db
mkdir -p "$APP_DIR"/data/storage/docker-images

# --------------------------------------------------------------------
echo "apply namespace"
# change namespace
kubectl apply -f "${BASE_DIR}"/namespaces/ml-namespace.yaml

# --------------------------------------------------------------------
echo "docker registry deploy...."
kubectl apply -f "${BASE_DIR}"/docker-registry/registry-deploy.yaml

# --------------------------------------------------------------------
echo "database deploy...."
# make secret for database
kubectl create secret generic mariadb-user --from-literal=username=$DB_USERNAME \
  --from-literal=password=$DB_PASSWORD --namespace=$APEML_NAMESPACE

kubectl apply -f "${BASE_DIR}"/database/ml-db-deploy.yaml
# --------------------------------------------------------------------
echo "apply configmaps"

# --------------------------------------------------------------------


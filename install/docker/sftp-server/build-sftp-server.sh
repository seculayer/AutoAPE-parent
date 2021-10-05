#!/bin/bash
##########################################################################
# AutoML for eyeCloudAI 3.1 build ssh server image
# Author : Jin Kim
# e-mail : jinkim@seculayer.com
# Powered by Seculayer © 2021 AI Service Model Team, R&D Center of Seculayer Inc.
##########################################################################
BASE_DIR=
EXEC_FILE="$0"
BASE_NAME=$(basename "$EXEC_FILE")
if [ "$EXEC_FILE" = "./$BASE_NAME" ] || [ "$EXEC_FILE" = "$BASE_NAME" ]; then
  BASE_DIR=$(pwd)
else
  BASE_DIR=$(echo "$EXEC_FILE" | sed 's/'"\/${BASE_NAME}"'$//')
fi
##########################################################################
source "${BASE_DIR}"/../../conf/ape.conf

# Build the Docker Image of SFTP Server
docker build --build-arg SSH_MASTER_USER=${SSH_MASTER_USER} \
  --build-arg SSH_MASTER_PASS=${SSH_MASTER_PASS} \
  -t "${REGISTRY_URL}"/ape/sftp-server:1.0.0 .
docker push "${REGISTRY_URL}"/ape/sftp-server:1.0.0

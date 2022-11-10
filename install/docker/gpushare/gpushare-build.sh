#!/bin/bash
##########################################################################
# AutoML for eyeCloudAI 3.1 gpu sharing plugin image build
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

### device plugin
if [ "${IS_PRIVATE_NETWORK}" = "false" ]
then
  docker build -t "${REGISTRY_URL}"/ape/gpu-device-plugin:1.0.0 ./gpushare-device-plugin
fi
docker push "${REGISTRY_URL}"/ape/gpu-device-plugin:1.0.0

### scheduler
if [ "${IS_PRIVATE_NETWORK}" = "false" ]
then
  docker build -t "${REGISTRY_URL}"/ape/gpu-schd-ext:1.0.0 ./gpushare-scheduler-extender
fi
docker push "${REGISTRY_URL}"/ape/gpu-schd-ext:1.0.0
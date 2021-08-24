#!/bin/bash
##########################################################################
# AutoML for eyeCloudAI 3.1 build docker images
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

# JAVA 11 base image
docker build -f ./base-images/java11/Dockerfile -t $REGISTRY_URL/ape/java-base:$JAVA_VER ./base-images/java11
docker push $REGISTRY_URL/ape/java-base:$JAVA_VER

# python3.7
docker build -f ./base-images/py3.7/Dockerfile -t $REGISTRY_URL/ape/python-base:$PYTHON_VER ./base-images/py3.7
docker push $REGISTRY_URL/ape/python-base:$PYTHON_VER

# python3.7 with CUDA & cuDNN
if [ "${GPU_USE}" == "true" ]
then
  docker build -f ./base-images/py3.7-cuda10.0/Dockerfile.gpu -t $REGISTRY_URL/ape/python-base-gpu:$PYTHON_VER ./base-images/py3.7-cuda10.0
  docker push $REGISTRY_URL/ape/python-base-gpu:$PYTHON_VER
fi

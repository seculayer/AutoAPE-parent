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
source "${BASE_DIR}"/../conf/ape.conf

# base images JAVA / Python / Python with CUDA & cuDNN
cd "${BASE_DIR}"/base-images || exit
chmod +x build-base-images.sh
./build-base-images.sh
cd "${BASE_DIR}"/

# GPU Sharing
if [ "${GPU_USE}" == "true" ]
then
  cd "${BASE_DIR}"/gpushare || exit
  chmod +x gpushare-build.sh
  ./gpushare-build.sh
  cd "${BASE_DIR}"/
fi

# SSH Server
cd "${BASE_DIR}"/sftp-server || exit
chmod +x build-sftp-server.sh
./build-sftp-server.sh
cd "${BASE_DIR}"/

# AES256
cd "${BASE_DIR}"/aes || exit
chmod +x build.sh
./build.sh
cd "${BASE_DIR}"/

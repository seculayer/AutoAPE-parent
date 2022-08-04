#!/bin/bash
##########################################################################
# AutoML for eyeCloudAI 3.1 initialize nodes
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
source ${BASE_DIR}/../../conf/ape.conf

# change encrypted values
setupConfig() {
        echo "--------------------------------"
        echo "[ Set Database Encrypted value]"
        echo "--------------------------------"
        while IFS= read -r line; do
                OLD_USERNAME="[@aes_dbusername]"
                username_old=$(printf '%s\n' "${OLD_USERNAME}" | sed -e 's/[]\/$*.^[]/\\&/g')
                username_new=$(printf '%s\n' "${AES_DB_USERNAME}" | sed -e 's/[]\/$*.^[]/\\&/g')

                OLD_USERNAME="[@aes_dbpassword]"
                password_old=$(printf '%s\n' "${OLD_USERNAME}" | sed -e 's/[]\/$*.^[]/\\&/g')
                pwssword_new=$(printf '%s\n' "${AES_DB_PASSWORD}" | sed -e 's/[]\/$*.^[]/\\&/g')

                sed -i "s/${username_old}/${username_new}/g" ${line} 2>/dev/null
                sed -i "s/${password_old}/${pwssword_new}/g" ${line} 2>/dev/null

                if [ "$?" -eq "0" ] ; then echo "> ${line} is Applied!" ; fi
        done < ".database_change_list"

        echo "--------------------------------"
        echo "[ Set SFTP Encrypted value]"
        echo "--------------------------------"
        while IFS= read -r line; do
                OLD_USERNAME="[@sshusername]"
                username_old=$(printf '%s\n' "${OLD_USERNAME}" | sed -e 's/[]\/$*.^[]/\\&/g')
                username_new=$(printf '%s\n' "${AES_SFTP_USERNAME}" | sed -e 's/[]\/$*.^[]/\\&/g')

                OLD_USERNAME="[@sshpassword]"
                password_old=$(printf '%s\n' "${OLD_USERNAME}" | sed -e 's/[]\/$*.^[]/\\&/g')
                pwssword_new=$(printf '%s\n' "${AES_SFTP_PASSWORD}" | sed -e 's/[]\/$*.^[]/\\&/g')

                sed -i "s/${username_old}/${username_new}/g" ${line} 2>/dev/null
                sed -i "s/${password_old}/${pwssword_new}/g" ${line} 2>/dev/null

                if [ "$?" -eq "0" ] ; then echo "> ${line} is Applied!" ; fi
        done < ".sftp_change_list"
}



# ENCRYPT DB USERNAME PASSWORD
AES_DB_USERNAME=`docker run --name encrypt ${REGISTRY_URL}/ape/ape-aes:1.0.0 ./run.sh $DB_USERNAME`
docker rm encrypt
AES_DB_PASSWORD=`docker run --name encrypt ${REGISTRY_URL}/ape/ape-aes:1.0.0 ./run.sh $DB_PASSWORD`
docker rm encrypt

# ENCRYPT SFTP USERNAME PASSWORD
AES_SFTP_USERNAME=`docker run --name encrypt ${REGISTRY_URL}/ape/ape-aes:1.0.0 ./run.sh $SSH_MASTER_USER`
docker rm encrypt
AES_SFTP_PASSWORD=`docker run --name encrypt ${REGISTRY_URL}/ape/ape-aes:1.0.0 ./run.sh $SSH_MASTER_PASS`
docker rm encrypt

# ------------------------------------------------------------------------------------
# download
# MRMS
if [ "${IS_PRIVATE_NETWORK}" = "true" ]
then
  echo "Private Network Mode"
else
  mkdir -p ${BASE_DIR}/mrms
  cd ${BASE_DIR}/mrms
  wget https://raw.githubusercontent.com/seculayer/automl-mrms/main/conf/db.properties
  wget https://raw.githubusercontent.com/seculayer/automl-mrms/main/conf/log4j2.properties
  wget https://raw.githubusercontent.com/seculayer/automl-mrms/main/conf/mrms-conf.xml
  cd ${BASE_DIR}
fi

# Data Analyzer - pubic 으로 repo 변경후 주석 제거
#mkdir -p ${BASE_DIR}/da
#cd ${BASE_DIR}/da
#wget https://raw.githubusercontent.com/seculayer/automl-da/main/conf/da-conf.xml?token=AGDDYKRQACG4AZSLLM4I23DBOZB5A
cd ${BASE_DIR}

# -------------------------------------------------------------------------------
# Change config
setupConfig
# -------------------------------------------------------------------------------
# MRMS
kubectl delete configmap/mrms-conf -n apeautoml
kubectl create configmap mrms-conf \
  --from-file="${BASE_DIR}"/mrms/db.properties \
  --from-file="${BASE_DIR}"/mrms/log4j2.properties \
  --from-file="${BASE_DIR}"/mrms/mrms-conf.xml \
  -n apeautoml
# -------------------------------------------------------------------------------
# Data Analyzer
kubectl delete configmap/da-conf -n apeautoml
kubectl create configmap da-conf \
  --from-file="${BASE_DIR}"/da/da-conf.xml \
  -n apeautoml
# -------------------------------------------------------------------------------

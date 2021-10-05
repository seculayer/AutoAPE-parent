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
setupConfig

kubectl create configmap mrms-conf \
  --from-file="${BASE_DIR}"/mrms/db.properties \
  --from-file="${BASE_DIR}"/mrms/log4j.properties \
  --from-file="${BASE_DIR}"/mrms/mrms-conf.xml \
  -n apeautoml
#!/bin/bash
##########################################################################
# AutoML for eyeCloudAI 3.1 deploy applications
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
source "${BASE_DIR}"/conf/ape.conf


setupConfig() {
        echo "--------------------------------"
        echo "[ Set Namespace - ML]"
        echo "--------------------------------"
        while IFS= read -r line; do
                OLD_APEML_NAMESPACE="[@namespace]"
                escape_old=$(printf '%s\n' "${OLD_APEML_NAMESPACE}" | sed -e 's/[]\/$*.^[]/\\&/g')
                escape_new=$(printf '%s\n' "${APEML_NAMESPACE}" | sed -e 's/[]\/$*.^[]/\\&/g')

                sed -i "s/${escape_old}/${escape_new}/g" ${line} 2>/dev/null
                if [ "$?" -eq "0" ] ; then echo "> ${line} is Applied!" ; fi
        done < ".namespace_change_list"

        echo "--------------------------------"
        echo "[ Set Application path]"
        echo "--------------------------------"
        while IFS= read -r line; do
                OLD_PATH="[@app_dir]"
                escape_old=$(printf '%s\n' "${OLD_PATH}" | sed -e 's/[]\/$*.^[]/\\&/g')
                escape_new=$(printf '%s\n' "${APP_DIR}" | sed -e 's/[]\/$*.^[]/\\&/g')

                sed -i "s/${escape_old}/${escape_new}/g" ${line} 2>/dev/null
                if [ "$?" -eq "0" ] ; then echo "> ${line} is Applied!" ; fi
        done < ".apppath_change_list"
}
setupConfig

##########################################################################
# label setting
kubectl label nodes `echo $MASTER_HOSTNAME | tr '[A-Z]' '[a-z]'` deploy=true
kubectl label nodes `echo $MASTER_HOSTNAME | tr '[A-Z]' '[a-z]'` app=true
kubectl label nodes `echo $DB_HOSTNAME | tr '[A-Z]' '[a-z]'` db=true
kubectl label nodes `echo $WEB_HOSTNAME | tr '[A-Z]' '[a-z]'` web=true

kubectl taint nodes --all node-role.kubernetes.io/master-

##########################################################################
# plugins
kubectl apply -f "${BASE_DIR}"/plugins/calico.yaml

##########################################################################
# deployments
cd ./deploy
chmod +x ./ape-deploy.sh
./ape-deploy.sh
cd ../
##########################################################################
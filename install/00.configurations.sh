#!/bin/bash
# Configuration load
source ./conf/ape.conf

setupNamespaceConfig() {
        echo "--------------------------------"
        echo "[ Set Namespace - ML]"
        echo "--------------------------------"
        OLD_APEML_NAMESPACE="[@namespace]"
        escape_old=$(printf '%s\n' "${OLD_APEML_NAMESPACE}" | sed -e 's/[]\/$*.^[]/\\&/g')
        escape_new=$(printf '%s\n' "${APEML_NAMESPACE}" | sed -e 's/[]\/$*.^[]/\\&/g')
        sed -i "s/${escape_old}/${escape_new}/g" ./deploy/namespaces/ml-namespace.yaml
        sed -i "s/${escape_old}/${escape_new}/g" ./deploy/database/ml-db-deploy.yaml
        sed -i "s/${escape_old}/${escape_new}/g" ./deploy/docker-registry/registry-deploy.yaml
        sed -i "s/${escape_old}/${escape_new}/g" ./deploy/deployments/mrms-deploy.yaml
        sed -i "s/${escape_old}/${escape_new}/g" ./deploy/deployments/mims-deploy.yaml
        sed -i "s/${escape_old}/${escape_new}/g" ./deploy/deployments/storage-deploy.yaml
}
setupAppPathConfig(){
        echo "--------------------------------"
        echo "[ Set Application path]"
        echo "--------------------------------"
        OLD_PATH="[@app_dir]"
        escape_old=$(printf '%s' "${OLD_PATH}" | sed -e 's/[]\/$*.^[]/\\&/g')
        escape_new=$(printf '%s' "${APP_DIR}" | sed -e 's/[]\/$*.^[]/\\&/g')
        sed -i "s/${escape_old}/${escape_new}/g" ./conf/daemon.json
        sed -i "s/${escape_old}/${escape_new}/g" ./conf/daemon-gpu.json
        sed -i "s/${escape_old}/${escape_new}/g" ./deploy/database/ml-db-deploy.yaml
        sed -i "s/${escape_old}/${escape_new}/g" ./deploy/docker-registry/registry-deploy.yaml
        sed -i "s/${escape_old}/${escape_new}/g" ./deploy/deployments/mrms-deploy.yaml
        sed -i "s/${escape_old}/${escape_new}/g" ./deploy/deployments/mims-deploy.yaml
        sed -i "s/${escape_old}/${escape_new}/g" ./deploy/deployments/storage-deploy.yaml
        sed -i "s/${escape_old}/${escape_new}/g" ./docker/base-images/java11/Dockerfile
        sed -i "s/${escape_old}/${escape_new}/g" ./docker/base-images/py3.7-cv2/Dockerfile
        sed -i "s/${escape_old}/${escape_new}/g" ./docker/base-images/py3.7-cuda11.2-cv2/Dockerfile
}

setupRegistryURLConfig() {
        echo "--------------------------------"
        echo "[ Set Registry URL]"
        echo "--------------------------------"
        OLD_REGISTRY_URL="[@registry_url]"
        escape_old=$(printf '%s\n' "${OLD_REGISTRY_URL}" | sed -e 's/[]\/$*.^[]/\\&/g')
        escape_new=$(printf '%s\n' "${REGISTRY_URL}" | sed -e 's/[]\/$*.^[]/\\&/g')
        sed -i "s/${escape_old}/${escape_new}/g" ./deploy/deployments/mrms-deploy.yaml
        sed -i "s/${escape_old}/${escape_new}/g" ./deploy/deployments/mims-deploy.yaml
        sed -i "s/${escape_old}/${escape_new}/g" ./deploy/deployments/storage-deploy.yaml
}

setupNamespaceConfig
setupAppPathConfig
setupRegistryURLConfig

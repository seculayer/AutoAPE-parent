#!/bin/bash
# Configuration load
source ./conf/ape.conf

setupNamespaceConfig() {
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
}
setupAppPathConfig(){
        echo "--------------------------------"
        echo "[ Set Application path]"
        echo "--------------------------------"
        while IFS= read -r line; do
                OLD_PATH="[@app_dir]"
                escape_old=$(printf '%s' "${OLD_PATH}" | sed -e 's/[]\/$*.^[]/\\&/g')
                escape_new=$(printf '%s' "${APP_DIR}" | sed -e 's/[]\/$*.^[]/\\&/g')

                sed -i "s/${escape_old}/${escape_new}/g" ${line} 2>/dev/null
                if [ "$?" -eq "0" ] ; then echo "> ${line} is Applied!" ; fi
        done < ".apppath_change_list"
}

setupRegistryURLConfig() {
        echo "--------------------------------"
        echo "[ Set Registry URL]"
        echo "--------------------------------"
        while IFS= read -r line; do
                OLD_REGISTRY_URL="[@registry_url]"
                escape_old=$(printf '%s\n' "${OLD_REGISTRY_URL}" | sed -e 's/[]\/$*.^[]/\\&/g')
                escape_new=$(printf '%s\n' "${REGISTRY_URL}" | sed -e 's/[]\/$*.^[]/\\&/g')

                sed -i "s/${escape_old}/${escape_new}/g" ${line} 2>/dev/null
                if [ "$?" -eq "0" ] ; then echo "> ${line} is Applied!" ; fi
        done < ".registry_url_change_list"
}

setupNamespaceConfig
setupAppPathConfig
setupRegistryURLConfig

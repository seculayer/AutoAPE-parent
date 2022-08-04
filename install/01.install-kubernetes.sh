#!/bin/bash
echo "*****************************************************************************************************************************************"
echo "*****************************************************************************************************************************************"
echo "*****************************************************************************************************************************************"
echo "******************************************************* Kubernetes Node Install *********************************************************"
echo "*****************************************************************************************************************************************"
echo "*****************************************************************************************************************************************"
echo "*****************************************************************************************************************************************"

# Configuration load
source ./conf/ape.conf


sudo mkdir -p /home$APP_DIR
sudo chown -R 1000:1000 /home$APP_DIR
sudo ln -s /home$APP_DIR $APP_DIR
sudo chown -R 1000:1000 $APP_DIR

echo "#####"
echo "##### Remove regacy docker / kubernetes"
echo "#####"
sudo yum remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine
sudo yum remove -y kubelet kubeadm kubectl

echo "#####"
echo "##### Check the firewall"
echo "#####"
count=$(systemctl status firewalld | grep dead | wc -l)
if(( "${count}" == 0 ));
then
	sudo systemctl stop firewalld
else
  echo "firewalld가 다운되어 있습니다."
fi

echo "#####"
echo "##### Check the Selinux"
echo "#####"

sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

echo "#####"
echo "##### swap off"
echo "#####"
sudo swapoff -a
sudo sed -ri '/\sswap\s/s/^#?/#/' /etc/fstab

echo "#####"
echo "##### Install required packages"
echo "#####"
sudo yum install -y yum-utils device-mapper-persistent-data lvm2 sshpass net-tools

sudo cp ./conf/k8s.conf /etc/sysctl.d/
sudo sysctl --system

echo "#####"
echo "##### Install Docker"
echo "#####"
sudo yum-config-manager --add-repo ./conf/docker-ce.repo
sudo yum install -y docker-ce-"${DOCKER_VERSION}"

sudo mkdir /etc/docker

### GPU Support
if [ "${GPU_USE}" = "true" ]
then
  sudo cp ./conf/nvidia-docker.repo /etc/yum.repos.d/
  sudo yum install -y nvidia-docker2
  sudo pkill -SIGHUP dockerd
  sudo cp ./conf/daemon-gpu.json /etc/docker/daemon.json
else
  sudo cp ./conf/daemon.json /etc/docker/daemon.json

fi
OLD_PATH="[@app_dir]"
escape_old=$(printf '%s\n' "${OLD_PATH}" | sed -e 's/[]\/$*.^[]/\\&/g')
escape_new=$(printf '%s\n' "${APP_DIR}" | sed -e 's/[]\/$*.^[]/\\&/g')

sudo sed -i "s/${escape_old}/${escape_new}/g" /etc/docker/daemon.json

sudo systemctl daemon-reload
sudo systemctl restart docker

echo "#####"
echo "##### Add RPM Repository"
echo "#####"
sudo cp ./conf/kubebyinternet.repo /etc/yum.repos.d/
sudo yum clean -y all
sudo yum repolist -y all

echo "#####"
echo "##### Install Kubernetes"
echo "#####"
sudo yum install -y kubelet-"${KUBE_VERSION}" kubeadm-"${KUBE_VERSION}" kubectl-"${KUBE_VERSION}" --disableexcludes=kubernetes

sudo chown -R "${USER}":"${USER}" "${APP_DIR}/data"
sudo usermod -aG docker "${USER}"
sudo chmod 666 /var/run/docker.sock

sudo systemctl enable docker
sudo systemctl enable kubelet

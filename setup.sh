#!/bin/bash
apt-get update
echo virtualbox-ext-pack virtualbox-ext-pack/license select true | sudo debconf-set-selections
apt-get install -y apt-transport-https virtualbox virtualbox-ext-pack xrdp mate-core mate-desktop-environment mate-notification-daemon
sed -i.bak '/fi/a #xrdp multiple users configuration \n mate-session \n' /etc/xrdp/startwm.sh

# allow just RDP through the local firewall
ufw allow 3389/tcp
# restart xrdp 
/etc/init.d/xrdp restart

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
touch /etc/apt/sources.list.d/kubernetes.list 
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
install minikube /usr/local/bin

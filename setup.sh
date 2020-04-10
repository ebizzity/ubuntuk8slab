#!/bin/bash

#INSTALL Packages
apt-get update
echo virtualbox-ext-pack virtualbox-ext-pack/license select true | sudo debconf-set-selections
apt-get install -y \
apt-transport-https \
virtualbox \
virtualbox-ext-pack \
mate-core \
mate-desktop-environment \
mate-notification-daemon
indicator-sound-gtk2 \
indicator-application-gtk2 \
xrdp 

# allow just RDP through the local firewall
ufw allow 3389/tcp
# restart xrdp 
/etc/init.d/xrdp restart

#Add Source for kubectl package
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
touch /etc/apt/sources.list.d/kubernetes.list 
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

#INSTALL kubectl
apt-get update
apt-get install -y kubectl

#Download and Install minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
install minikube /usr/local/bin

#!/bin/bash

#Description: Automates installation of Docker in Centos Linux.
#Author: James K
#Date: March 20, 2022

#Clean the system i.e. removing old versions of docker that may be installed
echo "Cleaning the system...."
sleep 2
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

#Set up docker repository
echo "Setting up docker repository...."
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

#Install docker engine
echo "Installing the latest version of docker engine...."
sleep 2
sudo yum install docker-ce docker-ce-cli containerd.io -y

if [ $? -ne 0 ]
then
echo "Docker installation failed..."
sleep 2
exit 2
fi

#Check status, start and enable docker deamon
echo "Checking status, stating and enabling docker deamon...."
sleep 2
sudo systemctl status docker
sleep 2
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
sleep 2

echo "Docker installation in your system is complete!"

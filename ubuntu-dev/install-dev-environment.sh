#!/bin/bash 

sudo echo "LANG=en_US.UTF-8" >> /etc/environment
sudo echo "LANGUAGE=en_US.UTF-8" >> /etc/environment
sudo echo "LC_ALL=en_US.UTF-8" >> /etc/environment
sudo echo "LC_CTYPE=fi_FI.UTF-8" >> /etc/environment
sudo echo "LC_TIME=fi_FI.UTF-8" >> /etc/environment

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections 
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get -y install oracle-java6-installer
sudo apt-get -y install oracle-java8-installer

sudo echo "allowed_users=anybody" > /etc/X11/Xwrapper.config

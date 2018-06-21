#!/bin/bash 

sudo apt-get -y install chromium-browser

sudo wget -O /opt/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz http://ftp.fau.de/eclipse/technology/epp/downloads/release/mars/R/eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz
sudo chown vagrant:vagrant /opt
cd /opt/ && sudo tar -zxf eclipse-jee-mars-R-linux-gtk-x86_64.tar.gz 

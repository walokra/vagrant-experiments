#!/bin/bash 
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
sudo apt-get -y install ubuntu-gnome-desktop
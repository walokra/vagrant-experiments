#!/bin/sh

# convert into Oracle Linux 7
#curl -O https://linux.oracle.com/switch/centos2ol.sh
sh sync/centos2ol.sh
yum upgrade -y

# fix locale warning
echo LANG=en_US.utf-8 >> /etc/environment
echo LC_ALL=en_US.utf-8 >> /etc/environment

# install Oracle Database prereq packages
yum install -y oracle-rdbms-server-12cR1-preinstall

# install Docker
cat >/etc/yum.repos.d/docker.repo <<-EOF
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/oraclelinux/7
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

yum install -y docker-engine

service docker start
chkconfig docker on

# install UEK kernel
yum install -y elfutils-libs
yum update -y --enablerepo=ol7_UEKR4
yum install -y kernel-uek-devel --enablerepo=ol7_UEKR4

#grubby --set-default=/boot/vmlinuz-3.8*
sed -i 's/DEFAULTKERNEL=kernel/DEFAULTKERNEL=kernel=uek/' /etc/sysconfig/kernel

# confirm
cat /etc/oracle-release

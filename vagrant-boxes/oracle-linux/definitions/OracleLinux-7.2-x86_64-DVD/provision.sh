#!/bin/bash
#
# Initial provisioning shell script
# For CentOS and Oracle Linux 7

echo $(grep PRETTY_NAME /etc/os-release | cut -d'"' -f2)

# Start provisioning
yum install -y bash bash-completion zsh tmux \
    wget curl gawk ack \
    htop dstat iotop iftop sysstat psmisc \
    git tig rsync sshfs sshpass \
    vim colordiff \
    pv tree expect \
    ethtool iptraf nmap iperf3 \
    iptables conntrack iptstate \
    net-tools bind-utils \
    lshw pciutils usbutils \
    strace gdb \
    reptyr ntsysv \
    yum-utils \
	ansible

ret=$?

if [[ $ret -ne 0 ]]; then
    echo "Unfortunately something went wrong..." >&2
    exit 1
else
    echo "Shell script provisioning done!"
    sudo yum clean all
fi

exit 0

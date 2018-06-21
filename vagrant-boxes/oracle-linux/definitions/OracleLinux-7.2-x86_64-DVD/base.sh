# Base install

source ./proxy.sh

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Fix slow DNS lookups with VirtualBox's DNS proxy:
# https://github.com/mitchellh/vagrant/issues/1172#issuecomment-9438465
echo 'options single-request-reopen' >> /etc/resolv.conf

cd /tmp
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm
rm -f epel-release-latest-7.noarch.rpm

echo "UseDNS no" >> /etc/ssh/sshd_config

hostnamectl set-hostname oraclelinux7.vagrant.vm

yum-config-manager --enable ol7_optional_latest

cat <<'EOF' > /etc/yum.repos.d/debuginfo.repo
[debuginfo]
name=debuginfo
baseurl=https://oss.oracle.com/ol7/debuginfo/
gpgcheck=0
enabled=1
EOF

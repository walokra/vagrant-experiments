vagrant-oracle-linux-7
========================

Vagrant + Oracle Linux 7 setup (converted from CentOS 7).

## Vagrant Setup

If you are behing a proxy, install vagrant-proxyconf.
```
(MacOSX)
$ export http_proxy=proxy:port
$ export https_proxy=proxy:port

(Windows)
$ set http_proxy=proxy:port
$ set https_proxy=proxy:port

$ vagrant plugin install vagrant-proxyconf
```

Install VirtualBox Guest plugin.
```
$ vagrant plugin install vagrant-vbguest
```

If you are behind a proxy, add following to Vagrantfile:
```
config.proxy.http     = "http://proxy:port"
config.proxy.https    = "http://proxy:port"
config.proxy.no_proxy = "localhost,127.0.0.1"
```

## Host OS Install (Vagrant)

`vagrant up` will do the following:
* Download CentOS 7 and boot up
* Convert into Oracle Linux 7 (https://linux.oracle.com/switch/centos/)
* Fix locale warning
* Install oracle-rdbms-server-12cR1-preinstall
* Install docker-engine, update to the latest binary
* install UEKR4 and make it a default kernel

```
$ vagrant up
   :
==> default: Oracle Linux Server release 7.2
```

Reboot to switch the kernel to UEKR4.  Confirm that NUMA and Transparent Hugepage is turned "off".
```
$ vagrant reload

$ vagrant ssh

[vagrant@localhost ~]$ dmesg | more
Initializing cgroup subsys cpuset
Initializing cgroup subsys cpu
Linux version 3.8.13-35.3.2.el6uek.x86_64 (mockbuild@ca-build44.us.oracle.com) (gcc version 4.4.7 20120313 (Red Hat 4.4.7-3) (GCC) ) #2 SMP Tue Jul 22 13:17:34 PDT 2014
Command line: ro root=/dev/mapper/VolGroup-lv_root rd_NO_LUKS LANG=en_US.UTF-8 rd_NO_MD rd_LVM_LV=VolGroup/lv_swap SYSFONT=latarcyrheb-sun16 rd_LVM_LV=VolGroup/lv_root  KEYBOARDTYPE=pc KEYTABLE=us rd_NO_DM rhgb quiet numa=off transparent_hugepage=never
   :

[vagrant@localhost ~]$ exit

```

# Oracle Linux 7 x86_64 Base Box for Vagrant

This is a minimal base box built for [Vagrant](http://www.vagrantup.com/). Initially created using VirtualBox on Mac OS X, guest additions installed, packaged using Vagrant 1.8.1.

You can access the Enterprise Manager Express using sys/sysdba and “oracle” as password.

https://oradb12c:5500/em

## Vagrant Base Box Information

1. Release: `Oracle Linux 7.2 x86_64`
2. Kernels: UEK R4  => `kernel-uek-4.1.12-32.el7uek.x86_64`, Red Hat Compatible Kernel => `kernel-3.10.0-327.4.4.el7.x86_64`
2. VirtualBox Guest Additions 5.0.12 installed
3. Default boot target => `multi-user.target`, `/etc/inittab` is **NO LONGER** used due to the switch to `systemd`.
4. **Public YUM** and **EPEL** configured, system up-to-date (**packages** and **errata**) as of 12 January, 2016 (UTC+11). Simply run `yum update -y` as `root` to stay updated.
5. Users and passwords
    * `root` / `vagrant`
    * `vagrant` / `vagrant` Public Key authentication configured for vagrant, password-less sudo
6. File Systems Layout
    * Virtual Hard Disk Capacity 20GB, Dynamically allocated
    * `/dev/sda1` => `/boot` `ext4` 500M
    * `/dev/sda2` => LVM Physical Volume
    * `/dev/linux/root` => `/` `xfs` 15GB
    * `/dev/linux/home` => `/home` `ext4` 3.8GB
    * No swap partition (LV) or swap file is configured
    * reserved blocks percentage: `/boot` => 0%, `/home` => 0%
    * `btrfs` support, `btrfs-progs` tools installed
    * In case more storage space is needed, create a new hard disk using `VBoxManage createhd`, attach it using `VBoxManage storageattach`. Then create a physical volume using the new HDD, add it to existing volume group, either grow existing logical volumes or create new ones, as you wish.
7. Networking
    * Networking mode - NAT
    * Port forwarding configured for NAT => `VBoxManage modifyvm "oracle71" --natpf1 "guestssh,tcp,,2222,,22"`
    * Hostname => `oraclelinux7.vagrantup.com`
    * For people who prefer the old NIC naming scheme (ethX instead of more predictable enpXsY), pass `net.ifnames=0` as kernel boot parameter to revert to old style.
8. Extra packages installed
    * tmux (`~vagrant/.tmux.conf` based on [Gist](https://gist.github.com/terrywang/3950393))
    * vim (with `Vundle.vim`, see `~/.vimrc`)
    * gdb, strace, crash
    * git, tig
    * rsync
    * htop
    * pv, tree, psmisc
    * wget, curl, gawk, ack
    * colordiff
    * zsh (with `prezto`)
    * bash-completion
    * net-tools, bind-utils, ethtool, iptraf, iftop, nmap
    * conntrack, iptstate
    * lshw, pciutils, usbutils
    * reptyr, ntsysv, yum-utils
    * sl
    * screenfetch (shell script)
9. systemd services
    * sshd.service (enabled)
    * firewalld.service (disabled)
    * kdump.service (disabled)
    * postfix.service (enabled)
    * rhnsd (off)
10. SELinux is disabled. To re-enable it, edit `/etc/selinux/config` and reboot

## Basic Software
* Puppet YUM repository configured and enabled.

## Getting started

Download the base box and get the box started

```bash
$ vagrant box add oraclelinux-7-x86_64 ADDRESS
$ mkdir test_environment
$ cd test_environment
$ vagrant init oraclelinux-7-x86_64
$ vagrant up
$ vagrant ssh
```

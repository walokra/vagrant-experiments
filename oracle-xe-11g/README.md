# Ansible playbook for Oracle XE

This is an [Ansible](http://www.ansibleworks.com/) playbook for [Oracle XE 11g](http://www.oracle.com/technetwork/products/express-edition/overview/index.html). It can be used by itself or as part of a larger playbook.

## Prerequisites

Download Oracle XE 11g release 2 from [oracle](http://www.oracle.com/technetwork/products/express-edition/downloads/index.html) and add oracle-xe-* under ./files directory.

# Steps

## Testing locally with Vagrant

[Vagrant](http://www.vagrantup.com/) configuration is provide. After installing Vagrant, run `vagrant up` at the root of the project to get a VM instance bootstrapped and configured with a running instance of Oracle XE 11g.

## Include role in a larger playbook

### Add this role as a git submodule

Assuming your playbook structure is such as:
```
- master-playbook
  |- vars
  |- roles
  |- master-playbook-main.yml
```

Checkout this project as a submodule under roles:

```
$  cd roles
$  git submodule add git://github.com/walokra/ansible-oraclexe.git ./ansible-oraclexe
$  git submodule update --init
$  git commit ./ansible-oraclexe -m "Added ansible-oraclexe as ./ansible-oraclexe"
```

### Include this playbook as a role in your master playbook

`master-playbook-main.yml`:

```
---

# Oracle XE install
- hosts: localhost
  user: vagrant
  sudo: yes

  roles:
    - ansible-oraclexe

  vars_files:
    - vars/my-vars.yml
```

# License

MIT

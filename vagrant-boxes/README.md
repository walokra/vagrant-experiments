# Vagrant Base Boxes

Definitions for building Vagrant base boxes with Packer and Veewee.

## Boxes

* CentOS-6.6-x86_64
* OracleLinux-7.2-x86_64

# Build

These boxes can be built using [packer](http://www.packer.io) or using [veewee](https://github.com/jedi4ever/veewee).

## Packer

e.g.

```sh
$ cd oracle-linux/definitions
$ packer build OracleLinux-7.2-x86_64-DVD.json
```

The definitions are based on the definitions for a minimal CentOS installation, but with a few modifications:

- The disk can grow to 40GB
- Provides 2GB of swap
- Fixes [slow DNS resolution](https://github.com/NREL/vagrant-boxes/issues/5)

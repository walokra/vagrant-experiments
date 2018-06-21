# Ansible playbook for Oracle Enterprise Edition

This is an [Ansible](http://www.ansibleworks.com/) playbook for [Oracle EE 12c](http://www.oracle.com/technetwork/products/express-edition/overview/index.html).

You can provision a Vagrant box with it or use it create Oracle EE base images for [Docker](https://www.docker.com/).

Builds upon [cvezalis/oracledb-ansible](https://github.com/cvezalis/oracledb-ansible).

## Prerequisites

Download Oracle EE 12c release 1 files `linuxamd64_12102_database_1of2.zip` and `linuxamd64_12102_database_2of2.zip` from [oracle](http://www.oracle.com/technetwork/database/enterprise-edition/downloads/database12c-linux-download-2240591.html) and add linuxamd64_12102_database-* under ./files directory.:

# Steps

## Using with Vagrant

[Vagrant](http://www.vagrantup.com/) configuration is provide. After installing Vagrant, run `vagrant up` at the root of the project to get a VM instance bootstrapped and configured with a running instance of Oracle 12c.

You can access the Enterprise Manager Express using sys/sysdba and “oracle” as password.

https://oradb12c:5500/em

## Using with Docker

* `docker run` creates and starts up a new database or the existing database, if it is already created.
* `docker logs` shows all the logs prefixed with log source (in the style of syslog).
* Uses `trap` to handle signals and shutdown gracefully.
* Data and logs go to `/data`, so that `-v /data` could be used.
* Oracle instance uses 40% of total memory. Can be changed in [create_database.sh](step2/create_database.sh).
* rlwrap can be installed by running `bash /tmp/install/install_rlwrap.sh` (+ 50 MB on disk).

## Build

Manually:
```
docker build -t walokra/oracle12c:preinstall step1
docker run -it --shm-size 1GB --name oracle_install -v `pwd`:/tmp/ansible walokra/oracle12c:preinstall bash
```
inside the container run
```
ansible-playbook /tmp/ansible/oracle-ee.yml -c local -e docker=yes
```
After install
```
docker commit oracle_install walokra/oracle12c:installed
docker rm oracle12c_install
```



Execute the following lines in bash and wait ~15 minutes:

```
cd docker
make all
```

### Usage

In the following examples `oracle` is the name of the container.

* Create or run database and listener
  * Daemon mode

    ```
    # Create and start
    docker run -d --shm-size 1GB --name oracle -p 1521:1521 -v /data bofm/oracle12c
    # Stop
    docker stop -t 120 oracle
    # Start again
    docker start oracle
    ```
    **Important:** Always stop with `-t`, otherwise Docker will kill the database instance, if it doesn't shut down in 10 seconds.

	* Foreground mode

    ```
    # Start
    docker run -it --shm-size 1GB --name oracle_database -p 1521:1521 -v /data bofm/oracle12c
    # `ctrl+c` (SIGINT) to stop
    ```

* Create a gzipped tar archive suitable for `docker load` (an archive of the image with a created database and without volumes)

  It is recommended to use large (>=20GB, the default is 10GB) Docker base volume size, for which Vagrant with [Vagrantfile](Vagrantfile) can be used.

  ```bash
  # Build everything and save the created image to a file.
  #   This will echo something like this:
  #     Image saved to: /some/path/docker_img_oracle_database_created_YYYY-MM-DD.tgz
  make all docker-save

  # The saved image can be loaded from the file
  # The image will be loaded with tag bofm/oracle12c:created
  docker load < docker_img_oracle_database_created_YYYY-MM-DD.tgz

  # Run the image in the new container
  # Daemon
  docker run -d --shm-size 1GB --name oracle_database -p 1521:1521 bofm/oracle12c:created
  # Foreground
  docker run -it --shm-size 1GB --name oracle_database -p 1521:1521 bofm/oracle12c:created
  ```

* Logs

  ```bash
  # Check all the logs in one place
  docker logs oracle_database

  # Check alert log
  docker logs oracle_database | grep alertlog:

  # Check listener log
  docker logs oracle_database | grep listener:
  ```

* SQL*Plus, RMAN or any other program

  ```bash
  # Bash
  # as root
  docker exec -it oracle_database bash
  # as oracle
  docker exec -it oracle_database gosu oracle bash

  # Run sqlplus in the running container
  docker exec -it oracle_database gosu oracle sqlplus / as sysdba

  # Run rman in the running container
  docker exec -it oracle_database gosu oracle rman target /

  # Run sqlplus in a separate container and
  # connect to the database in the linked container
  docker run -it --rm --link oracle_database:oradb bofm/oracle12c sqlplus sys/sys@oradb/ORCL as sysdba
  ```

* Start listener only (not sure if anybody needs it :) )

  ```bash
  docker run -d --name listener -p 1521:1521 bofm/oracle12c listener
  # Or link it to the running container
  docker run -d --name listener -p 1521:1521 --link <database_container> bofm/oracle12c listener
  ```

### Limitations and Bugs
* `--privileged` option is required to mount /dev/shm to use Oracle's automatic memory management.
* Database options and sample schemas installation through DBCA is a mystery. In this repo dbca is run with `-sampleSchema true` and [db_template.dbt](step2/db_template.dbt) contains this line `<option name="SAMPLE_SCHEMA" value="true"/>`, but nothing happens, the database is always created without sample schemas. Well, that's Oracle Database after 30+ years of development.


# License

MIT

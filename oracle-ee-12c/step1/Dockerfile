FROM oraclelinux:7
MAINTAINER walokra

# Add epel for ansible
RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm && \
		yum -y update && \
		yum -y install sudo ansible

# To avoid error: sudo: sorry, you must have a tty to run sudo
RUN sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers
 
COPY oraInst.loc /etc/
 
WORKDIR /tmp

ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/db_home1
ENV ORACLE_SID orcl
ENV PATH  $ORACLE_HOME/bin:$PATH

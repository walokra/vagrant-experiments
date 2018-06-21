#!/bin/bash 
mkdir -p /etc/puppet/modules; 

if [ ! -d /etc/puppet/modules/jdk7 ]; then 
	puppet module install biemond-jdk7 
fi

if [ ! -d /etc/puppet/modules/wls ]; then 
	puppet module install biemond-wls 
fi

if [ ! -d /etc/puppet/modules/orautils ]; then 
	puppet module install biemond-orautils
fi

if [ ! -d /etc/puppet/modules/sysctl ]; then 
	puppet module install fiddyspence-sysctl
fi

if [ ! -d /etc/puppet/modules/limits ]; then 
	puppet module install erwbgy-limits 
fi

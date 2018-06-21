#!/bin/bash
workspace=/home/vagrant/workspace
eclipseroot=/opt/eclipse

# eclipse
repoUrls=http://download.eclipse.org/releases/mars/

destEclipse=$eclipseroot
echo "Destination" $destEclipse

$destEclipse/eclipse \
	-clean -purgeHistory \
   -nosplash \
   -application org.eclipse.equinox.p2.director \
   -repository $repoUrls -list

#!/bin/bash
workspace=/home/vagrant/workspace
eclipseroot=/opt/eclipse
bundlepool=$eclipseroot/dropins

# eclipse
repoUrls=http://download.eclipse.org/releases/mars/

# m2eclipse
repoUrls=$repoUrls,http://download.eclipse.org/technology/m2e/releases
features=org.eclipse.m2e.feature.feature.group,org.eclipse.m2e.logback.feature.feature.group

# Subversive
#repoUrls=$repoUrls,http://community.polarion.com/projects/subversive/download/eclipse/5.0/update-site/ 
#features=$features,org.eclipse.team.svn.feature.group,org.polarion.eclipse.team.svn.connector.feature.group,org.polarion.eclipse.team.svn.connector.svnkit17.feature.group

# m2e-subversive
#repoUrls=$repoUrls,https://repository.sonatype.org/content/sites/forge-sites/m2eclipse-subversive/0.13.0/N/0.13.0.201106211115
#features=$features,org.eclipse.team.svn.m2e.feature.group,org.sonatype.m2e.subversive.feature.feature.group

# m2e-git
repoUrls=$repoUrls,http://download.eclipse.org/technology/m2e/releases/
features=$features,org.sonatype.m2e.egit.feature.feature.group

destEclipse=$eclipseroot
echo "Destination" $destEclipse
echo "Features" $features

$destEclipse/eclipse \
   -nosplash \
   -application org.eclipse.equinox.p2.director \
   -repository $repoUrls \
   -installIU $features

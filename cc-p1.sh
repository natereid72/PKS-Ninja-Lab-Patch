#!/bin/bash

#Check to see if script has already run and reset to original state before running again
file="~/nsx-t-ci-pipeline/pipelines/pks-params.yml.bak"
if [ -f "$file" ]
then
mv ~/nsx-t-ci-pipeline/pipelines/pks-params.yml.bak ~/nsx-t-ci-pipeline/pipelines/pks-params.yml
mv ~/nsx-t-ci-pipeline/tasks/config-pks/task.sh.bak ~/nsx-t-ci-pipeline/tasks/config-pks/task.sh
mv ~/nsx-t-ci-pipeline/tasks/config-pks/config-pks-1.1.sh.bak ~/nsx-t-ci-pipeline/tasks/config-pks/config-pks-1.1.sh
mv ~/nsx-t-ci-pipeline/tasks/config-pks/task.yml.bak ~/nsx-t-ci-pipeline/tasks/config-pks/task.yml
mv ~/nsx-t-ci-pipeline/pipelines/install-pks-pipeline.yml.bak ~/nsx-t-ci-pipeline/pipelines/install-pks-pipeline.yml
mv ~/etc/nsswitch.conf.bak ~/etc/nsswitch.con
fi

#Define Ops Manager and PKS releases to install
sed -i.bak '/opsman\_major\_minor\_version: \^2\\.3.*$/c\opsman_major_minor_version: ^2\\.3\\.0$'  ~/nsx-t-ci-pipeline/pipelines/pks-params.yml
sed -i.bak '/pks\_major\_minor\_version: \^1\\.2.*$/c\pks_major_minor_version: ^1\\.2\\.0$'  ~/nsx-t-ci-pipeline/pipelines/pks-params.yml

#Comment out incompatible property references in pks pipeline
sed -i.bak '/pks_syslog_properties/,/Finished configuring syslog properties/s/^/#/' ~/nsx-t-ci-pipeline/tasks/config-pks/task.sh
sed -i.bak '/PKS_VRLI_ENABLED/,/\<fi\>/s/^/#/' ~/nsx-t-ci-pipeline/tasks/config-pks/config-pks-1.1.sh
sed -i.bak '/PKS_SYSLOG/s/^/#/' ~/nsx-t-ci-pipeline/tasks/config-pks/task.yml
sed -i.bak '/PKS_SYSLOG/s/^/#/' ~/nsx-t-ci-pipeline/pipelines/install-pks-pipeline.yml
sed -i.bak '/pks_tile_syslog/s/^/#/' ~/nsx-t-ci-pipeline/pipelines/pks-params.yml

#Correct name service switch config for cli-vm dns name resolution
sed -i.bak  '/mdns4/c\hosts:  files  dns' /etc/nsswitch.conf

#Unused block - Placeholder for anything that may require vSphere config changes
#curl -k -i -u administrator@vsphere.local:VMware1! -X POST -c cookie-jar.txt https://vcsa-01a.corp.local/rest/com/vmware/cis/session
#curl -k -i -b cookie-jar.txt https://vcsa-01a.corp.local/rest/vcenter/...

#Switch to home directory post-script
cd ~
ping vcsa-01a.corp.local -c 1
echo ""
echo "Patched: PKS Pipeline, cli-vm DNS client config."

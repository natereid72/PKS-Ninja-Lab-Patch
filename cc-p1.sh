#Comment out incompatible property references in pks pipeline
sed -i.bak '/pks_syslog_properties/,/Finished configuring syslog properties/s/^/#/' ~/nsx-t-ci-pipeline/tasks/config-pks/task.sh
sed -i.bak '/PKS_VRLI_ENABLED/,/\<fi\>/s/^/#/' ~/nsx-t-ci-pipeline/tasks/config-pks/config-pks-1.1.sh
sed -i.bak '/PKS_SYSLOG/s/^/#/' ~/nsx-t-ci-pipeline/tasks/config-pks/task.yml
sed -i.bak '/PKS_SYSLOG/s/^/#/' ~/nsx-t-ci-pipeline/pipelines/install-pks-pipeline.yml
sed -i.bak '/pks_tile_syslog/s/^/#/' ~/nsx-t-ci-pipeline/pipelines/pks-params.yml

#Correct name service switch config for cli-vm dns name resolution
sed -i  '/mdns4/c\hots:  files  dns' /etc/nsswitch.conf

#Unused block - Placeholder for anything that may require vSphere config changes
#curl -k -i -u administrator@vsphere.local:VMware1! -X POST -c cookie-jar.txt https://vcenter/rest/com/vmware/cis/session
#curl -k -i -b cookie-jar.txt https://vcenter/rest/vcenter/vm 

sed -i '/pks_syslog_properties/,/Finished configuring syslog properties/s/^/#/' ~/nsx-t-ci-pipeline/tasks/config-pks/task.sh
sed -i '/PKS_SYSLOG/s/^/#/' ~/nsx-t-ci-pipeline/tasks/config-pks/task.yml
sed -i  '/mdns4/c\hots:  files  dns' /etc/nsswitch.conf

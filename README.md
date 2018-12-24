# PKS-Ninja-Patch

## This script is a stop-gap for issues in the current (v10) PKS-Ninja lab template.

#### _(Execute this script immediately after deploying the v10 lab template, before you begin the lab guides.)_

### Fixes:

- CLI-VM
  - DNS name resolution
    - Fix name service switch config (/etc/nsswitch.conf) 
      - Removes mdns4 multicast DNS resolution config.
    - Create .bak of orignal file in same directory
    
  - PKS pipeline install
    - Remark out pipeline property conflicts (~/nsx-t-ci-pipeline/tasks/config-pks/task.yml, ~/nsx-t-ci-pipeline/tasks/config-pks/task.sh, ~/nsx-t-ci-pipeline/tasks/config-pks/config-pks-1.1.sh, ~/nsx-t-ci-pipeline/pipelines/install-pks-pipeline.yml, ~/nsx-t-ci-pipeline/pipelines/pks-params.yml
      - All parameters or functions referring to "syslog". Bit of brute force but works and doesn't seem to break any lab tasks.)
    - Restrict platform deployment to Ops Man 2.3.0 and PKS 1.2.0 (~/nsx-t-ci-pipeline/pipelines/pks-params.yml)
    - Remove RegionA01-MGMT01 from PKS tile 'Networking / vSphere Cluster Names'
    - Create .bak of original files in same directory
    
  - Add aliases to cli-vm shell
    - pksli = pks login -a pks.corp.local -u pks-admin -p VMware1! --skip-ssl-validation
    - pksg c= pks get-credentials
    
### Notes:

The script will create a .bak of each file before it is updated. Running the script again will reset original state before applying the patch again. If you make other changes to the affected files post-run and then rerun, your changes will be lost.
    
### Directions:

- Execute **`source cc-p1.sh`** at the command line on cli-vm

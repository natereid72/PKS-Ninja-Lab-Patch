# PKS-Ninja-Patch

## This script is a stop-gap for issues in the current PKS-Ninja lab template.

#### _(Execute this script immediately after deploying the v10 lab template, before you begin the lab guides.)_

### Fixes:

- CLI-VM
  - DNS name resolution
    - Fix name service switch config (/etc/nsswitch.conf) (Removes mdns4 multicast DNS resolution config.)
    - Create .bak of orignal file in same directory
    
  - PKS pipeline install
    - Remark out pipeline property conflicts (~/nsx-t-ci-pipeline/tasks/config-pks/task.yml, ~/nsx-t-ci-pipeline/tasks/config-pks/task.sh, ~/nsx-t-ci-pipeline/tasks/config-pks/config-pks-1.1.sh, ~/nsx-t-ci-pipeline/pipelines/install-pks-pipeline.yml, ~/nsx-t-ci-pipeline/pipelines/pks-params.yml) (Remarks out any parameter or function referring to syslog. Bit of brute force but works and doesn't seem to break any lab tasks.)
    - Restrict platform deployment to Ops Man 2.3.0 and PKS 1.2.0 (~/nsx-t-ci-pipeline/pipelines/pks-params.yml)
    - Create .bak of original files in same directory
    
### Directions:

- Execute **`source cc-p1.sh`** at the command line on cli-vm

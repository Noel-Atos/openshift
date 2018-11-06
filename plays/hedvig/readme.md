# HEDVIG Deployment

## Description:

This describes how to intergrate Hedvig into the OCP deployment using Ansible scripts.



## Behaviour:

**Feature:** Integrate Hedvig Storage



## Dependencies:

These scripts deployed using Ansible Engine  2.6.4. and 'Openshift-Ansible-3..47-1'  In addition, the following are required to be installed:

HCP PAAS Infrastructure
Hedvig Storage Infrastructure
Hedvig Installer 'hedvig-installer.tar.gz'

OCP Deployment:
- Deployment of OCP environment
- Deployment of 'openshift/pre_configure.yml'
- Deployment of 'openshift/deploy_openshift_cluster.yml'



## Configuration:

A list of the external variables used by the playbook (see first table).


Variables for role 'configure_hedvig_compute

| Variable | Description | Example | Where set |
|-----|-----|-----|-----|
| **role_path** | Absolute path to role | /home/ec2-user/openshift/roles/configure_hedvig_daemonset | configure_hedvig_compute/vars/main.yml |


Variables for role 'configure_hedvig_daemonset'

| Variable | Description | Example | Where set |
|-----|-----|-----|-----|
| **role_path** | Absolute path to role | /home/ec2-user/openshift/roles/configure_hedvig_daemonset | configure_hedvig_daemonset/vars/main.yml |
| **hedvig_installer_path** | Absolute path to Hedvig Installer | /home/ec2-user/hedvig/hedvig_installer | configure_hedvig_daemonset/vars/main.yml |
| **hedvig_seed_1** | IP Address of a Hedvig Cluster Node in AZ1 | 10.4.xx.xx | configure_hedvig_daemonset/vars/main.yml |
| **hedvig_seed_2** | IP Address of a Hedvig Cluster Node in AZ2 | 10.5.xx.xx | configure_hedvig_daemonset/vars/main.yml |
| **hedvig_seed_3** | IP Address of a Hedvig Cluster Node in AZ3 | 10.6.xx.xx | configure_hedvig_daemonset/vars/main.yml |
| **kube_cluster_hedvig_id** | Cluster / Environment  Name | ocp04.atoshcp.net | configure_hedvig_daemonset/vars/main.yml |
| **image_id** | The ID /Version of the Hedvig Console | v3.8.8 | configure_hedvig_daemonset/vars/main.yml |
| **ocp_uri** | The internal url for the ocp Cluster | https://admin-internal.ocp04.paas.atoshcp.net:8443 | configure_hedvig_daemonset/vars/main.yml |
| **ocp_token** | Security token for user | Token  | configure_hedvig_daemonset/vars/main.yml |



Variables for role 'configure_hedvig_provisioner

| Variable | Description | Example | Where set |
|-----|-----|-----|-----|
| **hedvig_installer_path** | Absolute path to Hedvig Installer | /home/ec2-user/hedvig/hedvig_installer | configure_hedvig_provisioner/vars/main.yml |
| **storage_cluster** | Name given to Hedvig Storage Cluster | iag_solatest | configure_hedvig_provisioner/vars/main.yml |
| **storage_node** | IP Address of a Hedvig Cluster Node  | 10.4.xx.xx | configure_hedvig_provisioner/vars/main.yml |
| **kube_cluster_id** | Cluster / Environment  Name | ocp04.atoshcp.net | configure_hedvig_provisioner/vars/main.yml |
| **image_version** | Tag for the most recently released version of the Hedvig Dynamic Provisione (https://hub.docker.com/r/hedviginc/hedvigprovisioner/tags/) | v1.0.6| configure_hedvig_provisioner/vars/main.yml |
| **ocp_uri** | The internal url for the ocp Cluster | https://admin-internal.ocp04.paas.atoshcp.net:8443 | configure_hedvig_provisioner/vars/main.yml |
| **ocp_token** | Security token for user | Token  | configure_hedvig_provisioner/vars/main.yml |


##Files:
configure_hedvig_compute/files/hosts                              - This file is copied to the compute nodes and replaces the /etc/hosts. It cotaons the hedvig clusters and the Redhat Satallite server.

configure_hedvig_compute/files/metacache.service                  - This is the metacache service file, copied to compute nodes.

configure_hedvig_daemonset/files/hostpath_scc.yml                 - This is a Security Context Constraints file.

configure_hedvig_daemonset/templates/daemonset.yml.j2             - The deamonset.yml, configures the Hedvig proxies.

configure_hedvig_provisioner/templates/backend.json.j2            - Configuration file to point to the Hedvig Storage Cluster

configure_hedvig_provisioner/templates/hedvig-deployment.yaml.j2  - Hedvig Dynamic Provisioner yaml file.


## Testing:

Testing is currently carried out using an Ansible Control node which will build the environment on AWS. To test, do the following:

1. Clone  https://github.com/cloud-automation-framework/openshift.git.
2. Deploy OCP roles 'openshift/pre_configure.yml' and 'openshift/deploy_openshift_cluster.yml'.  .
3. Uncompress the Hedvig Installer 'hedvig-installer.tar.gz'
4. Update variables and files for the Hedvig Deployment.
5. Run Hedvig Playbooks (see usage).


## Usage:

The following commands will run the scripts using the `iag-ocp-dev` inventory:

```$ ansible-playbook -i inventories/iag-ocp-dev/plays/hedvig/pre_configure.yml```


```$ ansible-playbook -i inventories/iag-ocp-dev/plays/hedvig/deploy_daemonset.yml```


```$ ansible-playbook -i inventories/iag-ocp-dev/plays/hedvig/deploy_provisioner.yml```

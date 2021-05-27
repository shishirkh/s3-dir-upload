# Changelog
All notable changes to chart **cskm** are documented in this file,
which is effectively a **Release Note** and readable by customers.

Do take a minute to read how to format this file properly.
It is based on [Keep a Changelog](http://keepachangelog.com)
- Newer entries _above_ older entries.
- At minimum, every released (stable) version must have an entry.
- Pre-release or incubating versions may reuse `Unreleased` section.

### Changed
## [4.11.1] - 2019-11-22
- Add nodeSelector support. CSKM will be installed on node(s) containing all labels listed in .Values.nodeSelector
- Change logStorage from 100 to 260 Mb.
- Added comment to values.yaml and values-template and values-model files about chart installation in IPv6 environment.
- Vault FOSS update version 1.2.3 was done for CSKM
- Change audit log collection from tcp to file

### Changed
## [4.10.1] - 2019-10-17
- CSFSEC-3158 - CSKM - change post-install-job-container label name
- CSFSEC-3237 - Add kubernetes certificates into cskm post-install-job hook
- CSFSEC-3220 - CSKM - Remove/Fix sdc-ca-cert-secret or other csdc certs requirement when csdc tls disable in cskm helm chart

### Changed
## [4.10.0] - 2019-08-30
- CSFSEC-3013 - CSKM- Change cbur image tag in helm chart
- CSFSEC-2991 - CSKM - Change liveness probe from tcpSocket to httpGet in helm chart 
- CSFSEC-3014 - CSKM- Fix typo in cskm/templates/brpolicy.yaml in cskm helm chart
- Vault FOSS update version 1.2.2 was done for CSKM 

### Changed
## [4.9.0] - 2019-07-11
- CSFSEC-2785 - Fix kubectl delete pvc, secret commands and echo text in templates/pre-delete-job.yaml
- CSFSEC-2709 - CSKM - implement init container to check if cmdb is ready or not to start cskm installation process
- FOSS (HashiCorp Vault) upgraded to version 1.1.3

### Changed
## [4.8.5] - 2019-06-13
- Parameterize CBUR configurations for CSKM
- Fixed storageClassName typo in cskm/templates/statefulset.yaml file
- Modified pre-delete-job hook-weight from -6 to 0
- Adding pre-delete-job to clean pvc & secret on deleting. It is default behaviour now.
- Using cbur image for backup restore to latest
- Fixed RHEL licensing issue in docker image

### Changed
## [4.7.0] - 2019-05-17
- FOSS (HashiCorp Vault) upgraded to version 1.1.1
- CSFS-13260 - Post install job is slow to complete

### Changed
## [4.6.1] - 2019-04-15
- CSFS-12159 - Validation error with StatefulSet

### Changed
## [4.6.0] - 2019-04-12
- CSFS-11599 - vault helm chart post job getting service_ip incorrectly
- CSFS-12291 - CSKM post install script exposes Vault token to public. Added new parameter postInstallTraceEnabled 
  to values.yaml
- CSFSEC-2195 - Create variable for protocol (http/https) in userScript part of post-install job
- CSFSEC-2441 - hardcoded https protocol 

### Changed
## [4.5.3] - 2019-03-15
- CSFS-10293 - CSKM post-install job failures cannot be debugged because hook-delete-policy include "failed"	
- CSFS-7529 - Create Input variable to specify the service type either ClusterIP or NodePort
- CSFS-11422 - RBAC rules adjusted to work on ComPass 19.1  

### Changed
## [4.4.1] - 2019-02-13
- Add unified logging
- Foss update to version 1.0.2
- Fix CSFS-10186 - CSKM post-install job can't find the service IP when an ExternalName refers to the same service


### Changed
## [4.3.1] - 2019-01-15
- CSFSEC - Test Automation - CSKM deployment step with CSDC failing after recent changes in readiness probe

## [4.3.0] - 2018-12-27
### Changed
- CSFS-8923 - New auth plugin for etcd added to CSKM Docker image  
- CSDS-8984 - More flexible configuration for readiness probe  

## [4.2.2] - 2018-12-6
### Changed
- CSFSEC-1611 - CSKM - Enable HTTP for REST API
- CSFSEC-1617 - CSKM - post-install job randomly return empty service ip

## [4.1.10] - 2018-12-14
### Changed
- Add configuration of secondsAfterPostInstall in values.yaml

## [4.1.9] - 2018-11-19
### Changed
- CSFSEC-1550 - CSKM post-install job can't find the service IP when deployed as a sub-chart
- CSFSEC-1552 - User can set additional env variables in values.yaml
- CSFSEC-1559 - BCMT 18.08 Overwrite Storageclass in value.yaml with "" not working
- CSFSEC-1562 - Add option to allow users to wait at the end of post-install job
- CSFSEC-1563 - Add flag to docker image to skip vault starting

## [4.0.0] - 2018-10-26
### Added
- Added backup and restore support. Manual steps are at https://confluence.app.alcatel-lucent.com/display/plateng/Backup+and+Restore+Guide 
- Add post-install job to initialize and unseal vault
- Add options in values.yaml to allow admin to disable automatic initiazation and unsealing.
- Allow user/admin to define their script to configure vault. as an example, the values.yaml contains how to configure vault with k8s authentication.
- CSFSEC-1399: Setting vault log level by helm chart
- CSFSEC-1093: use pvc to create file backend storage.

## [3.0.0] - 2018-10-01
### Added
- Re-desined docker image and helm chart. New image includes only Vault binaries. 
- CSKM started to use ConfigMap for configuration
- All backend supported by Vault are supported by CSKM now

## [2.0.3] - 2018-09-28
### Added
- Changing default helm repo to candidates

## [2.0.2] - 2018-09-28
### Added
- Disable audit log by default

## [2.0.1] - 2018-09-27
### Added
- Allow users to change docker registry on Compaas

## [2.0.0] - 2018-09-26
### Added
- Helm chart to support newly designed CSKM docker image

## [1.0.1] - 2018-09-04
### Added
- CSF chart relocation rules enforced
- in values.yaml create 'registry:' variable to follow a relocation rule

## [1.0.0] - 2018-07-31
### Added
- All future chart versions shall provide a change log summary

## [0.0.0] - YYYY-MM-DD
### Added | Changed | Deprecated | Removed | Fixed | Security
- your change summary, this is not a **git log**!


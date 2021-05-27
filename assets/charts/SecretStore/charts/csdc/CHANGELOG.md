# Changelog
All notable changes to chart **csdc** are documented in this file,
which is effectively a **Release Note** and readable by customers.

Do take a minute to read how to format this file properly.
It is based on [Keep a Changelog](http://keepachangelog.com)
- Newer entries _above_ older entries.
- At minimum, every released (stable) version must have an entry.
- Pre-release or incubating versions may reuse `Unreleased` section.

## [Unreleased]
### Added
- CSF chart relocation rules enforced
### Changed
- incubating example only - behavior changed
### Deprecated
- incubating example only - existing behavior deprecated
### Removed
- incubating example only - existing behavior deleted
### Fixed
- incubating example only - buggy behavior fixed
### Security
- incubating example only - security vulnerability fix

## [2.1.8] - 2019-09-19
### Fixed
- Find and remove the unstarted member

## [2.1.7] - 2019-09-18
### Fixed
- Add nodeSelector support for CSDC

## [2.1.6] - 2019-08-05
### Fixed
- Add a timer in preStop and remove force-new-cluster flag

## [2.1.5] - 2019-08-05
### Fixed
- Add dial-timeout for etcdctl and change the FQDN for livenessprobe to POD IP


## [2.1.4] - 2019-07-29
### Fixed
- just start etcd only for data in disk if pod is restarted and pod ip is not changed

## [2.1.3] - 2019-07-02
### Changed
- Change the default kubectl version from v1.10.3-user to v1.13.4

## [2.1.2] - 2019-06-26
### Added
- Parameterize CBUR configurations for CSDC with tls

## [2.1.1] - 2019-06-26
### Changed
- Hide the curl output when waiting for other pods to come up.

## [2.1.0] - 2019-06-21
### Fixed
- CSDC enhance upgrade for disk to ramdisk

## [2.0.34] - 2019-06-12
### Fixed
- CSDC supports memory/ramdisk option for snap and wal files

## [2.0.33] - 2019-06-03
### Added
- Parameterize CBUR configurations for CSDC

## [2.0.32] - 2019-05-05
### Fixed
- CSDC enhancements for NTAS/SMSF

## [2.0.31] - 2019-04-16
### Changed
- Change to split the CSDC chart into etcd server chart

## [2.0.30] - 2019-04-02
### Fixed
- Fix to disable BrPolicy when proxy is brought up

## [2.0.29] - 2019-03-26
### Fixed
- Fix add resources in the post-delete-job.yaml

## [2.0.28] - 2019-03-26
### Fixed
- Fix unable to delete proxy instance if the tls of csdc server and proxy instance is different

## [2.0.27] - 2019-03-22
### Changed
- Change the the restart cluster scenaro from snapshot restore to --force-new-cluster to preserve the v2 data.

## [2.0.26] - 2019-03-07
### Fixed
- Fix pod reschedule but ip not change issue.

## [2.0.25] - 2019-03-07
### Fixed
- Fix Incorrect namespace definition for proxy deployment

## [2.0.24] - 2019-02-19
### Fixed
- Fix container restart issue

## [2.0.23] - 2019-02-19
### Fixed
- Add namespace of the ETCDCTL_ENDPOINT for different clusters share

## [2.0.22] - 2019-02-19
### Fixed
- Fix the issue that self-define memory is invalid on ComPaaS

## [2.0.21] - 2019-02-18
### Fixed
- Fix user defined certificates issue on ComPaaS patch7.

## [2.0.20] - 2019-02-15
### Fixed
- Fix cbur cron job issue

## [2.0.19] - 2019-02-15
### Fixed
- Fix the ETCDCTL_ENDPOINT host about DNS query failures

## [2.0.18] - 2019-02-12
### Changed
- jobs: change the name of post-delete job to include chart name

## [2.0.17] - 2019-02-12
### Changed
- TLS: add full domain name of svc into server key pairs

## [2.0.16] - 2019-02-11
### Fixed
- Change compass release name by compass parameter

## [2.0.15] - 2019-02-02
### Fixed
- Fix user defined certificates issue on ComPaaS patch6.

## [2.0.14] - 2019-02-01
### Fixed
- Fix user defined certificates issue on ComPaaS patch5.

## [2.0.13] - 2019-02-01
### Fixed
- Add patch for restart cluster

## [2.0.12] - 2019-02-01
### Fixed
- Restore snapshot when restart a cluster in case of losing data

## [2.0.11] - 2019-01-31
###  Changed
- Fix user defined certificates issue on ComPaaS patch4.

## [2.0.10] - 2019-01-31
###  Changed
- Fix grpc proxy namespace issue.

## [2.0.9] - 2019-01-30
###  Changed
- Add a flag cbur.enable that user can disable brpolicy created.

## [2.0.8] - 2019-01-30
###  Changed
- Fix user defined certificates issue on ComPaaS patch3.

## [2.0.7] - 2019-01-30
###  Changed
- Fix user defined certificates issue on ComPaaS patch2.

## [2.0.6] - 2019-01-30
###  Changed
- Fix user defined certificates issue on ComPaaS patch1.

## [2.0.5] - 2019-01-30
###  Changed
- Fix user defined certificates issue on ComPaaS.

## [2.0.4] - 2019-01-21
###  Changed
- Support deploy etcd with tls key pairs which are provided by user.

## [2.0.3] - 2019-01-11
###  Changed
- According to ComPaaS, app cannot create ClusterRoleBinding object and cannot use privileged mode.
- According to CBUR, cbur sidecar cannot be run as root.

## [2.0.2] - 2019-01-11
###  Changed
- Fix the issue that cannot restore with tls

## [2.0.1] - 2019-01-08
###  Changed
- Fix the issue that pod cannot startup when the file member_id is empty for some unknown reason

## [2.0.0] - 2018-12-28
###  Changed
- changed the sdc image to support rbac

## [1.0.54] - 2018-12-25
### Fixed
- Change sdc-secret.yaml to fix deploy failed when enable rbac

## [1.0.53] - 2018-12-24
### Fixed
- Handle the scenario that the member id is null

## [1.0.52] - 2018-12-20
### Added
- Add process for csdc to enable RBAC of ETCD

## [1.0.51] - 2018-12-10
### fixed
- Version 1.0.51 support snapshot-count, heartbeat-interval, election-timeout configuration to start etcd

## [1.0.50] - 2018-12-05
### fixed
- Version 1.0.50 support grpc proxy connect to customized etcd cluster


## [1.0.49] - 2018-12-03
### fixed
- Version 1.0.49 did not change all the required files, fix it

## [1.0.48] - 2018-11-28
### fixed
- uses the resource.request as the value of resouce.limits

## [1.0.47] - 2018-11-26
### fixed
- clean up csdc pvc when csdc chart deleted

## [1.0.46] - 2018-11-22
### fixed
- waiting for pod ready before start etcd service for pod restart scenario

## [1.0.45] - 2018-11-15
### fixed
- start a new cluster when restore, all other pods rejoin to this cluster.


## [1.0.44] - 2018-11-14
### fixed
- when restore failed just restart the pod

## [1.0.43] - 2018-11-12
### Changed
- change the resource limits and add updateStrategy

## [1.0.42] - 2018-10-24
### Fixed
- Fixed issue that the container stay in crashloopbackoff state due to memberid is not saved correctly

## [1.0.41] - 2018-10-09
### Changed
- Change pre-delete-job.yaml from pod to job.

## [1.0.40] - 2018-09-28
### Fixed
- Fixed issue that etcd namespace is not deleted via pre-delete hook.

## [1.0.39] - 2018-09-28
### Fixed
- Fixed issue that CSDC has no resource dfinition and fails to start in namespace with quota.

## [1.0.38] - 2018-09-17
### Fixed
- Leave the storageclass field to null.

## [1.0.37] - 2018-09-11
### Fixed
- Fixed issue that csdc deploy failed on ComPaaS with RBAC enabled.

## [1.0.36] - 2018-09-10
### Fixed
- Fixed issue that csdc can not run successfully after rebooting Control node.

## [1.0.35] - 2018-08-21
### Changed
- Support backup/restore for helm.

## [1.0.34] - 2018-08-20
### Changed
- Update values-model.yaml and values-template.yaml.j2 to support compaas portal

## [1.0.33] - 2018-08-13
### Added
- Add test scripts for tls chart

## [1.0.32] - 2018-08-09
### Added
- All future chart versions shall provide a change log summary

## [0.0.0] - YYYY-MM-DD
### Added | Changed | Deprecated | Removed | Fixed | Security
- your change summary, this is not a **git log**!


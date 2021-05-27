# Changelog
All notable changes to chart **crdb-redisio** are documented in this file.

## [Unreleased]
## [5.3.1] - 2019-11-06
### Changed
- Added injection of replicaof to server config during install for CSFS-18112
- Added test for ensuring replicaof in saved config

## [5.3.0] - 2019-09-10
### Added
- Image version check to prevent problematic helm upgrades with old images
- NCMS Restore plugin hook jobs for CBUR
- Support for nodeSelector values for server and sentinel
### Changed
- Updated images to 2.7-1 to include tools updates and redis-py v3.3.7
- admin image updated to use nano-based base image
- Updated to redis_exporter v1.1.1
- sentinel resources are excluded on singleserver (server.count=1)
- rolemon excluded on singleserver (server.count=1) for CSFOSDB-1571
### Removed
- Removed pre/post restore from CBUR policy

## [5.2.11] - 2019-09-10
### Fixed
- Fixed values-compat merging of metrics-related values not allowing disabled metrics
- Added *.src to helmignore to exclude files from packaging

## [5.2.10] - 2019-09-06
### Changed
- Updated to images for 2.6-3 to increase all socket_timeout default values to 2.0s

## [5.2.9] - 2019-09-05
### Changed
- Updated to images for 2.6-2 to include entrypoint change for setup_include during init
- Updated to images for 2.6-2 to include sentinel_monitor thread exception change

## [5.2.8] - 2019-08-21
### Fixed
- Added command without redisio-monitor to prevent harmonize_log reaping
### Changed
- Updated to images for 2.6-1 to include rolemon label resource util enhancement

## [5.2.7] - 2019-08-20
### Changed
- Updates to crdb-redisio-test to integrate with CCTF launch script
- Included newer images with flexlog 1.1-5.103

## [5.2.6] - 2019-08-06
### Fixed
- Added configmaps to post-delete RBAC Role

## [5.2.5] - 2019-07-29
### Changed
- Added values-compat to fix upgrade compatibility issues with metrics and cbura

## [5.2.4] - 2019-07-26
### Changed
- cbura image name and tag in values-model for ComPaaS

## [5.2.3] - 2019-06-26
### Added
- Checks to skip invalid password helm test when password not used
### Changed
- Updated to nano-based images

## [5.2.2] - 2019-06-19
### Added
- Support for nodePort port specification in values and services
- Support for server.tmpfsWorkingDir for tmpfs-backed database
- Helm tests for rolemon-managed pod labels

## [5.2.1] - 2019-06-13
### Changed
- Increased default rolemon container memory limit to 256Mi
- Fixed incorrect default image tag

## [5.2.0] - 2019-05-31
### Changed
- Updated images to 2.5-1 to incorporate alarm handling

## [5.1.0] - 2019-05-28
### Added
- Added metrics sidecar container support to Redis server statefulset
- Added Redis server dashboard configmap for Grafana integration
### Changed
- Updated redisio entrypoint to resolve SLAVE_ANNOUNCE_IP from a name to an IP
- Updated redisio entrypoint to remove replicaof/slaveof entries from server conf
- Added crdb-redisio-test template
- Redis.io to version 5.0.5
- CRDB tools to 2.4-1

## [5.0.2] - 2019-05-01
### Changed
- Updated images to latest based on changes to Jenkins build

## [5.0.1] - 2019-04-29
### Added
- values-model.yaml and values-template.yaml.j2 for ComPaaS UI

## [5.0.0] - 2019-04-08
### Added
- Per-pod service for servers
- Master and Num_Slaves labels on server pods for better status visibility
### Changed
- Updated to new redisio and admin images for CSFS-11265
- Sentinel datadir to be based on emptyDir volume
- Helm render tests as needed for chart changes
- Redis.io to version 5.0.4
- Redis-py to version 3.2.1
### Removed
- PVCs from Sentinel Statefulsets
- Server node headless service
- fsGroup from container spec in Statefulsets

## [4.1.2] - 2019-02-06
### Changed
- Updated base images and tool dependencies

## [4.1.1] - 2019-01-30
### Fixed
- Corrected RBAC hook weights to be unique

## [4.1.0] - 2019-01-23
### Changed
- Modified RBAC definition to be more selective for enhanced ComPaaS security
- Updates test Pods to have requests and limits set

## [4.0.3] - 2019-01-16
### Fixed
- Check for cbur.enabled=false to exclude cbur manifest

## [4.0.2] - 2019-01-08
### Changed
- Redis.io tools to v2.3.2

## [4.0.1] - 2018-12-31
### Added
- Added basic helm test cases
- Added post-install hook Job to wait for pods to be Running
- Added pre-delete hook Job to cleanup preceeding Jobs
### Changed
- Redis.io tools to v2.3.1
- Changed environment-based config to use _CRDB_REDISIO prefix
### Fixed
- Invalid kubectl command in NOTES when admin.debug enabled

## [3.2.2] - 2018-12-20
### Added
- Added render-test
### Changed
- Changed chart to be built in different git repo
### Fixed
- confInclude Values causing invalid yaml

## [3.2.1] - 2018-11-29
### Changed
- Changed default images to use 2.2-1.367 with Redis.io 5.0.2

## [3.1.1] - 2018-11-07
### Fixed
- Fixed exposed services to use groupname instead of fullname

## [3.0.4] - 2018-11-07
### Changed
- Modified fullname template to support fullnameOverride and Release Name suffix

## [3.0.3] - 2018-11-06
### Fixed
- Corrected nameOverride handling when groupName null

## [3.0.2] - 2018-10-31
### Added
- Added resources to all containers for ComPaaS

## [3.0.1] - 2018-10-30
### Added
- Added support for CBUR-based Backup/Recovery
### Changed
- Refactored image and imageTag into partial template include
- Altered image-related value structure
- Updated NOTES to use redis:// URI

## [2.1.2] - 2018-10-25
### Fixed
- Fixed noauth with common.password=none

## [2.1.1] - 2018-10-15
### Changed
- Removed storageClass value to force use of default
### Fixed
- Compaas storageclass in stateful sets

## [2.0.1] - 2018-09-25
### Added
- Access to master and slave pods through services
- Access to sentinel through service
- Server sidecar for managing labels
- Support for persistence on sentinel
### Changed
- Improved support for Healing of restarted Pods
- Restructure of configuration files in Pods
- Changed priority of storageClass values

## [1.0.2] - 2018-09-07
### Changed
- Removed chart name and version as a resource label
- Added selector to statefulsets

## [1.0.1] - 2018-08-30
### Added
- Initial Release of crdb-redisio Chart

## Entry Template:
## [0.0.0] - YYYY-MM-DD
### Added | Changed | Deprecated | Removed | Fixed | Security
- your change summary, this is not a **git log**!

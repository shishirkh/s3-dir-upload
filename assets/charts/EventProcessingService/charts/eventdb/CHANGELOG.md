# Changelog
All notable changes to chart **ccas-apache** are documented in this file,
which is effectively a **Release Note** and readable by customers.

Do take a minute to read how to format this file properly.
It is based on [Keep a Changelog](http://keepachangelog.com)
- Newer entries _above_ older entries.
- At minimum, every released (stable) version must have an entry.
- Pre-release or incubating versions may reuse `Unreleased` section.

## [2.1.6] - 2019-07-02
### Added
- cassandra conf files used in configmap - CSFOSDB-1619
### Changed
- cassandra image tag default to 3.11.4.379 - CSFOSDB-1699

## [2.1.5] - 2019-06-25
### Fixed
- BrPolicy post-restore change to truncate once per cluster and run clean - CSFOSDB-1634

## [2.1.4] - 2019-06-12
### Fixed
- backup cluster name for helm chart upgrade from 2.0.X - CSFOSDB-1502
### Changed
- cassandra image tag default to 3.11.4.377 - CSFOSDB-1502

## [2.1.3] - 2019-05-30
### Added
- support for istio - CSFOSDB-1373

## [2.1.2] - 2019-05-27
### Added 
- Parameterize CBUR configurations for Cassandra – CSFOSDB-1536

## [2.1.1] - 2019-05-09
### Fixed
- scale incompatible with kubernetes 1.13.4+ (NCMS 19.03) - CSFOSDB-1506
- change default for config.network to null - CSFOSDB-1506
- remove null defaults in values-model - CSFOSDB-1506

## [2.1.0] - 2019-04-28
### Added
- support for seeds with hostNetwork - CSFOSDB-1106
- support for cluster_domain - CSFOSDB-1106
- support for listen_address with istio - CSFOSDB-1106
### Changed
- cassandra image tag default to 3.11.4.375 - CSFOSDB-1106

## [2.0.13] - 2019-04-05
### Changed
- BrPolicy post-restore command options (truncate,restoreKS) - CSFOSDB-1417
### Added
- commandOverrides for liveness and readiness probes - CSFOSDB-12018

## [2.0.12] - 2019-03-28
### Fixed
- Remove extra rbac privileges in pre/post upgrade roles - CSFOSDB-1364
- Allow disabling backup pvc in ComPaas - CSFOSDB-1363
- Fix year typo in CHANGELOG


## [2.0.11] - 2019-03-12
### Changed
- cassandra image tag default to 3.11.4.371 - CSFOSDB-1377
- cbura-sidecar image tag default to 1.0.3-770

## [2.0.10] - 2019-02-28
### Changed
- cassandra image tag default to 3.11.4.366 - CSFOSDB-1346
- tools kubectl image tag default to v1.12.3 - CSFOSDB-1329

## [2.0.9] - 2019-01-28
### Fixed
- Allow promotheus annotations to cassandra service - CSFOSDB-1305

### Added
- New value: metrics.annotate_service (default false)

## [2.0.8] - 2019-01-28
### Changed
- Use "soft" antiAffinity if minconfig.Enabled
- Job admin.hook_delete_policy now includes before-hook-creation

## [2.0.7] - 2019-01-17
### Added 
- Pod spec updated to include podAntiAffinity rules, default hard - CSFOSDB-1280
- New values: antiAffinity (default "hard"), minconfig.overrideResources (default true)

### Changed
- Reverted default resources to minconfig - CSFOSDB-1276
- Replaced rbac wildcarding, replaced clusterrole to role for ComPaas compatibility
- Post-upgrade now runs secret migration first
- Default image csfTag: 3.11.2.360

### Fixed
- Re-added persistence.enabled to support chart upgrades from 2.0.2 - CSFOSDB-1289

## [2.0.6] - 2018-12-31
### Added
- Unified Metrics, Interation with CPRO/grafana - CSFOSDB-1142
- Higher resources for field deployment, minconfig still supported

## [2.0.5] - 2018-12-31
### Added
- Unified Metrics, Interation with CPRO/grafana - CSFOSDB-1142

## [2.0.4] - 2018-11-30
### Fixed
- Addressed default storage class in values, CSFOSDB-1100
- Fix upgrade from 2.0.2 chart
- Update pre/post-upgrade scripts for status check for compatibility with latest kubectl cli
- Update statefulset cbur container volume mapping to support using datadir for backup
- Fix password update for cassandra superuser (broken in 2.0.3 with secret implemented as pre-install hook)
 
## [2.0.3] - 2018-10-31
### Fixed
- Removed default password in values
- Support chart upgrade with null password
- Cleanup logs in pre/post upgrade jobs
- Define resources for all containers (side-car, init, jobs)
 

## [2.0.2] - 2018-09-17
### Changed
- Removed release name in selector for cbur policy
- Cleaned up chart relocation if statements
- Tunable liveness probe parameters (values)
- Improve description of password (values-model)
- Changed cpu data type to string (values-model)

## [2.0.1] - 2018-08-29
### Added
- Configmap for LCM events: Heal (via Upgrade)
- Pre-upgrade and post-upgrade hooks for LCM events: Heal (via Upgrade), Upgrade, Scale (via Upgrade), Update (via Upgrade)
- Backup restore template for CBUR policy - new cbur sidecar container
- Backup volume (separate from data volume)
- CSF chart relocation rules enforced
### Changed
- Generates random default password when password not specified for cassandra super user
- Password for cassandra super user must be supplied in encoded format
### Notes
- CSF chart security RBAC/PSP enforced
- Green only: chart upgrade from 1.0.X version is not supported

## [1.0.26] - 2018-07-27
### Added
- All future chart versions shall provide a change log summary

## [0.0.0] - YYYY-MM-DD
### Added | Changed | Deprecated | Removed | Fixed | Security
- your change summary, this is not a **git log**!


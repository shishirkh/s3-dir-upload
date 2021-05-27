# Changelog
All notable changes to chart **belk-kibana** are documented in this file,
which is effectively a **Release Note** and readable by customers.

Do take a minute to read how to format this file properly.
It is based on [Keep a Changelog](http://keepachangelog.com)
- Newer entries _above_ older entries.
- At minimum, every released (stable) version must have an entry.
- Pre-release or incubating versions may reuse `Unreleased` section.

## [Unreleased] or [Released]
### Added
- CSF chart relocation rules enforced

## [6.0.8] - 2019-12-18
### Updated
- Added latest csan plugin.
- Server.host set to pod hostname for compatibility with IPv6
- Updated kibana image to point to latest centos base image
- Moved kibana docker image to delivered


## [6.0.7] - 2019-12-02
### Updated
- Added latest csan plugin.
- Server.host set to pod hostname for compatibility with IPv6
- Updated kibana image to point to latest centos base image

## [6.0.6] - 2019-10-30
### Updated
- CSFS-14508: Added separator for secrets
- CSFLDA-2118: Added BrPolicy for configmap restore
- Creating optimize directory in kibana image
- Added autoEnableCron in BrPolicy
- Upgraded base image to centos-7.7
- Moving kibana images to docker-delivered

## [6.0.5] - 2019-08-29
### Updated
- Moved kibana images to delivered

## [6.0.4] - 2019-08-22
### Updated
- CSFLDA-1975: Moved kibana image to centos nano image

## [6.0.3] - 2019-07-31
### Added
- CSFS-14508: Added secret, env and values for csan

## [6.0.2] - 2019-07-19
### Added
- CSFS-14403: Added user configurable capture group for kibanabaseurl

## [6.0.1] - 2019-07-08
### Added
- Moved all images to delivered


## [6.0.0] - 2019-06-28
### Changed
- Upgraded kibana to 7.0.1

## [5.2.7] - 2019-06-28
### Changed
- CSFS-14066: kibana password is not changed after helm upgrade 

## [5.2.6] - 2019-06-27
### Changed
- Updated kibana docker images to delivered
- Added server.ssl.supportedProtocols: ["TLSv1.2"] to kibana configmap

## [5.2.5] - 2019-06-26
### Added
- Kibana-csan plugin is added

## [5.2.4] - 2019-05-21
### Added
- Added security annotation for kibana

## [5.2.3] - 2019-05-20
### Added
- Added security annotation


## [5.2.2] - 2019-04-30
### Added
- Upgraded chart to 6.6.1
- Moved docker images to delivered
- Removed Sentinl plugin

## [5.2.1] - 2019-04-25
### Added
- Upgraded base image

## [5.2.0] - 2019-04-25
### Changed
- Upgraded ELK to 6.6.1
- Removed Sentinl plugin

## [5.1.5] - 2019-03-26
### Changed
- Upgraded base image to Centos 7.6
- Moved images to delivered

## [5.1.4] - 2019-03-22
### Changed
- Upgraded base image to Centos 7.6

## [5.1.3] - 2019-03-18
### Changed
- Installed sentinl plugin for kibana chart

## [5.1.2] - 2019-03-15
### Changed
- Installed sentinl plugin for kibana 

## [5.1.1] - 2019-03-11
### Changed
- CSFID-1611: Keycloak integration - added searchguard.openid.root_ca parameter to kibana configmap

## [5.1.0] - 2019-03-04
### Added
- CSFID-1611: Keycloak integration
- Liveness and Readiness probe modified

## [5.0.5] - 2019-02-14
### Added
- CSFLDA-1542: Implemented Kibana POD anti-affinity rules

## [5.0.4] - 2019-02-13
### Added
- CSFS-10055: Kibana readiness probe is reporting "ready" too early

## [5.0.3] - 2019-02-01
### Added
- Upgraded to 6.5.4-oss
- Reduced the memory limit and request to kibana
- removed xpack env variables in docker image
- moved docker images to delivered

## [5.0.2] - 2019-01-31
### Added
- removed xpack env variables in docker image

## [5.0.1] - 2019-01-29
### Added
- Reduced the memory limit and request to kibana

## [5.0.0] - 2019-01-28
### Added
- Upgraded to 6.5.4 oss rpm

## [4.3.1] - 2019-01-04
### Added
- Fix for CSFLDA-1407:Kibana UI prompts twice for authentication

## [4.3.0] - 2018-12-20
### Added
- Upgraded kibana to 6.5.1

## [4.2.1] - 2018-11-05
### Added
- CSFS-7753: belk-efkc ingress configuration, TLS support missing

## [4.2.0] - 2018-10-29
### Added
- Kibana version Upgraded from 6.2.4 to 6.4.1

## [4.1.7] - 2018-10-26
### Changed
- CSFS-7750: Ingress not configurable in Kibana helm chart.

## [4.1.6] - 2018-10-24
### Changed
- CSFS-7750: Ingress not configurable in Kibana helm chart.
- CSFS-7753: belk-efkc ingress configuration, TLS support missing


## [4.1.5] - 2018-10-23
### Changed
- CSFS-7748: BELK add proxy authentication support


## [4.1.4] - 2018-09-26
### Changed
- Resource properties removed from templates and added in the values.yaml

## [4.1.3] - 2018-09-19
### Changed
- Modified secret creation

## [4.1.2] - 2018-09-05
### Added
- Update config LCM event is added

## [4.1.1] - 2018-09-04
### Changed
- CSFLDA-897: Fix for bug while installing chart with wrong base64 password

## [4.1.0] - 2018-08-31
### Added
- Install and delete LCM events are added for kibana

## [4.0.2] - 2018-08-30
### Changed
- Updated image registry name from registry to global registry

## [4.0.1] - 2018-08-28
##Changed
- CSFLDA-816: Fixed Kibana service endpoints detection

## [4.0.0] - 2018-08-13
### Added
- All future chart versions shall provide a change log summary
- PSP/RBAC support
### Changed
- Chart to follow semantic naming. belk-`component`-`opensource version`-`csf release year`.`csf release month`.`patch` 
  e.g.: belk-kibana-6.2.4-18.07.02
- docker image on Centos 7.5### Added

## [0.0.0] - YYYY-MM-DD
### Added | Changed | Deprecated | Removed | Fixed | Security
- your change summary, this is not a **git log**!


# ServiceName

This is the helm chart for the deployment of resourcemanager service.
resourcemanager service  is the common recever service for ZTS VNF
## Getting Started

<todo>

### Prerequisites

* Kubernetes 1.4+ with Beta APIs enabled
* PV provisioner support in the underlying infrastructure
* Helm enabled
* Required Network Plugin 

### Modifying the variables for esymacservice microservice

All the configurable variables are mentioned in the values.yaml file.
This file needs to be updated for any changes.

Current configurable values:
     logRetention = No: of days for which the esymacservice will store the log files.
Note: The logfile storage path is ./log/

### Installing the Chart

To install the chart with the release name my-release:

```
$helm install --name my-release -f values.yaml <repo>/<microservice1>
```

The command deploys <microservice1> on the Kubernetes cluster in the default configuration. 

### Uninstalling the Chart

To uninstall/delete the my-release deployment:
```
$ helm delete my-release
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

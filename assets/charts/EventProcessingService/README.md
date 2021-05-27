# ZTS Event Processing Service 

ZTS Event Processing Service provides the fault management and performance management of ZTS managed VNFs

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

* Kubernetes 1.4+ with Beta APIs enabled
* PV provisioner support in the underlying infrastructure
* Helm enabled
* Required Network Plugin 

### Installing the Chart

To install the chart with the release name my-release:

```
$ helm install --name <name> EventProcessingService.
EventProcessingService shall also be deployed from the ZTS master helm chart as part of ZTS deployment action
```

### Uninstalling the Chart

To uninstall/delete the my-release deployment:
```
$ helm delete my-release
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

### Modifying single parameter inside chart
Specify each parameter using the --set key=value[,key=value] argument to helm install. For example,
```
$ helm install --name my-release \
  --set <examplemicroservice1_image>=<> \
  <examplemicroservice>
```
Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,
```
$ helm install --name my-release -f values.yaml <repo>/<microservice1>
```

# ServiceName

<Give brief description of your microservice>

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
$ helm install --name my-release <repo>/<microservice1 name>
```

The command deploys <microservice1> on the Kubernetes cluster in the default configuration. 

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
Execute below steps before deploying the pods:

 1.Login to portus
 2.Go to profile
 3.Create a token (use your login name)
 4.At the right side of the window generated token will be available (Token ************* was created successfully)
 5.Execute the below command in your node,
    kubectl create secret docker-registry portus-regcred --docker-server=archive.docker-registry.eecloud.nsn-net.net --docker-username=username --docker-password=<created token> --docker-email=username@nokia.com

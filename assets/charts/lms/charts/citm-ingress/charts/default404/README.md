On orchestrated environment (BCMT or other), CITM ingress controller needs a default backend, when a request on a resource can't be resolved.

The default backend is a service which handles all URL paths and hosts the CITM nginx ingress controller doesn't understand (i.e., all the requests that are not mapped with an Ingress).

Basically a default backend exposes two URLs:

* /healthz that returns 200
* / that returns 404

CITM provides such default backend, with the ability to have a per application customization and rendering

https://confluence.app.alcatel-lucent.com/display/plateng/CITM+-+NGINX+Guide


```console
$ helm install default404
```

## Introduction

This chart bootstraps an default404 deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites
  - Kubernetes 1.4+ with Beta APIs enabled

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release default404
```

The command deploys default404 on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the default404 chart and their default values.

Parameter | Description | Default
------ | --------- | ---------------------------------------
backend.name | name of the default backend component | default404
backend.page.title | page title | 404 - Not found
backend.page.body | page body | The requested page was not found
backend.page.copyright | copyright | Nokia. All rights reserved
backend.page.productFamilyName | Product Family Name| CITM
backend.page.productName | Product name| Default backend
backend.page.productRelease | Product release | 4.0.4-5
backend.page.toolbarTitle | toolbar title | View more ...
backend.page.imageBanner | Image logo| Nokia_logo_white.svg
backend.page.port | listening port | 8080
backend.debug | activate debug log | false

You can also adapt following kubernetes parameters

Parameter | Description | Default
------ | --------- | ---------------------------------------
global.registry | default backend container image repository | csf-docker-delivered.repo.lab.pl.alcatel-lucent.com
imageRepo | default backend container image repository | citm/citm-default-backend 
imageTag | default backend container image tag | 4.0.4-5
imagePullPolicy | default backend container image pull policy | IfNotPresent
nodeSelector | node labels for pod assignment.See runOnEdge for edge node selection | {}
runOnEdge | If true, add a nodeSelector label in order to run default backend only on edge node | false
tolerations | node taints to tolerate (requires Kubernetes >=1.6) | []
replicaCount | desired number of default backend pods | 1
resources | default backend pod resource requests & limits | {}
service.clusterIP | internal default backend cluster service IP | ""
service.externalIPs | default backend service external IP addresses | []
service.servicePort | default backend service port to create | 8080
service.type | type of default backend service to create | ClusterIP
rbac.create | If true, create & use RBAC resources | true
istio.enable | If true, create & use Istio Policy and virtualservice | false

Alternatively, a YAML file (my-values.yaml) that specifies the values for the parameters can be provided while installing the chart.

```console
$ helm install default404 --name my-release -f my-values.yaml
```


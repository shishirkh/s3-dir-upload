# CSDC

A distributed, reliable key-value store for the most critical data of a distributed system. Supported ETCD API v3.

## Introduction

This chart bootstraps an csdc deployment on a  k8s cluster using the helm(https://helm.sh) package manager.

## Prerequisites
  - Kubernetes 1.4+ with Beta APIs enabled

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release --namespace t1 csf-incubator/csdc
```

The command deploys CSDC (ECTD cluster and gRPC proxy) on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete --purge my-release
```

## Test service

Copy etcdctl tool from container to host (t1 - namespace, etcd-proxy-csdc-2650847186-5567f - pod name):

```console
$ kubectl cp t1/etcd-proxy-csdc-2650847186-5567f:/usr/local/bin/etcdctl $PWD/etcdctl
```
Check list of members:

```console
$ ETCDCTL_API=3 ./etcdctl --endpoints=http://my-release-proxy-csdc.t1:2379 member list --write-out table
```

## Use SDC API

The application should mount configMap which is named "compaas-sdc-server-configmap" to retrieve server info first as below,
```
apiVersion: v1
kind: Pod
metadata:
  name: "{{ .Release.Name }}-client-test"
spec:
  containers:
    - name: {{ .Release.Name }}-client-test
      image: "csf-docker-delivered.repo.lab.pl.alcatel-lucent.com/sdc:1.5.59"
      volumeMounts:
        - name: clienttest
          mountPath: /etc/etcd/
      command:
        - "/bin/sh"
        - "-ec"
        - |
          sdcctl set system test_key 1
          echo "try to get key"
          sdcctl get system test_key
          echo "try to list key"
          sdcctl ls system --recursive /
          echo "try to rm key"
          sdcctl rm system test_key
  volumes:
    - name: clienttest
      configMap:
        name: "compaas-sdc-server-configmap"
        items:
        - key: config
          path: etcd.client.conf
  restartPolicy: Never
```


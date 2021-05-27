# CITM-ingress

[citm-ingress](https://confluence.app.alcatel-lucent.com/display/plateng/CITM+-+NGINX+Guide) is an Ingress controller that uses ConfigMap to store the nginx configuration.

To use, add the `kubernetes.io/ingress.class: nginx` annotation to your Ingress resources.

```console
$ helm install citm-ingress
```

## Introduction

This chart bootstraps a citm-ingress controller deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites
  - Kubernetes 1.4+ with Beta APIs enabled

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release citm-ingress
```

The command deploys nginx-ingress on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

This deploy also a default backend. The [default backend configuration](#default404) section lists the parameters that can be configured during installation for default backend.

**NOTE**: If you're installing a release upper than 1.16.5 (1.16.5 included), make sure configmap ingress-controller-leader-nginx does not exist. If it's present, remove it before installing the chart

```console
$ kubectl delete cm ingress-controller-leader-nginx
```

## Updating the Chart

```console
$ helm upgrade my-release citm-ingress
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the nginx-ingress chart and their default values.

Parameter | Description | Default 
--------- | ----------- | ------- 
registry | controller container image repository| csf-docker-delivered.repo.lab.pl.alcatel-lucent.com 
controller.name | name of the controller component | controller 
controller.imageRepo | controller image repository name | citm/citm-nginx
controller.imageTag | controller container image tag | 1.16.1-17.1
controller.imagePullPolicy | controller container image pull policy | IfNotPresent
[controller.config](#configmap) | nginx ConfigMap entries | none
controller.bindAddress | Sets the addresses on which the server will accept requests instead of *.<br>See [bind-address](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/configmap.md#bind-address)| none 
controller.workerProcessAsRoot | Required to start nginx worker process as root (default nginx).<br>See [worker-process-as-root](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/configmap.md#worker-process-as-root) | false
controller.hostNetwork | If the nginx deployment / daemonset should run on the host's network namespace | true
controller.reusePort | enable "reuseport" option of the "listen" directive for nginx.<br>See [reuse-port](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/configmap.md#reuse-port)| true
controller.disableIvp6 | disable Ipv6  for nginx.<br>See [disable-ipv6](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/configmap.md#disable-ipv6)| false
controller.securityContextPrivileged | set securityContext to Privileged | false
controller.workerProcessAsRoot | Required to start nginx worker process as root (default nginx) | false
controller.httpRedirectCode | set http-redirect-code.<br>See [http-redirect-code](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/configmap.md#http-redirect-code) | 308
controller.defaultBackendService | default 404 backend service; required only if defaultBackend.enabled = false | ""
[controller.defaultSSLCertificate](#default-certificate) |  Optionally specify the secret name for default SSL certificate. Must be namespace/secret_name | ""
controller.UdpServiceConfigMapNoNamespace | set to true to have all config map starting with this name udp-services-configmap, whatever the namespace will be added | false
controller.TcpServiceConfigMapNoNamespace | set to true to have all config map starting with this name tcp-services-configmap, whatever the namespace will be added | false
[controller.CalicoVersion](#calico) | if you want to activate ddiscovery of ipv6 endpoints. Endpoints are retrieved using calico CNI network subsystem.<br>Supported values are not-used, v1 or v3)  | not-used
[controller.splitIpv4Ipv6StreamBackend](#calico) | By default, create only one stream for all backends.<br>NOTE: In case of transparent proxy activated, this property is not taken into account (aka: we'll generate two different streams) | false
controller.healthzPort |  port for healthz endpoint. (default 10254).<br>See [--healthz-port](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/cli-arguments.md) ingress controller argument | none
controller.httpPort |  Indicates the port to use for HTTP traffic (default 80).<br>See [--http-port](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/cli-arguments.md) ingress controller argument| none
controller.httpsPort |  Indicates the port to use for HTTPS traffic (default 443).<br>See [--https-port](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/cli-arguments.md) ingress controller argument | none
controller.sslProtocols | Indicates ssl protocols to be used. Default TLS 1.2 and TLS 1.3 | TLSv1.3 TLSv1.2
controller.sslCiphers | Indicates ssl cipher list to be activated | TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384
controller.sslPasstroughProxyPort |  Default port to use internally for SSL when SSL Passthgough is enabled (default 442).<br>See [--ssl-passthrough-proxy-port](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/cli-arguments.md) ingress controller argument  | none
controller.statusPort |  Indicates the TCP port to use for exposing the nginx status page (default 18080).<br>See [--status-port](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/cli-arguments.md) ingress controller argument  | none
controller.forcePort |  force http & https port to default (80 & 443) | none
controller.electionID | election ID to use for the status update. <br>See [--election-id](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/cli-arguments.md) ingress controller argument | ingress-controller-leader
controller.ingressClass | name of the ingress class to route through this controller.<br>See [--ingress-class](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/cli-arguments.md) ingress controller argument  | nginx
controller.podLabels | labels to add to the pod container metadata | none
controller.publishService.enabled | Allows customization of the external service | none
controller.publishService.pathOverride | Allows overriding of the publish service to bind to | false
[controller.scope.enabled](#scope) | limit the scope of the ingress controller | false (watch all namespaces)
[controller.scope.namespace](#scope) | namespace to watch for ingress | "" (use the release namespace)
[controller.etcd.enabled](#etcd) | enable  Configuration of the location of your etcd cluster | false
[controller.etcd.etcd_endpoints](#etcd) | etcd endpoints list | none
[controller.etcd.ETCD_CA_CERT](#etcd) | etcd ca cert file path | /etc/etcd/ssl/ca.pem
[controller.etcd.ETCD_CLIENT_CERT](#etcd) | etcd client cert file path | /etc/etcd/ssl/etcd-client.pem
[controller.etcd./etc/etcd/ssl/etcd-client-key.pem](#etcd) | etcd client key file path | /etc/etcd/ssl/etcd-client-key.pem
[controller.blockCidrs](#block)|A comma-separated list of IP addresses (or subnets), requests from which have to be blocked globally|None
[controller.blockUserAgents](#block)|A comma-separated list of User-Agent, requests from which have to be blocked globally.<br>It's possible to use here full strings and regular expressions.
[controller.blockReferers](#block)|A comma-separated list of Referers, requests from which have to be blocked globally.<br>It's possible to use here full strings and regular expressions
controller.logToJsonFormat | to format log in json format | true
[controller.extraArgs](#extraargs) | Additional controller container [argument](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/cli-arguments.md) | {}
controller.kind | install as Deployment or DaemonSet | DaemonSet
controller.tolerations | node taints to tolerate (requires Kubernetes >=1.6) | []
controller.runOnEdge | add a nodeSelector label in order to run only on edge node. Set this to false if you do not want only edge node | true
controller.nodeSelector | node labels for pod assignment. For is_edge label, considere setting runOnEdge | {}
controller.podAnnotations | annotations to be added to pods | {}
controller.replicaCount | desired number of controller pods | 1
controller.resources | controller pod resource requests & limits | {}
controller.service.enabled | enable controller service | true
controller.service.annotations | annotations for controller service | {}
controller.service.clusterIP | internal controller cluster service IP | ""
controller.service.externalIPs | controller service external IP addresses | []
controller.service.loadBalancerIP | IP address to assign to load balancer (if supported) | ""
controller.service.loadBalancerSourceRanges | list of IP CIDRs allowed access to load balancer (if supported) | []
controller.service.targetPorts.http | Sets the targetPort that maps to the Ingress' port 80 | 80
controller.service.targetPorts.https | Sets the targetPort that maps to the Ingress' port 443 | 443
controller.service.type | type of controller service to create | ClusterIP
controller.service.nodePorts.http | If controller.service.type is NodePort and this is non-empty, it sets the nodePort that maps to the Ingress' port 80 | ""
controller.service.nodePorts.https | If controller.service.type is NodePort and this is non-empty, it sets the nodePort that maps to the Ingress' port 443 | ""
[rbac.create](#rbac) | If true, create & use RBAC resources for ingress controller | true
rbac.serviceAccountName | ServiceAccount to be used (ignored if rbac.create=true) | default
[controller.snippetNamespacesAllowed](#snippet-authorize) | Restrict usage of Lua code in Snippet annotation only for a subset of namespace. By default, all namespaces can use Lua code in snippet body | ""
[controller.deniedInSnippetCode](#snippet-authorize) | Set of pattern to check. If found in snippet body, annotation is ignored. Modify with care | "access_by_lua body_filter_by_lua content_by_lua header_filter_by_lua init_by_lua init_worker_by_lua log_by_lua rewrite_by_lua set_by_lua"
controller.customLuaModules.enabled | enable possibility of providing ConfigMap with lua modules | false
controller.customLuaModules.modules | list of custom lua modules. Each module consists of name (moduleName) and ConfigMap name with lua sources (sourcesConfigMapName) | none
[tcp](#stream-backend) | TCP service key:value pairs | {}
[udp](#stream-backend) | UDP service key:value pairs | {}
httpsForAllServers | If set to true, we force https on all ingress resources. If no certificate is provided for an ingress resource, default certificate will be used. You can overwrite it using https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-CHARTS/raw/1.0/citm-ingress/README.md#default-certificate | false
[grafanaSecret](#grafana) | Name of the secret that contains the grafana credentials | {}
[grafanaURL](#grafana) |  URL and port of the grafana server, without 'http:// | {}
[metrics](#enable-metrics) |  Set this to true if you want metrics witout Grafana rendering | false

### default404
You can also adapt following parameters for default backend

Parameter | Description | Default
--------- | ----------- | ------- 
defaultBackend.enable | If false, controller.defaultBackendService must be provided | true
[default404.rbac.create](#rbac) | If true, create & use RBAC resources for default backend | true
default404.nodeSelector | node labels for pod assignment. See default404.runOnEdge for edge node selection | {} 
default404.runOnEdge | If true, add a nodeSelector label in order to run default backend only on edge node | false
default404.tolerations | node taints to tolerate (requires Kubernetes >=1.6) | []
default404.replicaCount | desired number of default backend pods | 1 
default404.resources | default backend pod resource requests & limits | {}
default404.service.service.clusterIP | internal default backend cluster service IP | ""
default404.service.service.externalIPs | default backend service external IP addresses | []
default404.service.service.servicePort | default backend service port to create | 8080 
default404.service.service.type | type of default backend service to create | ClusterIP
default404.backend.page.title | page title of default http backend | 404 - Not found
default404.backend.page.body | page body of default http backend | The requested page was not found
default404.backend.page.copyright | copyright of default http backend | Nokia. All rights reserved
default404.backend.page.productFamilyName | Product Family Name of default http backend| Nokia
default404.backend.page.productName | Product name of default http backend | 
default404.backend.page.productRelease | Product release of default http backend | 
default404.backend.page.toolbarTitle | toolbar title of default http backend | View more ...
default404.backend.page.imageBanner | Image logo of default http backend| Nokia_logo_white.svg
default404.backend.debug | activate debug log of default http backend | false

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
$ helm install citm-ingress --name my-release -f values.yaml
```

## Run examples

### etcd
### calico

If you want to retrieve ipv6 endpoints, using calico CNI release 3

```console
$ helm install citm-ingress --set controller.etcd.enabled=true,controller.CalicoVersion=v3,controller.etcd.etcd_endpoints="https://192.168.1.2:2379"
```
### block
Hereafter, various ways to block incoming request, based on cidr, user-agent or referer.
#### blockCidrs

A comma-separated list of IP addresses (or subnets), requestst from which have to be blocked globally.

References: http://nginx.org/en/docs/http/ngx_http_access_module.html#deny

If you want to block 192.168.1.0/24 and 172.17.0.1 and 2001:0db8::/32

```console
$ helm install citm-ingress --set controller.blockCidrs="192.168.1.0/24\,172.17.0.1\,2001:0db8::/32"
```
#### blockUserAgents
A comma-separated list of User-Agent, requestst from which have to be blocked globally. It's possible to use here full strings and regular expressions. 

More details about valid patterns can be found at map Nginx directive documentation.

References: http://nginx.org/en/docs/http/ngx_http_map_module.html#map

If you want to block curl/7.63.0 and Mozilla/5.0 user agent incoming request

```console
$ helm install citm-ingress --set controller.blockUserAgents="curl/7.63.0\,~Mozilla/5.0"
```

#### blockReferers
A comma-separated list of Referers, requestst from which have to be blocked globally. It's possible to use here full strings and regular expressions. 

More details about valid patterns can be found at map Nginx directive documentation.

References: http://nginx.org/en/docs/http/ngx_http_map_module.html#map

If you want to block request having referrer security.com/ or www.example.org/galleries/ or something containing google
```console
$ helm install citm-ingress --set controller.blockReferers="security.com/\,www.example.org/galleries/\,~\.google\."
```

### grafana
grafana secret is built using grafana helm release and -cpro-grafana. 

grafanaURL is the url of grafana service, or IP of pod. Port 3000 is the port for importing dashboard

Refer to [CPRO user guide](https://confluence.app.alcatel-lucent.com/display/plateng/CPRO+-+Prometheus) for details

```console
$ helm install citm-ingress --set grafanaSecret=grafana-cpro-grafana,grafanaURL=192.168.2.54:3000
```

### enable-metrics
You can activate metrics on vhost and stream. 

```console
$ helm install citm-ingress --set metrics=true
```

Rendering is available at

* http://edge_ip:18080/nginx-console/status.html (this one integrate streamStatus and vhostStatus in the same page)
* http://edge_ip:18080/vhostStatus
* http://edge_ip:18080/streamStatus
* http://edge_ip:18080/nginx_status

* Prometheus metrics are available at http://edge_ip:9913/metrics

18080 is the default port for status page. See controller.statusPort

### configmap
You can add any of supported [configmap attribute](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/configmap.md) using controller.config

Example, to disable ipv6 listening, use http2 for ssl connection and set http2-max-field-size to 12345

```console
$ helm install citm-ingress --set controller.config.disable-ipv6=true --set controller.config.http2-max-field-size=12345 --set controller.config.use-http2=true
```

To set log level at debug in nginx
```console
$ helm install citm-ingress --set controller.config.error-log-level=debug
```

### default-certificate

By default, CITM ingress controller provide a default Fake certificate, self signed. You can use your own certificate, thanks to the controller.

Create a certificate, here mysecret

```console
$ CERT_NAME=mysecret
$ KEY_FILE=/tmp/${CERT_NAME}.key
$ CERT_FILE=/tmp/${CERT_NAME}.crt
$ HOST=$(hostname -s)
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${KEY_FILE} -out ${CERT_FILE} -subj "/CN=${HOST}/O=Nokia"
$ kubectl create secret tls ${CERT_NAME} --key ${KEY_FILE} --cert ${CERT_FILE}
$ rm -f $KEY_FILE $CERT_FILE
$ kubectl get secret mysecret
NAME       TYPE                DATA      AGE
mysecret   kubernetes.io/tls   2         15s

$ kubectl describe secret mysecret
Name:         mysecret
Namespace:    default
Labels:       <none>
Annotations:  <none>

Type:  kubernetes.io/tls

Data
====
tls.crt:  1135 bytes
tls.key:  1704 bytes
```
Now, you can use it when deploying CITM ingress chart
```console
$ helm install citm-ingress --set controller.defaultSSLCertificate=default/mysecret
```
Note that templating is supported, so something like this will be correctly expanded (using a values.yaml)
```console
controller:
  defaultSSLCertificate: "{{ .Release.Namespace }}/mysecret"
```
```console
$ helm install citm-ingress -f values.yaml
```

### scope
By default, CITM ingress controller track all namespaces. 

You can configure it to track only one namespace. In that case, CITM ingress controller also needs to be deployed in this namespace. 

If controller.scope.namespace is not specified, the namespace associated with your release is used.

**NOTE**: If rbac is activated, Kubernetes roles and policies will be declared accordinglly.

```console
$ helm install citm-ingress --namespace ab --set controller.scope.enabled=true,controller.scope.namespace=ab 
```

### rbac
By default, RBAC is enabled. If for any reason, you want to disable, set rbac.create and default404.rbac.create to false

```console
$ helm install citm-ingress --set rbac.create=false,default404.rbac.create=false
```

### snippet-authorize
You can restrict usage of Lua code in Snippet annotation only for a subset of namespace. By default, check is not activated

To allow Snippet code with Lua code only in foo and bar namespaces, set controller.snippetNamespacesAllowed to "foo bar"

```console
$ helm install citm-ingress --set controller.snippetNamespacesAllowed="foo bar"
```
You can also overwritte checked pattern which are denied by providing (controller.deniedInSnippetCode). 

Setting this parameter to something else than the default provided, ONLY if you know what you're doing.

### stream-backend
Use this to provide description of TCP/UDP services to be exposed by CITM ingress controller. 

The syntax should follow a key,value pair

The key indicates the external port to be used. The value is a reference to a Service in the form "namespace/name:port", where "port" can either be a port number or name. 

TCP ports 80 and 443 (or controller.service.nodePorts.http[s]) are reserved by the controller for servicing HTTP[S] traffic

Example, to declare a TCP service tcpServer on port 2019 and another one on port 2018. Also, an UDP service on port 2020. Namespace is set to default

```console
$ helm install citm-ingress --set tcp.2019=default/tcpServer:2019 --set tcp.2018=default/tcpServer:2018 --set udp.2020=default/udpServer:2020
```
Same using a values.yaml
```console
tcp: 
  2018: default/tcpServer:2018
  2019: default/tcpServer:2019
udp:
  2020: default/udpServer:2020
```
```console
$ helm install citm-ingress -f values.yaml
```
Note that templating is supported, so something like this will be correctly expanded
```console
tcp: 
  2015: "{{ .Release.Namespace }}/{{ .Release.Name }}-tcpserver2018:2018"
```
Check CTIM reference guide for dynamic declaration of udp/tcp services 

https://confluence.app.alcatel-lucent.com/display/plateng/CITM+-+NGINX+Guide#CITM-NGINXGuide-Configurationproceduresoncontainer

3.9.3.11. Configure UDP/TCP services

### extraargs
You can add any of supported [arguments](https://gitlabe1.ext.net.nokia.com/csf_bcmt/gerrit/CSF-DOCKER/raw/1.0/citm/ingress/docs/cli-arguments.md) using controller.extraArgs

Example, to activate log debug in ingress controller (-v argument)

```console
$ helm install citm-ingress --set controller.extraArgs.v=6
```

## TEST
Steps to run a test suite on a release
```console
$ helm test my-release
```


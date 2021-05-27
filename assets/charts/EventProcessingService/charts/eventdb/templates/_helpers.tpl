{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "eventdb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 60 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 60 chars because Kubernetes name fields are limited to 63 (by the DNS naming spec)
and Statefulset will append -xx at the end of name.
*/}}
{{- define "eventdb.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s" $name | trunc 60 | trimSuffix "-" -}}
{{- end -}}
{{/*
Return the appropriate apiVersion for networkpolicy.
*/}}
{{- define "eventdb.networkPolicy.apiVersion" -}}
{{- if semverCompare ">=1.4-0, <1.7-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "extensions/v1beta1" -}}
{{- else if semverCompare "^1.7-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "networking.k8s.io/v1" -}}
{{- end -}}
{{- end -}}
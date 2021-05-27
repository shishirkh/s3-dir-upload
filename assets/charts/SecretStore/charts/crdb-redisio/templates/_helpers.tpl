{{/* vim: set filetype=mustache: */}}
{{/*
*
* Expand the name of the chart.
*
*/}}
{{- define "crdb-redisio.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
*
* Create a default fully qualified app name.
* We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
* If release name contains chart name it will be used as a full name.
*
*/}}
{{- define "crdb-redisio.fullname" -}}
{{- if .Values.fullnameOverride -}}
  {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
  {{- $name := default .Chart.Name .Values.nameOverride -}}
  {{- if contains $name .Release.Name -}}
    {{- .Release.Name | trunc 63 | trimSuffix "-" -}}
  {{- else -}}
    {{- printf "%s-%s" "secretstore" $name | trunc 63 | trimSuffix "-" -}}
  {{- end -}}
{{- end -}}
{{- end -}}

{{/*
*
* Set the group name (Sentinel master group name)
*
*/}}
{{- define "crdb-redisio.groupname" -}}
{{- if .Values.common.groupName -}}
  {{- .Values.common.groupName -}}
{{- else -}}
  {{- template "crdb-redisio.fullname" . -}}
{{- end -}}
{{- end -}}

{{/*
*
* Define the Database Access URIs
*
*/}}
{{- define "crdb-redisio.db.uri" -}}
redis://{{ template "crdb-redisio.groupname" . }}.{{ .Release.Namespace }}.svc.cluster.local:{{ .Values.services.redis.port }}
{{- end -}}
{{- define "crdb-redisio.db_readonly.uri" -}}
redis://{{ template "crdb-redisio.groupname" . }}-readonly.{{ .Release.Namespace }}.svc.cluster.local:{{ .Values.services.redis.port }}
{{- end -}}

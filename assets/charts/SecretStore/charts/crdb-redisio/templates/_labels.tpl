{{/* vim: set filetype=mustache: */}}
{{/*

Common set of labels for all resources

*/}}
{{- define "crdb-redisio.common_labels" }}
app: {{ .Values.name.podname }}
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
csf-component: crdb
csf-subcomponent: redisio
crdb-dbtype: redisio
{{- end -}}

{{/* vim: set filetype=mustache: */}}
{{/*

Common set of labels for all resources

*/}}
{{- define "cm-crdb-redisio.common_labels" }}
app: {{ template "cm-crdb-redisio.fullname" . }}
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
csf-component: crdb
csf-subcomponent: redisio
crdb-dbtype: redisio
{{- end -}}

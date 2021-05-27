{{/*
  CRDB Redis.io images
  Partial templates for convenience in retrieving image: parameters
*/}}

{{/* global.imageRegistry */}}
{{- define "crdb-redisio.gr" -}}
{{- if (.Values.global) -}}
{{ .Values.global.imageRegistry }}
{{- else -}}
{{ .Values.defaultRegistry }}
{{- end -}}
{{- end -}}

{{/* global.imageRegistry - metrics */}}
{{- define "crdb-redisio.gr1" -}}
{{- if (.Values.global) -}}
{{ .Values.global.imageRegistry }}
{{- else -}}
{{ .Values.defaultRegistry }}
{{- end -}}
{{- end -}}

{{/* global.imageRegistry - cbur */}}
{{- define "crdb-redisio.gr2" -}}
{{- if (.Values.global) -}}
{{ .Values.global.imageRegistry }}
{{- else -}}
{{ .Values.defaultRegistry }}
{{- end -}}
{{- end -}}

{{- define "crdb-redisio.server.image" }}
image: "{{ .Values.server.image.imageRegistry | default (include "crdb-redisio.gr" .) }}/{{ .Values.server.image.name }}:{{ .Values.image.server.dockerTag }}"
imagePullPolicy: "{{ .Values.server.image.pullPolicy }}"
{{- end -}}

{{- define "crdb-redisio.rolemon.image" }}
image: "{{ .Values.rolemon.image.imageRegistry | default (include "crdb-redisio.gr" .) }}/{{ .Values.rolemon.image.name }}:{{ .Values.image.rolemon.dockerTag | default .Values.server.image.dockerTag }}"
imagePullPolicy: "{{ .Values.image.rolemon.pullPolicy | default .Values.image.server.pullPolicy }}"
{{- end -}}

{{- define "crdb-redisio.sentinel.image" }}
image: "{{ .Values.sentinel.image.imageRegistry | default (include "crdb-redisio.gr" .) }}/{{ .Values.sentinel.image.name | default .Values.server.image.name }}:{{ .Values.image.sentinel.dockerTag | default .Values.server.image.dockerTag }}"
imagePullPolicy: "{{ .Values.image.sentinel.pullPolicy | default .Values.image.server.pullPolicy }}"
{{- end -}}

{{- define "crdb-redisio.admin.image.name" -}}
{{ .Values.admin.image.imageRegistry | default (include "crdb-redisio.gr" .) }}/{{ .Values.admin.image.name }}:{{ .Values.image.admin.dockerTag | default .Values.image.server.dockerTag }}
{{- end -}}
{{- define "crdb-redisio.admin.image" }}
image: {{ include "crdb-redisio.admin.image.name" . }}
imagePullPolicy: "{{ .Values.image.admin.pullPolicy | default .Values.image.server.pullPolicy }}"
{{- end -}}

{{- define "crdb-redisio.cbur.image" }}
image: "{{ .Values.cbur.image.imageRegistry | default (include "crdb-redisio.gr2" .) }}/{{ .Values.cbur.image.name }}:{{ .Values.image.cbura.dockerTag }}"
imagePullPolicy: "{{ .Values.image.cbura.pullPolicy | default .Values.image.server.pullPolicy }}"
{{- end -}}

{{/*   Images for Metrics/Exporter    */}}
{{- define "crdb-redisio.server.metrics.image" }}
image: "{{ .Values.server.metrics.image.imageRegistry | default (include "crdb-redisio.gr1" .) }}/{{ .Values.server.metrics.image.name }}:{{ .Values.server.metrics.image.dockerTag }}"
imagePullPolicy: "{{ .Values.server.metrics.image.pullPolicy }}"
{{- end -}}
{{- define "crdb-redisio.sentinel.metrics.image" }}
image: "{{ .Values.sentinel.metrics.image.imageRegistry | default (include "crdb-redisio.gr1" .) }}/{{ .Values.sentinel.metrics.image.name | default .Values.server.metrics.image.name }}:{{ .Values.sentinel.metrics.image.dockerTag | default .Values.server.metrics.image.dockerTag }}"
imagePullPolicy: "{{ .Values.sentinel.metrics.image.pullPolicy | default .Values.server.metrics.image.pullPolicy }}"
{{- end -}}

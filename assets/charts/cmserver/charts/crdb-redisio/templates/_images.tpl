{{/*
  CRDB Redis.io images
  Partial templates for convenience in retrieving image: parameters
*/}}

{{- define "cm-crdb-redisio.server.image" }}
image: "{{ .Values.global.imageRegistry }}/crdb/redisio:{{ .Values.image.redisio.dockerTag }}"
imagePullPolicy: "{{ .Values.image.redisio.pullPolicy }}"

{{- end -}}




{{- define "cm-crdb-redisio.rolemon.image" }}
image: "{{ .Values.global.imageRegistry }}/crdb/rolemon:{{ .Values.rolemon.image.tag }}"
imagePullPolicy: "{{ .Values.image.redisio.pullPolicy }}"
{{- end -}}

{{- define "cm-crdb-redisio.sentinel.image" }}
image: "{{ .Values.global.imageRegistry }}/crdb/redisio:{{ .Values.image.redisio.dockerTag }}"
imagePullPolicy: "{{ .Values.image.redisio.pullPolicy }}"
{{- end -}}

{{- define "cm-crdb-redisio.admin.image.name" -}}
{{ .Values.global.imageRegistry }}/crdb/admin:{{ .Values.image.admin.dockerTag }}
{{- end -}}

{{- define "cm-crdb-redisio.admin.image" }}
image: {{ .Values.global.imageRegistry }}/crdb/admin:{{ .Values.image.admin.dockerTag }}
imagePullPolicy: "{{ .Values.image.admin.pullPolicy }}"
{{- end -}}

{{- define "cm-crdb-redisio.cbur.image" }}
image: "{{ .Values.global.imageRegistry }}/cbur/cbura:{{ .Values.cbur.image.tag }}"
imagePullPolicy: "{{ .Values.image.redisio.pullPolicy }}"
{{- end -}}

{{/*   Images for Metrics/Exporter    */}}
{{- define "cm-crdb-redisio.server.metrics.image" }}
image: "{{ .Values.global.imageRegistry }}/{{ .Values.server.metrics.image.name }}:{{ .Values.server.metrics.image.tag }}"
imagePullPolicy: "{{ .Values.image.redisio.pullPolicy }}"
{{- end -}}
{{- define "cm-crdb-redisio.sentinel.metrics.image" }}
image: "{{ .Values.global.imageRegistry }}/{{ .Values.sentinel.metrics.image.name | default .Values.server.metrics.image.name }}:{{ .Values.sentinel.metrics.image.tag | default .Values.server.metrics.image.tag }}"
imagePullPolicy: "{{ .Values.image.redisio.pullPolicy }}"
{{- end -}}

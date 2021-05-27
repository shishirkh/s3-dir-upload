{{/*
  Side Car images for zts
  */}}

{{- define "logsidecar.image" }}
image: "{{ .Values.global.imageRegistry }}/lfsclient:1.3.26"
{{- end -}}

{{- define "envoysidecar.image" }}
image: "{{ .Values.global.imageRegistry }}/envoysidecarproxywithtls:1.3.59"
{{- end -}}

{{- define "consulagentsidecar.image" }}
image: "{{ .Values.global.imageRegistry }}/consul:1.3.1"
{{- end -}}


{{- define "consulregistrationsidecar.image" }}
image: "{{ .Values.global.imageRegistry }}/alpine-curl:1.3.1"
{{- end -}}



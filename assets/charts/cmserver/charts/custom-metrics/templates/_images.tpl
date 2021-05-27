{{/*
  Side Car images for zts
  */}}

{{- define "logsidecar.image" }}
image: "{{ .Values.global.imageRegistry }}/lfsclient:1.5.4"
{{- end -}}

{{- define "envoysidecar.image" }}
image: "{{ .Values.global.imageRegistry }}/envoysidecarproxywithtls:1.5.4"
{{- end -}}

{{- define "consulagentsidecar.image" }}
image: "{{ .Values.global.imageRegistry }}/consul:1.5.1"
{{- end -}}


{{- define "consulregistrationsidecar.image" }}
image: "{{ .Values.global.imageRegistry }}/alpine-curl:1.5.1"
{{- end -}}

{{- define "cburasidecar.image" }}
image: "{{ .Values.global.imageRegistry }}/cbur/cbura:1.0.3-983"
{{- end -}}

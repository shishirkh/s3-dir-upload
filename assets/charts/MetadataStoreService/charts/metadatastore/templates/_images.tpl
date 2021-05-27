{{/*
  Side Car images for zts
  */}}

{{- define "logsidecar.image" }}
image: "{{ .Values.global.imageRegistry }}/lfsclient:1.3.29"
{{- end -}}

{{- define "envoysidecar.image" }}
image: "{{ .Values.global.imageRegistry }}/envoysidecarproxywithtls:1.4.7"
{{- end -}}

{{- define "consulagentsidecar.image" }}
image: "{{ .Values.global.imageRegistry }}/consul:1.4.2"
{{- end -}}


{{- define "consulregistrationsidecar.image" }}
image: "{{ .Values.global.imageRegistry }}/alpine-curl:1.3.1"
{{- end -}}

{{- define "cburasidecar.image" }}
image: "{{ .Values.global.imageRegistry }}/cbur/cbura:1.0.3-983"
{{- end -}}


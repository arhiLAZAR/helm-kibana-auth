{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kibana-auth.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kibana-auth.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create an enquoted environment variable to translate dictionary from helm values to bash.
*/}}
{{- define "dict2bash" -}}
{{- $index := 0 | int -}}
{{- $dict := . -}}
{{- $len := len $dict | int -}}
'
{{- range $dict -}}
{{- $index = $index | add1 -}}
{{- . | quote -}}
{{- if lt $index $len }} {{ end -}}
{{- end -}}
'
{{- end -}}

{{/*
Create an enquoted environment variable to translate dictionary from helm values to cfg.
*/}}
{{- define "dict2cfg" -}}
{{- $index := 0 | int -}}
{{- $dict := . -}}
{{- $len := len $dict | int -}}
[
{{- range $dict -}}
{{- $index = $index | add1 -}}
{{- . | quote -}}
{{- if lt $index $len }}, {{ end -}}
{{- end -}}
]
{{- end -}}

{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "pxc-operator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "pxc-operator.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.pxcOperator.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.pxcOperator.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "pxc-operator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the pxc-operator service account to use
*/}}
{{- define "pxc-operator.serviceAccountName" -}}
{{- if .Values.serviceAccount.pxcOperatorServiceAccount.create -}}
{{ default (include "pxc-operator.fullname" .) .Values.serviceAccount.pxcOperatorServiceAccount.name }}
{{- else -}}
{{ default "default" .Values.serviceAccount.pxcOperatorServiceAccount.name }}
{{- end -}}
{{- end -}}


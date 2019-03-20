{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "psmdb-operator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "psmdb-operator.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.psmdbOperator.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.psmdbOperator.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "psmdb-operator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the psmdb-operator service account to use
*/}}
{{- define "psmdb-operator.serviceAccountName" -}}
{{- if .Values.serviceAccount.psmdbOperatorServiceAccount.create -}}
{{ default (include "psmdb-operator.fullname" .) .Values.serviceAccount.psmdbOperatorServiceAccount.name }}
{{- else -}}
{{ default "default" .Values.serviceAccount.psmdbOperatorServiceAccount.name }}
{{- end -}}
{{- end -}}


variable "kubernetes_namespace_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vmsingle_domains" {
  type = string
}

variable "alertmanager_domains" {
  type = string
}

variable "vmalert_domains" {
  type = string
}

variable "vmagent_domains" {
  type = string
}

variable "victoriametrics_version" {
  type = string
}

variable "grafana_domains" {
  type = string
}

variable "grafana_admin_user" {
  type = string
}

variable "grafana_admin_password" {
  type = string
}

variable "grafana_client_id" {
  type = string
}

variable "grafana_client_secret" {
  type = string
}

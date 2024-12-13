variable "kubernetes_namespace_name" {
  type = string
}

variable "monitoring_version" {
  type        = string
  description = "Set the version of monitoring stack"
}

variable "helm_release_name" {
  type = string
}

variable "grafana_admin_password" {
  type = string
}

variable "grafana_environment" {
  type = string
}

variable "grafana_domain" {
  type = string
}

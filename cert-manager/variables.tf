variable "cert_manager_version" {
  type = string
  description = "Set the version of cert-manager"
}

variable "values_yaml" {
  type = string
  description = "Path to the values.yml file, relative to the root module"
}

variable "duckdns_webhook_version" {
  type = string
  description = "Set the version of duckdns webhook"
}

variable "kubernetes_namespace_name" {
  type = string
  description = "Name of the kubernetes namespace"
}

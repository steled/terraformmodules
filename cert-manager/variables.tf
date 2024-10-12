variable "namespace" {
  type = string
  description = "Name of the kubernetes namespace"
}

variable "cert_manager_version" {
  type = string
  description = "Set the version of cert-manager"
}

variable "duckdns_webhook_version" {
  type = string
  description = "Set the version of duckdns webhook"
}

variable "duckdns_webhook_values_yaml" {
  type = string
  description = "Path to the duckdns webhook values.yml file, relative to the root module"
}

variable "duckdns_webhook_ip_address" {
  type        = string
  description = "IP address for duckdns webhook service"
}

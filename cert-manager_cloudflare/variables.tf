variable "cert_manager_version" {
  type = string
  description = "Set the version of cert-manager"
}

variable "cloudflare_api_token" {
  type = string
}

variable "cert_manager_email" {
  type = string
}

variable "namespace" {
  type = string
  description = "Name of the kubernetes namespace"
}

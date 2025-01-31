# variable "apprise_api_htpasswd_secret" {
#   type = string
# }

variable "apprise_version" {
  type = string
}

variable "domain" {
  type = string
}

variable "environment" {
  type = string
}

variable "kubernetes_namespace_name" {
  type        = string
  description = "Name of the kubernetes namespace"
}

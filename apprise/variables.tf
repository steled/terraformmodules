variable "kubernetes_namespace_name" {
  type        = string
  description = "Name of the kubernetes namespace"
}

variable "apprise_version" {
  type = string
}

variable "environment" {
  type = string
}

variable "apprise_api_htpasswd_secret" {
  type = string
}

variable "domain" {
  type = string
}
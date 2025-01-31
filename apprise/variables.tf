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

variable "ssh_host" {
  type        = string
  description = "Host for SSH connection"
}

variable "ssh_user" {
  type        = string
  description = "Username for SSH connection"
}

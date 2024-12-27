variable "kubernetes_namespace_name" {
  type = string
}

variable "authentik_version" {
  type = string
}

variable "environment" {
  type = string
}

variable "authentik_domains" {
  type = string
}

variable "authentik_secret_key" {
  type = string
}

variable "postgresql_password" {
  type = string
}

variable "authentik_bootstrap_password" {
  type = string
}

variable "authentik_bootstrap_token" {
  type = string
}

variable "authentik_bootstrap_email" {
  type = string
}

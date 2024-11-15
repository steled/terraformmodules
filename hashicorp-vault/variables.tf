variable "ssh_user" {
  type = string
  description = "Username for SSH connection"
}

variable "ssh_host" {
  type = string
  description = "Host for SSH connection"
}

variable "kubernetes_namespace_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "hashicorp_vault_domain" {
  type = string  
}

variable "ip_address" {
  type = string
}

variable "hashicorp_vault_version" {
  type = string
}
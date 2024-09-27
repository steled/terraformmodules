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

variable "nextcloud_version" {
  type = string
  description = "Set the version of nextcloud"
}

variable "nextcloud_domain" {
  type = string
}

variable "environment" {
  type = string
}

variable "ip_address" {
  type = string
}

variable "nextcloud_admin_username" {
  type = string
}

variable "nextcloud_admin_password" {
  type = string
}

variable "nextcloud_proxies" {
  type = string
}

variable "mail_fromaddress" {
  type = string
}

variable "mail_domain" {
  type = string
}

variable "smtp_host" {
  type = string
}

variable "smtp_port" {
  type = string
}

variable "smtp_username" {
  type = string
}

variable "smtp_password" {
  type = string
}

variable "postgresql_postgresqlusername" {
  type = string
}

variable "postgresql_postgresqlpassword" {
  type = string
}

variable "postgresql_postgresqldatabase" {
  type = string
}

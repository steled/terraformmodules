variable "ssh_user" {
  type        = string
  description = "Username for SSH connection"
}

variable "ssh_host" {
  type        = string
  description = "Host for SSH connection"
}

variable "maintenance_job_image" {
  type = string
}

variable "kubernetes_namespace_name" {
  type = string
}

variable "nextcloud_version" {
  type        = string
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

variable "redis_password" {
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

variable "postgresql_username" {
  type = string
}

variable "postgresql_user_password" {
  type = string
}

variable "postgresql_admin_password" {
  type = string
}

variable "postgresql_database" {
  type = string
}

variable "values_yaml" {
  type        = string
  description = "Path to the values.yml file, relative to the root module"
}

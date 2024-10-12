variable "ssh_user" {
  type = string
  description = "Username for SSH connection"
}

variable "ssh_host" {
  type = string
  description = "Host for SSH connection"
}

variable "namespace" {
  type = string
  description = "Name of the kubernetes namespace"
}

variable "env_JD_DEVICENAME" {
  type = string
}

variable "env_JD_PASSWORD" {
  type = string
}

variable "env_JD_EMAIL" {
  type = string
}

variable "sftp_values_yaml" {
  type = string
  description = "Path to the values.yml file, relative to the root module"
}

variable "sftp_ip_address" {
  type        = string
  description = "IP address for SFTP service"
}

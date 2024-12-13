variable "ssh_user" {
  type        = string
  description = "Username for SSH connection"
}

variable "ssh_host" {
  type        = string
  description = "Host for SSH connection"
}

variable "namespace" {
  type        = string
  description = "Name of the kubernetes namespace"
}

variable "host" {
  type = string
}

variable "ip" {
  type = string
}

variable "environment" {
  type = string
}

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

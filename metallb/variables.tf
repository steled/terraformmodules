variable "kubernetes_namespace_name" {
  type = string
}

variable "metallb_version" {
  type = string
  description = "Set the version of metallb"
}

variable "helm_values_addresses" {
  type = string
}

variable "values_yaml" {
  type = string
  description = "Path to the values.yml file, relative to the root module"
}
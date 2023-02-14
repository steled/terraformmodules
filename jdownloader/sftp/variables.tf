variable "kubernetes_namespace_name" {
  type = string
  description = "Name of the kubernetes namespace"
}

variable "values_yaml" {
  type = string
  description = "Path to the values.yml file, relative to the root module"
}

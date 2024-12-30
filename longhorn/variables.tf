variable "kubernetes_namespace_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "domain" {
  type = string
}

variable "longhorn_version" {
  type = string
}

# variable "basic_auth" {
#   type = string
# }

variable "values_yaml" {
  type        = string
  description = "Path to the values.yml file, relative to the root module"
}

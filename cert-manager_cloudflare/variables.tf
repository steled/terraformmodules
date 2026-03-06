variable "cert_manager_version" {
  type        = string
  description = "Set the version of cert-manager"
}

variable "cert_manager_values_yaml" {
  type        = string
  description = "Path to the cert-manager values.yml file, relative to the root module"
}

variable "cloudflare_api_token" {
  type = string
}

variable "cert_manager_email" {
  type = string
}

variable "namespace" {
  type        = string
  description = "Name of the kubernetes namespace"
}

variable "namespace_annotations" {
  description = "Additional annotations for the namespace"
  type        = map(string)
  default     = {}
}

variable "namespace_labels" {
  description = "Additional labels for the namespace"
  type        = map(string)
  default     = {}
}
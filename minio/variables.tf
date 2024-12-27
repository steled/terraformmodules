variable "kubernetes_namespace_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "ingress_domains" {
  type = string
}

variable "console_ingress_domains" {
  type = string
}

variable "minio_version" {
  type = string
}

variable "rootUser" {
  type = string
}

variable "rootPassword" {
  type = string
}

variable "user1_name" {
  type = string
}

variable "user1_password" {
  type = string
}

variable "user1_policy" {
  type = string
}

variable "user1_secretKey" {
  type = string
}

variable "user1_accessKey" {
  type = string
}

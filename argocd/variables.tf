variable "kubernetes_namespace_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "domain" {
  type = string
}

variable "argocd_version" {
  type = string
}

variable "argocd_apps_version" {
  type = string
}

variable "telegram_bot_token" {
  type = string
}

variable "argocd_values_yaml" {
  type        = string
  description = "Path to the Argo CD values.yml file, relative to the root module"
}

variable "argocd_apps_values_yaml" {
  type        = string
  description = "Path to the Argo CD Apps values.yml file, relative to the root module"
}

variable "argocd_accounts_steled_password" {
  type        = string
  description = "Password for Argo CD user steled"
}

variable "argocd_apps_sshPrivateKey" {
  type        = string
  description = "SSH private key for argocd-apps repository"
}

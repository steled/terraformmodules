variable "kubernetes_namespace_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vmsingle_domains" {
  type = string
}

variable "alertmanager_domains" {
  type = string
}

variable "vmalert_domains" {
  type = string
}

variable "vmagent_domains" {
  type = string
}

variable "victoriametrics_version" {
  type = string
}

variable "grafana_domains" {
  type = string
}

variable "grafana_admin_user" {
  type = string
}

variable "grafana_admin_password" {
  type = string
}

variable "grafana_client_id" {
  type = string
}

variable "grafana_client_secret" {
  type = string
}

variable "haproxy_version" {
  type = string
}

variable "telegram_bot_token" {
  type = string
}

variable "telegram_chat_id" {
  type = string
}

variable "authentik_url" {
  type = string
}

variable "notify_domain" {
  type = string
}

variable "apprise_config_id" {
  type = string
}

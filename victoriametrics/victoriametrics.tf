resource "kubernetes_namespace" "victoriametrics" {
  metadata {
    name = var.kubernetes_namespace_name
  }
}

resource "helm_release" "victoriametrics" {
  name      = "victoria-metrics-k8s-stack"
  namespace = kubernetes_namespace.victoriametrics.metadata[0].name

  repository = "https://victoriametrics.github.io/helm-charts/"
  chart      = "victoria-metrics-k8s-stack"
  version    = var.victoriametrics_version

  values = [templatefile("${path.module}/values.yaml", {
    environment           = var.environment
    vmsingle_domains      = var.vmsingle_domains
    alertmanager_domains  = var.alertmanager_domains
    vmalert_domains       = var.vmalert_domains
    vmagent_domains       = var.vmagent_domains
    grafana_domains       = var.grafana_domains
    grafana_client_id     = var.grafana_client_id
    grafana_client_secret = var.grafana_client_secret
    telegram_bot_token    = var.telegram_bot_token
    telegram_chat_id      = var.telegram_chat_id
    # authentik_url         = var.authentik_url
  })]
}

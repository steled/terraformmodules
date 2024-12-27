resource "kubernetes_secret" "victoriametrics_basic_auth_secret" {
  metadata {
    name      = "victoriametrics-secret"
    namespace = kubernetes_namespace.victoriametrics.metadata[0].name
  }

  data = {
    grafana_admin-user     = var.grafana_admin_user
    grafana_admin-password = var.grafana_admin_password
  }

  type = "Opaque"
}

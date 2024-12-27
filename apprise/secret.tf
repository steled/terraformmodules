resource "kubernetes_secret_v1" "apprise_api_htpasswd_secret" {
  metadata {
    name      = "apprise-api-htpasswd-secret"
    namespace = var.kubernetes_namespace_name
  }

  data = {
    ".htpasswd" = var.apprise_api_htpasswd_secret
  }

  type = "Opaque"
}

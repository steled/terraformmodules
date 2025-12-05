resource "kubernetes_secret_v1" "authentik_secret" {
  metadata {
    name      = "authentik-secret"
    namespace = kubernetes_namespace_v1.authentik.metadata[0].name
  }

  data = {
    AUTHENTIK_BOOTSTRAP_PASSWORD = var.authentik_bootstrap_password
    AUTHENTIK_BOOTSTRAP_TOKEN    = var.authentik_bootstrap_token
    AUTHENTIK_BOOTSTRAP_EMAIL    = var.authentik_bootstrap_email
  }

  type = "Opaque"
}

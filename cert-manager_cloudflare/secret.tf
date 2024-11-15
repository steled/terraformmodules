resource "kubernetes_secret" "cloudflare_api_token_secret" {
  metadata {
    name      = "cloudflare-api-token"
    namespace = kubernetes_namespace.certmanager.metadata[0].name
  }

  data = {
    api-token = var.cloudflare_api_token
  }

  type = "Opaque"
}

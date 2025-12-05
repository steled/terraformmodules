resource "kubernetes_secret_v1" "cloudflare_api_token_secret" {
  metadata {
    name      = "cloudflare-api-token"
    namespace = kubernetes_namespace_v1.certmanager.metadata[0].name
    annotations = {
      "argocd.argoproj.io/tracking-id" = "helm-cert-manager:/Secret:cert-manager/cloudflare-api-token"
    }
  }

  data = {
    api-token = var.cloudflare_api_token
  }

  type = "Opaque"
}

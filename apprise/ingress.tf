resource "kubernetes_ingress_v1" "apprise" {
  metadata {
    name      = "apprise"
    namespace = kubernetes_namespace_v1.apprise.metadata[0].name
    annotations = {
      "cert-manager.io/cluster-issuer"      = "cloudflare-letsencrypt-${var.environment}"
      "ingress.cilium.io/loadbalancer-mode" = "shared"
    }

    labels = {
      name = "apprise"
    }
  }

  spec {
    ingress_class_name = "cilium"
    rule {
      host = var.domain
      http {
        path {
          backend {
            service {
              name = kubernetes_service_v1.apprise.metadata[0].name
              port {
                number = 80
              }
            }
          }
          path      = "/"
          path_type = "Prefix"
        }
      }
    }
    tls {
      hosts       = [var.domain]
      secret_name = "apprise-secret"
    }
  }
}

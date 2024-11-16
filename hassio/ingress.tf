resource "kubernetes_ingress_v1" "hassio" {
  metadata {
    name        = "hassio"
    namespace   = kubernetes_namespace.hassio.metadata[0].name
    annotations = {
      "cert-manager.io/cluster-issuer" = "cloudflare-letsencrypt-${var.environment}"
      "ingress.cilium.io/loadbalancer-mode" = "shared"
      # "nginx.org/server-snippets" = <<EOF
      #   location / {
      #     proxy_set_header Host $host;
      #     proxy_redirect http:// https://;
      #     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      #     proxy_set_header Upgrade $http_upgrade;
      #     proxy_set_header Connection $connection_upgrade;
      #   }
      #   EOF
    }
  }

  spec {
    ingress_class_name = "cilium"
    rule {
      host = var.host
      http {
        path {
          backend {
            service {
              name = kubernetes_service_v1.hassio.metadata.0.name
              port {
                number = 443
              }
            }
          }
          path = "/"
          path_type = "Prefix"
        }
      }
    }
    tls {
      hosts = [ var.host ]
      secret_name = "hassio-secret"
    }
  }
}

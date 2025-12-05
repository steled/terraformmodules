# resource "kubernetes_ingress_v1" "longhorn" {
#   metadata {
#     name      = "longhorn"
#     namespace = kubernetes_namespace_v1.longhorn.metadata[0].name
#     annotations = {
#       "cert-manager.io/cluster-issuer"      = "cloudflare-letsencrypt-${var.environment}"
#       "ingress.cilium.io/loadbalancer-mode" = "shared"
#     }
#   }

#   spec {
#     ingress_class_name = "cilium"
#     rule {
#       host = var.longhorn_domain
#       http {
#         path {
#           backend {
#             service {
#               name = "longhorn-frontend"
#               port {
#                 number = 80
#               }
#             }
#           }
#           path      = "/"
#           path_type = "Prefix"
#         }
#       }
#     }
#     # tls {
#     #   hosts       = [var.host]
#     #   secret_name = "longhorn-secret"
#     # }
#   }
# }

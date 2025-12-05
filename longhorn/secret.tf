# resource "kubernetes_secret_v1" "longhorn_basic_auth_secret" {
#   metadata {
#     name      = "basic_auth"
#     namespace = kubernetes_namespace_v1.longhorn.metadata[0].name
#   }

#   data = {
#     auth = var.basic_auth
#   }

#   type = "Opaque"
# }

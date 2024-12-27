# resource "kubernetes_secret" "longhorn_basic_auth_secret" {
#   metadata {
#     name      = "basic_auth"
#     namespace = kubernetes_namespace.longhorn.metadata[0].name
#   }

#   data = {
#     auth = var.basic_auth
#   }

#   type = "Opaque"
# }

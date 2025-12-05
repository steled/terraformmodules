resource "kubernetes_secret_v1" "minio_basic_auth_secret" {
  metadata {
    name      = "minio-secret"
    namespace = kubernetes_namespace_v1.minio.metadata[0].name
  }

  data = {
    rootUser        = var.rootUser
    rootPassword    = var.rootPassword
    user1_password  = var.user1_password
    user1_secretKey = var.user1_secretKey
  }

  type = "Opaque"
}

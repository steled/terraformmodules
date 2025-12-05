resource "kubernetes_secret_v1" "gitea-admin-secret" {
  metadata {
    name      = "gitea-admin-secret"
    namespace = var.kubernetes_namespace_name
  }

  data = {
    username = var.gitea_admin_username
    password = var.gitea_admin_password
  }

  type = "Opaque"
}
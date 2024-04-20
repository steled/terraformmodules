resource "kubernetes_secret" "nextcloud-secret" {
  metadata {
    name      = "nextcloud-secret"
    namespace = var.kubernetes_namespace_name
  }

  data = {
    nextcloud-username = var.nextcloud_admin_username
    nextcloud-password = var.nextcloud_admin_password
  }

  type = "Opaque"
}

resource "kubernetes_secret" "nextcloud_staging_secret" {
  metadata {
    name      = "nextcloud-secret"
    namespace = var.kubernetes_namespace_name
  }

  data = {
    nextcloud-username = var.nextcloud_staging_admin_username
    nextcloud-password = var.nextcloud_staging_admin_password
  }

  type = "Opaque"
}

resource "kubernetes_secret" "nextcloud_staging_secret" {
  metadata {
    name      = "nextcloud-secret"
    namespace = var.kubernetes_namespace_name
  }

  data = {
    nextcloud-username = var.nextcloud_admin_username
    nextcloud-password = var.nextcloud_admin_password
    smtp-host          = var.smtp_host
    smtp-username      = var.smtp_username
    smtp-password      = var.smtp_password
    redis-password     = var.redis_password
  }

  type = "Opaque"
}

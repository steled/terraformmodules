resource "kubernetes_secret_v1" "nextcloud_secret" {
  metadata {
    name      = "nextcloud-secret"
    namespace = var.kubernetes_namespace_name
  }

  data = {
    nextcloud-username        = var.nextcloud_admin_username
    nextcloud-password        = var.nextcloud_admin_password
    postgresql-username       = var.postgresql_username
    postgresql-admin-password = var.postgresql_admin_password
    postgresql-user-password  = var.postgresql_user_password
    smtp-host                 = var.smtp_host
    smtp-username             = var.smtp_username
    smtp-password             = var.smtp_password
    redis-password            = var.redis_password
  }

  type = "Opaque"
}

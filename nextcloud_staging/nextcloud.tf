resource "kubernetes_namespace" "nextcloud_staging" {
  metadata {
    name = var.kubernetes_namespace_name
  }

  connection {
    type     = "ssh"
    user     = var.ssh_user
    host     = var.ssh_host
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud-staging/server",
      "sudo chown 1000:1000 -R /ext/persistent/nextcloud-staging/server/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud-staging/server/config",
      "sudo chown www-data:www-data -R /ext/persistent/nextcloud-staging/server/config/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud-staging/postgresql",
      "sudo chown 1001:1001 -R /ext/persistent/nextcloud-staging/postgresql/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud-staging/backup",
      "sudo chown 1001:1001 -R /ext/persistent/nextcloud-staging/backup/",
    ]
  }
}

resource "helm_release" "nextcloud_staging" {
  name          = "nextcloud-staging"

  repository    = "https://nextcloud.github.io/helm/"
  chart         = "nextcloud"
  version       = var.nextcloud_version # take care of update path; check version here: https://github.com/nextcloud/helm/blob/master/charts/nextcloud/Chart.yaml
  recreate_pods = true

  values = [ templatefile("${path.module}/values.yaml", {
    nextcloud_domain = var.nextcloud_domain,
    environment = var.environment,
    ip_address = var.ip_address,
    nextcloud_proxies = var.nextcloud_proxies
    mail_fromaddress = var.mail_fromaddress
    mail_domain = var.mail_domain
    smtp_host = var.smtp_host
    smtp_port = var.smtp_port
    smtp_username = var.smtp_username
    smtp_password = var.smtp_password
    postgresql_postgresqlusername = var. postgresql_postgresqlusername,
    postgresql_postgresqlpassword = var.postgresql_postgresqlpassword,
    postgresql_postgresqldatabase = var.postgresql_postgresqldatabase
  }) ]

  namespace = kubernetes_namespace.nextcloud_staging.metadata[0].name

 timeout = 360

  depends_on = [
    kubernetes_persistent_volume_claim.nextcloud_staging_server_pvc,
    kubernetes_persistent_volume_claim.nextcloud_staging_postgresql_pvc,
    kubernetes_persistent_volume_claim.nextcloud_staging_backup_pvc,
    kubernetes_secret.nextcloud_staging_secret
  ]
}

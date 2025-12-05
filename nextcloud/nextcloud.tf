resource "kubernetes_namespace_v1" "nextcloud" {
  metadata {
    name = var.kubernetes_namespace_name
  }

  connection {
    type = "ssh"
    user = var.ssh_user
    host = var.ssh_host
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir --mode 0755 -p /ext/backup/nextcloud/postgresql",
      "sudo chown steled:steled -R /ext/backup/nextcloud/postgresql/",
      "sudo mkdir --mode 0755 -p /ext/backup/nextcloud/server",
      "sudo chown steled:steled -R /ext/backup/nextcloud/server/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud/backup",
      "sudo chown 1001:1001 -R /ext/persistent/nextcloud/backup/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud/server",
      "sudo chown 1000:1000 -R /ext/persistent/nextcloud/server/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud/server/config",
      "sudo chown www-data:www-data -R /ext/persistent/nextcloud/server/config/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud/server/custom_apps",
      "sudo chown www-data:www-data -R /ext/persistent/nextcloud/server/custom_apps/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud/server/data",
      "sudo chown www-data:www-data -R /ext/persistent/nextcloud/server/data/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud/server/html",
      "sudo chown www-data:www-data -R /ext/persistent/nextcloud/server/html/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud/server/root",
      "sudo chown www-data:www-data -R /ext/persistent/nextcloud/server/root/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud/server/themes",
      "sudo chown www-data:www-data -R /ext/persistent/nextcloud/server/themes/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud/server/tmp",
      "sudo chown www-data:www-data -R /ext/persistent/nextcloud/server/tmp/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud/postgresql",
      "sudo chown 1001:1001 -R /ext/persistent/nextcloud/postgresql/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud/redis",
      "sudo chown 1001:1001 -R /ext/persistent/nextcloud/redis/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud/redis/master",
      "sudo chown 1001:1001 -R /ext/persistent/nextcloud/redis/master/",
      "sudo mkdir --mode 0755 -p /ext/persistent/nextcloud/redis/replica",
      "sudo chown 1001:1001 -R /ext/persistent/nextcloud/redis/replica/"
    ]
  }
}

resource "helm_release" "nextcloud" {
  name = "nextcloud"

  repository    = "https://nextcloud.github.io/helm/"
  chart         = "nextcloud"
  version       = var.nextcloud_version # take care of update path; check version here: https://github.com/nextcloud/helm/blob/master/charts/nextcloud/Chart.yaml
  recreate_pods = true

  values = [templatefile(var.values_yaml, {
    nextcloud_domain    = var.nextcloud_domain,
    environment         = var.environment,
    ip_address          = var.ip_address,
    nextcloud_proxies   = var.nextcloud_proxies,
    mail_fromaddress    = var.mail_fromaddress,
    mail_domain         = var.mail_domain,
    redis_password      = var.redis_password,
    smtp_host           = var.smtp_host,
    smtp_port           = var.smtp_port,
    smtp_username       = var.smtp_username,
    smtp_password       = var.smtp_password,
    postgresql_username = var.postgresql_username,
    postgresql_database = var.postgresql_database
  })]

  namespace = kubernetes_namespace_v1.nextcloud.metadata[0].name

  timeout = 360

  depends_on = [
    kubernetes_persistent_volume_claim_v1.nextcloud_server_pvc,
    kubernetes_persistent_volume_claim_v1.nextcloud_postgresql_pvc,
    kubernetes_persistent_volume_claim_v1.nextcloud_backup_pvc,
    kubernetes_persistent_volume_claim_v1.nextcloud_redis_master_pvc,
    kubernetes_persistent_volume_claim_v1.nextcloud_redis_replica_pvc,
    kubernetes_secret_v1.nextcloud_secret
  ]
}

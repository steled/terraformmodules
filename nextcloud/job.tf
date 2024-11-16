resource "kubernetes_job" "nextcloud_maintenance_job" {
  metadata {
    name      = "nextcloud-maintenance-job"
    namespace = kubernetes_namespace.nextcloud.metadata[0].name
  }
  spec {
    template {
      metadata {}
      spec {
        container {
          command                    = [ "/bin/sh", "-c", "su -s /bin/bash www-data -c 'php occ maintenance:repair --include-expensive && php occ db:add-missing-indices'" ]
          image                      = var.maintenance_job_image
          image_pull_policy          = "IfNotPresent"
          name                       = "nextcloud-maintenance-job"
          termination_message_path   = "/dev/termination-log"
          termination_message_policy = "File"
          env {
            name  = "NEXTCLOUD_DATA_DIR"
            value = "/var/www/html/data"
          }
          volume_mount {
            mount_path = "/var/www/"
            name       = "nextcloud-main"
            sub_path   = "root"
          }
          volume_mount {
            mount_path = "/var/www/html"
            name       = "nextcloud-main"
            sub_path   = "html"
          }
          volume_mount {
            mount_path = "/var/www/html/data"
            name       = "nextcloud-main"
            sub_path   = "data"
          }
          volume_mount {
            mount_path = "/var/www/html/config"
            name       = "nextcloud-main"
            sub_path   = "config"
          }
          volume_mount {
            mount_path = "/var/www/html/custom_apps"
            name       = "nextcloud-main"
            sub_path   = "custom_apps"
          }
          volume_mount {
            mount_path = "/var/www/tmp"
            name       = "nextcloud-main"
            sub_path   = "tmp"
          }
        }
        restart_policy                   = "Never"
        termination_grace_period_seconds = 30
        security_context {
          fs_group = 82
        }
        volume {
          name = "nextcloud-main"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.nextcloud_server_pvc.metadata.0.name
          }
        }
      }
    }
    backoff_limit              = 2
    ttl_seconds_after_finished = "120"
  }
  wait_for_completion = true
  timeouts {
    create = "2m"
    update = "2m"
  }

  depends_on = [ helm_release.nextcloud ]
}

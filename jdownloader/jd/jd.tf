resource "kubernetes_deployment" "jdownloader" {
  metadata {
    name = "jd"
    namespace = var.namespace

    labels = {
      app = "jd-sftp"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "jd-sftp"
      }
    }

    template {
      metadata {
        labels = {
          app = "jd-sftp"
        }
      }

      spec {
#        restart_policy = "Never"
        security_context {
          run_as_user  = 1000
          run_as_group = 1000
          run_as_non_root = true
        }

        container {
          image = "antlafarge/jdownloader:alpine"
          image_pull_policy = "Always"
          name  = "jd"

          env {
            name  = "JD_DEVICENAME"
            value = var.env_JD_DEVICENAME
          }
          env {
            name  = "JD_PASSWORD"
            value = var.env_JD_PASSWORD
          }
          env {
            name  = "JD_EMAIL"
            value = var.env_JD_EMAIL
          }

          port {
            name           = "jd"
            container_port = 3129
            protocol       = "TCP"
          }
        
          volume_mount {
            mount_path = "/jdownloader/cfg"
            name       = "config"
          }

          volume_mount {
            mount_path = "/jdownloader/downloads"
            name       = "downloads"
          }

          volume_mount {
            mount_path = "/jdownloader/logs"
            name       = "logs"
          }
        }
        volume {
          name = "config"
          persistent_volume_claim {
            claim_name = "jd-sftp-config-pvc"
          }
        }

        volume {
          name = "downloads"
          persistent_volume_claim {
            claim_name = "jd-sftp-downloads-pvc"
          }
        }

        volume {
          name = "logs"
          persistent_volume_claim {
            claim_name = "jd-sftp-logs-pvc"
          }
        }
      }
    }
  }
}

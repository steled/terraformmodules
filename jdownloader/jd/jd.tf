resource "kubernetes_deployment_v1" "jdownloader" {
  metadata {
    name      = "jd"
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
          run_as_user     = 1000
          run_as_group    = 1000
          run_as_non_root = true
        }

        container {
          image             = "antlafarge/jdownloader:alpine"
          image_pull_policy = "Always"
          name              = "jd"

          env {
            name = "JD_DEVICENAME"
            value_from {
              secret_key_ref {
                name = "jdownloader"
                key  = "env_jd_devicename"
              }
            }
            # value = var.env_jd_devicename
          }
          env {
            name = "JD_PASSWORD"
            value_from {
              secret_key_ref {
                name = "jdownloader"
                key  = "env_jd_password"
              }
            }
            # value = var.env_jd_password
          }
          env {
            name = "JD_EMAIL"
            value_from {
              secret_key_ref {
                name = "jdownloader"
                key  = "env_jd_email"
              }
            }
            # value = var.env_jd_email
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

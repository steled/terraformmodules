resource "kubernetes_namespace" "apprise" {
  metadata {
    name = var.kubernetes_namespace_name

    labels = {
      name = "apprise"
    }
  }
}

resource "kubernetes_deployment_v1" "apprise" {
  metadata {
    name      = "apprise"
    namespace = var.kubernetes_namespace_name

    labels = {
      name = "apprise"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = "apprise"
      }
    }

    strategy {
      type = "Recreate"
    }

    template {
      metadata {
        labels = {
          name = "apprise"
        }
      }

      spec {
        container {
          image = "caronc/apprise:${var.apprise_version}"
          name  = "apprise"

          env {
            name  = "APPRISE_STATEFUL_MODE"
            value = "simple"
          }

          env {
            name  = "PGID"
            value = "1000"
          }

          env {
            name  = "PUID"
            value = "1000"
          }

          port {
            container_port = 8000
            name = "http"
            protocol = "TCP"
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "128Mi"
            }
          }

          volume_mount {
            name = "apprise-data"
            mount_path = "/config"
          }

          volume_mount {
            name = "apprise-data"
            mount_path = "/plugin"
          }

          volume_mount {
            name = "apprise-data"
            mount_path = "/attach"
          }

          volume_mount {
            name = "apprise-api-htpasswd-secret-volume"
            mount_path = "/etc/nginx/.htpasswd"
            read_only = true
            sub_path = ".htpasswd"
          }

          volume_mount {
            name = "apprise-api-override-conf-config-volume"
            mount_path = "/etc/nginx/location-override.conf"
            read_only = true
            sub_path = "location-override.conf"
          }
        }

        restart_policy = "Always"

        volume {
          name = "apprise-api-override-conf-config-volume"
          config_map {
            name = kubernetes_config_map_v1.apprise_api_override_conf_config.metadata[0].name
          }
        }

        volume {
          name = "apprise-data"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim_v1.apprise_data.metadata[0].name
          }
        }

        volume {
          name = "apprise-api-htpasswd-secret-volume"
          secret {
            secret_name = kubernetes_secret_v1.apprise_api_htpasswd_secret.metadata[0].name
          }
        }
      }
    }
  }
}

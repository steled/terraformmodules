resource "kubernetes_persistent_volume_claim_v1" "apprise_data" {
  metadata {
    name = "apprise-data"
    namespace = var.kubernetes_namespace_name

    labels = {
      name = "apprise"
    }
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}

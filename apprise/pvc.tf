resource "kubernetes_persistent_volume_v1" "apprise_data_pv" {
  metadata {
    name = "apprise-data-pv"
    labels = {
      type = "local"
    }
  }
  spec {
    storage_class_name = "manual"
    capacity = {
      storage = "1Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      host_path {
        path = "/ext/persistent/apprise/data"
      }
    }
  }

  depends_on = [kubernetes_namespace.apprise, ]
}

resource "kubernetes_persistent_volume_claim_v1" "apprise_data_pvc" {
  metadata {
    name      = "apprise-data-pvc"
    namespace = var.kubernetes_namespace_name

    labels = {
      name = "apprise"
    }
  }
  spec {
    storage_class_name = "manual"
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = kubernetes_persistent_volume_v1.apprise_data_pv.metadata[0].name
  }

  depends_on = [kubernetes_persistent_volume_v1.apprise_data_pv, ]
}

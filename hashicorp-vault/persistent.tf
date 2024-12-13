resource "kubernetes_persistent_volume" "hashicorp_vault_data_pv" {
  metadata {
    name = "data-vault-0"
    labels = {
      type = "local"
    }
  }
  spec {
    storage_class_name = "manual"
    capacity = {
      storage = "10Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      host_path {
        path = "/ext/persistent/hashicorp-vault/data"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "hashicorp_vault_data_pvc" {
  metadata {
    name      = kubernetes_persistent_volume.hashicorp_vault_data_pv.metadata.0.name
    namespace = kubernetes_namespace.hashicorp_vault.metadata[0].name
  }
  spec {
    storage_class_name = "manual"
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "10Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.hashicorp_vault_data_pv.metadata.0.name
  }

  depends_on = [kubernetes_persistent_volume.hashicorp_vault_data_pv, ]
}

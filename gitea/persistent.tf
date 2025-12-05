resource "kubernetes_persistent_volume_v1" "gitea-server-pv" {
  metadata {
    name = "gitea-server-pv"
    #    annotations = {
    #      "pv.beta.kubernetes.io/gid" = "3000"
    #    }
    labels = {
      type = "local"
    }
  }
  spec {
    storage_class_name = "manual"
    capacity = {
      storage = "5Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      host_path {
        path = "/ext/persistent/gitea/server"
      }
    }
  }

  depends_on = [kubernetes_namespace_v1.gitea, ]
}

resource "kubernetes_persistent_volume_claim" "gitea-server-pvc" {
  metadata {
    name      = "gitea-server-pvc"
    namespace = var.kubernetes_namespace_name
  }
  spec {
    storage_class_name = "manual"
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "5Gi"
      }
    }
    volume_name = kubernetes_persistent_volume_v1.gitea-server-pv.metadata[0].name
  }

  depends_on = [kubernetes_persistent_volume_v1.gitea-server-pv, ]
}

resource "kubernetes_persistent_volume_v1" "gitea-postgresql-pv" {
  metadata {
    name = "gitea-postgresql-pv"
    #    annotations = {
    #      "pv.beta.kubernetes.io/gid" = "3000"
    #    }
    labels = {
      type = "local"
    }
  }
  spec {
    storage_class_name = "manual"
    capacity = {
      storage = "5Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      host_path {
        path = "/ext/persistent/gitea/postgresql"
      }
    }
  }

  depends_on = [kubernetes_namespace_v1.gitea, ]
}

resource "kubernetes_persistent_volume_claim_v1" "gitea-postgresql-pvc" {
  metadata {
    name      = "gitea-postgresql-pvc"
    namespace = var.kubernetes_namespace_name
  }
  spec {
    storage_class_name = "manual"
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "5Gi"
      }
    }
    volume_name = kubernetes_persistent_volume_v1.gitea-postgresql-pv.metadata[0].name
  }

  depends_on = [kubernetes_persistent_volume_v1.gitea-postgresql-pv, ]
}

resource "kubernetes_persistent_volume_v1" "gitea-backup-pv" {
  metadata {
    name = "gitea-backup-pv"
    #    annotations = {
    #      "pv.beta.kubernetes.io/gid" = "3000"
    #    }
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
        path = "/ext/persistent/gitea/backup"
      }
    }
  }

  depends_on = [kubernetes_namespace_v1.gitea, ]
}

resource "kubernetes_persistent_volume_claim_v1" "gitea-backup-pvc" {
  metadata {
    name      = "gitea-backup-pvc"
    namespace = var.kubernetes_namespace_name
  }
  spec {
    storage_class_name = "manual"
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = kubernetes_persistent_volume_v1.gitea-backup-pv.metadata[0].name
  }

  depends_on = [kubernetes_persistent_volume_v1.gitea-backup-pv, ]
}

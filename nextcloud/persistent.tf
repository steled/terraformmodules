resource "kubernetes_persistent_volume" "nextcloud_server_pv" {
  metadata {
    name = "nextcloud-server-pv"
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
      storage = "8Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      host_path {
        path = "/ext/persistent/nextcloud/server"
      }
    }
  }

  depends_on = [ kubernetes_namespace.nextcloud, ]
}

resource "kubernetes_persistent_volume_claim" "nextcloud_server_pvc" {
  metadata {
    name = "nextcloud-server-pvc"
    namespace = var.kubernetes_namespace_name
  }
  spec {
    storage_class_name = "manual"
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "8Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.nextcloud_server_pv.metadata.0.name
  }

  depends_on = [ kubernetes_persistent_volume.nextcloud_server_pv, ]
}

resource "kubernetes_persistent_volume" "nextcloud_postgresql_pv" {
  metadata {
    name = "nextcloud-postgresql-pv"
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
      storage = "8Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      host_path {
        path = "/ext/persistent/nextcloud/postgresql"
      }
    }
  }

  depends_on = [ kubernetes_namespace.nextcloud, ]
}

resource "kubernetes_persistent_volume_claim" "nextcloud_postgresql_pvc" {
  metadata {
    name = "nextcloud-postgresql-pvc"
    namespace = var.kubernetes_namespace_name
  }
  spec {
    storage_class_name = "manual"
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "8Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.nextcloud_postgresql_pv.metadata.0.name
  }

  depends_on = [ kubernetes_persistent_volume.nextcloud_postgresql_pv, ]
}

resource "kubernetes_persistent_volume" "nextcloud_backup_pv" {
  metadata {
    name = "nextcloud-backup-pv"
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
        path = "/ext/persistent/nextcloud/backup"
      }
    }
  }

  depends_on = [ kubernetes_namespace.nextcloud, ]
}

resource "kubernetes_persistent_volume_claim" "nextcloud_backup_pvc" {
  metadata {
    name = "nextcloud-backup-pvc"
    namespace = var.kubernetes_namespace_name
  }
  spec {
    storage_class_name = "manual"
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.nextcloud_backup_pv.metadata.0.name
  }

  depends_on = [ kubernetes_persistent_volume.nextcloud_backup_pv, ]
}

resource "kubernetes_persistent_volume" "nextcloud_redis_master_pv" {
  metadata {
    name = "nextcloud-redis-master-pv"
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
        path = "/ext/persistent/nextcloud/redis/master"
      }
    }
  }

  depends_on = [ kubernetes_namespace.nextcloud, ]
}

resource "kubernetes_persistent_volume_claim" "nextcloud_redis_master_pvc" {
  metadata {
    name = "nextcloud-redis-master-pvc"
    namespace = var.kubernetes_namespace_name
  }
  spec {
    storage_class_name = "manual"
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.nextcloud_redis_master_pv.metadata.0.name
  }

  depends_on = [ kubernetes_persistent_volume.nextcloud_redis_master_pv, ]
}

resource "kubernetes_persistent_volume" "nextcloud_redis_replica_pv" {
  metadata {
    name = "nextcloud-redis-replica-pv"
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
        path = "/ext/persistent/nextcloud/redis/replica"
      }
    }
  }

  depends_on = [ kubernetes_namespace.nextcloud_staging, ]
}

resource "kubernetes_persistent_volume_claim" "nextcloud_redis_replica_pvc" {
  metadata {
    name = "nextcloud-redis-replica-pvc"
    namespace = var.kubernetes_namespace_name
  }
  spec {
    storage_class_name = "manual"
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.nextcloud_redis_replica_pv.metadata.0.name
  }

  depends_on = [ kubernetes_persistent_volume.nextcloud_redis_replica_pv, ]
}

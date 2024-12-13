resource "kubernetes_persistent_volume" "nextcloud_staging_server_pv" {
  metadata {
    name = "nextcloud-staging-server-pv"
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
        path = "/ext/persistent/nextcloud-staging/server"
      }
    }
  }

  depends_on = [kubernetes_namespace.nextcloud_staging, ]
}

resource "kubernetes_persistent_volume_claim" "nextcloud_staging_server_pvc" {
  metadata {
    name      = "nextcloud-staging-server-pvc"
    namespace = var.kubernetes_namespace_name
  }
  spec {
    storage_class_name = "manual"
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "8Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.nextcloud_staging_server_pv.metadata[0].name
  }

  depends_on = [kubernetes_persistent_volume.nextcloud_staging_server_pv, ]
}

resource "kubernetes_persistent_volume" "nextcloud_staging_postgresql_pv" {
  metadata {
    name = "nextcloud-staging-postgresql-pv"
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
        path = "/ext/persistent/nextcloud-staging/postgresql"
      }
    }
  }

  depends_on = [kubernetes_namespace.nextcloud_staging, ]
}

resource "kubernetes_persistent_volume_claim" "nextcloud_staging_postgresql_pvc" {
  metadata {
    name      = "nextcloud-staging-postgresql-pvc"
    namespace = var.kubernetes_namespace_name
  }
  spec {
    storage_class_name = "manual"
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "8Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.nextcloud_staging_postgresql_pv.metadata[0].name
  }

  depends_on = [kubernetes_persistent_volume.nextcloud_staging_postgresql_pv, ]
}

resource "kubernetes_persistent_volume" "nextcloud_staging_backup_pv" {
  metadata {
    name = "nextcloud-staging-backup-pv"
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
        path = "/ext/persistent/nextcloud-staging/backup"
      }
    }
  }

  depends_on = [kubernetes_namespace.nextcloud_staging, ]
}

resource "kubernetes_persistent_volume_claim" "nextcloud_staging_backup_pvc" {
  metadata {
    name      = "nextcloud-staging-backup-pvc"
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
    volume_name = kubernetes_persistent_volume.nextcloud_staging_backup_pv.metadata[0].name
  }

  depends_on = [kubernetes_persistent_volume.nextcloud_staging_backup_pv, ]
}

resource "kubernetes_persistent_volume" "nextcloud_staging_redis_master_pv" {
  metadata {
    name = "nextcloud-staging-redis-master-pv"
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
        path = "/ext/persistent/nextcloud-staging/redis/master"
      }
    }
  }

  depends_on = [kubernetes_namespace.nextcloud_staging, ]
}

resource "kubernetes_persistent_volume_claim" "nextcloud_staging_redis_master_pvc" {
  metadata {
    name      = "nextcloud-staging-redis-master-pvc"
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
    volume_name = kubernetes_persistent_volume.nextcloud_staging_redis_master_pv.metadata[0].name
  }

  depends_on = [kubernetes_persistent_volume.nextcloud_staging_redis_master_pv, ]
}

resource "kubernetes_persistent_volume" "nextcloud_staging_redis_replica_pv" {
  metadata {
    name = "nextcloud-staging-redis-replica-pv"
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
        path = "/ext/persistent/nextcloud-staging/redis/replica"
      }
    }
  }

  depends_on = [kubernetes_namespace.nextcloud_staging, ]
}

resource "kubernetes_persistent_volume_claim" "nextcloud_staging_redis_replica_pvc" {
  metadata {
    name      = "nextcloud-staging-redis-replica-pvc"
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
    volume_name = kubernetes_persistent_volume.nextcloud_staging_redis_replica_pv.metadata[0].name
  }

  depends_on = [kubernetes_persistent_volume.nextcloud_staging_redis_replica_pv, ]
}

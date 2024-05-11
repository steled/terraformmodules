resource "kubernetes_persistent_volume" "jd-sftp-config-pv" {
  metadata {
    name = "jd-sftp-config-pv"
#    annotations = {
#      "pv.beta.kubernetes.io/gid" = "3000"
#    }
    labels = {
      type = "local"
      app  = "jd-sftp"
    }
  }
  spec {
    storage_class_name = "manual"
    capacity = {
      storage = "100Mi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      host_path {
        path = "/ext/persistent/jdownloader/config"
      }
    }
  }

  depends_on = [ kubernetes_namespace.jd-sftp, ]
}

resource "kubernetes_persistent_volume_claim" "jd-sftp-config-pvc" {
  metadata {
    name = "jd-sftp-config-pvc"
    namespace = kubernetes_namespace.jd-sftp.metadata[0].name
  }
  spec {
    storage_class_name = "manual"
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "100Mi"
      }
    }
    volume_name = kubernetes_persistent_volume.jd-sftp-config-pv.metadata.0.name
  }

  depends_on = [ kubernetes_persistent_volume.jd-sftp-config-pv, ]
}

resource "kubernetes_persistent_volume" "jd-sftp-downloads-pv" {
  metadata {
    name = "jd-sftp-downloads-pv"
#    annotations = {
#      "pv.beta.kubernetes.io/gid" = "3000"
#    }
    labels = {
      type = "local"
      app  = "jd-sftp"
    }
  }
  spec {
    storage_class_name = "manual"
    capacity = {
      storage = "50Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      host_path {
        path = "/ext/persistent/jdownloader/downloads"
      }
    }
  }

  depends_on = [ kubernetes_namespace.jd-sftp, ]
}

resource "kubernetes_persistent_volume_claim" "jd-sftp-downloads-pvc" {
  metadata {
    name = "jd-sftp-downloads-pvc"
    namespace = kubernetes_namespace.jd-sftp.metadata[0].name
  }
  spec {
    storage_class_name = "manual"
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "50Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.jd-sftp-downloads-pv.metadata.0.name
  }

  depends_on = [ kubernetes_persistent_volume.jd-sftp-downloads-pv, ]
}

resource "kubernetes_persistent_volume" "jd-sftp-logs-pv" {
  metadata {
    name = "jd-sftp-logs-pv"
#    annotations = {
#      "pv.beta.kubernetes.io/gid" = "3000"
#    }
    labels = {
      type = "local"
      app  = "jd-sftp"
    }
  }
  spec {
    storage_class_name = "manual"
    capacity = {
      storage = "100Mi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      host_path {
        path = "/ext/persistent/jdownloader/logs"
      }
    }
  }

  depends_on = [ kubernetes_namespace.jd-sftp, ]
}

resource "kubernetes_persistent_volume_claim" "jd-sftp-logs-pvc" {
  metadata {
    name = "jd-sftp-logs-pvc"
    namespace = kubernetes_namespace.jd-sftp.metadata[0].name
  }
  spec {
    storage_class_name = "manual"
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "100Mi"
      }
    }
    volume_name = kubernetes_persistent_volume.jd-sftp-logs-pv.metadata.0.name
  }

  depends_on = [ kubernetes_persistent_volume.jd-sftp-logs-pv, ]
}

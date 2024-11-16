resource "kubernetes_secret_v1" "rsync_secret" {
  metadata {
    name      = "rsync"
    namespace = kubernetes_namespace.jd-sftp.metadata[0].name
  }

  data = {
    "upload.id_rsa" = file(var.rsync_upload_id_rsa)
  }

  type = "Opaque"
}

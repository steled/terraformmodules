resource "kubernetes_namespace" "jd-sftp" {
  metadata {
    name = var.namespace
  }
}

module "jd" {
  source = "./jd"

  namespace = kubernetes_namespace.jd-sftp.metadata[0].name

  env_JD_DEVICENAME = var.env_JD_DEVICENAME
  env_JD_PASSWORD   = var.env_JD_PASSWORD
  env_JD_EMAIL      = var.env_JD_EMAIL

#  depends_on = [
#    kubernetes_persistent_volume.jd-sftp-test-config-pvc,
#    kubernetes_persistent_volume.jd-sftp-test-downloads-pvc,
#    kubernetes_persistent_volume.jd-sftp-test-logs-pvc,
#  ]
}

module "sftp" {
  source = "./sftp"

  namespace   = kubernetes_namespace.jd-sftp.metadata[0].name
  values_yaml = var.sftp_values_yaml

  depends_on = [ module.jd, ]
}

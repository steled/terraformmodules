resource "kubernetes_namespace" "jd-sftp" {
  metadata {
    name = var.kubernetes_namespace_name
  }
}

module "jd" {
  source = "./jd"

  kubernetes_namespace_name = var.kubernetes_namespace_name

  env_JD_DEVICENAME = var.env_JD_DEVICENAME
  env_JD_PASSWORD   = var.env_JD_PASSWORD
  env_JD_EMAIL      = var.env_JD_EMAIL

  config_pvc_name = var.config_pvc_name
  downloads_pvc_name = var.downloads_pvc_name
  logs_pvc_name = var.logs_pvc_name

#  depends_on = [
#    kubernetes_persistent_volume.jd-sftp-test-config-pvc,
#    kubernetes_persistent_volume.jd-sftp-test-downloads-pvc,
#    kubernetes_persistent_volume.jd-sftp-test-logs-pvc,
#  ]
}

module "sftp" {
  source = "./sftp"

  kubernetes_namespace_name = var.kubernetes_namespace_name
  values_yaml = var.sftp_values_yaml

  depends_on = [ module.jd, ]
}